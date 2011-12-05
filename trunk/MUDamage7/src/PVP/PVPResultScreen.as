package PVP {
	import mx.containers.*;
	import mx.controls.*;
	import mx.core.*;
	import flash.events.*;

	import Form.MUDamage.SubForm.*;
	import Form.MUDamage.*;
	import Calc.*;
	import Calc.ResultScreen.*;
	import Data.Database.*;
	import Data.Database.MLV.*;
	/**
	 * PVPダメージ計算の結果を表示する画面
	 */
	public class PVPResultScreen extends Form {
		private var muc1:Object;
		private var muc2:Object;
		
		/**
		 * コンストラクタ
		 */
		public function PVPResultScreen(d1:FormMUDamage,d2:FormMUDamage) {
			super();
			this.muc1 = calc(d1);
			this.muc2 = calc(d2);
			// ラベル付
			this.label = d2.form_title.text;
			init();
		}
		/**
		 * フォームデータから各種基本パラメータを計算
		 */
		private function calc(d:FormMUDamage):Object{
			var muc:Object = {};
			
			muc.d = d;
			muc.f = (new FormData(muc.d)).getData();
			muc.i = new ItemData(muc.f);
			muc.c = (new CharacterCalculator(muc.f,muc.i)).getData();
			muc.a = (new AttackCalculator(muc.f,muc.i,muc.c)).getData();
			
			return muc;
		}
		/**
		 * 初期化
		 */
		private function init():void{
			// 閉じるボタン
			this.addChild(createCloseButton());

			var hbox:HBox = new HBox();
			this.addChild(hbox);
			// キャラクターステータス表示
			hbox.addChild(new CharacterScreen(muc1));
			// キャラクター装備表示
			hbox.addChild(new ItemScreen(muc1));
			// ダメージ一覧Gridを表示
			this.addChild(new DamageGrid(
					(new PVPDamageCalculator(muc1,muc2)).calcSkills()));

			hbox = new HBox();
			this.addChild(hbox);
			// キャラクターステータス表示
			hbox.addChild(new CharacterScreen(muc2));
			// キャラクター装備表示
			hbox.addChild(new ItemScreen(muc2));
			// ダメージ一覧Gridを表示
			this.addChild(new DamageGrid(
					(new PVPDamageCalculator(muc2,muc1)).calcSkills()));
		}
		/**
		 * 閉じるボタン
		 */
		private function createCloseButton():Button{
			var button:Button = new Button();
			button.label = "閉じる";
			var container:Container = this;
			button.addEventListener(MouseEvent.CLICK,
					function(event:Event):void{
						container.parent.removeChild(container);
					});
			
			return button;
		}
	}
}
