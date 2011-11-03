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
		private var LABEL:String = "羽：";
		private var d:FormMUDamage;
		private var c:Internal;
		private var item:ComboBox;
		private var item_attr:FormItemAttributeBox;
		private var cop:ComboBox;
		/**
		 * コンストラクタ
		 */
		public function FormWing(d:FormMUDamage) {
			this.d = d;
			this.c = Internal.getInstance();

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
			item.dataProvider = c.getWing(d.getJob().selectedIndex);//TODO
			item.labelFunction = FormCommon.labelfunc0;
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
			if(wingname == "なし"){
				//各種非表示
				FormCommon.hide(item_attr);
				FormCommon.hide(cop);
			}else{
				//opの作成
//				var op_data:Array = c.getWingOp(wingname);
//				item_attr.setOptionData(op_data);
			// TODO
				
				//copの作成
				var cop_data:Array = c.getWingCop(wingname);
				this.cop.dataProvider = cop_data;
				
				//各種表示
				FormCommon.show(this.item_attr);
				if(cop_data.length > 1)FormCommon.show(this.cop);
			}
		}
	}
}
