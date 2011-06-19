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
		protected var d:FormMUDamage;
	
		protected var kind:ComboBox;
		protected var item:ComboBox;
		protected var setop:ComboBox;
		protected var exellent:FormExellentBox;
	
		protected var hbox:HBox;
		
		protected var kinds:Object;
		protected var KIND_ARRAY:Array;
		/**
		 * コンストラクタ
		 */
		public function FormEquipBase(d:FormMUDamage) {
			this.d = d;

			initKinds();
			initForm();
		}
		/**
		 * kind arrayの初期化
		 */
		protected function initKinds():void{
			
		}
		/**
		 * フォームの初期化
		 */
		protected function initForm():void{
		}
		/**
		 * 改行
		 */
		protected function ln():void{
			hbox = new HBox();
			this.addChild(hbox);
		}
		/**
		 * kindフォーム
		 */
		protected function createKind():void{
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
		protected function createItem():void{
			//アイテムフォームの作成
			item = new ComboBox();
			item.addEventListener(ListEvent.CHANGE,eventChangeItem);
			FormCommon.hide(item);
			hbox.addChild(item);
		}
		/**
		 * setopフォーム
		 */
		protected function createSetop():void{
			//ステータスOPの作成
			setop = new ComboBox();
			FormCommon.hide(setop);
			hbox.addChild(setop);
		}
		/**
		 * kindフォーム変更時イベント
		 */
		protected function eventChangeKind(event:Event):void{
			kind.selectedItem[1]();
		}
		/**
		 * アイテムフォーム変更時イベント
		 */
		protected function eventChangeItem(event:Event):void{
		}
		/**
		 * setopフォームのデータを変更
		 */
		protected function changeSetop():void{
			if(setop.visible){
				var d:Object = D.getData(item.selectedItem.set_item)[item.selectedItem.set_index];
				var k:Object = D.getKey(item.selectedItem.set_item);
				var str:String = d[k.status];
				// インデックスの保持
				var index:int = setop.selectedIndex;
				if(index == -1)index = 0;
				// オプションの作成
				var a:Array = new Array();
				if(str == ""){
					a.push({label:"",type:"none",value:0});
				}else{
					a.push({label:str+"+5",type:str,value:5});
					a.push({label:str+"+10",type:str,value:10});
				}
				// オプションの登録
				setop.dataProvider = a;
				setop.selectedIndex = index;
			}
		}
		/**
		 * kindを除くフォームを全て隠す
		 */
		protected function hideAll():void{
		}
		/**
		 * none
		 */
		protected function displayNone():void{
			hideAll();
		}
		/**
		 * kindがなしの場合true
		 */
		public function isNone():Boolean{
			return (getKind().selectedLabel == "なし");
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
