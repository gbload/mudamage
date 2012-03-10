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
		 * kind arrayの初期化
		 */
		override protected function initKinds():void{
			kinds = {
					none 	: displayNone,
					normal 	: displayNormal,
					exellent: displayEx,
					set		: displaySet,
					socket	: displaySocket,
					lucky	: displayLucky
				};
			KIND_ARRAY = [
			              ["なし"	,kinds.none],
			              ["通常"	,kinds.normal],
			              ["EX"		,kinds.exellent],
			              ["セット"	,kinds.set],
			              ["ソケット",kinds.socket],
			              ["ラッキー",kinds.lucky]
			            ];
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
				// indexのセット
				var tmp:int = item.selectedIndex;
				if(tmp < 0)tmp=0;
				
				if(type==1) item.dataProvider = D.getSelect("socket_protect_"+f_name,jobindex);
				else if(type==2) item.dataProvider = D.getSelect("set_protect_"+f_name,jobindex);
				else if(type==3) item.dataProvider = D.getSelect("lucky_protect_"+f_name,jobindex);
				else item.dataProvider = D.getSelect("protect_"+f_name,jobindex);
				// indexのセット
				item.selectedIndex = tmp;
				// type
				this.type = type;
			}
			// イベントの呼び出し
			item.dispatchEvent(new ListEvent(ListEvent.CHANGE) as Event);
			return true;
		}
		/**
		 * kind Luckyを表示
		 */
		protected function displayLucky():void{
			hideAll();
			FormCommon.show(item);
			FormCommon.show(item_attr);
			FormCommon.show(setop);
			FormCommon.show(enchant);
			
			changeItem(3);
		}
	}
}
