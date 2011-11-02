import Form.Menu.*;
import Form.MUDamage.*;
import mx.controls.*;
import mx.containers.*;
import mx.core.*;
import mx.collections.*;
import mx.events.*;
import flash.events.*;

import Form.MUDamage.SubForm.*;
import Data.Database.*;
import Data.Database.MLV.*;
import Data.Resource.*;

public namespace main;

main function init():void{
	// アプリケーションコントロールバー
	var a:ApplicationControlBar = new ApplicationControlBar();
	a.dock = true;
	this.addChild(a);
	// タイトル
	a.addChild(new FormTitle());
	// メニュー
	var menu:FormMenu = new FormMenu();
	a.addChild(menu);
	
	// image
//	var img:Image = new Image();
//	img.source = Background.main;
//	this.addChild(img);
	this.setStyle("backgroundColor","#FAFAFA");
	
	var c:Controller = new Controller(this);
	menu.setController(c);
	
}