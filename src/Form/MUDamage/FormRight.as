package Form.MUDamage {
	import mx.controls.*;
	import mx.containers.*;
	import mx.core.*;
	import mx.collections.*;
	import mx.events.*;
	import flash.events.*;

	import Form.MUDamage.SubForm.*;
	import Data.Database.*;
	
	public class FormRight extends FormEquip {
		private var f_name:String;
	
		private var item_attr:FormItemAttributeBox;
		private var enchant:FormEnchantBox;
		private var socket:FormSocketBox;
		private var arrow:ComboBox;
		private var op380:CheckBox;
	
		private var op380box:HBox;

		private var LABELS:Object = 
			{	right : "右:",
				left : "左:",
				helm : "兜:",
				armor : "鎧:",
				glove : "手:",
				garter : "腰:",
				boots : "足:"};
		/**
		 * コンストラクタ
		 * @param d
		 * @param f_name [right,left,helm,armor,glove,garter,boots]
		 * @param 
		 */
		public function FormEquip(d:FormMUDamage,f_name:String) {
			super(d);
			this.f_name = f_name;
			
			this.label = this.LABELS[f_name];
			kinds = {
				none 	: displayNone,
				normal 	: displayNormal,
				exellent: displayEx,
				set		: displaySet,
				socket	: displaySocket
			};
			KIND_ARRAY = [
			              ["なし"	,kinds.none],
			              ["通常"	,kinds.normal],
			              ["EX"		,kinds.exellent],
			              ["セット"	,kinds.set],
			              ["ソケット",kinds.socket]
			            ];
			
			initForm();
		}
		/**
		 * フォームの設定
		 */
		override protected function initForm():void{
			ln();
			createKind();
			createItem();
			item_attr = new FormItemAttributeBox();
				FormCommon.hide(item_attr);
				hbox.addChild(item_attr);
			enchant = new FormEnchantBox(item, item_attr.getPlus());
				FormCommon.hide(enchant);
				hbox.addChild(enchant);
			createSetop();
			
			exellent = new FormExellentBox(item);
				FormCommon.hide(exellent);
				this.addChild(exellent);
			socket = new FormSocketBox(item);
				FormCommon.hide(socket);
				this.addChild(socket);
			
			createArrow();
			create380op();
		}
		/**
		 * 矢のボックスを作成
		 */
		private function createArrow():void{
			//矢のフォーム作成
			if(f_name == "right"){//右手のみ
				//矢のフォーム
				arrow = new ComboBox();
				FormCommon.hide(arrow);
				arrow.dataProvider = ["矢+N","矢+1","矢+2","矢+3"];
				this.addChild(arrow);
			}
		}
		/**
		 * 380OPのボックスを作成。
		 */
		private function create380op():void{
			//380OPのフォーム作成
			ln();
			op380box = hbox;
			FormCommon.hide(hbox);
			//380OPの作成
			op380 = new CheckBox();
			hbox.addChild(op380);
			var la:Label = new Label();
			la.text = "380op";
			hbox.addChild(la);
		}
		/**
		 * kindを除く全てのフォームを隠す
		 */
		override protected function hideAll():void{
			FormCommon.hide(item);
			FormCommon.hide(item_attr);
			FormCommon.hide(setop);
			FormCommon.hide(exellent);
			FormCommon.hide(enchant);
			FormCommon.hide(socket);
			FormCommon.hide(arrow);
			FormCommon.hide(op380box);
		}
		/**
		 * kindがソケットの場合true
		 */
		public function isSocket():Boolean{
			return (getKind().selectedLabel == "ソケット");
		}
		/**
		 * アイテム変更時イベント
		 */
		override protected function eventChangeItem(event:Event):void{
			// OPの変更
			changeOption();
			// setopの変更
			changeSetop(item.selectedItem[9]);
			//380OPの変更
			if((isNormal() || isEx())
			 && item.selectedItem[6] == 380){
				FormCommon.show(op380box);
			}else{
				FormCommon.hide(op380box);
				op380.selected = false;
			}
			// 弓の場合、左手フォームを隠す
			if(f_name == "right")
				if(item.selectedItem[3] == "弓"){
					d.getFormLeft().getKind().selectedIndex = 0;//左手を「なし」に設定
					d.getFormLeft().getKind().dispatchEvent((new ListEvent(ListEvent.CHANGE)) as Event);//イベントの呼び出し
					FormCommon.hide(d.getFormLeft().getKind());//左手フォームを隠す
					FormCommon.show(arrow);//矢のフォームを表示
				//両手武器の場合、左手を隠す
				}else if(item.selectedItem[4] == "両手"){
					d.getFormLeft().getKind().selectedIndex = 0;//左手を「なし」に設定
					d.getFormLeft().getKind().dispatchEvent((new ListEvent(ListEvent.CHANGE)) as Event);//イベントの呼び出し
					FormCommon.hide(d.getFormLeft().getKind());//左手フォームを隠す
				}else{//元に戻す
					FormCommon.show(d.getFormLeft().getKind());
					FormCommon.hide(arrow);
				}
		}
		/**
		 * オプションの変更
		 */
		private function changeOption():Boolean{
			// OPの変更
			var a:Array;
			var index:int = item_attr.getOption().selectedIndex;
			if(index == -1)index = 0;
			if(item.selectedItem[3] == "盾"){
				a = [{label:"opなし",value:0},
							{label:"op5",value:5},
							{label:"op10",value:10},
							{label:"op15",value:15},
							{label:"op20",value:20}]
			}else if(kind.selectedLabel == "鷹"){
				return false;
			}else{
				a = [{label:"opなし",value:0},
							{label:"op4",value:4},
							{label:"op8",value:8},
							{label:"op12",value:12},
							{label:"op16",value:16}]
			}
			item_attr.getOption().dataProvider = a;
			item_attr.getOption().selectedIndex = index;
			return true;
		}
		/**
		 * アイテムフォームのデータを変更
		 * @param type 0:通常 1:ソケット 2:セットアイテム
		 */
		private function changeItem(type:int):Boolean{
			//すでに作成されていないかチェック
			if(item.dataProvider == "" || c.getItemType(item.selectedItem) != type){
				//アイテムの追加
				var jobindex:int = d.getJob().selectedIndex;//職取得
				if(f_name == "right")//右手
					//ソケットアイテムを除く 神具を除く
					if(type==1) item.dataProvider = c.getSocketRight(jobindex);
					else if(type==2) item.dataProvider = c.getSetRight(jobindex);
					else item.dataProvider = c.getRight(jobindex);
				else if(f_name == "left")//左手
					//ソケットアイテムを除く　両手武器を除く
					if(type==1) item.dataProvider = c.getSocketLeft(jobindex);
					else if(type==2) item.dataProvider = c.getSetLeft(jobindex);
					else item.dataProvider = c.getLeft(jobindex);
				else if(f_name == "helm")
					if(type==1) item.dataProvider = c.getSocketEquip(jobindex,"兜");
					else if(type==2) item.dataProvider = c.getSetEquip(jobindex,"兜");
					else item.dataProvider = c.getEquip(jobindex,"兜");
				else if(f_name == "armor")
					if(type==1) item.dataProvider = c.getSocketEquip(jobindex,"鎧");
					else if(type==2) item.dataProvider = c.getSetEquip(jobindex,"鎧");
					else item.dataProvider = c.getEquip(jobindex,"鎧");
				else if(f_name == "glove")
					if(type==1) item.dataProvider = c.getSocketEquip(jobindex,"手");
					else if(type==2) item.dataProvider = c.getSetEquip(jobindex,"手");
					else item.dataProvider = c.getEquip(jobindex,"手");
				else if(f_name == "garter")
					if(type==1) item.dataProvider = c.getSocketEquip(jobindex,"腰");
					else if(type==2) item.dataProvider = c.getSetEquip(jobindex,"腰");
					else item.dataProvider = c.getEquip(jobindex,"腰");
				else if(f_name == "boots")
					if(type==1) item.dataProvider = c.getSocketEquip(jobindex,"足");
					else if(type==2) item.dataProvider = c.getSetEquip(jobindex,"足");
					else item.dataProvider = c.getEquip(jobindex,"足");
			}
			// イベントの呼び出し
			item.dispatchEvent(new ListEvent(ListEvent.CHANGE) as Event);
			return true;
		}
		/**
		 * kind Normalを表示
		 */
		private function displayNormal():void{
			hideAll();
			FormCommon.show(item);
			FormCommon.show(item_attr);
			FormCommon.show(enchant);

			changeItem(0);
		}
		/**
		 * kind Exを表示
		 */
		private function displayEx():void{
			hideAll();
			FormCommon.show(item);
			FormCommon.show(item_attr);
			FormCommon.show(enchant);
			FormCommon.show(exellent);
			
			changeItem(0);
		}
		/**
		 * kind Setを表示
		 */
		private function displaySet():void{
			hideAll();
			FormCommon.show(item);
			FormCommon.show(item_attr);
			FormCommon.show(setop);
			
			changeItem(2);
		}
		/**
		 * kind Socketを表示
		 */
		private function displaySocket():void{
			hideAll();
			FormCommon.show(item);
			FormCommon.show(item_attr);
			FormCommon.show(socket);
			
			changeItem(1);
		}
		/**
		 * item_attr
		 */
		public function getItemAttr():FormItemAttributeBox{
			return item_attr;
		}
		/**
		 * enchant
		 */
		public function getEnchant():FormEnchantBox{
			return enchant;
		}
		/**
		 * socket
		 */
		public function getSocket():FormSocketBox{
			return socket;
		}
		/**
		 * arrow
		 */
		public function getArrow():ComboBox{
			return arrow;
		}
		/**
		 * 380op
		 */
		public function getOp380():CheckBox{
			return op380;
		}
	}
}
