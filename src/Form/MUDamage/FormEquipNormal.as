package Form.MUDamage {
	import mx.controls.*;
	import mx.containers.*;
	import mx.core.*;
	import mx.collections.*;
	import mx.events.*;
	import flash.events.*;

	import Form.MUDamage.SubForm.*;
	import Data.Database.*;
	
	public class FormEquipNormal {
		private var form:FormEquip;
		/**
		 * コンストラクタ
		 */
		public function FormEquipNormal(form:FormEquip) {
			this.form = form;
		}
		/**
		 * 通常装備選択フォームを表示
		 */
		public function display():void{
			form.hideAll();
			show();
		}
		/**
		 * 表示
		 */
		private function show():void{
			FormCommon.show(form.item)
			FormCommon.show(form.item_attr)
			FormCommon.show(form.enchant)
		}
	}
}
