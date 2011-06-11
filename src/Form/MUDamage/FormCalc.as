package Form.MUDamage {
	import mx.controls.*;
	import mx.containers.*;
	import mx.core.*;
	import mx.collections.*;
	import mx.events.*;
	import flash.events.*;

	import Form.MUDamage.SubForm.*;
	import Data.Database.*;
	
	public class FormCalc extends VBox{
		private var d:FormMUDamage;
		
		private var map:ComboBox;
		private var calc:Button;
	
		private var hbox:HBox;
		/**
		 * コンストラクタ
		 */
		public function FormCalc(d:FormMUDamage) {
			this.d = d;
			
			initForm();
		}
		/**
		 * フォームを初期化
		 */
		private function initForm():void{
			ln();
			createMap();
			createCalc();
		}
		private function ln():void{
			hbox = new HBox();
			this.addChild(hbox);
		}
		/**
		 * Map
		 */
		private function createMap():void{
			map = new ComboBox();
			map.dataProvider = D.getData("map");
			hbox.addChild(map);
		}
		/**
		 * Calc Button
		 */
		private function createCalc():void{
			calc = new Button();
			calc.label = "計算";
			hbox.addChild(calc);
		}
	}
}
