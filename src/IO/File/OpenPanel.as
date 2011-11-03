package IO.File {
	import flash.events.*;

	import mx.containers.*;
	import mx.controls.*;
	import mx.managers.*;
	import mx.core.*;
	import mx.events.*;
	
	import IO.FileIO.*;
	import Form.Menu.*;
	import Form.MUDamage.*;
	
	/**
	 * エクスポート/インポートの機能を提供するパネル
	 */
	public class OpenPanel extends Canvas {
		private var c:Controller;
		private var menu:FormMenu;

		private var pop:TitleWindow;
		private var textinput:TextInput;
		private var list:List;
		private var deletebutton:Button;
		private var nodatatext:Text;
		/**
		 * コンストラクタ
		 */
		public function OpenPanel(c:Controller,menu:FormMenu) {
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
			this.setStyle("borderAlpha","1.0");
			
			var f:Form = new Form();//Layout用
			this.addChild(f);

			var te:Text = new Text();//案内
			te.text = "以下のタイトルを開きます。";
			te.setStyle("fontWeight","bold");
			f.addChild(te);
			
			textinput = new TextInput();//名前の入力
			textinput.text = c.getNowForm().form_title.text;
			f.addChild(textinput);
			
			var hbox:HBox = new HBox();//ボタン用のLayout
			f.addChild(hbox);
			
			var b:Button = new Button();//保存ボタン
			b.label = "開く";
			b.addEventListener(MouseEvent.CLICK,eventOpen);
			hbox.addChild(b);
			
			b = new Button();//キャンセルボタン
			b.label = "キャンセル";
			b.addEventListener(MouseEvent.CLICK,eventCancel);
			hbox.addChild(b);
			
			te = new Text();//案内
			te.text = "\n現在保存されているデータ：";
			te.setStyle("fontWeight","bold");
			f.addChild(te);

			list = new List();
			list.percentWidth = 100;
			list.addEventListener(ListEvent.ITEM_CLICK,eventList);
			f.addChild(list);

			
			b = new Button();//削除ボタン
			deletebutton = b;
			b.label = "削除";
			b.addEventListener(MouseEvent.CLICK,eventDelete);
			f.addChild(b);
			
			nodatatext = new Text();
			nodatatext.text = "データがありません。";
			f.addChild(nodatatext);
			
			//リスト更新
			updateList();
		}
		/**
		 * Popupに登録する
		 */
		private function setPanel():void{
			pop = PopUpManager.createPopUp(menu,TitleWindow,true) as TitleWindow;
			pop.width = 350;
			pop.height = 450;
			pop.setStyle("borderColor","#DDFFDD");
			pop.setStyle("borderAlpha","0.3");
			pop.showCloseButton = true;//右上の×ボタン
			pop.addEventListener(CloseEvent.CLOSE,eventClickPopupClose);//右上の×ボタンのイベント
			PopUpManager.centerPopUp(pop);
			pop.title = "開く";//タイトル
			
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
		/**
		 * 開く
		 */
		private function eventOpen(event:Event):Boolean{
			var title:String = textinput.text;
			var a:Array = StaticFileIO.open(title); 
			if(a == null){
				return false;
			}
			c.changeTab(a[1]);
			StaticFormIO.setData(a,c.getForm(a[1]));
			Alert.show("[" + title + "]" + "を開きました。");
			//ウインドウを閉じる
			pop.dispatchEvent(new CloseEvent(CloseEvent.CLOSE) as Event);
			return true;
		}
		/**
		 * リストから選択したものをTextInputに表示する
		 */
		private function eventList(event:Event):Boolean{
			textinput.text = event.target.selectedItem.slice(1);
			return true;
		}
		/**
		 * リストから選択したものを削除する
		 */
		private function eventDelete(event:Event):Boolean{
			var title:String = (list.selectedItem as String).slice(1);
			//データの削除
			if(event.type == "close" && (event as CloseEvent).detail == Alert.YES){
				StaticFileIO.deleteData(title);
				Alert.show("[" + title + "]" + "を削除しました。");
				// リストを更新
				updateList();
				return false;
			}
			//削除するデータをチェック
			var ch:Boolean = StaticFileIO.isDuplication(title);
			if(ch == true){
				Alert.show("[" + title + "]" + "を削除します。"
							,"確認",(Alert.YES | Alert.NO),null,eventDelete);
				return false;
			}else{
				Alert.show("上記リストから削除するデータを選択してください。");
				return false;
			}
			return true;
		}
		/**
		 * リストを更新する
		 */
		private function updateList():void{
			list.dataProvider = StaticFileIO.getTitleList();
			if(list.dataProvider.length == 0){
				deletebutton.visible = false;
				nodatatext.visible = true;
			}else{
				deletebutton.visible = true;
				nodatatext.visible = false;
			}
		}
	}
}
