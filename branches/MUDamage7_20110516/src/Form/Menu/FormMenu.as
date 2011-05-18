package Form.Menu{
	import mx.controls.*;
	import mx.controls.menuClasses.*;
	import mx.events.*;
	import flash.events.*;
	
	public class FormMenu extends MenuBar{
		public function FormMenu(){
			this.x=100;
			this.y=30;
			this.labelField = "@label";
			
			this.dataProvider = [<menuitem label="MenuItem A">
            <menuitem label="SubMenuItem A-1" enabled="false"/>
            <menuitem label="SubMenuItem A-2"/>
        </menuitem>,
        <menuitem label="MenuItem B"/>,
        <menuitem label="MenuItem C"/>,
        <menuitem label="MenuItem D">
            <menuitem label="SubMenuItem D-1" 
                type="radio" groupName="one"/>
            <menuitem label="SubMenuItem D-2" 
                type="radio" groupName="one"
                selected="true"/>
            <menuitem label="SubMenuItem D-3" 
                type="radio" groupName="one"/>
        </menuitem>];
			
			this.addEventListener(MenuEvent.ITEM_CLICK,eventClick);
		}
		private function eventClick(e:MenuEvent):Boolean{
			Alert.show(e.label);
			return true;
		}
	}
}