package PVP {
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
	import Calc.*;
	/**
	 * 対人ダメージ計算
	 */
	public class PVPDamageCalculator extends DamageCalculator{
		private var muc2:Object
		/**
		 * コンストラクタ
		 */
		public function PVPDamageCalculator(muc:Object,muc2:Object){
			super(muc);
			
			this.muc2 = muc2;
		}
		/**
		 * 最低ダメ判定前の防御計算を行ないます。
		 */
		override protected function calcGuard1(s:int):int{
			return calcGuardCommon1(s,muc2);
		}
		/**
		 * 最低ダメ判定前の防御計算を行ないます。
		 */
		override protected function calcGuard1Darkspirit(s:int):int{
			return calcGuardCommon1(s,muc2);
		}
		/**
		 * 最低ダメ判定後の防御計算を行ないます。
		 */
		override protected function calcGuard2(s:int):int{
			return calcGuardCommon2(s,muc2);
		}
		/**
		 * 命中率計算
		 */
		override protected function calcHit(notuse:int):Number{
			var hit:Number=0;
			
			var tmp_hit1:int = c.pvp_hit * c.lv;
			var tmp_hit2:int = muc2.c.pvp_avoid * muc2.c.lv;
			
			hit = Math.pow((tmp_hit1 / (tmp_hit1 + tmp_hit2)),2);
			return hit;
		}
	}
}
