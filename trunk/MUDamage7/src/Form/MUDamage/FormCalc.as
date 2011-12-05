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
	import PVP.*;
	import IO.FileIO.*;
	
	public class FormCalc extends VBox{
		private var d:FormMUDamage;
		private var controller:Controller;
		
		private var map:ComboBox;
		private var sub1:ComboBox;
		private var sub2:ComboBox;
		private var calc:Button;
		private var pvp_text:TextInput;
		private var pvp_calc:Button;
	
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
			ln();
			createPVPTextInput();
			createPVPCalc();
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
		 * PvP Input Button
		 */
		private function createPVPTextInput():void{
			pvp_text = new TextInput();
			pvp_text.toolTip = "開くファイル名を入力してください。";
			hbox.addChild(pvp_text);
		}
		/**
		 * PvP Calc Button
		 */
		private function createPVPCalc():void{
			pvp_calc = new Button();
			pvp_calc.label = "対人計算";
			pvp_calc.addEventListener(MouseEvent.CLICK,eventClickPVPCalc);
			hbox.addChild(pvp_calc);
		}
		/**
		 * event click calc button
		 */
		private function eventClickCalc(event:Event):void{
			controller.showResult(new ResultScreen(d));
		}
		/**
		 * event click calc button
		 */
		private function eventClickPVPCalc(event:Event):void{
			// file open
			var title:String = pvp_text.text;
			var a:Array = StaticFileIO.open(title); 
			if(a == null){
				Alert.show("["+title+"]は存在しません");
				return;
			}
			var form:FormMUDamage = new FormMUDamage(controller, a[1]);
			StaticFormIO.setData(a,form);
			// 計算して結果を表示
			controller.showResult(new PVPResultScreen(d,form));
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
