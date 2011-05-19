package Form.MUDamage {
	import mx.controls.*;
	import mx.containers.*;
	import mx.core.*;
	import mx.collections.*;
	import mx.events.*;
	import flash.events.*;

	import Form.MUDamage.SubForm.*;
	import Data.Database.*;
	
	public class FormEquip extends FormItem {
		private var d:FormMUDamage;
		private var c:Internal;
		private var type:String;
	
		private var kinds:Object;
	
		private var kind:ComboBox;
		private var item:ComboBox;
		private var item_attr:FormItemAttributeBox;
		private var setop:ComboBox;
		private var exellent:FormExellentBox;
		private var enchant:FormEnchantBox;
		private var socket:FormSocketBox;
		private var arrow:ComboBox;
		private var op380:CheckBox;
	
		private var op380box:HBox;
		
		private var hbox:HBox;
		private var vbox:VBox;
	
		private var LABELS:Object = 
			{	right : "右:",
				left : "左:",
				helm : "兜:",
				armor : "鎧:",
				glove : "手:",
				garter : "腰:",
				boots : "足:"};
		private var KIND_ARRAY:Array = 
			["なし","通常","EX","セット","ソケット","EXソケット"];
		/**
		 * コンストラクタ
		 * @param d
		 * @param type [right,left,helm,armor,glove,garter,boots]
		 * @param 
		 */
		public function FormEquip(d:FormMUDamage,type:String) {
			this.d = d;
			this.c = Internal.getInstance();
			this.type = type;
			
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
		private function initForm():void{
			this.label = this.LABELS[type];
			
			ln();
			createKind();
			createItem();
			item_attr = new FormItemAttributeBox();hbox.addChild(item_attr);
			enchant = new FormEnchantBox(item, item_attr);hbox.addChild(enchant);
			createSetop();
			
			exellent = new FormExellentBox(item);this.addChild(exellent);
			socket = new FormSocketBox(item);this.addChild(socket);
			
			createArrow();
			create380op();
		}
		/**
		 * 改行
		 */
		private function ln():void{
			hbox = new HBox();
			this.addChild(hbox);
		}
		/**
		 * kindボックスの作成
		 */
		private function createKind():void{
			//kindフォームの作成
			kind = new ComboBox();
			kind.addEventListener(ListEvent.CHANGE,eventChangeKind);
			var data:ArrayCollection = new ArrayCollection(this.KIND_ARRAY);
			kind.dataProvider = data;
			kind.labelFunction = FormCommon.labelfunc0;
			kind.rowCount = 10;
			hbox.addChild(kind);
		}
		/**
		 * アイテムボックスを作成
		 */
		private function createItem():void{
			//アイテムフォームの作成
			item = new ComboBox();
			item.addEventListener(ListEvent.CHANGE,eventChangeItem);
			item.labelFunction = FormCommon.labelfunc;
			item.rowCount = 10;
			FormCommon.hide(item);
			hbox.addChild(item);
		}
		/**
		 * セットOPボックスの作成
		 */
		private function createSetop():void{
			//セットのステータスOP作成
			setop = new ComboBox();
			FormCommon.hide(setop);
			hbox.addChild(setop);
		}
		/**
		 * 矢のボックスを作成
		 */
		private function createArrow():void{
			//矢のフォーム作成
			if(type == "right"){//右手のみ
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
		 * kindを覗く全てのフォームを隠す
		 */
		public function hideAll():void{
			FormCommon.hide(kind);
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
		 * kindが通常の場合true
		 */
		public function isNormal():Boolean{
			return (getKind().selectedLabel == "通常");
		}
		/**
		 * kindがEXの場合true
		 */
		public function isEx():Boolean{
			return (getKind().selectedLabel == "EX");
		}
		/**
		 * kindがセットの場合true
		 */
		public function isSet():Boolean{
			return (getKind().selectedLabel == "セット");
		}
		/**
		 * kindがソケットの場合true
		 */
		public function isSocket():Boolean{
			return (getKind().selectedLabel == "ソケット");
		}
		/**
		 * Kind変更時発生イベント
		 */
		private function eventChangeKind(event:Event):void{
			event.target.selectedItem[1]();
		}
		/**
		 * アイテム変更時イベント
		 */
		private function eventChangeItem(event:Event):void{
			// OPの変更
			changeOption();
			//380OPの変更
			if((isNormal() || isEx())
			 && item.selectedItem[6] == 380){
				FormCommon.show(op380box);
			}else{
				FormCommon.hide(op380box);
				op380.selected = false;
			}
			// 弓の場合、左手フォームを隠す
			if(type == "right")
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
		 * kind Noneを表示
		 */
		private function displayNone():void{
			hideAll();
		}
		/**
		 * kind Normalを表示
		 */
		private function displayNormal():void{
			hideAll();
			FormCommon.show(item);
			FormCommon.show(item_attr);
			FormCommon.show(enchant);
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
		}
		/**
		 * kind Setを表示
		 */
		private function displaySet():void{
			hideAll();
			FormCommon.show(item);
			FormCommon.show(item_attr);
			FormCommon.show(setop);
		}
		/**
		 * kind Socketを表示
		 */
		private function displaySocket():void{
			hideAll();
			FormCommon.show(item);
			FormCommon.show(item_attr);
			FormCommon.show(socket);
		}
		/**
		 * kind
		 */
		public function getKind():ComboBox{
			return kind;
		}
		/**
		 * item
		 */
		public function getItem():ComboBox{
			return item;
		}
		/**
		 * item_attr
		 */
		public function getItemAttr():FormItemAttributeBox{
			return item_attr;
		}
		/**
		 * setop
		 */
		public function getSetop():ComboBox{
			return setop;
		}
		/**
		 * exellent
		 */
		public function getExellent():FormExellentBox{
			return exellent;
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
