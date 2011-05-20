package Form.MUDamage {
	import mx.controls.*;
	import mx.containers.*;
	import mx.core.*;
	import mx.collections.*;
	import mx.events.*;
	import flash.events.*;

	import Form.MUDamage.SubForm.*;
	import Data.Database.*;
	
	public class FormRing extends FormNeck {
		/**
		 * コンストラクタ
		 * @param num 1.リング1　2.リング2
		 */
		public function FormRing(d:FormMUDamage,num:int) {
			super();
			if(num==1)this.label = "リング1:";
			else this.label = "リング2:";
		}
		private function init():void{
			this.width = 900;
			this.label = name;
			this.direction = "horizontal";
			
			//kindフォームの作成
			var kind:ComboBox = new ComboBox();
			item.f_kind = kind;
			kind.name = f_name;
			kind.addEventListener(ListEvent.CHANGE,click::kindChangeAcc);
			var data:ArrayCollection = new ArrayCollection(["なし","EX","セット","魔法師","大魔法師","パンダ変化","スケルトン","ショップ"]);
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
				e.rowCount = 6;
				//hide(e);
				item.f_exop[i] = e;
				e.addEventListener(ListEvent.CHANGE,click::exopChange);
				e.name = f_name;
				e.dataProvider = ["","防御成功","ダメ減","生命増","マナ増","ダメ反"];
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
			si.addEventListener(ListEvent.CHANGE,click::accitemChange);
			si.name = f_name;
			si.rowCount = 20;
			si.dataProvider = c.getSetRing();
			si.labelFunction = FormCommon.labelfunc;
			item.f_item = si;
			
			//ステータスOPの作成
			var cop:ComboBox = new ComboBox();
			cop.name = f_name;
			hbox.addChild(cop);
			item.f_cop = cop;
			change::setop(item);//OPの作成
			
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
			si.dataProvider = c.getShopRing();
			si.labelFunction = FormCommon.labelfunc;
			item.f_shopitem = si;
			
			return fi;
		}
	}
}
