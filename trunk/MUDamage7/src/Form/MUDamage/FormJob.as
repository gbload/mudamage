package Form.MUDamage {
	import mx.controls.*;
	import mx.containers.*;
	import mx.core.*;
	import mx.collections.*;
	import mx.events.*;
	import flash.events.*;

	import Form.MUDamage.SubForm.*;
	import Data.Database.*;
	/**
	 * 職フォーム
	 * @author sinlion
	 *
	 */
	public class FormJob extends ComboBox{
		private var controller:Controller;
		private var form_item:FormItem;
		/**
		 * コンストラクタ
		 */
		public function FormJob(controller:Controller){
			this.controller = controller;
			
			createJob();
		}
		/**
		 * 職フォームを作成
		 */
		private function createJob():void{
			form_item = new FormItem();
			form_item.direction = "horizontal";
			form_item.label = "クラス：";
			
			this.rowCount = 10;
			this.dataProvider = D.getData("job");
			this.enabled = false;
			form_item.addChild(this);
		}
		/**
		 * 職をセットする
		 */
		public function setJob(job:int):void{
			if(job == -1)return;
			this.selectedIndex = job;
		}
		/**
		 * 職フォームアイテムを返す
		 */
		public function getFormItem():FormItem{
			return form_item;
		}
	}
}