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
			la.text = "幸運";
			return la;
		}
		/**
		 * コンポーネントを非表示にする
		 */
		private static function hide(obj:UIComponent):void{
			obj.visible = false;
			obj.includeInLayout = false;
		}
		/**
		 * アイテムレベルのボックスを作成
		 */
		private static function createPlus():ComboBox{
			var e:ComboBox = new ComboBox();
			hide(e);
			e.dataProvider = new ArrayCollection(c.plus);
			return e;
		}
		/**
		 * セレクタ
		 */
		private function labelfunc(item:Object):String{
			if(item.toString() == "")return "";
			return item[1];
		}
		/**
		 * セレクタ2
		 */
		private function labelfunc0(item:Object):String{
			if(item.toString() == "")return "";
			return item[0];
		}
	}
}
