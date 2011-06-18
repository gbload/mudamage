package Calc {
	import mx.controls.*;
	import mx.containers.*;
	import mx.core.*;
	import mx.collections.*;
	import mx.events.*;
	import flash.events.*;

	import Form.MUDamage.SubForm.*;
	import Data.Database.*;
	import Data.Database.MLV.*;
	/**
	 * 攻撃力/魔力を計算
	 * @author sinlion
	 *
	 */
	public class AttackData{
		public var attack:Attack = new Attack();
		public var magic:Attack = new Attack();
		public var curse:Attack = new Attack();
		// 追加攻撃力
		public var add:int=0;
		// スキル
		public var skills:Array = new Array();
		public var key:Object;
	}
}
class Attack{
	public var min:int=0;
	public var max:int=0;
}