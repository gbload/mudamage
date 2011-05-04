package Form.SubForm {
	public class FormEnchantBox extends HBox {
		private var name:ComboBox;
		private var value:ComboBox;
		/**
		 * EnchantBoxの作成
		 */
		public function FormEnchantBox() {
			// 
			internal = Internal.getInstance();
			// エンチャントOPの作成
			item.f_enop = new ComboBox();
			name = item.f_enop;
			item.f_enop.name = item.name;
			item.f_enop.labelFunction = FormCommon.labelfunc0;
			item.f_enop.addEventListener(ListEvent.CHANGE,click::en);
			hide(item.f_enop);
			hbox.addChild(item.f_enop);
			item.f_enop_value = new ComboBox();
			value = item.f_enop_value;
			item.f_enop_value.name = item.name;
			item.f_enop_value.width = 80;
			hide(item.f_enop_value);
			hbox.addChild(item.f_enop_value);
		}
		/**
		 * クリックイベント
		 */
		private function eventClick(Event event):boolean {
			if(!name.selectedItem)return false;//インポート対策
			var sel:int = value.selectedIndex;
			var a:Array = new Array();
			for(var i:int=name.selectedItem[2];i<=item.f_plus.selectedIndex,i<=13;i++){
				a.push(item.f_enop.selectedItem[3][i - item.f_enop.selectedItem[2]]);
			}
			value.dataProvider = a;
			value.selectedIndex = sel;
			return true;
		}
		/**
		 * エンチャントの種類をセット
		 */
		private function setData(internal:Internal,item:Object,plus:int):void {
			if(!item)return false;//インポート対策
			var sel:int = name.selectedIndex;
			name.dataProvider = internal.getEnchaunt(
					internal.getEnchauntKind(item),
					plus);
			name.selectedIndex = sel;
			
			return true;
		}
		public function getName():ComboBox {
			return name;
		}
		public function getValue():ComboBox {
			return value;
		}
	}
}
