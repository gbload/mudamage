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
			// 弓の場合、左手フォームを隠す
			if(item.selectedItem[3] == "弓"){
				d.getFormLeft().getKind().selectedIndex = 0;//左手を「なし」に設定
				d.getFormLeft().getKind().dispatchEvent((new ListEvent(ListEvent.CHANGE)) as Event);//イベントの呼び出し
				FormCommon.hide(d.getFormLeft().getKind());//左手フォームを隠す
				FormCommon.show(arrow);//矢のフォームを表示
			//両手武器の場合、左手を隠す
			}else if(item.selectedItem[4] == "両手"){
				d.getFormLeft().getKind().selectedIndex = 0;//左手を「なし」に設定
				d.getFormLeft().getKind().dispatchEvent((new ListEvent(ListEvent.CHANGE)) as Event);//イベントの呼び出し
				FormCommon.hide(d.getFormLeft().getKind());//左手フォームを隠す
			}else{//元に戻す
				FormCommon.show(d.getFormLeft().getKind());
				FormCommon.hide(arrow);
			}
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
				//ソケットアイテムを除く 神具を除く
				if(type==1) item.dataProvider = D.getSelect("socket_right",jobindex);
				else if(type==2) item.dataProvider = D.getSelect("set_right",jobindex);
				else item.dataProvider = D.getSelect("right",jobindex);
				// type
				this.type = type;
			}
			// イベントの呼び出し
			item.dispatchEvent(new ListEvent(ListEvent.CHANGE) as Event);
			return true;
		}
		/**
		 * arrow
		 */
		public function getArrow():ComboBox{
			return arrow;
		}
	}
}
