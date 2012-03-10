package Form.MUDamage {
	import mx.controls.*;
	import mx.containers.*;
	import mx.core.*;
	import mx.collections.*;
	import mx.events.*;
	import flash.events.*;

	import Form.MUDamage.SubForm.*;
	import Data.Database.*;
	
	public class FormEquipRight extends FormEquip {
		protected var arrow:ComboBox;
		protected var type:int;
		protected var other_hand:FormEquip;
		/**
		 * コンストラクタ
		 * @param d
		 */
		public function FormEquipRight(d:FormMUDamage) {
			super(d);
			this.label = "右:";
		}
		/**
		 * フォームの設定
		 */
		override protected function initForm():void{
			super.initForm();
			createArrow();
		}
		/**
		 * 矢のボックスを作成
		 */
		protected function createArrow():void{
			//矢のフォーム作成
			arrow = new ComboBox();
			FormCommon.hide(arrow);
			arrow.dataProvider = ["矢+N","矢+1","矢+2","矢+3"];
			this.addChild(arrow);
		}
		/**
		 * kindを除く全てのフォームを隠す
		 */
		override protected function hideAll():void{
			super.hideAll();
			FormCommon.hide(arrow);
		}
		/**
		 * アイテム変更時イベント
		 */
		override protected function eventChangeItem(event:Event):void{
			super.eventChangeItem(event);
			var i:Object = D.getData(item.selectedItem.item)[item.selectedItem.index];
			var k:Object = D.getKey(item.selectedItem.item);
			// 弓の場合、左手フォームを隠す
			if(i[k.type] == "弓" || i[k.type] == "ボウガン"){
				other_hand.getKind().selectedIndex = 0;//左手を「なし」に設定
				other_hand.getKind().dispatchEvent((new ListEvent(ListEvent.CHANGE)) as Event);//イベントの呼び出し
				FormCommon.hide(other_hand.getKind());//左手フォームを隠す
				FormCommon.show(arrow);//矢のフォームを表示
			}
			//両手武器の場合、左手を隠す
			else if(i[k.hand] == "両手"){
				other_hand.getKind().selectedIndex = 0;//左手を「なし」に設定
				other_hand.getKind().dispatchEvent((new ListEvent(ListEvent.CHANGE)) as Event);//イベントの呼び出し
				FormCommon.hide(other_hand.getKind());//左手フォームを隠す
			}
			else{//元に戻す
				FormCommon.show(other_hand.getKind());
				FormCommon.hide(arrow);
			}
			//エルフの左手制限
			d.form_left.setElfWeapon();
		}
		/**
		 * アイテムフォームのデータを変更
		 * @param type 0:通常 1:ソケット 2:セットアイテム
		 */
		override protected function changeItem(type:int):Boolean{
			// left_form because ledt is not created in initialize
			this.other_hand = d.form_left;
			//すでに作成されていないかチェック
			if(item.dataProvider == "" || this.type != type){
				//アイテムの追加
				var jobindex:int = d.getJob().selectedIndex;//職取得
				// indexのセット
				var tmp:int = item.selectedIndex;
				if(tmp < 0)tmp=0;
				//ソケットアイテムを除く 神具を除く
				if(type==1) item.dataProvider = D.getSelect("socket_right",jobindex);
				else if(type==2) item.dataProvider = D.getSelect("set_right",jobindex);
				else item.dataProvider = D.getSelect("right",jobindex);
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
		 * none
		 */
		override protected function displayNone():void{
			hideAll();
			if(other_hand)FormCommon.show(other_hand.getKind());
			//エルフの左手制限
			d.form_left.setElfWeapon();
		}
		/**
		 * arrow
		 */
		public function getArrow():ComboBox{
			return arrow;
		}
	}
}
