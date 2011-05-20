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
			if(item.dataProvider == "" || c.getItemType(item.selectedItem) != type){
				//アイテムの追加
				var jobindex:int = d.getJob().selectedIndex;//職取得
				if(f_name == "helm")
					if(type==1) item.dataProvider = c.getSocketEquip(jobindex,"兜");
					else if(type==2) item.dataProvider = c.getSetEquip(jobindex,"兜");
					else item.dataProvider = c.getEquip(jobindex,"兜");
				else if(f_name == "armor")
					if(type==1) item.dataProvider = c.getSocketEquip(jobindex,"鎧");
					else if(type==2) item.dataProvider = c.getSetEquip(jobindex,"鎧");
					else item.dataProvider = c.getEquip(jobindex,"鎧");
				else if(f_name == "glove")
					if(type==1) item.dataProvider = c.getSocketEquip(jobindex,"手");
					else if(type==2) item.dataProvider = c.getSetEquip(jobindex,"手");
					else item.dataProvider = c.getEquip(jobindex,"手");
				else if(f_name == "garter")
					if(type==1) item.dataProvider = c.getSocketEquip(jobindex,"腰");
					else if(type==2) item.dataProvider = c.getSetEquip(jobindex,"腰");
					else item.dataProvider = c.getEquip(jobindex,"腰");
				else if(f_name == "boots")
					if(type==1) item.dataProvider = c.getSocketEquip(jobindex,"足");
					else if(type==2) item.dataProvider = c.getSetEquip(jobindex,"足");
					else item.dataProvider = c.getEquip(jobindex,"足");
			}
			// イベントの呼び出し
			item.dispatchEvent(new ListEvent(ListEvent.CHANGE) as Event);
			return true;
		}
	}
}
