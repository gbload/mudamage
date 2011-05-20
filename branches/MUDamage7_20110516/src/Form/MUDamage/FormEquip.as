package Form.MUDamage {
	import mx.controls.*;
	import mx.containers.*;
	import mx.core.*;
	import mx.collections.*;
	import mx.events.*;
	import flash.events.*;

	import Form.MUDamage.SubForm.*;
	import Data.Database.*;
	
	public class FormEquip extends FormEquipBase {
		protected var item_attr:FormItemAttributeBox;
		protected var enchant:FormEnchantBox;
		protected var socket:FormSocketBox;
		protected var op380:CheckBox;
	
		protected var firstbox:HBox; 
		protected var op380box:HBox;
		/**
		 * コンストラクタ
		 * @param d
		 * @param f_name [right,left,helm,armor,glove,garter,boots]
		 * @param 
		 */
		public function FormEquip(d:FormMUDamage) {
			super(d);
		}
		/**
		 * kind arrayの初期化
		 */
		override protected function initKinds():void{
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
		}
		/**
		 * フォームの設定
		 */
		override protected function initForm():void{
			ln();
			firstbox = hbox;
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
			
			create380op();
		}
		/**
		 * 380OPのボックスを作成。
		 */
		protected function create380op():void{
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
		}
		/**
		 * オプションの変更
		 */
		protected function changeOption():Boolean{
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
		protected function changeItem(type:int):Boolean{
			return true;
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
			FormCommon.hide(op380box);
		}
		/**
		 * kind Normalを表示
		 */
		protected function displayNormal():void{
			hideAll();
			FormCommon.show(item);
			FormCommon.show(item_attr);
			FormCommon.show(enchant);

			changeItem(0);
		}
		/**
		 * kind Exを表示
		 */
		protected function displayEx():void{
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
		protected function displaySet():void{
			hideAll();
			FormCommon.show(item);
			FormCommon.show(item_attr);
			FormCommon.show(setop);
			
			changeItem(2);
		}
		/**
		 * kind Socketを表示
		 */
		protected function displaySocket():void{
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
		 * 380op
		 */
		public function getOp380():CheckBox{
			return op380;
		}
	}
}
