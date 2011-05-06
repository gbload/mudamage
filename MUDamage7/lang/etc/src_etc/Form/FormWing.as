package Form {
	import mx.controls.*;
	
	import Csv.Dat;
	
	public class FormWing extends FormItem {
		private static var LABEL:String = "Wing:";
		private var d:Dat;
		private var c:Internal;
		private var item:ComboBox;
		private var item_attr:FormItemAttributeBox;
		private var cop:ComboBox;
		/**
		 * コンストラクタ
		 */
		public function FormWing(d:Dat) {
			this.d = d;
			this.c = Internal.getInstance();

			this.direction = "horizontal";
			this.label = this.LABEL;

			createItem();
			this.item_attr = new FormItemAttributeBox();
			createCop();
		}
		/**
		 * アイテムボックスを作成
		 */
		private function createItem():void{
			//アイテムフォームの作成
			var item:ComboBox = new ComboBox();
			item.addEventListener(ListEvent.CHANGE,wingChange);
			item.dataProvider = c.getWing(d.f_job.selectedIndex);
			this.addChild(item);
		}
		/**
		 * COPボックスの作成
		 */
		private function createCop():void{
			//copフォームの作成
			var cop:ComboBox = new ComboBox();
			FormCommon.hide(cop);
			d.f_wing.f_cop = cop;
			fi.addChild(cop);
		}
		/**
		 * 羽変更イベント
		 */
		private function wingChange(event:Event):void{
			var wingname:String = item.selectedLabel;
			if(wingname == "None"){
				//各種非表示
				FormCommon.hide(item_attr);
				FormCommon.hide(cop);
			}else{
				//opの作成
				var op:Array = c.getWingOp(wingname);
				item_attr.setOptionData(op);
				
				//copの作成
				var cop:Array = c.getWingCop(wingname);
				this.cop.dataProvider = cop;
				
				//各種表示
				FormCommon.show(item_attr);
				if(cop.length > 1)FormCommon.show(cop);
			}
		}
	}
}
