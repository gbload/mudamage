package Form.Menu{
	import mx.controls.*;
	import mx.controls.menuClasses.*;
	import mx.events.*;
	import flash.events.*;
	
	import IO.Export.*;
	
	public class FormMenu extends MenuBar{
		public function FormMenu(){
			this.x=200;
			this.y=40;
			this.labelField = "@label";
			
			this.dataProvider = [<menuitem label="ファイル">
            <menuitem label="開く" enabled="false"/>
            <menuitem label="保存" enabled="false"/>
            <menuitem label="エクスポート/インポート" enabled="false"/>
            <menuitem label="一括エクスポート/インポート"/>
        </menuitem>,
        <menuitem label="石像破壊シミュレータ" enabled="false"/>,
        <menuitem label="サンプルデータ" enabled="false"/>,
        <menuitem label="不具合＆リリース" enabled="false"/>];
			
			this.addEventListener(MenuEvent.ITEM_CLICK,eventClick);
		}
		private function eventClick(e:MenuEvent):Boolean{
//			Alert.show(e.label);
			if(e.label == "一括エクスポート/インポート"){
				this.parent.addChild(new AllExportPanel());
			}
			return true;
		}
	}
}