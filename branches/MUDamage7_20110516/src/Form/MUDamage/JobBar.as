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
		/**
		 * コンストラクタ
		 */
		public function JobBar(controller:Controller){
			this.controller = controller;
			
			init();
		}
		/**
		 * 初期化
		 */
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
			this.addEventListener(FlexEvent.VALUE_COMMIT,eventChangeJob);
		}
		/**
		 * 職イベント
		 */
		private function eventChangeJob(event:Event):Boolean{
			this.controller.changeTab(this.selectedIndex);
			return true;
		}
	}
}