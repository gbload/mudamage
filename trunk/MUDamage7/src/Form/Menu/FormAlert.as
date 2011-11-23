package Form.Menu{
	import mx.controls.*;
	import mx.containers.*;
	import mx.core.*;
	import mx.collections.*;
	import mx.events.*;
	import mx.managers.*;
	import flash.events.*;
	
	import IO.FileIO.*;
	import Form.Menu.*;
	
	public class FormAlert extends Canvas{
		private var menu:FormMenu;
		private var text:String;

		private var pop:TitleWindow;
		private var textarea:TextArea;
		/**
		 * コンストラクタ
		 */
		public function FormAlert(menu:FormMenu,text:String) {
			super();
			
			this.menu = menu;
			this.text = text;
			
			init();
			setPanel();
		}
		/**
		 * Canvasの設定
		 */
		private function init():void{
			this.setStyle("borderAlpha","1.0");

			var f:Form = new Form();//Layout用
			f.name = "form";
			this.addChild(f);
			
			var b:Button = new Button();//キャンセルボタン
			b.label = "OK";
			b.addEventListener(MouseEvent.CLICK,eventCancel);
			f.addChild(b);
			
			textarea = new TextArea();
			textarea.text = text;
			textarea.name = "data";
			textarea.width = 350;
			textarea.height = 500;
			f.addChild(textarea);
		}
		/**
		 * Popupに登録する
		 */
		private function setPanel():void{
			pop = PopUpManager.createPopUp(menu,TitleWindow,true) as TitleWindow;
			pop.width = 420;
			pop.height = 650;
			pop.setStyle("borderColor","#DDFFDD");
			pop.setStyle("borderAlpha","0.3");
			pop.showCloseButton = true;//右上の×ボタン
			pop.addEventListener(CloseEvent.CLOSE,eventClickPopupClose);//右上の×ボタンのイベント
			PopUpManager.centerPopUp(pop);
			pop.title = "";//タイトル
			
			pop.addChild(this);//パネルを載せる
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
	}
}