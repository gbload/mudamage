package Form.MUDamage
{
	import mx.controls.*;
	import mx.containers.*;
	import mx.core.*;
	import mx.collections.*;
	import mx.events.*;
	import flash.events.*;

	import Form.MUDamage.SubForm.*;
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
			for(var i:int=0;i<MasterSkill.skill.length;i++)
				skills[MasterSkill.skill[i][MasterSkill.ID]] = {
					item:MasterSkill.skill[i],
					count:null
				};
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
			canvas.width = 260;
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
						// image
						var img:Image = new Image();
						img.source = getSkill(tree[i][j]).item[MasterSkill.IMAGE];
						img.x = j*65;
						img.y = i*50 + 30;
						canvas.addChild(img);
						// tooltip
						setTooltip(img,getSkill(tree[i][j]).item);
						// input
						var ti:TextInput = new TextInput();
						ti.text = "0";
						ti.name = (i * tree[i].length + j).toString();
						ti.width = 25;
						ti.restrict = "0-9";
						ti.maxChars = 2;
						ti.x = j*65 + 32;
						ti.y = i*50 + 30 + 22;
						ti.addEventListener(FocusEvent.FOCUS_IN,FormCommon.eventFocusAllSelection);
						ti.addEventListener(FocusEvent.FOCUS_OUT,eventChangeSkillLevel);
						canvas.addChild(ti);
						getSkill(tree[i][j]).count = ti;
					}
				}
			}
			return canvas;
		}
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
		/**
		 * event
		 */
		private function eventChangeLevel(event:Event):void{
			// validate
			var value:int = parseInt(level.text);
			if(value < 0)value=0;
			else if(value > 200)value=200;
			level.text = value.toString();
			// change point
			changePoint();
		}
		/**
		 * event
		 */
		private function eventChangeSkillLevel(event:Event):void{
			// validate
			var value:int = parseInt(event.target.parent.text);
			if(value < 0)value=0;
			else if(value > 20)value=20;
			event.target.parent.text = value.toString();
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
				if(skills[n].count != null)
					rest -= parseInt(skills[n].count.text);
			if(rest < 0)
				point.setStyle("color","#FF00000");
			point.text = "ポイント："+rest+" / "+max;
		}
		/**
		 * Skills
		 */
		public function getSkill(name:String):Object{
			if(skills[name]==null)Alert.show("Error:"+name);
			return skills[name];
		}
		public function getLevel():TextInput{
			return level;
		}
	}
}