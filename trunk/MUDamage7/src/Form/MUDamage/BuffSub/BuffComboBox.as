package Form.MUDamage.BuffSub {
	import mx.controls.*;
	import mx.containers.*;
	import mx.core.*;
	import mx.collections.*;
	import mx.events.*;
	import mx.managers.*;
	import flash.events.*;
	
	public class BuffComboBox extends ComboBox {
		/**
		 * 
		 */
		public function BuffComboBox(data:Array){
			this.dataProvider = data;
			this.rowCount = 10;
		}
		/**
		 * set event
		 */
		public function setEvent(func:Function):void{
			this.addEventListener(ListEvent.CHANGE,func);
		}
	}
}