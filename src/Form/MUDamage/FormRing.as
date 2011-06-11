package Form.MUDamage {
	import mx.controls.*;
	import mx.containers.*;
	import mx.core.*;
	import mx.collections.*;
	import mx.events.*;
	import flash.events.*;

	import Form.MUDamage.SubForm.*;
	import Data.Database.*;
	
	public class FormRing extends FormNeck {
		/**
		 * コンストラクタ
		 * @param num 1.リング1　2.リング2
		 */
		public function FormRing(d:FormMUDamage,num:int) {
			super(d);
			if(num==1)this.label = "リング1:";
			else this.label = "リング2:";
		}
		/**
		 * kind arrayの初期化
		 */
		override protected function initKinds():void{
			kinds = {
					none 	: displayNone,
					normal 	: displayNormal,
					exellent: displayEx,
					set: displaySet,
					shop : displayShop
				};
			KIND_ARRAY = [
			              ["なし"	,kinds.none],
			              ["通常"	,kinds.normal],
			              ["EX"	,kinds.exellent],
			              ["セット"	,kinds.set],
			              ["ショップ"	,kinds.shop],
			            ];
		}
		/**
		 * アイテムフォームのデータを変更
		 * @param type 0:通常orEX 1:ショップ 2:セットアイテム
		 */
		override protected function changeItem(type:int):Boolean{
			//すでに作成されていないかチェック
			if(old_type != type){
				// アイテムの追加
				if(type==1)item.dataProvider = D.getSelect("shop_ring");
				else if(type==2)item.dataProvider = D.getSelect("set_ring");
				else item.dataProvider = D.getSelect("ring");
				old_type = type;
			}
			// イベントの呼び出し
			item.dispatchEvent(new ListEvent(ListEvent.CHANGE) as Event);
			return true;
		}
	}
}
