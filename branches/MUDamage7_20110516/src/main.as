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
	this.addChild(new FormTitle());
	this.addChild(new FormMenu());
	// image
//	var img:Image = new Image();
//	img.source = Background.main;
//	this.addChild(img);
//	this.setStyle("backgroundColor","#000000");
	
	new Controller(this);
}