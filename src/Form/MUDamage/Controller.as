package Form.MUDamage {
	import mx.controls.*;
	import mx.containers.*;
	import mx.core.*;
	/**
	 * FormMUDamageをジョブ毎に管理する
	 * @author sinlion
	 *
	 */
	public class Controller {
		private var container:Container;
		private var forms:Array;
		private var now_form:FormMUDamage;
		/**
		 * コンストラクタ
		 */
		public function Controller(container:Container){
			this.container = container;
			forms = new Array();
			// 新規作成
			now_form = createForm();
			forms.push(now_form);
			container.addChild(now_form);
		}
		/**
		 * フォームを新規作成
		 */
		private function createForm(job:int=-1):FormMUDamage{
			var form:FormMUDamage = new FormMUDamage(this, job);
			// 位置を調整
			form.x = 50;
			form.y = 100;
			
			return form;
		}
		/**
		 * フォームの変更
		 */
		public function changeForm(job:int):void{
			for each(var form:FormMUDamage in forms){
				if(form.getJob().getOldJob() == job){
					container.removeChild(now_form);
					now_form = form;
					container.addChild(now_form);
					return;
				}
			}
			// 新規作成
			container.removeChild(now_form);
			now_form = createForm(job);
			forms.push(now_form);
			container.addChild(now_form);
			
		}
		/**
		 * 計算結果の表示
		 */
		public function showResult(result:Container):void{
			result.x = 50;
			result.y = 700;
			container.addChild(result);
		}
	}
}