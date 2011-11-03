package Form {
	import mx.controls.*;
	
	import Csv.Item;
	
	public class FormEquip extends FormItem {
		private var d:Dat;
		private var c:Internal;
	
		private var kinds:Object;
	
		private var kind:ComboBox;
		private var item:ComboBox;
		private var item_attr:FormItemAttributeBox;
		private var setop:ComboBox;
		private var exellent:FormExellentBox;
		private var enchant:FormEnchantBox;
		private var socket:FormSocketBox;
		
		private var hbox:HBox;
		private var vbox:VBox;
	
		private static var LABEL:Object = 
			{	right : "Right:",
				left : "Left:",
				helm : "Helm:",
				armor : "Armor:",
				glove : "Gloves:",
				garter : "Pants:",
				boots : "Boots:"};
		private var KIND_ARRAY:Array = [
			["None","Normal","EXE","Set Ancient","Socket","EXE Socket"];
		/**
		 * コンストラクタ
		 */
		public function FormEquip(d:Dat,name:String,f_name:String) {
			this.d = d;
			this.c = Internal.getInstance();
			
			kinds = {
				none 	: new FormEquipNone(),
				normal 	: new FormEquipNormal(),
				exellent: new FormEquipExellent(),
				set		: new FormEquipSet(),
				socket	: new FormEquipSocket()
			};
			KIND_ARRAY = [
			              ["None"	,kinds.none],
			              ["Normal"	,kinds.normal],
			              ["EXE"		,kinds.exellent],
			              ["Set Ancient"	,kinds.set],
			              ["Socket",kinds.socket]
			            ];
			
			initForm();
		}
		/**
		 * フォームの設定
		 */
		private function initForm():void{
			this.label = this.LABEL[item.name];
			
			ln();
			createKind();
			createItem();
			item_attr = new FormItemAttributeBox();hbox.addChild(item_attr);
			enchant = new FormEnchantBox();hbox.addChild(enchant);
			createSetop();
			
			exellent = new FormExellentBox();this.addChild(exellent);
			socket = new FormSocketBox();this.addChild(socket);
			
			createArrow();
			create380op();
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
		private function createKind():void{
			//kindフォームの作成
			var kind:ComboBox = new ComboBox();
			item.f_kind = kind;
			kind.name = item.name;
			kind.addEventListener(ListEvent.CHANGE,click::kindChange);
			var data:ArrayCollection = new ArrayCollection(this.KIND_ARRAY);
			kind.dataProvider = data;
			kind.labelFunction = FormCommon.labelfunc0;
			kind.rowCount = 7;
			hbox.addChild(kind);
		}
		/**
		 * アイテムボックスを作成
		 */
		private function createItem():void{
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
		 * セットOPボックスの作成
		 */
		private function createSetop():void{
			//セットのステータスOP作成
			item.f_cop = new ComboBox();
			item.f_cop.name = item.name;
			hide(item.f_cop);
			hbox.addChild(item.f_cop);
		}
		/**
		 * 矢のボックスを作成
		 */
		private function createArrow():void{
			//矢のフォーム作成
			if(name == "Right:"){//右手のみ
				//矢のフォーム
				e = new ComboBox();
				hide(e);
				e.width = 140;
				e.dataProvider = ["Arrow +0","Arrow +1","Arrow +2","Arrow +3"];
				item.f_arrow = e;
				this.addChild(e);
			}
		}
		/**
		 * 380OPのボックスを作成。
		 */
		private function create380op():void{
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
		/**
		 * Kind変更時発生イベント
		 */
		private function eventChangeKind(event:Event):void {
			event.target.selectedItem[1].display();
		}
	}
}
