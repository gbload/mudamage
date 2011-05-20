package Form.MUDamage {
	import mx.controls.*;
	import mx.containers.*;
	import mx.core.*;
	import mx.collections.*;
	import mx.events.*;
	import flash.events.*;

	import Form.MUDamage.SubForm.*;
	import Data.Database.*;
	/**
	 * ネックフォーム
	 * @author sinlion
	 *
	 */
	public class FormNeck extends FormItem {
		private var LABEL:String = "ネック:";
		private var d:FormMUDamage;
		private var c:Internal;
	
		private var kind:ComboBox;
		private var item:ComboBox;
		private var option:ComboBox;
		private var setop:ComboBox;
		private var exellent:FormExellentBox;
	
		private var hbox:HBox;
		
		private var kinds:Object;
		private var KIND_ARRAY:Array;
		
		private var old_type:int=-1;
		private var old_option:String="";
		/**
		 * コンストラクタ
		 */
		public function FormNeck(d:FormMUDamage) {
			this.d = d;
			this.c = Internal.getInstance();
			
//			this.width = 900;
			this.label = this.LABEL;
			
			kinds = {
					none 	: displayNone,
					normal 	: displayNormal,
					exellent: displayEx,
					set: displaySet,
					shop : displayShop
				};
			KIND_ARRAY = [
			              ["なし"	,kinds.none],
			              ["通常"	,kinds.normal],
			           ["EX"	,kinds.exellent],
			              ["セット"	,kinds.set],
			              ["ショップ"	,kinds.shop],
			            ];
			
			initForm();
		}
		/**
		 * フォームの初期化
		 */
		private function initForm():void{
			ln();
			createKind();
			createItem();
			createOption();
			createSetop();
			
			exellent = new FormExellentBox(item);
				FormCommon.hide(exellent);
				this.addChild(exellent);
		}
		/**
		 * 改行
		 */
		private function ln():void{
			hbox = new HBox();
			this.addChild(hbox);
		}
		/**
		 * kindフォーム
		 */
		private function createKind():void{
			//kindフォームの作成
			kind = new ComboBox();
			kind.addEventListener(ListEvent.CHANGE,eventChangeKind);
			kind.dataProvider = KIND_ARRAY;
			kind.labelFunction = FormCommon.labelfunc0;
			kind.rowCount = 6;
			hbox.addChild(kind);
		}
		/**
		 * アイテムフォーム
		 */
		private function createItem():void{
			//アイテムフォームの作成
			item = new ComboBox();
			item.addEventListener(ListEvent.CHANGE,eventChangeItem);
			item.labelFunction = FormCommon.labelfunc;
			FormCommon.hide(item);
			hbox.addChild(item);
		}
		/**
		 * オプションフォーム
		 */
		private function createOption():void{
			option = new ComboBox();
			FormCommon.hide(option);
			hbox.addChild(option);
		}
		/**
		 * setopフォーム
		 */
		private function createSetop():void{
			//ステータスOPの作成
			setop = new ComboBox();
			FormCommon.hide(setop);
			hbox.addChild(setop);
		}
		/**
		 * kindフォーム変更時イベント
		 */
		private function eventChangeKind(event:Event):void{
			kind.selectedItem[1]();
		}
		/**
		 * アイテムフォーム変更時イベント
		 */
		private function eventChangeItem(event:Event):void{
			// OPの変更
			changeOption(item.selectedItem[4]);
			// setopの変更
			changeSetop(item.selectedItem[9]);
		}
		/**
		 * アイテムフォームのデータを変更
		 * @param type 0:通常orEX 1:ショップ 2:セットアイテム
		 */
		private function changeItem(type:int):Boolean{
			//すでに作成されていないかチェック
			if(old_type != type){
				// アイテムの追加
				if(type==1)item.dataProvider = c.getShopNeck();
				else if(type==2)item.dataProvider = c.getSetNeck();
				else item.dataProvider = c.getNeck();
				old_type = type;
			}
			// イベントの呼び出し
			item.dispatchEvent(new ListEvent(ListEvent.CHANGE) as Event);
			return true;
		}
		/**
		 * オプションフォームのデータを変更
		 */
		private function changeOption(str:String):void{
			if(old_option != str){
				// インデックスの保持
				var index:int = option.selectedIndex;
				if(index == -1)index = 0;
				// オプションの作成
				var a:Array = new Array();
				if(kind.selectedLabel == "ショップ"){
					a.push(str+"3%");
				}else{
					a.push(str+"なし");
					for(var i:int=1; i<=4; i++){
						a.push(str+i.toString()+"%");
					}
				}
				// オプションの登録
				option.dataProvider = a;
				option.selectedIndex = index;
				
				old_option = str;
			}
		}
		/**
		 * setopフォームのデータを変更
		 */
		private function changeSetop(str:String):void{
			// インデックスの保持
			var index:int = setop.selectedIndex;
			if(index == -1)index = 0;
			// オプションの作成
			var a:Array = new Array();
			if(str == ""){
				a.push("");
			}else{
				a.push(str+"+5");
				a.push(str+"+10");
			}
			// オプションの登録
			setop.dataProvider = a;
			setop.selectedIndex = index;
		}
		/**
		 * kindを除くフォームを全て隠す
		 */
		private function hideAll():void{
			FormCommon.hide(item);
			FormCommon.hide(option);
			FormCommon.hide(setop);
			FormCommon.hide(exellent);
		}
		/**
		 * なしを表示
		 */
		private function displayNone():void{
			hideAll();
		}
		/**
		 * 通常を表示
		 */
		private function displayNormal():void{
			hideAll();
			FormCommon.show(item);
			FormCommon.show(option);
			
			changeItem(0);
		}
		/**
		 * EXを表示
		 */
		private function displayEx():void{
			hideAll();
			FormCommon.show(item);
			FormCommon.show(option);
			FormCommon.show(exellent);
			
			changeItem(0);
		}
		/**
		 * セットを表示
		 */
		private function displaySet():void{
			hideAll();
			FormCommon.show(item);
			FormCommon.show(option);
			FormCommon.show(setop);
			
			changeItem(2);
		}
		/**
		 * ショップを表示
		 */
		private function displayShop():void{
			hideAll();
			FormCommon.show(item);
			FormCommon.show(option);

			changeItem(1);
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
		 * option
		 */
		public function getOption():ComboBox{
			return option;
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
	}
}
