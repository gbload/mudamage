package Form.MUDamage.BuffSub {
	import mx.controls.*;
	import mx.containers.*;
	import mx.core.*;
	import mx.collections.*;
	import mx.events.*;
	import flash.events.*;

	import Form.MUDamage.SubForm.*;
	import Data.Database.*;
	import Data.Database.MLV.*;
	
	public class BuffMasterSkillCanvas extends Canvas {
		private var ti:BuffTextInput;
		private var master:Array;
		/**
		 * 
		 */
		public function BuffMasterSkillCanvas(name:String){
			// master skill
			master = MasterSkill.getSkill(name);
			// image
			var img:Image = new Image();
			img.source = master[MasterSkill.IMAGE];
			img.x = 0;
			img.y = 0;
			this.addChild(img);
			// tooltip
			setTooltip(img,master);
			// input
			var max:int = 20;
			ti = new BuffTextInput(0,max);
			ti.text = "0";
			ti.width = 25;
			ti.restrict = "0-9";
			ti.maxChars = 2;
			ti.x = 32;
			ti.y = 22;
			ti.addEventListener(FocusEvent.FOCUS_IN,FormCommon.eventFocusAllSelection);
			this.addChild(ti);
		}
		/**
		 * get
		 */
		public function getValue():String{
			return ti.text;
		}
		/**
		 * get skill value
		 */
		public function getSkillValue():Number{
			if(parseInt(ti.text)==0)return 0;
			else return MasterSkillValue.value[master[MasterSkill.VALUE_TYPE]][parseInt(ti.text)-1];
		}
		/**
		 * set
		 */
		public function setValue(text:String):void{
			ti.text = text;
		}
		/**
		 * set event
		 */
		public function setEvent(func:Function):void{
			ti.addEventListener(FocusEvent.FOCUS_OUT,func);
		}
		/**
		 * tooltip
		 */
		private function setTooltip(obj:Image,item:Array):void{
			var str:String = "";
			// 名前
			str += item[MasterSkill.NAME]+"\n";
			// 説明
			str += item[MasterSkill.DESCRIPTION]+"\n";
			// 表示形式 display_type 0:なし 1:% 2:秒 3:÷
			var display_type:int = item[MasterSkill.DISPLAY_TYPE];
			// 値の取得
			var type:int = item[MasterSkill.VALUE_TYPE];
			var value:Array = MasterSkillValue.value[type];
			for(var n:String in value){
				var lv:int = parseInt(n)+1;
				if(display_type == 1)
					str += "LV"+lv+" "+value[n].toString()+"%\n";
				else if(display_type == 2)
					str += "LV"+lv+" "+value[n].toString()+"秒\n";
				else if(display_type == 3)
					str += "LV"+lv+" "+value[n].toString()+"\n";
				else
					str += "LV"+lv+" "+value[n].toString()+"\n";
			}
			// tooltipに登録
			obj.toolTip = str;
			// tooltipのスタイル変更
			ToolTip.maxWidth = 200;
		}
	}
}