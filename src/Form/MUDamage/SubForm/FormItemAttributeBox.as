package Form.MUDamage.SubForm {
	import mx.controls.*;
	import mx.containers.*;
	import mx.core.*;
	import mx.collections.*;
	import mx.events.*;
	import flash.events.*;
	
	import Data.Database.*;
	/**
	 * アイテムボックス
	 */
	public class FormItemAttributeBox extends HBox {
		private var luck:CheckBox;
		private var luck_label:Label;
		private var plus:ComboBox;
		private var option:ComboBox;
		/**
		 * コンストラクタ
		 */
		public function FormItemAttributeBox() {
			createLuck();
			createPlus();
			createOp();
		}
		/**
		 * 幸運ボックスの作成
		 */
		private function createLuck():void{
			//幸運の作成
			var box:CheckBox = new CheckBox();
			luck = box;
			this.addChild(box);
			//ラベルの作成
			var la:Label = new Label();
			la.text = "幸運";
			this.addChild(la);
		}
		/**
		 * アイテムレベルボックスの作成
		 */
		private function createPlus():void{
			//+フォームの作成
			plus = new ComboBox();
			plus.dataProvider = D.getData("plus");
			this.addChild(plus);
		}
		/**
		 * OPボックスの作成
		 */
		private function createOp():void{
			//opフォームの作成
			option = new ComboBox();
			this.addChild(option);
		}
		/**
		 * ItemDataのセット
		 * @param ops [[type,value],...] type:攻撃,魔力,...
		 */
		public function setOptionData(ops:Array):void {
			// old index
			var old:int = option.selectedIndex;
			if(old<0)old = 0;
			// create
			var a:Array = new Array();
			a.push({
				label:"opなし",
				type:"",
				value:0
			});
			for each(var op:Array in ops){
				var per:String = "";
				if(op[1]==1)per = "%";
				var plus:String = "+";
				if(op[1]==1)plus = "";
				for(var i:int=1;i<=4;i++)
					a.push({
						label:op[0]+plus+(op[1]*i).toString()+per,
						type:op[0],
						value:op[1]*i
					});
			}
			option.dataProvider = a;
			// old index
			option.selectedIndex = old;
		}
		/**
		 * 幸運の有無を返す
		 */
		public function getLuck():CheckBox{
			return luck;
		}
		/**
		 * オプションフォームを返す
		 */
		public function getOption():ComboBox{
			return option;
		}
		/**
		 * アイテムレベルを返す
		 */
		public function getPlus():ComboBox{
			return plus;
		}
	}
}
