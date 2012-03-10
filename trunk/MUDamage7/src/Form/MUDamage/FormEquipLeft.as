package Form.MUDamage {
	import mx.controls.*;
	import mx.containers.*;
	import mx.core.*;
	import mx.collections.*;
	import mx.events.*;
	import flash.events.*;

	import Form.MUDamage.SubForm.*;
	import Data.Database.*;
	
	public class FormEquipLeft extends FormEquipRight {
		private var darkspirit_level:ComboBox;
		/**
		 * コンストラクタ
		 * @param d
		 */
		public function FormEquipLeft(d:FormMUDamage) {
			super(d);
			this.label = "左:";
			this.other_hand = d.getFormRight();
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
			for(var i:int=1; i<=50; i++)
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
				// indexのセット
				var tmp:int = item.selectedIndex;
				if(tmp < 0)tmp=0;
				//ソケットアイテムを除く　両手武器を除く
				if(type==1) item.dataProvider = D.getSelect("socket_left",jobindex);
				else if(type==2) item.dataProvider = D.getSelect("set_left",jobindex);
				else item.dataProvider = D.getSelect("left",jobindex);
				// indexのセット
				item.selectedIndex = tmp;
				// type
				this.type = type;
				// エルフの左手制限
				setElfWeapon();
			}
			// イベントの呼び出し
			item.dispatchEvent(new ListEvent(ListEvent.CHANGE) as Event);
			return true;
		}
		/**
		 * エルフの左手武器表示
		 */
		public function setElfWeapon():void{
			//アイテムの追加
			var jobindex:int = d.getJob().selectedIndex;//職取得
			if(jobindex==2){
				// 入れ替え後のindex変更用
				var now:int = item.selectedIndex;
				//右手が有効でエルフの場合、左手は盾のみ
				if(other_hand.getKind().selectedIndex!=0){
					var a:Array = new Array();
					for(var n:int = item.dataProvider.length - 1 ; n >= 0 ; n--){
						var i:Object = D.getData(item.dataProvider[n].item)[item.dataProvider[n].index];
						var k:Object = D.getKey(item.dataProvider[n].item);
						if(i[k.type] == "盾")
							a.unshift(item.dataProvider[n]);
					}
					item.dataProvider = a;
				//ソケットアイテムを除く　両手武器を除く
				}else{
					if(type==1) item.dataProvider = D.getSelect("socket_left",jobindex);
					else if(type==2) item.dataProvider = D.getSelect("set_left",jobindex);
					else item.dataProvider = D.getSelect("left",jobindex);
				}
				// 入れ替え前のindexに変更
				item.selectedIndex = now;
				
				// 調整
				if(item.visible && item.selectedItem != null){
					i = D.getData(item.selectedItem.item)[item.selectedItem.index];
					k = D.getKey(item.selectedItem.item);
					// 弓の場合、左手フォームを隠す
					if(i[k.type] == "弓" || i[k.type] == "ボウガン"){
						other_hand.getKind().selectedIndex = 0;//左手を「なし」に設定
//						other_hand.getKind().dispatchEvent((new ListEvent(ListEvent.CHANGE)) as Event);//イベントの呼び出し
						FormCommon.hide(other_hand.getKind());//左手フォームを隠す
						FormCommon.show(arrow);//矢のフォームを表示
					}
					else{//元に戻す
						FormCommon.show(other_hand.getKind());
						FormCommon.hide(arrow);
					}
				}
			}
		}
		/**
		 * darkspirit
		 */
		public function getDarkspiritLevel():ComboBox{
			return darkspirit_level;
		}
	}
}
