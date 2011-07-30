package Form.MUDamage {
	import mx.controls.*;
	import mx.containers.*;
	import mx.core.*;
	import mx.collections.*;
	import mx.events.*;
	import flash.events.*;

	import Form.MUDamage.SubForm.*;
	import Data.Database.*;
	import Calc.ResultScreen.*;
	
	public class FormCalc extends VBox{
		private var d:FormMUDamage;
		private var controller:Controller;
		
		private var map:ComboBox;
		private var calc:Button;
	
		private var hbox:HBox;
		/**
		 * コンストラクタ
		 */
		public function FormCalc(d:FormMUDamage,controller:Controller) {
			this.d = d;
			this.controller = controller;
			
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
			calc.addEventListener(MouseEvent.CLICK,eventClickCalc);
			hbox.addChild(calc);
		}
		/**
		 * event click calc button
		 */
		private function eventClickCalc(event:Event):void{
//			controller.showResult(new ResultScreen(d));
			d.addMain(new ResultScreen(d));
		}
		/**
		 * map
		 */
		public function getMap():ComboBox{
			return map;
		}
	}
}
