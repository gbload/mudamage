package Form.MUDamage {
	import mx.controls.*;
	import mx.containers.*;
	import mx.core.*;
	import mx.collections.*;
	import mx.events.*;
	import flash.events.*;

	import Form.MUDamage.SubForm.*;
	import Data.Database.*;
	
	public class FormEquipProtect extends FormEquip {
		protected var f_name:String;
		protected var LABELS:Object = {
			helm : "兜:",
			armor : "鎧:",
			glove : "手:",
			garter : "腰:",
			boots : "足:"};
		protected var type:int;
		/**
		 * コンストラクタ
		 * @param d
		 */
		public function FormEquipProtect(d:FormMUDamage, f_name:String) {
			super(d);
			this.f_name = f_name;
			this.label = this.LABELS[f_name];
		}
		/**
		 * アイテムフォームのデータを変更
		 * @param type 0:通常 1:ソケット 2:セットアイテム
		 */
		override protected function changeItem(type:int):Boolean{
			//すでに作成されていないかチェック
			if(item.dataProvider == "" || this.type != type){
				//アイテムの追加
				var jobindex:int = d.getJob().selectedIndex;//職取得
				if(type==1) item.dataProvider = D.getSelect("socket_protect_"+f_name,jobindex);
				else if(type==2) item.dataProvider = D.getSelect("set_protect_"+f_name,jobindex);
				else item.dataProvider = D.getSelect("protect_"+f_name,jobindex);
				// type
				this.type = type;
			}
			// イベントの呼び出し
			item.dispatchEvent(new ListEvent(ListEvent.CHANGE) as Event);
			return true;
		}
	}
}
