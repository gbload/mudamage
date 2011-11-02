package Form.MUDamage {
	import mx.controls.*;
	import mx.containers.*;
	import mx.core.*;
	import mx.collections.*;
	import mx.events.*;
	import flash.events.*;

	import Data.Database.*;
	/**
	 * 職フォーム
	 * @author sinlion
	 *
	 */
	public class JobBar extends ToggleButtonBar{
		private var controller:Controller;
	
		private var form_item:FormItem;
		
		private var old_job:int = 0;
		/**
		 * コンストラクタ
		 */
		public function JobBar(controller:Controller){
			this.controller = controller;
			
			init();
		}
		private function init():void{
			// データを登録
			this.dataProvider = D.getData("job");
			// 位置調整
			this.x = 30;
			this.y = 10;
			// 大きさ調整
			this.height = 30;
			// どれも選択されてない状態を許すかどうか
			this.toggleOnClick = false;
			// イベントの登録
			this.addEventListener(Event.TAB_INDEX_CHANGE,eventChangeJob);
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
	}
}