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
		private var sub1:ComboBox;
		private var sub2:ComboBox;
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
			createSubform();
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
			map.addEventListener(ListEvent.CHANGE, eventChangeMap);
			hbox.addChild(map);
		}
		/**
		 * Subform
		 */
		private function createSubform():void{
			sub1 = new ComboBox();
			FormCommon.hide(sub1);
			hbox.addChild(sub1);
			sub2 = new ComboBox();
			FormCommon.hide(sub2);
			hbox.addChild(sub2);
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
			controller.showResult(new ResultScreen(d));
//			d.addMain(new ResultScreen(d));
		}
		/**
		 * event change map
		 */
		private function eventChangeMap(event:Event):void{
			FormCommon.hide(sub1);
			FormCommon.hide(sub2);
			if(map.selectedLabel=="ドッペルゲンガー"){
				sub1.dataProvider = DoubleGoer.getPTMOptions();
				sub2.dataProvider = DoubleGoer.getLvOptions();
				FormCommon.show(sub1);
				FormCommon.show(sub2);
			}else if(map.selectedLabel=="カウンターリベリオン"){
				sub1.dataProvider = ImperialGuardian.getLvOptions();
				FormCommon.show(sub1);
			}
		}
		/**
		 * map
		 */
		public function getMap():ComboBox{
			return map;
		}
		public function getSub1():ComboBox{
			return sub1;
		}
		public function getSub2():ComboBox{
			return sub2;
		}
	}
}
