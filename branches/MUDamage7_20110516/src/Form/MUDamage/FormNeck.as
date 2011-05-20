package Form.MUDamage {
	import mx.controls.*;
	import mx.containers.*;
	import mx.core.*;
	import mx.collections.*;
	import mx.events.*;
	import flash.events.*;

	import Form.MUDamage.SubForm.*;
	import Data.Database.*;
	/**
	 * ネックフォーム
	 * @author sinlion
	 *
	 */
	public class FormNeck extends FormEquipBase {
		protected var option:ComboBox;		
	
		protected var old_type:int=-1;
		/**
		 * コンストラクタ
		 */
		public function FormNeck(d:FormMUDamage) {
			super(d);
			this.label = "ネック:";
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
		 * フォームの初期化
		 */
		override protected function initForm():void{
			ln();
			createKind();
			createItem();
			createOption();
			createSetop();

			exellent = new FormExellentBox(item);
			FormCommon.hide(exellent);
			this.addChild(exellent);
		}
		/**
		 * オプションフォーム
		 */
		protected function createOption():void{
			option = new ComboBox();
			FormCommon.hide(option);
			hbox.addChild(option);
		}
		/**
		 * アイテムフォーム変更時イベント
		 */
		override protected function eventChangeItem(event:Event):void{
			// OPの変更
			changeOption(item.selectedItem[4]);
			// setopの変更
			changeSetop(item.selectedItem[9]);
		}
		/**
		 * アイテムフォームのデータを変更
		 * @param type 0:通常orEX 1:ショップ 2:セットアイテム
		 */
		protected function changeItem(type:int):Boolean{
			//すでに作成されていないかチェック
			if(old_type != type){
				// アイテムの追加
				if(type==1)item.dataProvider = c.getShopNeck();
				else if(type==2)item.dataProvider = c.getSetNeck();
				else item.dataProvider = c.getNeck();
				old_type = type;
			}
			// イベントの呼び出し
			item.dispatchEvent(new ListEvent(ListEvent.CHANGE) as Event);
			return true;
		}
		/**
		 * オプションフォームのデータを変更
		 */
		protected function changeOption(str:String):void{
			// インデックスの保持
			var index:int = option.selectedIndex;
			if(index == -1)index = 0;
			// オプションの作成
			var a:Array = new Array();
			if(kind.selectedLabel == "ショップ"){
				a.push({label:str,type:"AH",value:3});
			}else{
				a.push({label:str+"なし",type:str,value:0});
				for(var i:int=1; i<=4; i++){
					a.push({label:str+i.toString()+"%",type:str,value:i});
				}
			}
			// オプションの登録
			option.dataProvider = a;
			option.selectedIndex = index;
		}
		/**
		 * kindを除くフォームを全て隠す
		 */
		override protected function hideAll():void{
			FormCommon.hide(item);
			FormCommon.hide(option);
			FormCommon.hide(setop);
			FormCommon.hide(exellent);
		}
		/**
		 * 通常を表示
		 */
		protected function displayNormal():void{
			hideAll();
			FormCommon.show(item);
			FormCommon.show(option);
			
			changeItem(0);
		}
		/**
		 * EXを表示
		 */
		protected function displayEx():void{
			hideAll();
			FormCommon.show(item);
			FormCommon.show(option);
			FormCommon.show(exellent);
			
			changeItem(0);
		}
		/**
		 * セットを表示
		 */
		protected function displaySet():void{
			hideAll();
			FormCommon.show(item);
			FormCommon.show(option);
			FormCommon.show(setop);
			
			changeItem(2);
		}
		/**
		 * ショップを表示
		 */
		protected function displayShop():void{
			hideAll();
			FormCommon.show(item);
			FormCommon.show(option);

			changeItem(1);
		}
		/**
		 * option
		 */
		public function getOption():ComboBox{
			return option;
		}
	}
}
