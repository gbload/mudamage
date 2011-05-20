package Form.MUDamage.SubForm {
	import mx.controls.*;
	import mx.containers.*;
	import mx.core.*;
	import mx.collections.*;
	import mx.events.*;
	import flash.events.*;

	import Form.MUDamage.*;
	import Data.Database.*;
	/**
	 * EXフォーム
	 * @author sinlion
	 *
	 */
	public class FormExellentBox extends HBox {
		private var item:ComboBox;
		
		private var options:Array;
		/**
		 * EXOPのBOXを作成
		 */
		public function FormExellentBox(item:ComboBox) {
			this.item = item;
			options = new Array();
			// アイテムフォームにイベントを登録
			item.addEventListener(ListEvent.CHANGE,eventChangeItem);
			// 背景色変更
			this.setStyle("backgroundColor","#DDFFDD");//背景色を緑色に
			// ラベルの作成
			var la:Label = new Label();
			la.text = "　EXOP:";
			la.setStyle("fontWeight","bold");
			la.width = 120;
			this.addChild(la);
			//exopの作成
			for(var i:int=0;i<5;i++){
				var e:ComboBox = new ComboBox();
				e.width = 120;
				e.rowCount = 6;
				e.addEventListener(ListEvent.CHANGE,eventChange);
				options[i] = e;
				this.addChild(e);
			}	
		}
		/**
		 * EXOP変更時イベント
		 * 重複しないようにする
		 */
		private function eventChange(event:Event):void {
			if(FormCommon.isDuplication(options))
				event.target.selectedIndex = 0;
		}
		/**
		 * アイテム変更時イベント
		 * EXOPのデータを変更する
		 */
		private function eventChangeItem(event:Event):void{
			if(this.visible)
				changeData();
		}
		/**
		 * データをセット
		 */
		public function changeData():Boolean {
			//EXOPの作成
			if(!item.selectedItem)return false;//インポート対策
			var a:Array;
			if(item.selectedItem[0] == "防具"){//防具
				if(options[0].dataProvider != "" && options[0].dataProvider[1] == "防御成功")return false;
				a = ["","防御成功","ダメ減","生命増","マナ増","ダメ反"];
			}else if(item.selectedItem[3] == "杖" || item.selectedItem[3] == "書"){
				//魔法系
				if(options[0].dataProvider != "" && options[0].dataProvider[3] == "魔力2%")return false;
				a = ["","EXD","速度+7","魔力2%","魔力lv20"];
			}else if(item.selectedItem[0] == "アクセサリ"){
				//魔法系
				if(options[0].dataProvider != "" && options[0].dataProvider[3] == "攻撃lv20")return false;
				a = ["","EXD","速度+7","攻撃lv20","攻撃2%","魔力lv20","魔力2%"];
			}else{
				//剣系
				if(options[0].dataProvider != "" && options[0].dataProvider[3] == "攻撃2%")return false;
				a = ["","EXD","速度+7","攻撃2%","攻撃lv20"];
			}
			for(var i:int = 0;i < options.length;i++){
				options[i].dataProvider = a;
			}
			return true;
		}
		/**
		 * EXOPの配列を返す
		 * [ComboBox,ComboBox,...]
		 */
		public function getOptions():Array {
			return options;
		}
		
	}
}
