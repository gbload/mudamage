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
	}
}