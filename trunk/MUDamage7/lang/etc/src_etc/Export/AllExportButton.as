package AllExport {
	import flash.events.*;
	import mx.core.Container;
	import mx.controls.Button;
	
	/**
	 * 一括エクスポート/インポートの機能を提供するボタン
	 */
	public class AllExportButton extends Button {
		/**
		 * コンストラクタ
		 * @param main:Container
		 */
		public function AllExportButton() {
			super();
			this.addEventListener(MouseEvent.CLICK,click);
		}
		
		/**
		 * ボタンをクリックした時のイベント
		 */
		private function click(event:Event):Boolean{
			this.parent.addChild(new AllExportPanel());
			return true;
		}
	}
}
