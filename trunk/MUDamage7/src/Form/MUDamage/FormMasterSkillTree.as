package Form.MUDamage
{
	import mx.controls.*;
	import mx.containers.*;
	import mx.core.*;
	import mx.collections.*;
	import mx.events.*;
	import flash.events.*;

	import Form.MUDamage.SubForm.*;
	import Form.MUDamage.BuffSub.*;
	import Data.Database.*;
	import Data.Database.MLV.*;
	/**
	 * マスタースキルツリー
	 * @author sinlion
	 *
	 */
	public class FormMasterSkillTree extends VBox
	{
		private var d:FormMUDamage;
		private var skills:Object;
		private var trees:Array = new Array();
		private var names:Array = new Array();
		private var level:TextInput;
	
		private var point:Label;
		private var hbox:HBox;
		/**
		 * コンストラクタ
		 */
		public function FormMasterSkillTree(d:FormMUDamage){
			this.d = d;
			initSkills();
			initBox();
		}
		/**
		 * skillsの初期化
		 */
		private function initSkills():void{
			skills = new Object();
			var a:Array = MasterSkill.skill;
			for(var i:int=0;i<a.length;i++){
				skills[a[i][0]] = new Object();
				skills[a[i][0]].getSkillValue = function():int{return 0;};
			}
		}
		/**
		 * Boxの初期化
		 */
		private function initBox():void{
			// LV
			ln();
			createLevel();
			// Tree
			ln();
			var job:int = d.getJob().selectedIndex;
			if(job==6)// rage fighter
				names[0] = MasterSkillTree.left_rage;
			else if(job==4)// darkload
				names[0] = MasterSkillTree.left_darkload;
			else
				names[0] = MasterSkillTree.left;
			names[1] = MasterSkillTree.middle[job];
			names[2] = MasterSkillTree.right[job];
			if(job==6)// rage fighter
				trees[0] = createTree(MasterSkillTree.title[job][0],MasterSkillTree.left_rage);
			else if(job==4)// darkload
				trees[0] = createTree(MasterSkillTree.title[job][0],MasterSkillTree.left_darkload);
			else
				trees[0] = createTree(MasterSkillTree.title[job][0],MasterSkillTree.left);
			trees[1] = createTree(MasterSkillTree.title[job][1],MasterSkillTree.middle[job]);
			trees[2] = createTree(MasterSkillTree.title[job][2],MasterSkillTree.right[job]);
		}
		/**
		 * 改行
		 */
		private function ln():void{
			hbox = new HBox();
			this.addChild(hbox);
		}
		/**
		 * LVフォームの作成
		 */
		private function createLevel():void{
			var fi:FormItem = new FormItem();
			fi.label = "MLV:";
			hbox.addChild(fi);
			level = new TextInput();
			level.text = "0";
			level.restrict = "0-9";
			level.maxChars = 3;
			level.width = 42;
			level.addEventListener(FocusEvent.FOCUS_IN,FormCommon.eventFocusAllSelection);
			level.addEventListener(FocusEvent.FOCUS_OUT,eventChangeLevel);
			fi.addChild(level);
			// point
			point = new Label();
			point.text = "ポイント：0 / 0";
			hbox.addChild(point);
		}
		/**
		 * treeの作成
		 */
		private function createTree(title:String, tree:Array):Canvas{
			var canvas:Canvas = new Canvas();
			canvas.width = 280;
			hbox.addChild(canvas);
			// title
			var label:Label = new Label();
			label.text = title;
			label.x = 120;
			label.y = 0;
			canvas.addChild(label);
			// tree
			for(var i:int=0;i<tree.length;i++){
				for(var j:int=0;j<tree[i].length;j++){
					if(tree[i][j] != ""){
						var can:BuffMasterSkillCanvas = new BuffMasterSkillCanvas(tree[i][j]);
						can.x = j*65+10;
						can.y = i*50+30;
						can.setEvent(eventChangeSkillLevel);
						canvas.addChild(can);
						skills[tree[i][j]] = can;
					}
				}
			}
			return canvas;
		}
		/**
		 * event
		 */
		private function eventChangeLevel(event:Event):void{
			// validate
			var value:int = parseInt(level.text);
			if(value < 0)value=0;
			else if(value > 330)value=330;
			level.text = value.toString();
			// change point
			changePoint();
		}
		/**
		 * event
		 */
		private function eventChangeSkillLevel(event:Event):void{
			// change point
			changePoint();
		}
		/**
		 * change point
		 */
		private function changePoint():void{
			var max:int = parseInt(level.text);
			var rest:int = max; //残りポイント
			var over:int = 0; //超過ポイント
			for(var n:String in skills)
				if(skills[n].getValue != null)
					rest -= parseInt(skills[n].getValue());
			if(rest < 0)
				point.setStyle("color","#FF0000");
			else
				point.setStyle("color","#000000")
			point.text = "ポイント："+rest+" / "+max;
		}
		/**
		 * call
		 */
		public function callFunction():void{
			changePoint();
		}
		/**
		 * Skills
		 */
		public function getSkill(name:String):Object{
			if(skills[name]==null)Alert.show("Error:"+name);
			return skills[name];
		}
		public function getSkillValue(name:String):Number{
			if(skills[name+"_rage"]!=null 
					&& skills[name+"_rage"].getSkillValue() != 0)
				return skills[name+"_rage"].getSkillValue();
			if(skills[name]!=null)
				return skills[name].getSkillValue();
			Alert.show("Error:"+name);
			return 0;
		}
		public function getLevel():TextInput{
			return level;
		}
		/**
		 * IO
		 */
		public function getSaveData():Array{
			var a:Array = new Array();
			for(var n:int=0;n<3;n++)
				for(var i:int=0;i<names[n].length;i++)
					for(var j:int=0;j<names[n][i].length;j++)
						if(names[n][i][j]!="")
							a.push(getSkill(names[n][i][j]).getValue());
			return a;
		}
		public function setSaveData(a:Array):void{
			if(a==null)return;
			var index:int = 0;
			for(var n:int=0;n<3;n++)
				for(var i:int=0;i<names[n].length;i++)
					for(var j:int=0;j<names[n][i].length;j++)
						if(names[n][i][j]!="")
							getSkill(names[n][i][j]).setValue(a[index++]);
		}
		public function getSaveCount():int{
			var count:int = 0;
			for(var n:int=0;n<3;n++)
				for(var i:int=0;i<names[n].length;i++)
					for(var j:int=0;j<names[n][i].length;j++)
						if(names[n][i][j]!="")
							count++;
			return count;
		}
	}
}