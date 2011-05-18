import Form.Menu.*;
import Form.MUDamage.*;

public namespace main;

main function init():void{
	this.addChild(new FormMenu());
	
	new Controller(this);
}