package AllExport {
	import flash.events.*;
	import mx.core.Container;
	import mx.controls.Button;
	
	/**
	 * 一括エクスポート/インポートの機能を提供するボタン
	 */
	public class AllExportButton extends Button {
		private var main:Container;
		/**
		 * コンストラクタ
		 * @param main:Container
		 */
		public function AllExportButton(main:Container) {
			super();
			this.main = main;
			this.addEventListener(MouseEvent.CLICK,click);
		}
		
		/**
		 * ボタンをクリックした時のイベント
		 */
		private function click(event:Event):Boolean{
			this.main.addChild(new AllExportPanel());
			return true;
		}
	}
}
