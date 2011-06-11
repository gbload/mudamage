package Form.MUDamage {
	import mx.controls.*;
	import mx.containers.*;
	import mx.collections.*;
	import mx.events.*;
	import flash.events.*;
	
	import Form.MUDamage.SubForm.*;
	import Data.Database.*;
	/**
	 * ペットフォーム
	 * @author sinlion
	 *
	 */
	public class FormPet extends FormItem {
		private var LABEL:String = "ペット：";
		private var d:FormMUDamage;
		private var item:ComboBox;
		private var sub:Array = new Array();
		/**
		 * コンストラクタ
		 */
		public function FormPet(d:FormMUDamage) {
			this.d = d;

			this.direction = "horizontal";
			this.label = this.LABEL;
			
			createItem();
			createSub(0);
			createSub(1);
		}
		/**
		 * アイテムフォーム
		 */
		private function createItem():void{
			//ペットを選択するフォーム
			var co:ComboBox = new ComboBox();
			item = co;
			co.dataProvider = D.getSelect("pet");
			co.rowCount = 20;
			co.addEventListener(ListEvent.CHANGE,eventChangeItem);
			this.addChild(co);
		}
		/**
		 * サブフォーム
		 */
		private function createSub(num:int):void{
			//補助フォーム1（ダークホースのLV、フェンリルの種類、ディノラントのOPなど）
			//補助フォーム2（ディノラントのOPなど）
			var co:ComboBox = new ComboBox();
			co.dataProvider = [""];
			sub[num] = co;
			co.addEventListener(ListEvent.CHANGE,eventChangeSub);
			FormCommon.hide(co);
			this.addChild(co);
		}
		/**
		 * アイテムフォームのイベント
		 */
		private function eventChangeItem(event:Event):void{
			//ペットの補助フォームを隠す
			FormCommon.hide(sub[0]);
			FormCommon.hide(sub[1]);
			//ペットの補助フォームの作成及び表示
			if(event.target.selectedLabel == "ディノラント"){
				FormCommon.show(sub[0]);
				FormCommon.show(sub[1]);
				sub[0].dataProvider = ["","AG+50","攻撃速度+5","ダメージ吸収+5%"];
				sub[1].dataProvider = ["","AG+50","攻撃速度+5","ダメージ吸収+5%"];
			}else if(event.target.selectedLabel == "フェンリル"){
				FormCommon.show(sub[0]);
				sub[0].dataProvider = ["ノーマル","破壊","守護","黄金"];
			}else if(event.target.selectedLabel == "ダークホース"){
				FormCommon.show(sub[0]);
				var a:Array = new Array();
				for(var i:int=1;i<=50;i++){
					a.push("LV"+i.toString());
				}
				sub[0].dataProvider = a;
			}
		}
		/**
		 * サブフォームのイベント
		 */
		private function eventChangeSub(event:Event):void{
			if(FormCommon.isDuplication(this.sub))
				event.target.selectedIndex = 0;
		}
		/**
		 * アイテムフォームを返す
		 */
		public function getItem():ComboBox {
			return item;
		}
	}
}
