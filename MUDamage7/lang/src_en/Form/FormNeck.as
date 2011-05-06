package Form {
	public class FormNeck extends FormItem {
		private var d:Dat;
		private var c:Internal;
		/**
		 * コンストラクタ
		 */
		public function FormNeck() {
			this.d = d;
			this.c = Internal.getInstance();
			
			init();
		}
		private function init():void{
			this.width = 900;
			this.label = "Pendant:";
			this.direction = "horizontal";
			var f_name:String = "neck";
			
			//kindフォームの作成
			var kind:ComboBox = new ComboBox();
			d.f_neck.f_kind = kind;
			kind.name = f_name;
			kind.addEventListener(ListEvent.CHANGE,click::kindChangeAcc);
			var data:ArrayCollection = new ArrayCollection(["None","EXE","Set Ancient","Shop"]);
			kind.dataProvider = data;
			kind.rowCount = 6;
			this.addChild(kind);
			
			var hbox:HBox = new HBox();
			hide(hbox);
			d.exbox[f_name] = hbox;
			this.addChild(hbox);
			//exopの作成
			for(var i:int=0;i<5;i++){
				var e:ComboBox = new ComboBox();
				e.width = 120;
				e.rowCount = 7;
				//hide(e);
				d.f_neck.f_exop[i] = e;
				e.addEventListener(ListEvent.CHANGE,click::exopChange);
				e.name = f_name;
				e.dataProvider = ["","XDMG","Speed +7","Dmg Level/20","Dmg 2%","Magic Level/20","Magic +2%"];
				hbox.addChild(e);
			}
			
			//setitemの作成
			hbox = new HBox();
			hide(hbox);
			d.setbox[f_name] = hbox;
			this.addChild(hbox);
			//setitemの作成
			var si:ComboBox = new ComboBox();
			hbox.addChild(si);
			si.name = f_name;
			si.addEventListener(ListEvent.CHANGE,click::accitemChange);
			si.rowCount = 20;
			si.dataProvider = c.getSetNeck();
			si.labelFunction = FormCommon.labelfunc;
			d.f_neck.f_item = si;
			//ステータスOPの作成
			var cop:ComboBox = new ComboBox();
			cop.name = f_name;
			hbox.addChild(cop);
			d.f_neck.f_cop = cop;
			change::setop(d.f_neck);//OPの作成
			
			//MuItemShopの作成
			hbox = new HBox();
			hide(hbox);
			d.shopbox[f_name] = hbox;
			this.addChild(hbox);
			//ShopItemの作成
			si = new ComboBox();
			hbox.addChild(si);
			si.addEventListener(ListEvent.CHANGE,click::accitemChange);
			si.name = f_name;
			si.rowCount = 20;
			si.dataProvider = c.getShopNeck();
			si.labelFunction = FormCommon.labelfunc;
			d.f_neck.f_shopitem = si;
			
			return fi;
		}
	}
}
