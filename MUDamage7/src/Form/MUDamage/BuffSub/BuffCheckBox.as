package Form.MUDamage.BuffSub {
	import mx.controls.*;
	import mx.containers.*;
	import mx.core.*;
	import mx.collections.*;
	import mx.events.*;
	import mx.managers.*;
	import flash.events.*;
	
	public class BuffCheckBox extends CheckBox {
		public function BuffCheckBox(label:Label){
			label.setStyle("color","#BBBBBB");
			var obj:CheckBox = this;
			this.addEventListener(Event.CHANGE,function(event:Event):void{
				if(obj.selected){
					label.setStyle("color","#000000");
				}else{
					label.setStyle("color","#BBBBBB");
				}
			});
		}
	}
}