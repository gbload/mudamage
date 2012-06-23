package Form.MUDamage {
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
	public class FormPentagram extends FormItem {
		private var LABEL:String = "属性:";
		private var d:FormMUDamage;
	
		private var item:ComboBox;
		private var attribute:ComboBox;
		private var plus:ComboBox;
		private var ereutels:Array;
	
		private var hbox:HBox;
		/**
		 * データ
		 */
		private var item_data:Array = [
		    // name,min,max,def,requireLV
		    ["",0,0,0,0],
		    ["ミュレンの魔法書",30,45,30,100],
		    ["エトラムの巻物",50,70,50,200]
	                               	];
		private var attr_data:Array = ["火","水","土","風","闇"];
		/**
		 * コンストラクタ
		 */
		public function FormPentagram(d:FormMUDamage) {
			this.d = d;
			this.ereutels = new Array();

//			this.direction = "horizontal";
			this.label = this.LABEL;

			ln();
			createItem();
			createAttribute();
			createPlus();
			for(var i:int=0;i<5;i++){
				ln();
				var ereutel:FormEreutel = new FormEreutel(i);
				hbox.addChild(ereutel);
				ereutels.push(ereutel);
			}
			hide();
		}
		/**
		 * 改行
		 */
		private function ln():void{
			hbox = new HBox();
			this.addChild(hbox);
		}
		/**
		 * item
		 */
		private function createItem():void{
			item = new ComboBox();
			item.dataProvider = item_data;
			item.labelFunction = FormCommon.labelfunc0;
			item.addEventListener(ListEvent.CHANGE,eventChangeItem);
			hbox.addChild(item);
		}
		/**
		 * attribute
		 */
		private function createAttribute():void{
			attribute = new ComboBox();
			attribute.dataProvider = attr_data;
			hbox.addChild(attribute);
		}
		/**
		 * plus
		 */
		private function createPlus():void{
			plus = new ComboBox();
			var a:Array = new Array();
			a.push("N");
			for(var i:int=1;i<=15;i++)
				a.push("+"+i);
			plus.dataProvider = a;
			hbox.addChild(plus);
		}
		/**
		 * event
		 */
		private function eventChangeItem(e:Event):void{
			if(item.selectedIndex!=0)
				show();
			else
				hide();
		}
		/**
		 * show
		 */
		private function show():void{
			FormCommon.show(attribute);
			FormCommon.show(plus);
			for(var i:int=0;i<ereutels.length;i++)
				FormCommon.show(ereutels[i]);
		}
		/**
		 * hide
		 */
		private function hide():void{
			FormCommon.hide(attribute);
			FormCommon.hide(plus);
			for(var i:int=0;i<ereutels.length;i++)
				FormCommon.hide(ereutels[i]);
		}
		/**
		 * 攻撃力、防御力を計算
		 */
		private function calcValue(val:int,plus:int,inc:int):int{
			var d:int = 0;
			if(val!=0){
				// pentagram
				d = val;
				d += inc*plus;
				if(plus >= 10)
					d += ((plus-9)+1)*(plus-9)/2;
			}
			return d;
		}
		/**
		 * エーテルのオプション数値を取得する関数を取得
		 */
		private function getEreutelValue(ereutels:Array):Function{
			return function(name:String,bool:Boolean=true):int{
				var val:int = 0;
				// ereutel
				for(var i:int=0;i<ereutels.length;i++){
					var e:Object = ereutels[i];
					if(e.name!="")
						for(var j:int=0;j<e.rank;j++){
							if(e.ranks[j].option == name && bool)
								val += e.ranks[j].value[e.pluses[j]];
						}
				}
				return val;
			};
		}
		/**
		 * 計算用
		 */
		public function getPentagramData():Object{
			var a:Array = new Array();
			for(var i:int=0;i<ereutels.length;i++)
				a.push(ereutels[i].getEreutelData());
			var obj:Object = {
				name: item.selectedLabel,
				item: item.selectedItem,
				attribute: attribute.selectedLabel,
				attribute_num: attribute.selectedIndex,
				plus: plus.selectedIndex,
				ereutels: a,
				min: calcValue(item.selectedItem[1],plus.selectedIndex,4),
				max: calcValue(item.selectedItem[2],plus.selectedIndex,4),
				def: calcValue(item.selectedItem[3],plus.selectedIndex,3),
				getEreutelValue : getEreutelValue(a)
			};
			return obj;
		}
		/**
		 * 保存用
		 */
		public function getSaveData():Array{
			var a:Array = new Array();
			a.push(item.selectedIndex);
			a.push(attribute.selectedIndex);
			a.push(plus.selectedIndex);
			for(var i:int=0;i<ereutels.length;i++)
				a = a.concat(ereutels[i].getSaveData());
			return a;
		}
		/**
		 * save count
		 */
		public function getSaveCount():int{
			return 27;
		}
		/**
		 * save count 3.18
		 */
		public function getSaveCount318():int{
			return 63;
		}
		/**
		 * import
		 */
		public function setSaveData(a:Array):void{
			if(a==null)return;
			var index:int = 0;
			item.selectedIndex = a[index++];
			if(item.selectedIndex>0){
				eventChangeItem(null);
				attribute.selectedIndex = a[index++];
				plus.selectedIndex = a[index++];
				for(var i:int=0;i<ereutels.length;i++){
					ereutels[i].setSaveData(a,index);
					index += 6;
				}
			}
		}
		/**
		 * import ver3.18
		 */
		public function setSaveData318(a:Array):void{
			if(a==null)return;
			var index:int = 0;
			item.selectedIndex = a[index++];
			if(item.selectedIndex>0){
				eventChangeItem(null);
				attribute.selectedIndex = a[index++];
				plus.selectedIndex = a[index++];
				for(var i:int=0;i<ereutels.length;i++){
					ereutels[i].setSaveData318(a,index);
					index += 12;
				}
			}
		}
	}
}
