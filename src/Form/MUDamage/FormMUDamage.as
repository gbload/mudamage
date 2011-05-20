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
		private var form_job:ComboBox;
		private var form_pet:FormPet;
		private var form_wing:FormWing;
		private var form_neck:FormNeck;
		private var form_right:FormEquip;
		private var form_left:FormEquip;
		private var form_helm:FormEquip;
		private var form_armor:FormEquip;
		private var form_glove:FormEquip;
		private var form_garter:FormEquip;
		private var form_boots:FormEquip;
//		private var form_ring1:FormRing;
//		private var form_ring2:FormRing;
//		private var form_status:FormStatus;
//		private var form_support:FormSupport;
		/**
		 * コンストラクタ
		 */
		public function FormMUDamage(){
			super();
			
			// 職
			createJob();
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
			form_right = new FormEquip(this,"right");
			this.addChild(form_right);
			// 左手
			form_left = new FormEquip(this,"left");
			this.addChild(form_left);
			// 兜
			form_helm = new FormEquip(this,"helm");
			this.addChild(form_helm);
			// 鎧
			form_armor = new FormEquip(this,"armor");
			this.addChild(form_armor);
			// 手
			form_glove = new FormEquip(this,"glove");
			this.addChild(form_glove);
			// 腰
			form_garter = new FormEquip(this,"garter");
			this.addChild(form_garter);
			// 足
			form_boots = new FormEquip(this,"boots");
			this.addChild(form_boots);
		}
		/**
		 * コントローラを登録する
		 */
		public function setController(c:Controller):void{
			this.controller = c;
		}
		/**
		 * 職フォームを作成
		 */
		private function createJob():void{
			var fi:FormItem = new FormItem();
			fi.direction = "horizontal";
			fi.label = "クラス：";
			var co:ComboBox = new ComboBox();
			this.form_job = co;
			co.rowCount = 10;
			co.dataProvider = new ArrayCollection(
				["ナイト","ウィザード","エルフ","魔剣士","ダークロード","召喚師","レイジファイター"]);
			co.addEventListener(ListEvent.CHANGE,eventChangeJob);
			fi.addChild(co);
			
			this.addChild(fi);
		}
		/**
		 * 職イベント
		 */
		private function eventChangeJob(event:Event):Boolean{
			this.controller.changeForm(this.getJob().selectedIndex);
			setJob(getOldJob());
			return true;
		}
		/**
		 * 職フォームを返す
		 */
		public function getJob():ComboBox {
			return form_job;
		}
		/**
		 * 職をセットする
		 */
		public function setJob(job:int):void{
			form_job.selectedIndex = job;
			old_job = job;
		}
		/**
		 * 職フォームの変更イベント直前の値を返す
		 */
		public function getOldJob():int{
			return old_job;
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