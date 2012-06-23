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
	 * 属性ダメージ計算
	 */
	public class PVPAttributeDamageCalculator extends PVPDamageCalculator {
		private static var nf:NumberFormatter = new NumberFormatter();

		private static var affinity:Array = [
		    // 火、水、地、風、暗黒、無属性
		    [0,-20,-10,10,20,20],
		    [20,0,-20,-10,10,20],
		    [10,20,0,-20,-10,20],
		    [-10,10,20,0,-20,20],
		    [-20,-10,10,20,0,20]
//		    [100,80,90,110,120,120],
//		    [120,100,80,90,110,120],
//		    [110,120,100,80,90,120],
//		    [90,110,120,100,80,120],
//		    [80,90,110,120,100,120]
		                                 ];
		private static var affinity_names:Array = 
				["火","水","土","風","闇","無"];

		/**
		 * コンストラクタ
		 */
		public function PVPAttributeDamageCalculator(muc:Object,muc2:Object,pvp_type:int){
			super(muc,muc2,pvp_type);
		}
		/**
		 * 属性ダメージ
		 */
		private function calcAttribute(
				cri:Boolean=false,
				exd:Boolean=false,
				min:Boolean=false):int{
			var d:int = 0;
			var inc:int = 0;
			var dec:int = 0;
			var drain:int = 0;
			// 属性なし
			if(c.attribute==5)return d;
			// 基本攻撃力
			if(min)
				d += a.attribute.min;
			else
				d += a.attribute.max;

			// ereutel
			d += f.property.getEreutelValue("attack");
			d += f.property.getEreutelValue("pvp_attack");
			d += f.property.getEreutelValue("long_attack");
			d += f.property.getEreutelValue("short_attack");
			inc += f.property.getEreutelValue("pvp_increase");
			d -= f2.property.getEreutelValue("defense");
			d -= f2.property.getEreutelValue("pvp_defense");
			d -= f2.property.getEreutelValue("long_defense");
			d -= f2.property.getEreutelValue("short_defense");
			dec += f2.property.getEreutelValue("pvp_decrease");
			drain += f2.property.getEreutelValue("pvp_drain");

			// 対人ダメージ増加（バグで130％のところを230％にしてる？）
			d += Math.floor(d*1.6);
			// affinity
			d += Math.floor(d*(calcAffinity()/2)/100);
			// EXD
			if(exd)
				d = Math.floor(d*1.2);
			// guard
			d -= c2.attribute_def;
			if(c2.attribute==5)
				d -= Math.floor(c2.attribute_def*((calcAffinity()/2)+10)/100);//無属性バグ
			else
				d -= Math.floor(c2.attribute_def*(calcAffinity()/2)/100);
			// ダメージ減少
			d -= Math.floor(d*dec/100);
			// 最低ダメ設定
			if(min)
				d = Math.max(Math.floor(c.lv/100), d);
			else
				d = Math.max(Math.floor(c.lv/100)*1.5, d);
			
			// ダメージ増加
			d += Math.floor(d*inc/100);
			// ダメージ吸収
			d = Math.floor(d*(100-drain)/100);
			
			return d;
		}
		/**
		 * 属性攻撃相性
		 */
		private function calcAffinity():int{
			var aff:int = 0;
			aff += f.property.getEreutelValue("fire_attack",(c2.attribute == 0));
			aff += f.property.getEreutelValue("water_attack",(c2.attribute == 1));
			aff += f.property.getEreutelValue("earth_attack",(c2.attribute == 2));
			aff += f.property.getEreutelValue("wind_attack",(c2.attribute == 3));
			aff += f.property.getEreutelValue("dark_attack",(c2.attribute == 4));

			aff -= f2.property.getEreutelValue("fire_defense",(c2.attribute == 0));
			aff -= f2.property.getEreutelValue("water_defense",(c2.attribute == 1));
			aff -= f2.property.getEreutelValue("earth_defense",(c2.attribute == 2));
			aff -= f2.property.getEreutelValue("wind_defense",(c2.attribute == 3));
			aff -= f2.property.getEreutelValue("dark_defense",(c2.attribute == 4));
			return affinity[c.attribute][c2.attribute] + aff;
		}
		/**
		 * 属性のダメージ計算
		 */
		protected function calcAttributeSkill():ResultData{
			var data:ResultData = new ResultData();
			//スキル名
			data.skillname = "属性"+":";
			data.skillname += affinity_names[c.attribute]+"->"+affinity_names[c2.attribute];
			data.skillname += "("+calcAffinity()+"%)";

			data.hit_num = calcHit();
			
			// 属性ダメージ
			data.min = calcAttribute(false,false,true);
			data.max = calcAttribute(false,false,false);
			data.cri = calcAttribute(true,false,false);
			data.exd = calcAttribute(false,true,false);

			//1HIT当たりのダメージを計算
			data.average = calcAverage(data,a,c);//1hit当たりのダメージ
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
		private function calcHit():Number{
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
		private function calcAverage(data:ResultData,a:AttackData,c:CharacterData):int{
			var hit1:int=0;//1hit当たりのダメージ
			
			hit1 += data.exd * c.attribute_pvp_exd/100.0;
			hit1 += data.cri * c.attribute_pvp_cri/100.0;
			hit1 += ((data.min + data.max)/2) * c.attribute_pvp_normal/100.0;
			
			hit1 *= data.hit_num;
			
			return Math.floor(hit1);
		}
	}
}
class ResultData{
	/**
	 * 表示用
	 */
	public var skillname:String = ""; //スキル名
	public var skillhit:Object = ""; //スキルHIT数
	public var total:Object = ""; //1秒当たりの合計ダメージ
	public var averageper:Object = ""; //1秒当たりの1hitダメージ
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
