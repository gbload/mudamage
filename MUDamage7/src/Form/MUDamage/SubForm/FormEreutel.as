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
		private var plus1:ComboBox;
		private var plus2:ComboBox;
		private var plus3:ComboBox;
		private var plus4:ComboBox;
		private var plus5:ComboBox;
		private var rank1:ComboBox;
		private var rank2:ComboBox;
		private var rank3:ComboBox;
		private var rank4:ComboBox;
		private var rank5:ComboBox;
		/**
		 * データ
		 */
		private var item_data:Array = [
		    // name,rank1,rank2,rank3
		    ["軍神のエルテル","軍神"],
		    ["加護のエルテル","加護"],
		    ["高潔のエルテル","高潔"],
		    ["神聖のエルテル","神聖"],
		    ["狂喜のエルテル","狂喜"]
		                               ];
		private var item_none:Array = ["","","",""];
		private static var ITEM_NAME:int = 0;
		
		/**
		 * コンストラクタ
		 */
		public function FormEreutel(num:int) {
			createItem(num);
			createRank();
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
			rank.dataProvider = [1,2,3,4,5];
			rank.addEventListener(ListEvent.CHANGE,eventChange);
			this.addChild(rank);
		}
		/**
		 * plus
		 */
		private function createPlus(plus:ComboBox):ComboBox{
			plus = new ComboBox();
			var a:Array = new Array();
			a.push("N");
			for(var i:int=1;i<=10;i++)
				a.push("+"+i);
			plus.dataProvider = a;
			this.addChild(plus);
			return plus;
		}
		/**
		 * rank options
		 */
		private function createRankOption():void{
			// rank1
			rank1 = new ComboBox();
			this.addChild(rank1);
			plus1 = createPlus(plus1);
			// rank2
			rank2 = new ComboBox();
			FormCommon.hide(rank2);
			this.addChild(rank2);
			plus2 = createPlus(plus2);
			FormCommon.hide(plus2);
			// rank3
			rank3 = new ComboBox();
			FormCommon.hide(rank3);
			this.addChild(rank3);
			plus3 = createPlus(plus3);
			FormCommon.hide(plus3);
			// rank4
			rank4 = new ComboBox();
			FormCommon.hide(rank4);
			this.addChild(rank4);
			plus4 = createPlus(plus4);
			FormCommon.hide(plus4);
			// rank5
			rank5 = new ComboBox();
			FormCommon.hide(rank5);
			this.addChild(rank5);
			plus5 = createPlus(plus5);
			FormCommon.hide(plus5);
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
			FormCommon.show(rank1);
			FormCommon.show(plus1);
		}
		private function hide():void{
			FormCommon.hide(rank);
			FormCommon.hide(rank1);
			FormCommon.hide(plus1);
			FormCommon.hide(rank2);
			FormCommon.hide(plus2);
			FormCommon.hide(rank3);
			FormCommon.hide(plus3);
			FormCommon.hide(rank4);
			FormCommon.hide(plus4);
			FormCommon.hide(rank5);
			FormCommon.hide(plus5);
		}
		/**
		 * change rank option
		 */
		private function changeRankData(combo:ComboBox,plus:ComboBox,data:String,num:int):void{
			var index:int = 0;
			var rank_index:int = rank.selectedIndex+1;
		
			index = combo.selectedIndex;
			if(index == -1)index = 0;
			combo.dataProvider = getNames(data,num);
			combo.selectedIndex = index;
			
			if(num >= 2 && rank_index < num){
				FormCommon.hide(combo);
				FormCommon.hide(plus);
			}
			else{
				FormCommon.show(combo);
				FormCommon.show(plus);
			}
		}
		private function changeRankOption():void{
			var i:Object = item.selectedItem;
			//rank1
			changeRankData(rank1,plus1,i[1],1);
			//rank2
			changeRankData(rank2,plus2,i[1],2);
			//rank3
			changeRankData(rank3,plus3,i[1],3);
			//rank4
			changeRankData(rank4,plus4,i[1],4);
			//rank5
			changeRankData(rank5,plus5,i[1],5);
		}
		/**
		 * オプションデータを整形して返す
		 */
		private function getNames(ereutel:String,rank:int):Array{
			var result:Array = new Array();
			// データ取得
			var d:Object = D.getData("ereutel");
			var key:Object = D.getKey("ereutel");
			for(var i:int=0;i<d.length;i++){
				if(d[i][key.ereutel] == ereutel 
						&& parseInt(d[i][key.rank]) == rank){
					// 値データ配列の整形
					var values:Array = new Array();
					for(var j:int=0;j<=10;j++)
						values.push(d[i][key.value+j])
					result.push({label:d[i][key.name],value:values,option:d[i][key.option]});
				}
			}
			
			return result;
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
					pluses: [plus1.selectedIndex,plus2.selectedIndex
					         ,plus3.selectedIndex,plus4.selectedIndex,plus5.selectedIndex],
					ranks: [rank1.selectedItem,rank2.selectedItem
					        ,rank3.selectedItem,rank4.selectedItem,rank5.selectedItem]
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
				a.push(plus1.selectedIndex);
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
				plus1.selectedIndex = a[index++];
				eventChange(null);
				rank1.selectedIndex = a[index++];
				rank2.selectedIndex = a[index++];
				rank3.selectedIndex = a[index++];
			}
		}
	}
}
