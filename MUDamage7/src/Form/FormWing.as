package Form {
	import mx.controls.*;
	
	import Csv.Dat;
	
	public class FormWing extends FormItem {
		private static var LABEL:String = "羽：";
		private var d:Dat;
		private var c:Internal;
		/**
		 * コンストラクタ
		 */
		public function FormWing(d:Dat) {
			this.d = d;
			this.c = Internal.getInstance();
			
			init();
		}
		/**
		 * 各種設定
		 */
		private function init():void{
			this.direction = "horizontal";
			this.label = this.LABEL;
			
			setItem();
			setLuck();
			setPlus();
			setOp();
			setCop();
		}
		/**
		 * アイテムボックスを作成
		 */
		private function setItem():void{
			//アイテムフォームの作成
			var box:ComboBox = new ComboBox();
			box.addEventListener(ListEvent.CHANGE,wingChange);
			box.dataProvider = c.getWing(d.f_job.selectedIndex);
			d.f_wing.f_item = item;
			this.addChild(item);
		}
		/**
		 * 幸運ボックスの作成
		 */
		private function setLuck():void{
			//幸運の作成
			var box:CheckBox = FormCommon.createLuckBox();
			d.f_wing.f_luck = box;
			this.addChild(box);
			//ラベルの作成
			var la:Label = FormCommon.createLuckLabel();
			d.f_wing.f_luck_label = la;
			this.addChild(la);
		}
		/**
		 * アイテムレベルボックスの作成
		 */
		private function setPlus():void{
			//+フォームの作成
			var plus:ComboBox = FormCommon.createPlus();
			d.f_wing.f_plus = plus;
			this.addChild(plus);
		}
		/**
		 * OPボックスの作成
		 */
		private function setOp():void{
			//opフォームの作成
			var op:ComboBox = new ComboBox();
			op.rowCount = 10;
			op.labelFunction = FormCommon.labelfunc0;
			FormCommon.hide(op);
			d.f_wing.f_op = op;
			this.addChild(op);
		}
		/**
		 * COPボックスの作成
		 */
		private function setCop():void{
			//copフォームの作成
			var cop:ComboBox = new ComboBox();
			FormCommon.hide(cop);
			d.f_wing.f_cop = cop;
			fi.addChild(cop);
		}
		/**
		 * 羽変更イベント
		 */
		private function hideWing():void{
			use namespace dat;
			//各種隠し
			hide(d.f_wing.f_cop);
			hide(d.f_wing.f_op);
			hide(d.f_wing.f_plus);
			hide(d.f_wing.f_luck);
			hide(d.f_wing.f_luck_label);
		}
		private function wingChange(event:Event):void{
			var wingname:String = d.f_wing.f_item.selectedLabel;
			if(wingname == "なし"){
				//各種隠し
				hideWing();
			}else{
				//opの作成
				var op:Array = c.getWingOp(wingname);
				d.f_wing.f_op.dataProvider = op;
				
				//copの作成
				var cop:Array = c.getWingCop(wingname);
				d.f_wing.f_cop.dataProvider = cop;
				
				//各種表示
				show(d.f_wing.f_luck);
				show(d.f_wing.f_luck_label);
				show(d.f_wing.f_plus);
				if(op.length > 1)show(d.f_wing.f_op);
				if(cop.length > 1)show(d.f_wing.f_cop);
			}
		}
	}
}
