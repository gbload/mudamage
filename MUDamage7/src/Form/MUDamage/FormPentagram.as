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
		    ["",0,0,0,0,[]],
		    ["ミュレンの古写本",30,45,30,100,[]],
		    ["エトラムの巻物",50,70,50,200,[]],
		    ["剣闘士のダガー",168,227,132,300,[]],
		    ["狂戦士のダガー",168,227,132,300,[1]],
		    ["ガイオンの盾",96,129,231,300,[]],
		    ["ガイオンの魔盾",96,129,231,300,[2]],
		    ["勇者の秘薬",134,180,184,300,[]],
		    ["英雄の秘薬",134,180,184,300,[3]],
		    ["クンドンの狂刃（レア）",181,245,249,300,[3,4]],
		    ["クンドンの魔導書（レア）",181,245,249,300,[3,5]],
		    ["反乱軍の盾（レア）",181,245,249,300,[4,6]],
		    ["イカロスの古文書（レア）",181,245,249,300,[5,6]],
		    ["アントニアスの魔剣（ユニーク）",209,284,288,300,[4,7]],
		    ["クンドンの封印書（ユニーク）",209,284,288,300,[5,7]],
		    ["アルカナの預言書（ユニーク）",209,284,288,300,[3,7]]
	                               	];
		private var attr_data:Array = ["火","水","土","風","闇"];
	
		private var option_data:Array = [
		    ["",""],
		    ["グリモア攻撃力増加+10%","attack",1,[0,2,3]],
		    ["グリモア防御力増加+10%","defense",1,[0,2,3]],
		    ["属性クリティカルダメージ確率+10%","critical",1,[0,2,3]],
		    ["防御力を属性防御力に変換+5%","normal_defense",2,[0,3,5],[1,3,5]],
		    ["攻撃力を属性攻撃力に追加+1%","normal_attack",2,[0,3,5],[1,3,5]],
		    ["反対属性に対する抵抗力増加+5％","strong_affinity",2,[1,3,6],[2,3,6]],
		    ["属性攻撃に対する抵抗力増加+5%","resistance",3,[1,3,6],[2,3,6],[3,3,6]]
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
				var ereutel:FormEreutel = new FormEreutel(i,setOption());
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
				option.enabled = false;
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
			var i:int=0;
			if(item.selectedItem[4]>=300)
				for(i=0;i<options.length;i++)
					FormCommon.show(options[i]);
			else
				for(i=0;i<options.length;i++)
					FormCommon.hide(options[i]);
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
		private function getOption(ereutels:Array):Function{
			return function(name:String):Boolean{
				if(name != ""){
					for(var i:int=0;i<options.length;i++){
						if(options[i].visible && options[i].selectedItem[1] == name){
							return true;
						}
					}
				}
				return false;
			};
		}
		/**
		 * グリモアのオプションが発生した場合、オプションを設定する
		 */
		public function setOption():Function{
			return function():void{
				var a:Array = new Array();
				for(var k:int=0;k<ereutels.length;k++)
					a.push(ereutels[k].getEreutelData());
				
				var bool:Boolean = true;
				for(var i:int=0;i<item.selectedItem[5].length;i++){
					// check condition
					for(var j:int=0;j<option_data[item.selectedItem[5][i]][2];j++){
						if(a[option_data[item.selectedItem[5][i]][3+j][0]].name != ""){
							if(a[option_data[item.selectedItem[5][i]][3+j][0]].rank < option_data[item.selectedItem[5][i]][3+j][1]
									|| a[option_data[item.selectedItem[5][i]][3+j][0]].pluses[option_data[item.selectedItem[5][i]][3+j][1]-1] < option_data[item.selectedItem[5][i]][3+j][2]){
								bool = false;
							}
						}else{
							bool = false;
						}
					}
					// set option
					if(bool){
						options[i].selectedIndex = item.selectedItem[5][i];
					}
				}
			}
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
				getOption: getOption(a),
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
