package Form.MUDamage {
	import mx.controls.*;
	import mx.containers.*;
	import mx.core.*;
	import mx.collections.*;
	import mx.events.*;
	import flash.events.*;
	
	public class FormMUDamage extends Form {
		private var controller:Controller;
		private var old_job:int = 0;
	
		private var form_title:TextInput;
		private var form_job:FormJob;
		private var form_pet:FormPet;
		private var form_wing:FormWing;
		private var form_neck:FormNeck;
		private var form_right:FormEquipRight;
		private var form_left:FormEquipLeft;
		private var form_helm:FormEquipProtect;
		private var form_armor:FormEquipProtect;
		private var form_glove:FormEquipProtect;
		private var form_garter:FormEquipProtect;
		private var form_boots:FormEquipProtect;
//		private var form_ring1:FormRing;
//		private var form_ring2:FormRing;
//		private var form_status:FormStatus;
//		private var form_support:FormSupport;
		/**
		 * コンストラクタ
		 */
		public function FormMUDamage(c:Controller, job:int){
			super();
			
			// 職
			form_job = new FormJob(c);
			form_job.setJob(job);
			this.addChild(form_job.getFormItem());
			// ペット
			form_pet = new FormPet(this);
			this.addChild(form_pet);
			// 羽
			form_wing = new FormWing(this);
			this.addChild(form_wing);
			// ネック
			form_neck = new FormNeck(this);
			this.addChild(form_neck);
			// 右手
			form_right = new FormEquipRight(this);
			this.addChild(form_right);
			// 左手
			form_left = new FormEquipLeft(this);
			this.addChild(form_left);
			// 兜
			form_helm = new FormEquipProtect(this,"helm");
			this.addChild(form_helm);
			// 鎧
			form_armor = new FormEquipProtect(this,"armor");
			this.addChild(form_armor);
			// 手
			form_glove = new FormEquipProtect(this,"glove");
			this.addChild(form_glove);
			// 腰
			form_garter = new FormEquipProtect(this,"garter");
			this.addChild(form_garter);
			// 足
			form_boots = new FormEquipProtect(this,"boots");
			this.addChild(form_boots);
		}
		/**
		 * 職フォームを返す
		 */
		public function getJob():FormJob {
			return form_job;
		}
		/**
		 * 右手フォームを返す
		 */
		public function getFormRight():FormEquip{
			return form_right;
		}
		/**
		 * 左手フォームを返す
		 */
		public function getFormLeft():FormEquip{
			return form_left;
		}
		/**
		 * 兜フォームを返す
		 */
		public function getFormHelm():FormEquip{
			return form_helm;
		}
		/**
		 * 鎧フォームを返す
		 */
		public function getFormArmor():FormEquip{
			return form_armor;
		}
		/**
		 * 手フォームを返す
		 */
		public function getFormGlove():FormEquip{
			return form_glove;
		}
		/**
		 * 腰フォームを返す
		 */
		public function getFormGarter():FormEquip{
			return form_garter;
		}
		/**
		 * 足フォームを返す
		 */
		public function getFormBoots():FormEquip{
			return form_boots;
		}
	}
}