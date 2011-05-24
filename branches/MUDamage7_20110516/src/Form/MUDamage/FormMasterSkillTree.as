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
		private var c:Internal = Internal.getInstance();
		private var skills:Object;
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
			createTree(MasterSkillTree.title[job][0],MasterSkillTree.left);
			createTree(MasterSkillTree.title[job][1],MasterSkillTree.middle[job]);
			createTree(MasterSkillTree.title[job][2],MasterSkillTree.right[job]);
		}
		/**
		 * スキルツリーを作成
		 */
		private function createTree(title:String,tree:Array):void{
			var vbox:VBox = new VBox();
			this.addChild(vbox);
			var hbox:HBox;
			for(var i:int=0;i<tree.length;i++){
				hbox = new HBox();
				vbox.addChild(hbox);
				for(var j:int=0;j<tree[i].length;j++){
					if(tree[i][j] != ""){
						var img:Image = new Image();
						img.source = getSkills(tree[i][j]).item[MasterSkill.IMAGE];
						hbox.addChild(img);
					}else{
						var canvas:Canvas = new Canvas();
						canvas.width = 32;
						canvas.height = 44;
						hbox.addChild(canvas);
					}
				}
			}
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