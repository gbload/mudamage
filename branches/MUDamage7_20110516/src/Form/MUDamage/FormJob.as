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
		
		private var old_job:int = 0;
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
			this.addEventListener(ListEvent.CHANGE,eventChangeJob);
			form_item.addChild(this);
		}
		/**
		 * 職イベント
		 */
		private function eventChangeJob(event:Event):Boolean{
			this.controller.changeForm(this.selectedIndex);
			setJob(getOldJob());
			return true;
		}
		/**
		 * 職をセットする
		 */
		public function setJob(job:int):void{
			if(job == -1)return;
			this.selectedIndex = job;
			old_job = job;
		}
		/**
		 * 職フォームの変更イベント直前の値を返す
		 */
		public function getOldJob():int{
			return old_job;
		}
		/**
		 * 職フォームアイテムを返す
		 */
		public function getFormItem():FormItem{
			return form_item;
		}
	}
}