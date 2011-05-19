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
		private var c:Internal;
		private var item:ComboBox;
		private var item_attr:FormItemAttributeBox;
	
		private var type:ComboBox;
		private var value:ComboBox;
		/**
		 * EnchantBoxの作成
		 */
		public function FormEnchantBox(item:ComboBox, item_attr:FormItemAttributeBox) {
			c = Internal.getInstance();
			this.item = item;
			this.item_attr = item_attr;
			// アイテムレベルフォームにイベントを登録
			item.addEventListener(ListEvent.CHANGE, eventChangePlus);
			item_attr.addPlusEventListener(eventChangePlus);
			// エンチャントOPの作成
			// エンチャントの種類
			type = new ComboBox();
			type.labelFunction = FormCommon.labelfunc0;
			type.addEventListener(ListEvent.CHANGE, eventChange);
			this.addChild(type);
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
		private function changeEnchantValue():void{
			var index:int = value.selectedIndex;
			var a:Array = new Array();
			for(var i:int=type.selectedItem[2];i<=item_attr.getPlus(),i<=13;i++){
				a.push(type.selectedItem[3][i - type.selectedItem[2]]);
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
				// エンチャントの種類を変更
				var index:int = type.selectedIndex;
				type.dataProvider = c.getEnchaunt(
						c.getEnchauntKind(item),
						item_attr.getPlus());
				type.selectedIndex = index;
				// エンチャントの値を変更
				changeEnchantValue();
			}
		}
		/**
		 * エンチャント名を返す
		 */
		public function getType():ComboBox {
			return type;
		}
		/**
		 * エンチャントの値を返す
		 */
		public function getValue():ComboBox {
			return value;
		}
	}
}
