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
		private var c:Internal = Internal.getInstance();
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
			plus.dataProvider = new ArrayCollection(c.plus);
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
		 */
		public function setOptionData(type:String):void {
			
		}
		/**
		 * 幸運の有無を返す
		 */
		public function getLuck():Boolean{
			return luck.selected;
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
