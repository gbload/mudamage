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
		private var options:Array;
		private var ereutels:Array;
	
		private var hbox:HBox;
		/**
		 * データ
		 */
		private var item_data:Array = [
		    // name,min,max,def,requireLV
		    ["",0,0,0,0],
		    ["ミュレンの魔法書",30,45,30,100],
		    ["エトラムの巻物",50,70,50,200],
		    ["ロレンシア騎士団鉄壁の盾(仮)",10,15,50,100],
		    ["英雄の飛躍(仮)",20,30,20,0],
		    ["剣闘士の短刀(仮)",40,55,15,0],
		    ["クンドンの狂気の刃(仮)",50,70,10,0],
		    ["クンドンの魔法書(仮)",40,55,40,0],
		    ["帝国守護軍の砦(仮)",20,30,100,0],
		    ["イカロスの古書(仮)",80,110,80,0],
		    ["アルカの預言書(仮)",110,140,110,0],
		    ["アントニアスの剣(仮)",150,200,50,0],
		    ["クンドンの封印書(仮)",130,170,130,0]
	                               	];
		private var attr_data:Array = ["火","水","土","風","闇"];
	
		private var option_data:Array = [
		    ["",""],
		    ["グリモア攻撃力増加+10%","attack"],
		    ["グリモア防御力増加+10%","defense"],
		    ["属性クリティカルダメージ確率+10%","critical"],
		    ["防御力を属性防御力に変換+5%","normal_defense"],
		    ["ダメージを属性ダメージに追加+10%","normal_attack"],
		    ["強い相性に対する抵抗力増加+5%","strong_affinity"],
		    ["属性攻撃に対する抵抗力増加+5%","resistance"]
		                                 ];
		/**
		 * コンストラクタ
		 */
		public function FormPentagram(d:FormMUDamage) {
			this.d = d;
			this.options = new Array();
			this.ereutels = new Array();

//			this.direction = "horizontal";
			this.label = this.LABEL;

			ln();
			createItem();
			createAttribute();
			createPlus();
			createOption();
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
		 * option
		 */
		private function createOption():void{
			for(var i:int=0;i<2;i++){
				var option:ComboBox = new ComboBox();
				option.dataProvider = option_data;
				option.labelFunction = FormCommon.labelfunc0;
				option.addEventListener(ListEvent.CHANGE,eventChangeOption);
				FormCommon.hide(option);
				options.push(option);
				hbox.addChild(option);
			}
		}
		/**
		 * option event
		 */
		private function eventChangeOption(event:Event):void {
			if(FormCommon.isDuplication(options))
				event.target.selectedIndex = 0;
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
			for(var i:int=0;i<options.length;i++)
				FormCommon.show(options[i]);
			for(i=0;i<ereutels.length;i++)
				FormCommon.show(ereutels[i]);
		}
		/**
		 * hide
		 */
		private function hide():void{
			FormCommon.hide(attribute);
			FormCommon.hide(plus);
			for(var i:int=0;i<options.length;i++)
				FormCommon.hide(options[i]);
			for(i=0;i<ereutels.length;i++)
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
		 * オプションを選択している場合trueを返す
		 */
		private function getOption():Function{
			return function(name:String):Boolean{
				var bool:Boolean = false;
				if(name != "")
					for(var i:int=0;i<options.length;i++){
						if(options[i].selectedItem[1] == name){
							bool=true;
							break;
						}
					}
				return bool;
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
				options: options,
				getOption: getOption(),
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
			a.push(options[0].selectedIndex);
			a.push(options[1].selectedIndex);
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
		 * save count 3.34
		 */
		public function getSaveCount334():int{
			return 65;
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
		/**
		 * import ver3.34
		 */
		public function setSaveData334(a:Array):void{
			if(a==null)return;
			var index:int = 0;
			item.selectedIndex = a[index++];
			if(item.selectedIndex>0){
				eventChangeItem(null);
				attribute.selectedIndex = a[index++];
				plus.selectedIndex = a[index++];
				options[0].selectedIndex = a[index++];
				options[1].selectedIndex = a[index++];
				for(var i:int=0;i<ereutels.length;i++){
					ereutels[i].setSaveData318(a,index);
					index += 12;
				}
			}
		}
	}
}
