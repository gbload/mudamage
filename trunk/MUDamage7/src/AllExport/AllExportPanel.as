package AllExport {
	import mx.containers.*;
	import mx.controls.*;
	import flash.events.*;
	/**
	 * 一括エクスポート/インポートの機能を提供するパネル
	 */
	public class AllExportPanel extends Panel {
		private var textarea:TextArea;
		/**
		 * コンストラクタ
		 */
		public function AllExportPanel() {
			super();
		}
		/**
		 * パネルの設定
		 */
		private function init():void{
			this.title = "一括エクスポート/インポート";
			this.name = "allexport";
			this.setStyle("borderAlpha","1.0");
			
			var f:Form = new Form();//Layout用
			f.name = "form";
			this.addChild(f);
			
			var te:Text = new Text();//案内
			te.text = "エクスポート/インポート";
			te.setStyle("fontWeight","bold");
			f.addChild(te);
			
			textarea = new TextArea();
			textarea.name = "data";
			textarea.width = 300;
			textarea.height = 300;
			//textarea.addEventListener(FocusEvent.FOCUS_IN,menu::sel);
			f.addChild(textarea);
			
			var hbox:HBox = new HBox();//ボタン用のLayout
			f.addChild(hbox);
			
			var b:Button = new Button();//エクスポートボタン
			b.label = "エクスポート";
			b.addEventListener(MouseEvent.CLICK,eventExport);
			hbox.addChild(b);
			
			b = new Button();//インポートボタン
			b.label = "インポート";
			b.addEventListener(MouseEvent.CLICK,eventImport);
			hbox.addChild(b);
			
			b = new Button();//全選択ボタン
			b.label = "全選択";
			b.addEventListener(MouseEvent.CLICK,eventAllSelect);
			hbox.addChild(b);
			
			b = new Button();//キャンセルボタン
			b.label = "キャンセル";
			b.addEventListener(MouseEvent.CLICK,eventCancel);
			f.addChild(b);
		}
		/**
		 * このパネルを閉じます。
		 */
		private function eventCancel(event:Event):Boolean{
			this.parent.removeChild(this);
			return false;
		}
		/**
		 * 一括エクスポート/インポートしたデータを全選択します。
		 */
		private function eventAllSelect(event:Event):Boolean{
			textarea.setFocus();
			textarea.setSelection(0,textarea.length);
		}
		/**
		 * 一括エクスポートします。
		 */
		private function eventExport(event:Event):Boolean{
			Array a = getData();
			textarea.text = a.toString();
		}
		/**
		 * 一括インポートします。
		 */
		private function eventImport(event:Event):Boolean{
		var str:String = ((p.getChildByName("form") as Form).getChildByName("data") as TextArea).text;
		var a2:Array = str.split(/,/g);
		menu::setdata(menu::exportdata(a2));
		Alert.show("データをインポートしました。");
		}
	}
}
