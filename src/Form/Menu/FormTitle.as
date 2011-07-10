package Form.Menu{
	import mx.controls.*;
	import mx.containers.*;
	import mx.controls.menuClasses.*;
	import mx.events.*;
	import flash.events.*;
	
	import Data.Resource.*;
	
	public class FormTitle extends Canvas{
		public function FormTitle(){
			this.x=30;
			this.y=30;
			
			createTitle();
			createVersion();
		}
		private function createTitle():void{
			var label:Label = new Label();
			label.text = "MUDamage7";
			label.setStyle("fontSize","20");
			this.addChild(label);
		}
		private function createVersion():void{
			var label:Label = new Label();
			label.text = Version.version;
			label.x = 50;
			label.y = 25;
			this.addChild(label);
		}
	}
}