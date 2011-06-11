package Form.MUDamage.SubForm {
	import mx.controls.*;
	import mx.containers.*;
	import mx.core.*;
	import mx.collections.*;
	import mx.events.*;
	import flash.events.*;

	import Form.MUDamage.*;
	import Data.Database.*;
	/**
	 * エンチャントフォーム
	 * @author sinlion
	 *
	 */
	public class FormEnchantBox extends HBox {
		private var item:ComboBox;
		private var plus:ComboBox;
	
		private var kind:ComboBox;
		private var value:ComboBox;
		/**
		 * EnchantBoxの作成
		 */
		public function FormEnchantBox(item:ComboBox, plus:ComboBox) {
			this.item = item;
			this.plus = plus;
			// アイテムレベルフォームにイベントを登録
			item.addEventListener(ListEvent.CHANGE, eventChangePlus);
			plus.addEventListener(ListEvent.CHANGE, eventChangePlus);
			// エンチャントOPの作成
			// エンチャントの種類
			kind = new ComboBox();
			kind.labelFunction = FormCommon.labelfunc0;
			kind.addEventListener(ListEvent.CHANGE, eventChange);
			this.addChild(kind);
			// エンチャントの値
			value = new ComboBox();
			this.addChild(value);
		}
		/**
		 * クリックイベント
		 * エンチャントの値フォームのデータを変更
		 */
		private function eventChange(event:Event):void {
			changeEnchantValue();
		}
		/**
		 * アイテムレベルの変更時イベント及びアイテムの変更時イベント
		 * エンチャントの種類を変更
		 */
		private function eventChangePlus(event:Event):void{
			changeEnchant();
		}
		/**
		 * エンチャントの値フォームのデータを変更
		 */
		private function changeEnchantValue():void{
			var index:int = value.selectedIndex;
			var a:Array = new Array();
			for(var i:int=kind.selectedItem[2];i<=plus.selectedIndex && i<=13;i++){
				a.push(kind.selectedItem[3][i - kind.selectedItem[2]]);
			}
			value.dataProvider = a;
			value.selectedIndex = index;
		}
		/**
		 * エンチャントの種類を変更
		 * @param item ComboBox.selectedItem
		 */
		public function changeEnchant():void{
			if(this.visible){
				var str:String = item.selectedItem.item;
				var d:Object = D.getData(str)[item.selectedItem.index];
				var k:Object = D.getKey(str);
				var type:int = d[k.ex_en_type];
				// エンチャントの種類を変更
				var index:int = kind.selectedIndex;
				kind.dataProvider = D.getEnchant(
						type,
						plus.selectedIndex);
				kind.selectedIndex = index;
				// エンチャントの値を変更
				changeEnchantValue();
			}
		}
		/**
		 * エンチャント名を返す
		 */
		public function getKind():ComboBox {
			return kind;
		}
		/**
		 * エンチャントの値を返す
		 */
		public function getValue():ComboBox {
			return value;
		}
	}
}
