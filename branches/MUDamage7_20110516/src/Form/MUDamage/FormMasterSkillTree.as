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
	public class FormMasterSkillTree extends HBox
	{
		private var d:FormMUDamage;
		private var skills:Object;
		private var trees:Array = new Array();
		/**
		 * コンストラクタ
		 */
		public function FormMasterSkillTree(d:FormMUDamage){
			this.d = d;
			if(d.getJob().selectedIndex != 6){
				initSkills();
				initBox();
			}
		}
		/**
		 * skillsの初期化
		 */
		private function initSkills():void{
			skills = new Object();
			for(var i:int=0;i<MasterSkill.skill.length;i++)
				skills[MasterSkill.skill[i][MasterSkill.ID]] = {
					item:MasterSkill.skill[i],
					count:0
				};
		}
		/**
		 * Boxの初期化
		 */
		private function initBox():void{
			var job:int = d.getJob().selectedIndex;
			trees[0] = createTree(MasterSkillTree.title[job][0],MasterSkillTree.left);
			trees[1] = createTree(MasterSkillTree.title[job][1],MasterSkillTree.middle[job]);
			trees[2] = createTree(MasterSkillTree.title[job][2],MasterSkillTree.right[job]);
		}
		/**
		 * treeの作成
		 */
		private function createTree(title:String, tree:Array):Canvas{
			var canvas:Canvas = new Canvas();
			canvas.width = 260;
			this.addChild(canvas);
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
						img.source = getSkills(tree[i][j]).item[MasterSkill.IMAGE];
						img.x = j*65;
						img.y = i*50 + 30;
						canvas.addChild(img);
						// tooltip
						setTooltip(img,getSkills(tree[i][j]).item);
						// input
						var ti:TextInput = new TextInput();
						ti.name = (i * tree[i].length + j).toString();
						ti.width = 25;
						ti.restrict = "0-9";
						ti.maxChars = 2;
						ti.x = j*65 + 32;
						ti.y = i*50 + 30 + 22;
						canvas.addChild(ti);
					}
				}
			}
			return canvas;
		}
		private function setTooltip(obj:Image,item:Array):void{
			var str:String = "";
			// 名前
			str += item[MasterSkill.NAME]+"\n"
			// 表示形式 display_type 0:なし 1:% 2:秒 3:÷
			var display_type:int = item[MasterSkill.DISPLAY_TYPE];
			// 値の取得
			var type:int = item[MasterSkill.VALUE_TYPE];
			var value:Array = MasterSkillValue.value[type];
			for(var n:Object in value){
				if(display_type == 1)
					str += "LV"+n+" "+value[n].toString()+"%\n";
				else if(display_type == 2)
					str += "LV"+n+" "+value[n].toString()+"秒\n";
				else if(display_type == 3)
					str += "LV"+n+" "+value[n].toString()+"\n";
				else
					str += "LV"+n+" "+value[n].toString()+"\n";
			}
			// tooltipに登録
			obj.toolTip = str;
		}
		/**
		 * Skills
		 */
		public function getSkills(name:String):Object{
			if(skills[name]==null)Alert.show("Error:"+name);
			return skills[name];
		}

	}
}