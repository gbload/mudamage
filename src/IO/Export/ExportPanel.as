package IO.Export {
	import mx.controls.*;
	import mx.containers.*;
	import mx.core.*;
	import mx.collections.*;
	import mx.events.*;
	import mx.managers.*;
	import flash.events.*;
	
	import IO.FileIO.*;
	import Form.Menu.*;
	import Form.MUDamage.*;
	
	/**
	 * エクスポート/インポートの機能を提供するパネル
	 */
	public class ExportPanel extends Canvas {
		private var c:Controller;
		private var menu:FormMenu;

		private var pop:TitleWindow;
		private var textarea:TextArea;
		/**
		 * コンストラクタ
		 */
		public function ExportPanel(c:Controller,menu:FormMenu) {
			super();
			
			this.c = c;
			this.menu = menu;
			
			init();
			setPanel();
		}
		/**
		 * Canvasの設定
		 */
		private function init():void{
			this.name = "export";
			this.setStyle("borderAlpha","1.0");
			
			var f:Form = new Form();//Layout用
			f.name = "form";
			this.addChild(f);
			
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
		 * Popupに登録する
		 */
		private function setPanel():void{
			pop = PopUpManager.createPopUp(menu,TitleWindow,true) as TitleWindow;
			pop.width = 350;
			pop.height = 450;
			pop.setStyle("borderColor","black");
			pop.setStyle("borderAlpha","0.3");
			pop.showCloseButton = true;//右上の×ボタン
			pop.addEventListener(CloseEvent.CLOSE,eventClickPopupClose);//右上の×ボタンのイベント
			PopUpManager.centerPopUp(pop);
			pop.title = "エクスポート/インポート";//タイトル
			
			pop.addChild(this);//MLVキャンバスを載せる
		}
		/**
		 * ポップアップを閉じる
		 */
		private function eventClickPopupClose(event:Event):void{
			PopUpManager.removePopUp(event.target as IFlexDisplayObject);
		}
		/**
		 * このパネルを閉じる
		 */
		private function eventCancel(event:Event):Boolean{
			pop.dispatchEvent(new CloseEvent(CloseEvent.CLOSE) as Event);
			return false;
		}
		/**
		 * エクスポート/インポートしたデータを全選択する
		 */
		private function eventAllSelect(event:Event):Boolean{
			textarea.setFocus();
			textarea.setSelection(0,textarea.length);
			return true;
		}
		/**
		 * エクスポートする
		 */
		private function eventExport(event:Event):Boolean{
			textarea.text = StaticFormIO.getData(c.getNowForm().form_title.text,c.getNowForm()).toString();
			return true;
		}
		/**
		 * インポートする
		 */
		private function eventImport(event:Event):Boolean{
			if(StaticFormIO.setData(StaticFormIO.importData(textarea.text.split(",")),c.getNowForm()))
				Alert.show("インポートに成功しました。");
			return true;
		}
	}
}
