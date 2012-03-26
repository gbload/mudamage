package Calc {
	import mx.controls.*;
	import mx.containers.*;
	import mx.core.*;
	import mx.collections.*;
	import mx.events.*;
	import mx.formatters.*;
	import flash.events.*;

	import Form.MUDamage.SubForm.*;
	import Data.Database.*;
	import Data.Database.MLV.*;
	/**
	 * 属性ダメージ計算
	 */
	public class AttributeDamageCalculator extends DamageCalculator {
		private static var nf:NumberFormatter = new NumberFormatter();
		
		private static var affinity:Array = [
		    // 火、水、地、風、暗黒、無属性
		    [100,80,90,110,120,120],
		    [120,100,80,90,110,120],
		    [110,120,100,80,90,120],
		    [90,110,120,100,80,120],
		    [80,90,110,120,100,120]
		                                 ];
		private static var affinity_names:Array = 
				["火","水","土","風","闇","無"];

		/**
		 * コンストラクタ
		 */
		public function AttributeDamageCalculator(muc:Object){
			super(muc);
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
			// 属性なし
			if(c.attribute==5)return d;
			// 基本攻撃力
			if(min)
				d += a.attribute.min;
			else
				d += a.attribute.max;

			// ereutel
			d += f.property.getEreutelValue("attack");
			d += f.property.getEreutelValue("monster_attack");
			inc += f.property.getEreutelValue("monster_increase");
			
			// affinity
			d = Math.floor(d*calcAffinity()/100);
			// EXD
			if(exd)
				d = Math.floor(d*1.2);
			// guard
			if(m[mk.attribute_def]==0)
				d -= m[mk.def];
			else
				d -= m[mk.attribute_def];
			// 最低ダメ設定
			if(min)
				d = Math.max(4, d);
			else
				d = Math.max(6, d);
			
			// ダメージ増加
			d += Math.floor(d*inc/100);
			
			return d;
		}
		/**
		 * 属性被ダメージ
		 */
		private function calcMonsterAttribute(min:Boolean):int{
			var d:int = 0;
			var dec:int = 0;
			var drain:int = 0;
			// 属性なし
			if(m[mk.attribute]==5)return d;
			// 基本攻撃力
			if(min)
				d += m[mk.attribute_min];
			else
				d += m[mk.attribute_max];

			// ereutel
			d -= f.property.getEreutelValue("defense");
			d -= f.property.getEreutelValue("monster_defense");
			dec += f.property.getEreutelValue("monster_decrease");
			drain += f.property.getEreutelValue("monster_drain");

			// affinity
			d = Math.floor(d*calcDefenseAffinity()/100);
			// guard
			d -= m[mk.attribute_def];
			// ダメージ減少
			d -= Math.floor(d*dec/100);
			// 最低ダメ設定
			if(min)
				d = Math.max(4, d);
			else
				d = Math.max(6, d);
			
			// ダメージ吸収
			d = Math.floor(d*(100-drain)/100);
			return d;
		}
		/**
		 * 属性攻撃相性
		 */
		private function calcAffinity():int{
			var aff:int = 0;
			aff += f.property.getEreutelValue("fire_attack",(m[mk.attribute] == 0));
			aff += f.property.getEreutelValue("water_attack",(m[mk.attribute] == 1));
			aff += f.property.getEreutelValue("earth_attack",(m[mk.attribute] == 2));
			aff += f.property.getEreutelValue("wind_attack",(m[mk.attribute] == 3));
			aff += f.property.getEreutelValue("dark_attack",(m[mk.attribute] == 4));
			return affinity[c.attribute][m[mk.attribute]] + aff;
		}
		/**
		 * 属性防御相性
		 */
		private function calcDefenseAffinity():int{
			var aff:int = 0;			
			aff += f.property.getEreutelValue("fire_defense",(m[mk.attribute] == 0));
			aff += f.property.getEreutelValue("water_defense",(m[mk.attribute] == 1));
			aff += f.property.getEreutelValue("earth_defense",(m[mk.attribute] == 2));
			aff += f.property.getEreutelValue("wind_defense",(m[mk.attribute] == 3));
			aff += f.property.getEreutelValue("dark_defense",(m[mk.attribute] == 4));
			return affinity[m[mk.attribute]][c.attribute] - aff;
		}
		/**
		 * 属性のダメージ計算
		 */
		protected function calcAttributeSkill(hit:Number):ResultData{
			var data:ResultData = new ResultData();
			//スキル名
			data.skillname = "属性"+":";
			data.skillname += affinity_names[c.attribute]+"->"+affinity_names[m[mk.attribute]];
			data.skillname += "("+calcAffinity()+"%)";
		
			data.hit_num = hit;
			
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
			data.hit = nf.format(hit*100) + "%";
			
			return data;
		}
		/**
		 * 命中率計算
		 * @param character data
		 * @param monster data
		 * @return hit
		 */
		private function calcHit(c:int):Number{
			var hit:Number = 0;
			if(c < m[mk.avoid])
				hit = 0.05;
			else
				hit = 1.0 - (m[mk.avoid] / c);
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
			
			hit1 += data.exd * c.attribute_exd/100.0;
			hit1 += data.cri * c.attribute_cri/100.0;
			hit1 += ((data.min + data.max)/2) * c.attribute_normal/100.0;
			
			hit1 *= data.hit_num;
			
			return Math.floor(hit1);
		}
		/**
		 * 属性のダメージ計算
		 */
		protected function calcAttributeSuffer():ResultData{
			var data:ResultData = new ResultData();
			//スキル名
			data.skillname = "属性"+":";
			data.skillname += affinity_names[m[mk.attribute]]+"->"+affinity_names[c.attribute];
			data.skillname += "("+calcDefenseAffinity()+"%)";

			// 属性ダメージ
			data.min = calcMonsterAttribute(true);
			data.max = calcMonsterAttribute(false);
			
			//データの整形
			data.minmax = data.min + "〜" + data.max;
			
			return data;
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
