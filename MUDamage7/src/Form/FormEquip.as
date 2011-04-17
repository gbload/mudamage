package Form {
	import mx.controls.*;
	
	import Csv.Item;
	
	public class FormEquip extends FormItem {
		private var d:Dat;
		private var c:Internal;
		private var item:Item;
		
		private var hbox:HBox;
		private var vbox:VBox;
	
		private static var LABEL:Object = 
			{	right : "右:",
				left : "左:",
				helm : "兜:",
				armor : "鎧:",
				glove : "手:",
				garter : "腰:",
				boots : "足:"};
		private static var KIND_ARRAY:Array = 
			["なし","通常","EX","セット","ソケット","EXソケット"];
		/**
		 * コンストラクタ
		 */
		public function FormEquip(d:Dat,name:String,f_name:String) {
			this.d = d;
			this.c = Internal.getInstance();
			
			init();
		}
		/**
		 * 各種設定
		 */
		private function init():void{
			this.label = this.LABEL[item.name];
			d.formbox[item.name] = this;
			
			ln();
			setKind();
			setLuck();
			setItem();
			setPlus();
			setOp();
			setEnop();
			setSetop();

			createExop();
			createSocket();
			
			setArrow();
			set380op();
		}
		/**
		 * 改行
		 */
		private function ln():void{
			hbox = new HBox();
			this.addChild();
		}
		/**
		 * kindボックスの作成
		 */
		private function setKind():void{
			//kindフォームの作成
			var kind:ComboBox = new ComboBox();
			item.f_kind = kind;
			kind.name = item.name;
			kind.addEventListener(ListEvent.CHANGE,click::kindChange);
			var data:ArrayCollection = new ArrayCollection(this.KIND_ARRAY);
			kind.dataProvider = data;
			kind.rowCount = 7;
			hbox.addChild(kind);
		}
		/**
		 * 幸運ボックスの作成
		 */
		private function setLuck():void{
			//幸運の作成
			var box:CheckBox = FormCommon.createLuckBox();
			item.f_luck = box;
			box.name = item.name;
			hbox.addChild(box);
			//ラベルの作成
			var la:Label = FormCommon.createLuckLabel();
			item.f_luck_label = la;
			la.name = item.name;
			hbox.addChild(la);
		}
		/**
		 * アイテムボックスを作成
		 */
		private function setItem():void{
			//アイテムフォームの作成
			item.f_item = new ComboBox();
			item.f_item.addEventListener(ListEvent.CHANGE,click::itemChange);
			item.f_item.name = item.name;
			item.f_item.width = 250;
			item.f_item.labelFunction = form::labelfunc;
			item.f_item.rowCount = 10;
			FormCommon.hide(item.f_item);
			hbox.addChild(item.f_item);
		}
		/**
		 * アイテムレベルボックスの作成
		 */
		private function setPlus():void{
			//+フォームの作成
			var plus:ComboBox = FormCommon.createPlus();
			item.f_plus = plus;
			plus.name = item.name;
			this.addChild(plus);
		}
		/**
		 * OPボックスの作成
		 */
		private function setOp():void{
			//opフォームの作成
			item.f_op = new ComboBox();
			item.f_op.name = item.name;
			FormCommon.hide(item.f_op);
			hbox.addChild(item.f_op);
		}
		/**
		 * エンチャントOPボックスの作成
		 */
		private function setEnop():void{
			//エンチャントOPの作成
			item.f_enop = new ComboBox();
			item.f_enop.name = item.name;
			item.f_enop.labelFunction = FormCommon.labelfunc0;
			item.f_enop.addEventListener(ListEvent.CHANGE,click::en);
			hide(item.f_enop);
			hbox.addChild(item.f_enop);
			item.f_enop_value = new ComboBox();
			item.f_enop_value.name = item.name;
			item.f_enop_value.width = 80;
			hide(item.f_enop_value);
			hbox.addChild(item.f_enop_value);
		}
		/**
		 * セットOPボックスの作成
		 */
		private function setCop():void{
			//セットのステータスOP作成
			item.f_cop = new ComboBox();
			item.f_cop.name = item.name;
			hide(item.f_cop);
			hbox.addChild(item.f_cop);
		}
		/**
		 * EXOPボックスの作成
		 */
		private function lnEx():void{
			ln();
			d.exbox[item.name] = hbox;
			hide(hbox);
			hbox.setStyle("backgroundColor","#DDFFDD");//背景色を緑色に
			//ラベル
			la = new Label();
			la.text = "　EXOP:";
			la.setStyle("fontWeight","bold");
			la.width = 120;
			hbox.addChild(la);
		}
		private function createExop():void{
			lnEx();
			//exopの作成
			for(var i:int=0;i<5;i++){
				var e:ComboBox = new ComboBox();
				e.width = 120;
				e.rowCount = 6;
				//hide(e);
				e.addEventListener(ListEvent.CHANGE,click::exopChange);
				item.f_exop[i] = e;
				item.f_exop[i].name = f_name;
				hbox.addChild(e);
			}
		}
		/**
		 * ソケットボックスの作成
		 */
		private function vlnSocket():void{
			var vbox:VBox = new VBox();
			this.addChild(vbox);
			d.sobox[item.name] = vbox;
			hide(vbox);
			vbox.setStyle("backgroundColor","#DDCCFF");//背景色を紫色に
		}
		private function lnScoket();void{
			hbox = new HBox();
			vbox.addChild(hbox);
		}
		private function createSocket():void{
			vlnSocket();
			lnSocket();
			//soopの作成
			for(i=0;i<5;i++){
				if(i==3){//2行目に突入
					lnSocket();
				}
				e = new ComboBox();
				e.addEventListener(ListEvent.CHANGE,click::soopChange);
				//e.setStyle("alternatingItemColors",["#FF0000","#00FF00","#0000FF"]);
				e.labelFunction = form::labelfunc0;
				e.width = 140;
				e.rowCount = 6;
				item.f_soop[i] = e;
				item.f_soop[i].name = f_name;
				item.f_soop[i].id = f_name + "soop" + i;
				hbox.addChild(e);
				//値フォームの作成
				e = new ComboBox();
				e.width = 80;
				e.rowCount = 6;
				item.f_soop_value[i] = e;
				item.f_soop_value[i].name = f_name;
				item.f_soop_value[i].id = f_name + "soopv" + i;
				hbox.addChild(e);
			}
			//ボーナスソケットオプションの作成
			for(i=0;i<2;i++){
				e = new ComboBox();
				//e.setStyle("alternatingItemColors",["#FF0000","#00FF00","#0000FF"]);
				e.addEventListener(ListEvent.CHANGE,click::sobonusChange);
				e.width = 140;
				e.rowCount = 6;
				item.f_sobonus[i] = e;
				item.f_sobonus[i].name = f_name;
				hide(e);
				hbox.addChild(e);
			}
		}
		/**
		 * 矢のボックスを作成
		 */
		private function setArrow():void{
			//矢のフォーム作成
			if(name == "右:"){//右手のみ
				//矢のフォーム
				e = new ComboBox();
				hide(e);
				e.width = 140;
				e.dataProvider = ["矢+N","矢+1","矢+2","矢+3"];
				item.f_arrow = e;
				this.addChild(e);
			}
		}
		/**
		 * 380OPのボックスを作成。
		 */
		private function set380op():void{
			//380OPのフォーム作成
			ln();
			d.box380[item.name] = hbox;
			hide(hbox);
			//380OPの作成
			item.f_380 = new CheckBox();
			item.f_380.name = item.name;
			hbox.addChild(item.f_380);
			la = new Label();
			item.f_380_label = la;
			item.f_380_label.name = item.name;
			la.text = "380op";
			hbox.addChild(la);
		}
	}
}
