package Form.SubForm {
	/**
	 * アイテムボックス
	 */
	public class FormItemBox extends HBox {
		private var luck:CheckBox;
		private var plus:ComboBox;
		private var option:ComboBox;
		public function FormItemBox() {
			createLuck();
			createPlus();
			createOp();
		}
		/**
		 * 幸運ボックスの作成
		 */
		private function createLuck():void{
			//幸運の作成
			var box:CheckBox = FormCommon.createLuckBox();
			luck = box;
			box.name = item.name;
			this.addChild(box);
			//ラベルの作成
			var la:Label = FormCommon.createLuckLabel();
			luck_label = la;
			la.name = item.name;
			this.addChild(la);
		}
		/**
		 * アイテムレベルボックスの作成
		 */
		private function createPlus():void{
			//+フォームの作成
			plus = FormCommon.createPlus();
			this.addChild(plus);
		}
		/**
		 * OPボックスの作成
		 */
		private function createOp():void{
			//opフォームの作成
			option = new ComboBox();
			this.addChild(item.f_op);
		}
		/**
		 * ItemDataのセット
		 */
		public function setOptionData(type:String):void {
			
		}
		public function addPlusEventListener(func:Function):void {
			item.addEventListener(ListEvent.CHANGE, func);
		}
	}
}
