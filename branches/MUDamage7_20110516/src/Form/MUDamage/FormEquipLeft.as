package Form.MUDamage {
	import mx.controls.*;
	import mx.containers.*;
	import mx.core.*;
	import mx.collections.*;
	import mx.events.*;
	import flash.events.*;

	import Form.MUDamage.SubForm.*;
	import Data.Database.*;
	
	public class FormEquipLeft extends FormEquip {
		private var darkspirit_level:ComboBox;
		protected var type:int;
		/**
		 * コンストラクタ
		 * @param d
		 */
		public function FormEquipLeft(d:FormMUDamage) {
			super(d);
			this.label = "左:";
		}
		/**
		 * kind arrayの初期化
		 */
		override protected function initKinds():void{
			super.initKinds();
			if(d.getJob().selectedLabel == "ダークロード"){
				kinds = {
						none 	: displayNone,
						normal 	: displayNormal,
						exellent: displayEx,
						set		: displaySet,
						socket	: displaySocket,
						darkspirit : displayDarkspirit
					};
				KIND_ARRAY = [
				              ["なし"	,kinds.none],
				              ["通常"	,kinds.normal],
				           ["EX"	,kinds.exellent],
				              ["セット"	,kinds.set],
				              ["ソケット",kinds.socket],
				              ["鷹",kinds.darkspirit]
				            ];
			}
		}
		/**
		 * フォームの設定
		 */
		override protected function initForm():void{
			super.initForm();
			createDarkspiritLevel();
		}
		/**
		 * DarkspiritLevelフォームの作成
		 */
		protected function createDarkspiritLevel():void{
			darkspirit_level = new ComboBox();
			var a:Array = new Array();
			for(var i:int=0; i<=50; i++)
				a.push("LV"+i);
			darkspirit_level.dataProvider = a;
			FormCommon.hide(darkspirit_level);
			firstbox.addChild(darkspirit_level);
		}
		/**
		 * kindを除く全てのフォームを隠す
		 */
		override protected function hideAll():void{
			super.hideAll();
			FormCommon.hide(darkspirit_level);
		}
		/**
		 * darkspiritを表示
		 */
		protected function displayDarkspirit():void{
			hideAll();
			FormCommon.show(darkspirit_level);
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
				//ソケットアイテムを除く　両手武器を除く
				if(type==1) item.dataProvider = D.getSelect("socket_left",jobindex);
				else if(type==2) item.dataProvider = D.getSelect("set_left",jobindex);
				else item.dataProvider = D.getSelect("left",jobindex);
				// type
				this.type = type;
			}
			// イベントの呼び出し
			item.dispatchEvent(new ListEvent(ListEvent.CHANGE) as Event);
			return true;
		}
		/**
		 * darkspirit
		 */
		public function getDarkspiritLevel():ComboBox{
			return darkspirit_level;
		}
	}
}
