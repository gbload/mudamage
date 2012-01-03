package Form.MUDamage.BuffSub {
	import mx.controls.*;
	import mx.containers.*;
	import mx.core.*;
	import mx.collections.*;
	import mx.events.*;
	import mx.managers.*;
	import flash.events.*;
	
	public class BuffTextInput extends TextInput {
		/**
		 * 
		 */
		public function BuffTextInput(min:int=0,max:int=-1){
			this.restrict = "0-9";
			this.maxChars = 4;
			this.width = 42;
			this.text = min.toString();
			createStatusEventListener(this,min,max);
		}
		/**
		 * min max
		 */
		private function createStatusEventListener(ti:TextInput,min:int=0,max:int=-1):void{
			ti.addEventListener(FocusEvent.FOCUS_OUT,function():void{
				var num:int = parseInt(ti.text);
				if(num < min)num = min;
				if(max != -1 && num > max)num = max;
				ti.text = num.toString();
			});
		}
		/**
		 * set event
		 */
		public function setEvent(func:Function):void{
			this.addEventListener(FocusEvent.FOCUS_OUT,func);
		}
	}
}