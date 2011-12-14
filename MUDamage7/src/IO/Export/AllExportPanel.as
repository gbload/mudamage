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
	 * 一括エクスポート/インポートの機能を提供するパネル
	 */
	public class AllExportPanel extends Canvas {
		private var c:Controller;
		private var menu:FormMenu;
	
		private var pop:TitleWindow;
		private var textarea:TextArea;
		/**
		 * コンストラクタ
		 */
		public function AllExportPanel(c:Controller,menu:FormMenu) {
			super();
			
			this.c = c;
			this.menu = menu;
			
			init();
			setPanel();
		}
		/**
		 * パネルの設定
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
			b.label = "一括エクスポート";
			b.addEventListener(MouseEvent.CLICK,eventExport);
			hbox.addChild(b);
			
			b = new Button();//インポートボタン
			b.label = "一括インポート";
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
			pop.title = "一括エクスポート/インポート";//タイトル
			
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
		 * 一括エクスポートします。
		 */
		private function eventExport(event:Event):Boolean{
			var a:Array = StaticFileIO.openAll();
			textarea.text = "";
			for each(var a2:Array in a){
				textarea.text = textarea.text + a2.toString() + "\n";
			}
			return true;
		}
		/**
		 * 一括インポートします。
		 */
		private var counter:int;
		private var savedatas:Array;
		private var savedata:Array;
		private function eventImport(event:Event):Boolean{
			var str:String = textarea.text;
			savedatas = str.split(/\n|\r|\r\n/g);
			counter = 0;
			save(true);
			return true;
		}
		private function save(flag:Boolean):void{
			if(counter >= savedatas.length){
				Alert.show("一括インポートが完了しました。");
				return;
			}
			
			savedata = savedatas[counter].split(/,/g);

			// データがない場合
			if(savedata.length <= 1){
				counter++;
				save(flag);// 再起呼び出し
				return;
			}
			
			// 重複してる場合
			if(flag && StaticFileIO.isDuplication(savedata[0])){
				// アラートを出す
				Alert.show("すでにそのタイトルのデータが存在します。上書きしますか？"+"\n"+savedata[0]
							,"確認",(Alert.OK | Alert.YES | Alert.NO | Alert.CANCEL),null,eventSave);
				return;
			}else{
				// 保存
				if(!StaticFileIO.save(StaticFormIO.importData(savedata,c.getNowForm())))return;
				counter++;
				save(flag);// 再起呼び出し
			}
		}
		private function eventSave(event:CloseEvent):Boolean{
			if(event.detail == Alert.OK){// 全て上書きする
				save(false);
			}else if(event.detail == Alert.YES){// 上書きする
				// 保存
				if(!StaticFileIO.save(StaticFormIO.importData(savedata,c.getNowForm())))return false;
				counter++;
				save(true);
			}else if(event.detail == Alert.NO){// 上書きしない
				counter++;
				save(true);
			}else if(event.detail == Alert.CANCEL){// キャンセル
				return false;
			}
			return true;
		}
	}
}
