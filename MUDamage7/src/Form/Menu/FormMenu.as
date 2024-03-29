package Form.Menu{
	import mx.controls.*;
	import mx.controls.menuClasses.*;
	import mx.events.*;
	import flash.events.*;
	
	import IO.Export.*;
	import IO.File.*;
	import Form.MUDamage.*;
	import Data.Resource.*;
	
	public class FormMenu extends MenuBar{
		private var c:Controller;
		public function FormMenu(){
			this.x=0;
			this.y=0;
			this.height=30;
			this.labelField = "@label";
			
			this.dataProvider = [<menuitem label="ファイル">
            <menuitem label="開く" enabled="true"/>
            <menuitem label="保存" enabled="true"/>
            <menuitem label="エクスポート/インポート" enabled="true"/>
            <menuitem label="一括エクスポート/インポート" enabled="true"/>
        </menuitem>,
        <menuitem label="サンプルデータ" enabled="false"/>,
        <menuitem label="不具合＆リリース" enabled="true">
        	<menuitem label="不具合"/>
        	<menuitem label="リリース"/>
        	<menuitem label="クレジット"/>
        </menuitem>];
			
			this.addEventListener(MenuEvent.ITEM_CLICK,eventClick);
		}
		public function setController(c:Controller):void{
			this.c = c;
		}
		private function eventClick(e:MenuEvent):Boolean{
//			Alert.show(e.label);
//			if(e.label == "一括エクスポート/インポート"){
//				this.parent.addChild(new AllExportPanel());
//			}
			if(e.label == "開く"){
				new OpenPanel(c,this);
			}else if(e.label == "保存"){
				new SavePanel(c,this);
			}else if(e.label == "エクスポート/インポート"){
				new ExportPanel(c,this);
			}else if(e.label == "一括エクスポート/インポート"){
				new AllExportPanel(c,this);
			}else if(e.label == "不具合"){
				new FormAlert(this,Description.bugs);
			}else if(e.label == "リリース"){
				new FormAlert(this,Description.release);
			}else if(e.label == "クレジット"){
				new FormAlert(this,Description.credit);
			}
			return true;
		}
	}
}