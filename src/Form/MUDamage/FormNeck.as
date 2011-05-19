package Form.MUDamage {
	import mx.controls.*;
	import mx.containers.*;
	import mx.core.*;
	import mx.collections.*;
	import mx.events.*;
	import flash.events.*;

	import Form.MUDamage.SubForm.*;
	import Data.Database.*;
	
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
			this.label = "ネック:";
			this.direction = "horizontal";
			var f_name:String = "neck";
			
			//kindフォームの作成
			var kind:ComboBox = new ComboBox();
			d.f_neck.f_kind = kind;
			kind.name = f_name;
			kind.addEventListener(ListEvent.CHANGE,click::kindChangeAcc);
			var data:ArrayCollection = new ArrayCollection(["なし","EX","セット","ショップ"]);
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
				e.dataProvider = ["","EXD","速度+7","攻撃lv20","攻撃2%","魔力lv20","魔力2%"];
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
