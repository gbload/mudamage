package Form {
	import mx.controls.*;
	
	private class FormCommon {
		public function FormCommon() {
			
		}
		private static var c:Internal = Internal.getInstance();
		/**
		 * 幸運ボックスの作成
		 */
		public static function createLuckBox():CheckBox{
			//幸運の作成
			var box:CheckBox = CheckBox();
			hide(box);
			return box;
		}
		/**
		 * 幸運ラベルの作成
		 */
		public static function createLuckLabel():Label{
			//幸運ラベルの作成
			var la:Label = new Label();
			hide(la);
			la.text = "Luck";
			return la;
		}
		/**
		 * コンポーネントを非表示にする
		 */
		public static function hide(obj:UIComponent):void{
			obj.visible = false;
			obj.includeInLayout = false;
		}
		/**
		 * コンポーネントを表示する
		 */
		public static function show(obj:UIComponent):void{
			if(obj!=null){
				obj.includeInLayout = true;
				obj.visible = true;
			}
		}
		/**
		 * アイテムレベルのボックスを作成
		 */
		public static function createPlus():ComboBox{
			var e:ComboBox = new ComboBox();
			hide(e);
			e.dataProvider = new ArrayCollection(c.plus);
			return e;
		}
		/**
		 * 重複選択しているか確認
		 * trueの場合、重複している
		 */
		public static function isDuplication(components:Array):boolean {
			var counts:Array = new Array();
			for(var i:int; i<components.length; i++){
				
			}
			return true;//TODO 
		}
		/**
		 * セレクタ
		 */
		public static function labelfunc(item:Object):String{
			if(item.toString() == "")return "";
			return item[1];
		}
		/**
		 * セレクタ2
		 */
		public static function labelfunc0(item:Object):String{
			if(item.toString() == "")return "";
			return item[0];
		}
	}
}
