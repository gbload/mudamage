package Form.MUDamage.InputSupport {
	import mx.controls.*;
	import mx.containers.*;
	import mx.core.*;
	import mx.collections.*;
	import mx.events.*;
	import mx.managers.*;
	import flash.events.*;

	import Form.MUDamage.SubForm.*;
	import Data.Database.*;
	
	public class StatusTextInput extends TextInput{
		private var min:int = 0;
		public function StatusTextInput(min:int=0){
			this.min = min;
			this.restrict = "0-9";
			this.maxChars = 4;
			this.width = 52;
			this.addEventListener(Event.CHANGE,checkMin);
		}
		private function checkMin(event:Event):void{
			var num:int = parseInt(event.target.text);
			if(num < min)
				num = min;
			event.target.text = num.toString();
		}
	}
}