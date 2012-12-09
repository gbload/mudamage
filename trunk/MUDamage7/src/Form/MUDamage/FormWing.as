package Form.MUDamage {
	import mx.controls.*;
	import mx.containers.*;
	import mx.events.*;
	import flash.events.*;
	
	import Form.MUDamage.SubForm.*;
	import Data.Database.*;
	/**
	 * 羽フォーム
	 * @author sinlion
	 *
	 */
	public class FormWing extends FormItem {
		private var LABEL:String = "羽:";
		private var d:FormMUDamage;
		private var item:ComboBox;
		private var item_attr:FormItemAttributeBox;
		private var cop:ComboBox;
		/**
		 * コンストラクタ
		 */
		public function FormWing(d:FormMUDamage) {
			this.d = d;

			this.direction = "horizontal";
			this.label = this.LABEL;

			createItem();
			
			this.item_attr = new FormItemAttributeBox();
			FormCommon.hide(this.item_attr);
			this.addChild(this.item_attr);
			
			createCop();
		}
		/**
		 * アイテムボックスを作成
		 */
		private function createItem():void{
			//アイテムフォームの作成
			item = new ComboBox();
			item.addEventListener(ListEvent.CHANGE,wingChange);
			item.dataProvider = D.getSelect("wing",d.getJob().selectedIndex);
			this.addChild(item);
		}
		/**
		 * COPボックスの作成
		 */
		private function createCop():void{
			//copフォームの作成
			cop = new ComboBox();
			FormCommon.hide(cop);
			this.addChild(cop);
		}
		/**
		 * 羽変更イベント
		 */
		private function wingChange(event:Event):void{
			var wingname:String = item.selectedLabel;
			if(item.selectedIndex == 0){
				//各種非表示
				FormCommon.hide(item_attr);
				FormCommon.hide(cop);
				return;
			}
			var d:Object = D.getData("wing")[item.selectedItem.index];
			var k:Object = D.getKey("wing");
			var op_data:Array = d[k.op];
			if(d[k.type] == 5){//征服者の羽
				item_attr.setOptionData(op_data);
				this.item_attr.getOption().selectedIndex = 4;
				
				this.item_attr.getPlus().selectedIndex = 0;
				
				this.item_attr.getLuck().selected = true;
				FormCommon.hide(this.item_attr);
				FormCommon.hide(this.cop);
			}else{
				//opの作成
				item_attr.setOptionData(op_data);
				
				//copの作成
				this.cop.dataProvider = d[k.cop];
				
				//各種表示
				FormCommon.show(this.item_attr);
				if(d[k.cop].length > 1)FormCommon.show(this.cop);
			}
		}
		public function getItem():ComboBox{
			return item;
		}
		public function getItemAttr():FormItemAttributeBox{
			return item_attr;
		}
		public function getCop():ComboBox{
			return cop;
		}
	}
}
