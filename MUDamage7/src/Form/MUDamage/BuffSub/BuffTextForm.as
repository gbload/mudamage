package Form.MUDamage.BuffSub {
	import mx.controls.*;
	import mx.containers.*;
	import mx.core.*;
	import mx.collections.*;
	import mx.events.*;
	import mx.managers.*;
	import flash.events.*;
	
	public class BuffTextForm extends HBox {
		private var la:Label;
		private var ti:TextInput;
		/**
		 * 
		 */
		public function BuffTextForm(str:String,min:int=0,max:int=-1){
			la = new Label();
			la.text = str;
			this.addChild(la);
			ti = new BuffTextInput(min,max);
			this.addChild(ti);
		}
		/**
		 * set event
		 */
		public function setEvent(func:Function):void{
			ti.addEventListener(FocusEvent.FOCUS_OUT,func);
		}
		public function get text():String{
			return ti.text;
		}
		public function set text(str:String):void{
			ti.text = str;
		}
	}
}