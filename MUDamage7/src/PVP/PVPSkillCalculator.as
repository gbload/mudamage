package PVP {
	import mx.controls.*;
	import mx.containers.*;
	import mx.core.*;
	import mx.collections.*;
	import mx.events.*;
	import mx.formatters.*;
	import flash.events.*;

	import Form.MUDamage.SubForm.*;
	import Calc.*;
	import Data.Database.*;
	import Data.Database.MLV.*;
	/**
	 * 対人ダメージ計算
	 */
	public class PVPSkillCalculator extends PVPAttributeDamageCalculator {
		private static var nf:NumberFormatter = new NumberFormatter();
		public var suffer_count:int = 0; //被ダメージ行の数

		/**
		 * コンストラクタ
		 */
		public function PVPSkillCalculator(muc1:Object,muc2:Object,pvp_type:int){
			super(muc1,muc2,pvp_type);
		}
		/**
		 * ダメージを計算します。
		 */
		public function calcSkills():Array{
			var r:Array = new Array();
			//命中率計算
			var hit:Number = calcHit();

			//ダメージ計算
			for(var n:String in a.skills){
				if(a.skills[n].skill[a.key.special]=="フレイムハンド"){
					r.push(calcDarkSpiritSkill(n));
				}else{
					r.push(calcSkill(n,hit));
				}
			}
			//属性ダメージ計算
			if(c.attribute!=5)
				r.push(calcAttributeSkill());
			
			return r;
		}
		/**
		 * 各スキルのダメージ計算
		 */
		protected function calcSkill(n:String,hit:Number):ResultData{
			var data:ResultData = new ResultData();
			var data2:ResultData = new ResultData();
			data.skillname = a.skills[n].skill[a.key.name];
			data.skillhit = a.skills[n].skill[a.key.hit];
			data.hit_num = hit;
			data2.hit_num = 1;
			// damage calculation
			var func:Function = calcDamage;
			if(a.skills[n].skill[a.key.type]=="魔法"){
				func = calcMagicDamage;
			}
			data.min = func(a.skills[n],a.skills[n].min,false,false,true);
			data.max = func(a.skills[n],a.skills[n].max,false,false);
			data.cri = func(a.skills[n],a.skills[n].cri,true,false);
			data.exd = func(a.skills[n],a.skills[n].exd,false,true);
			// 防御無視計算
			var tmp:int = c2.def;
			c2.def = 0;
			data2.min = func(a.skills[n],a.skills[n].min,false,false,true);
			data2.max = func(a.skills[n],a.skills[n].max,false,false);
			data2.cri = func(a.skills[n],a.skills[n].cri,true,false);
			data2.exd = func(a.skills[n],a.skills[n].exd,false,true);
			c2.def = tmp;
			
			//1HIT当たりのダメージを計算
			data2.average = calcAverage(data2,a,c);//1hit当たりのダメージ
			data.average = calcAverage(data,a,c,data2);//1hit当たりのダメージ
			//1HITダメージ/秒
			data.averageper = calcAveragePerSecond(n,data,a);
			//ダメージ/秒
			data.total = calcTotal(data);
			//1分当たりの攻撃回数を計算
			data.speed = calcSpeedPerMinute(n,a);
			//データの整形
			data.minmax = data.min + "〜" + data.max;
			nf.precision = 2; // 小数点以下2桁に設定
			data.hit = nf.format(hit*100) + "%";
			
			return data;
		}
		/**
		 * ダークスピリットのスキルダメージ計算
		 */
		protected function calcDarkSpiritSkill(n:String):ResultData{
			var data:ResultData = new ResultData();
			data.skillname = a.skills[n].skill[a.key.name];
			data.hit_num = calcHit();
			// damage calculation
			var func:Function = calcDarkSpiritDamage;
			
			data.min = func(a.skills[n],a.skills[n].min,false,false);
			data.max = func(a.skills[n],a.skills[n].max,false,false);
			data.cri = func(a.skills[n],a.skills[n].cri,true,false);
			data.exd = func(a.skills[n],a.skills[n].exd,false,true);
			//1HIT当たりのダメージを計算
			data.average = calcAverage(data,a,c);//1hit当たりのダメージ
			//1HITダメージ/秒
			data.averageper = calcAveragePerSecond(n,data,a);
			//1分当たりの攻撃回数を計算
			data.speed = calcSpeedPerMinute(n,a);
			//データの整形
			data.minmax = data.min + "〜" + data.max;
			nf.precision = 2; // 小数点以下2桁に設定
			data.hit = nf.format(data.hit_num*100) + "%";
			
			return data;
		}
		/**
		 * 命中率計算
		 * @param character data
		 * @param monster data
		 * @return hit
		 */
		protected function calcHit():Number{
			if(c.attribute!=5)return 1;
			var hit:Number = 0;
			var h1:Number = c.lv * c.pvp_hit;
			var h2:Number = c2.lv * c2.pvp_avoid;
			hit = Math.pow((h2/h1),2);
			hit = 1 / (1 + hit);
			return hit;
		}
		/**
		 * 1hit当たりの平均ダメージ
		 * @param result data
		 * @param attack data
		 * @param character data
		 * @return average damage
		 */
		protected function calcAverage(data:ResultData,a:AttackData,c:CharacterData,data2:ResultData=null):int{
			var hit1:int=0;//1hit当たりのダメージ
			if(data.skillname == "フレイムハンド(単体)"){//ダークスピリット
				hit1 += data.exd * c.darkspirit_exd_per/100;//EXD
				hit1 += data.cri * c.darkspirit_cri_per/10000;//クリティカル率
				hit1 += ((data.min + data.max)/2) * c.darkspirit_normal / 10000;//通常
			}else if(data.skillname == "フレイムハンド(範囲)"){//フレイムハンド範囲
				//クリティカル確率0%
				hit1 += ((data.min + data.max)/2);//通常
			}else{//通常
				hit1 += data.exd * c.exd / 100;//EXD
				hit1 += data.cri * c.cri / 10000;//クリ
				hit1 += ((data.min + data.max)/2) * c.normal / 10000;//通常
				hit1 += hit1 * c.wd/100;//WD
				if(data2!=null)
					hit1 = (hit1 * (1-c.ignore/100)) + (data2.average * (c.ignore/100));
			}
			hit1 *= data.hit_num;
			return hit1;
		}
		/**
		 * １秒当たりの1hit平均ダメージ
		 * @param result data
		 * @param attack data
		 * @return damage
		 */
		protected function calcAveragePerSecond(n:String,data:ResultData,a:AttackData):int{
			var second:int=0;
			if(a.skills[n].speed[0])second = data.average * 1000/a.skills[n].speed[0];
			else second = 0;
			return second;
		}
		/**
		 * １秒当たりの平均ダメージ
		 * @param result data
		 * @return damage
		 */
		protected function calcTotal(data:ResultData):int{
			var second:int=data.averageper * data.skillhit;
			return second;
		}
		/**
		 * １分当たりの攻撃回数
		 * @param attack data
		 * @return attack count
		 */
		protected function calcSpeedPerMinute(n:String,a:AttackData):String{
			var minute:String;
			if(!a.skills[n].speed[0])minute="0";//0だった場合
			else minute = (Math.floor(600000/a.skills[n].speed[0])/10).toString();//攻撃回数計算
			if(!a.skills[n].speed[0] || a.skills[n].speed[1]==0)minute += "?";//不明又は未検証の場合
			return minute;
		}
	}
}
class ResultData{
	/**
	 * 表示用
	 */
	public var skillname:String = ""; //スキル名
	public var skillhit:Number = 0; //スキルHIT数
	public var total:int = 0; //1秒当たりの合計ダメージ
	public var averageper:int = 0; //1秒当たりの1hitダメージ
	public var speed:String = ""; //１分当たりの攻撃回数
	public var average:int = 0; //1hit当たりの平均ダメージ
	public var minmax:String = ""; //最小最大ダメージ
	public var hit:String = ""; //命中率
	public var cri:int = 0; //クリティカルダメージ
	public var exd:int = 0; //エクセレントダメージ
	/**
	 * 計算用
	 */
	public var min:int = 0; //最小ダメージ
	public var max:int = 0; //最大ダメージ
	public var hit_num:Number = 0; //命中率
	public var hit_check:Boolean = false; //カスリダメージの有無
}