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
		public var right:Attack = new Attack();//右手攻撃力
		public var left:Attack = new Attack();//左手攻撃力
		public var magic:Attack = new Attack();
		public var curse:Attack = new Attack();
		public var attribute:Attack = new Attack();// 属性
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