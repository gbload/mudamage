package IO.Export {
	import mx.containers.*;
	import mx.controls.*;
	import flash.events.*;
	import mx.events.*;
	
	import IO.FileIO.*;
	
	/**
	 * エクスポート/インポートの機能を提供するパネル
	 */
	public class ExportPanel extends Panel {
		private var textarea:TextArea;
		/**
		 * コンストラクタ
		 */
		public function ExportPanel() {
			super();
			init();
			setPanel();
		}
		/**
		 * パネルの設定
		 */
		private function init():void{
			this.title = "エクスポート/インポート";
			this.name = "export";
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
		private function setPanel():void{
			var pop:TitleWindow = PopUpManager.createPopUp(this,TitleWindow,true) as TitleWindow;
			pop.width = 820;
			pop.height = 500;
			pop.setStyle("borderColor","black");
			pop.setStyle("borderAlpha","0.3");
			pop.showCloseButton = true;//右上の×ボタン
			pop.addEventListener(CloseEvent.CLOSE,eventClickPopupClose);//右上の×ボタンのイベント
			PopUpManager.centerPopUp(pop);
			pop.title = "エクスポート/インポート";//タイトル
			
			pop.addChild(this);//MLVキャンバスを載せる
		}
		/**
		 * このパネルを閉じます。
		 */
		private function eventCancel(event:Event):Boolean{
			this.parent.removeChild(this);
			return false;
		}
		/**
		 * エクスポート/インポートしたデータを全選択します。
		 */
		private function eventAllSelect(event:Event):Boolean{
			textarea.setFocus();
			textarea.setSelection(0,textarea.length);
			return true;
		}
		/**
		 * エクスポートします。
		 */
		private function eventExport(event:Event):Boolean{
			textarea.text = StaticFormIO.getData().toString();
			return true;
		}
		/**
		 * インポートします。
		 */
		private function eventImport(event:Event):Boolean{
			StaticFormIO.setData(StaticFormIO.importData(textarea.text.split(",")));
			return true;
		}
	}
}
