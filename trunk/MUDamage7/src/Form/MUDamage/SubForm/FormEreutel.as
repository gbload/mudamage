package Form.MUDamage.SubForm {
	import mx.controls.*;
	import mx.containers.*;
	import mx.events.*;
	import flash.events.*;
	
	import Form.MUDamage.SubForm.*;
	import Data.Database.*;
	/**
	 * 羽フォーム
	 * @author sinlion
	 *
	 */
	public class FormEreutel extends HBox {
		private var item:ComboBox;
		private var rank:ComboBox;
		private var plus:ComboBox;
		private var rank1:ComboBox;
		private var rank2:ComboBox;
		private var rank3:ComboBox;
		/**
		 * データ
		 */
		private var item_data:Array = [
		    // name,rank1,rank2,rank3
		    ["怒りのエルテル","攻撃力","攻撃","攻撃"],
		    ["加護のエルテル","防御力","防御","防御"],
		    ["高潔のエルテル","攻撃率","攻撃","攻撃"],
		    ["神聖のエルテル","防御率","防御","防御"]
		                               ];
		private var item_none:Array = ["","","",""];
		private static var ITEM_NAME:int = 0;
		
		/**
		 * コンストラクタ
		 */
		public function FormEreutel(num:int) {
			createItem(num);
			createRank();
			createPlus();
			createRankOption();
			hide();
		}
		/**
		 * Item
		 */
		private function createItem(num:int):void{
			item = new ComboBox();
			var a:Array = new Array();
			a.push(item_none);
			a.push(item_data[num]);
			item.dataProvider = a;
			item.labelFunction = FormCommon.labelfunc0;
			item.addEventListener(ListEvent.CHANGE,eventChange);
			this.addChild(item);
		}
		/**
		 * rank value
		 */
		private function createRank():void{
			rank = new ComboBox();
			rank.dataProvider = [1,2,3];
			rank.addEventListener(ListEvent.CHANGE,eventChange);
			this.addChild(rank);
		}
		/**
		 * plus
		 */
		private function createPlus():void{
			plus = new ComboBox();
			var a:Array = new Array();
			a.push("N");
			for(var i:int=1;i<=10;i++)
				a.push("+"+i);
			plus.dataProvider = a;
			this.addChild(plus);
		}
		/**
		 * rank options
		 */
		private function createRankOption():void{
			// rank1
			rank1 = new ComboBox();
			rank1.enabled = false;
			this.addChild(rank1);
			// rank2
			rank2 = new ComboBox();
			FormCommon.hide(rank2);
			rank2.enabled = false;
			this.addChild(rank2);
			// rank3
			rank3 = new ComboBox();
			FormCommon.hide(rank3);
			this.addChild(rank3);
		}
		/**
		 * change event
		 */
		private function eventChange(e:Event):void{
			var index:int = item.selectedIndex;
			if(index > 0){
				show();
				changeRankOption();
			} else 
				hide();
		}
		private function show():void{
			FormCommon.show(rank);
			FormCommon.show(plus);
			FormCommon.show(rank1);
		}
		private function hide():void{
			FormCommon.hide(rank);
			FormCommon.hide(plus);
			FormCommon.hide(rank1);
			FormCommon.hide(rank2);
			FormCommon.hide(rank3);
		}
		/**
		 * change rank option
		 */
		private function changeRankData(combo:ComboBox,data:Array,num:int):void{
			var index:int = 0;
			var rank_index:int = rank.selectedIndex+1;
		
			index = combo.selectedIndex;
			if(index == -1)index = 0;
			combo.dataProvider = data;
			combo.selectedIndex = index;
			
			if(num >= 2 && rank_index < num)FormCommon.hide(combo);
			else FormCommon.show(combo);
		}
		private function changeRankOption():void{
			var i:Object = item.selectedItem;
			//rank1
			changeRankData(rank1,[i[1]],1);
			//rank2
			changeRankData(rank2,[i[2]],2);
			//rank3
			var a3:Array = new Array();
			a3.push({label:"PVP時"+i[3],type:"pvp"});
			a3.push({label:"モンスター時"+i[3],type:"mon"});
			changeRankData(rank3,a3,3);
		}
		/**
		 * 計算用
		 */
		public function getEreutelData():Object{
			var obj:Object = {};
			if(item.selectedLabel=="")
				obj = {name: ""};
			else
				obj = {
					name: item.selectedLabel,
					item: item.selectedItem,
					rank: rank.selectedIndex+1,
					plus: plus.selectedIndex,
					rank1: rank1.selectedLabel,
					rank2: rank2.selectedLabel,
					rank3: rank3.selectedItem.type
				};
			return obj;
		}
		/**
		 * 保存用
		 */
		public function getSaveData():Array{
			var a:Array = new Array();
			a.push(item.selectedIndex);
			if(item.selectedLabel==""){
				for(var i:int=0;i<5;i++)
					a.push("");
			}else{
				a.push(rank.selectedIndex);
				a.push(plus.selectedIndex);
				a.push(rank1.selectedIndex);
				a.push(rank2.selectedIndex);
				a.push(rank3.selectedIndex);
			}
			return a;
		}
		/**
		 * import
		 */
		public function setSaveData(a:Array,index:int):void{
			item.selectedIndex = a[index++];
			if(item.selectedIndex > 0){
				rank.selectedIndex = a[index++];
				plus.selectedIndex = a[index++];
				eventChange(null);
				rank1.selectedIndex = a[index++];
				rank2.selectedIndex = a[index++];
				rank3.selectedIndex = a[index++];
			}
		}
	}
}
