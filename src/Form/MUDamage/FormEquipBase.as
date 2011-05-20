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
	 * 装備フォームのベース
	 * @author sinlion
	 *
	 */
	public class FormEquipBase extends FormItem {
		private var LABEL:String = "ネック:";
		private var d:FormMUDamage;
		private var c:Internal;
	
		private var kind:ComboBox;
		private var item:ComboBox;
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
		public function FormEquipBase(d:FormMUDamage) {
			this.d = d;
			this.c = Internal.getInstance();
			
			this.label = this.LABEL;
			
			init();
			initForm();
		}
		/**
		 * 初期化
		 */
		private function init():void{
		}
		/**
		 * フォームの初期化
		 */
		private function initForm():void{
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
			if(setop.visible){
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
		}
		/**
		 * kindを除くフォームを全て隠す
		 */
		private function hideAll():void{
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
