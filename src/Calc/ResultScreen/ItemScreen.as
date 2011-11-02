package Calc.ResultScreen {
	import mx.controls.*;
	import mx.containers.*;
	import mx.core.*;
	import mx.collections.*;
	import mx.events.*;
	import flash.events.*;

	import Form.MUDamage.SubForm.*;
	import Form.MUDamage.*;
	import Calc.*;
	import Data.Database.*;
	import Data.Database.MLV.*;
	/**
	 * キャラクターの装備を表示するCanvas
	 */
	public class ItemScreen extends VBox {
		private var d:FormMUDamage;
		private var f:Object;
		private var i:ItemData;
		private var c:CharacterData;
	
		private var row:HBox; // 行
		/**
		 * コンストラクタ
		 */
		public function ItemScreen(muc:Object){
			super();
			this.d = muc.d;
			this.f = muc.f;
			this.i = muc.i;
			this.c = muc.c;
			
			init();
		}
		/**
		 * 初期化
		 */
		private function init():void{
			setPet();
			setWing();
			setNeck();
			setWeapon("右:",f.right,d.form_right);
			if(i.is_shield)
				setProtect("左:",f.left,d.form_left,true);
			else
				setWeapon("左:",f.left,d.form_left);
			setProtect("兜:",f.helm,d.form_helm);
			setProtect("鎧:",f.armor,d.form_armor);
			setProtect("手:",f.glove,d.form_glove);
			setProtect("腰:",f.garter,d.form_garter);
			setProtect("足:",f.boots,d.form_boots);
			setRing("リング1:",f.ring1,d.form_ring1);
			setRing("リング2:",f.ring2,d.form_ring2);
		}
		/**
		 * 改行
		 */
		private function ln():void{
			var hbox:HBox = new HBox();
			row = hbox;
			this.addChild(hbox);
		}
		/**
		 * テキスト
		 */
		private function text(str:String, color:String="", t:String=""):void{
			var te:Label = new Label();
			te.text = str;
			//文字の色
			var c:String = "";
			if(color == "red")c = "#FF5555";
			else if(color == "blue")c = "#5555FF";
			else if(color == "cyan")c = "#5599FF";
			else if(color == "green")c = "#55BB55";
			else if(color == "purple")c = "#AA55DD";
			if(c != "")te.setStyle("color",c);
			//ツールチップ
			if(t != ""){
				te.toolTip = t;
				te.setStyle("textDecoration","underline");
			}
			
			row.addChild(te);
		}
		/**
		 * ペットを表示
		 */
		private function setPet():void{
			ln();
			var str:String = f.pet.item;
			text(str);
		}
		/**
		 * 羽を表示
		 */
		private function setWing():void{
			ln();
			text("羽:");
			// str
			var str:String = f.wing.item[f.wing.key.name];
			var tooltip:String = "";
			if(str!="なし"){
				str += d.form_wing.getItemAttr().getPlus().selectedLabel+" ";
				for(var n:String in f.wing.option)
					if(n!="")
						str += n+"+"+f.wing.option[n].toString()+" ";
				if(f.wing.luck)
					str += "幸運"+" ";
				str += "ダメージ増加"+i.getSpec(f.wing,"inc").toString()+"%"+" ";
				str += "ダメージ吸収"+i.getSpec(f.wing,"dec").toString()+"%"+" ";
				str += f.wing.cop;
				// tooltip
				tooltip += "要求LV:"+i.getSpec(f.wing,"lv").toString()+"\n";
				tooltip += "防御力:"+i.getSpec(f.wing,"def").toString()+"\n";
				tooltip += "ダメージ増加:"+i.getSpec(f.wing,"inc").toString()+"%"+"\n";
				tooltip += "ダメージ吸収:"+i.getSpec(f.wing,"dec").toString()+"%";
			}
			// 表示
			text(str,"",tooltip);
		}
		/**
		 * ネックレスを表示
		 */
		private function setNeck():void{
			ln();
			text("ネック:");
			// str
			var str:String = i.getItemData(f.neck,"name") as String;
			var tooltip:String = "";
			if(str!=null){
				if(f.neck.kind=="EX")
					str = "EX"+str;
				for(var n:String in f.neck.option)
					if(n!="")
						str += n+"+"+f.neck.option[n].toString()+" ";
				// tooltip
				// require level
				if(i.getItemData(f.neck,"lv")>0)
					tooltip += "要求レベル:"+i.getItemData(f.neck,"lv").toString()+"\n";
				// 表示
				text(str,getColor(f.neck.kind));
				// EXOP
				text(getExellent(f.neck),getColor(f.neck.kind));
			}
		}
		/**
		 * 武器を表示
		 */
		private function setWeapon(label:String,obj:Object,form:Object):void{
			ln();
			text(label);
			// str
			var str:String = i.getItemData(obj,"name") as String;
			var tooltip:String = "";
			if(str!=null){
				if(obj.kind=="EX")
					str = "EX"+str;
				str += setEquipBase(obj,form);
				/*
				 * tooltip
				 */
				// spec
				tooltip += "攻撃力:"+i.getSpec(obj,"min").toString()
							+"〜"+i.getSpec(obj,"max").toString()+"\n";
				if(i.getSpec(obj,"magic")>0)
					tooltip += "魔力:"+i.getSpec(obj,"magic").toString()+"%"+"\n";
				if(i.getSpec(obj,"pet")>0)
					tooltip += "ペット:"+i.getSpec(obj,"pet").toString()+"%"+"\n";
				if(i.getSpec(obj,"curse")>0)
					tooltip += "呪い:"+i.getSpec(obj,"curse").toString()+"%"+"\n";
				// require level
				if(i.getItemData(obj,"lv")>0)
					tooltip += "要求レベル:"+i.getItemData(obj,"lv").toString()+"\n";
				// require
				if(i.getRequire(obj,"str")>0)
					tooltip += "要求力:"+i.getRequire(obj,"str").toString()+"\n";
				if(i.getRequire(obj,"agi")>0)
					tooltip += "要求敏捷:"+i.getRequire(obj,"agi").toString()+"\n";
				if(i.getRequire(obj,"vit")>0)
					tooltip += "要求体力:"+i.getRequire(obj,"vit").toString()+"\n";
				if(i.getRequire(obj,"ene")>0)
					tooltip += "要求エナジー:"+i.getRequire(obj,"ene").toString()+"\n";
				if(i.getRequire(obj,"rec")>0)
					tooltip += "要求統率:"+i.getRequire(obj,"rec").toString()+"\n";
				// 表示
				text(str,getColor(obj.kind),tooltip);
				
				// EXOP
				text(getExellent(obj),getColor(obj.kind));
				// ソケットOP
				setSocket(obj,form);
				// ソケットボーナス
				setSocketBonus(obj,form);
			}
		}
		/**
		 * 防具を表示
		 */
		private function setProtect(label:String,obj:Object,form:Object,is_shield:Boolean=false):void{
			ln();
			text(label);
			// str
			var str:String = i.getItemData(obj,"name") as String;
			var tooltip:String = "";
			if(str!=null){
				if(obj.kind=="EX")
					str = "EX"+str;
				str += setEquipBase(obj,form);
				/*
				 * tooltip
				 */
				// spec
				tooltip += "防御力:"+i.getSpec(obj,"def").toString()+"\n";
				if(is_shield)
					tooltip += "防御成功率:"+i.getSpec(obj,"avoid").toString()+"\n";
				// require level
				if(i.getItemData(obj,"lv")>0)
					tooltip += "要求レベル:"+i.getItemData(obj,"lv").toString()+"\n";
				// require
				if(i.getRequire(obj,"str")>0)
					tooltip += "要求力:"+i.getRequire(obj,"str").toString()+"\n";
				if(i.getRequire(obj,"agi")>0)
					tooltip += "要求敏捷:"+i.getRequire(obj,"agi").toString()+"\n";
				if(i.getRequire(obj,"vit")>0)
					tooltip += "要求体力:"+i.getRequire(obj,"vit").toString()+"\n";
				if(i.getRequire(obj,"ene")>0)
					tooltip += "要求エナジー:"+i.getRequire(obj,"ene").toString()+"\n";
				if(i.getRequire(obj,"rec")>0)
					tooltip += "要求統率:"+i.getRequire(obj,"rec").toString()+"\n";
				// 表示
				text(str,getColor(obj.kind),tooltip);
				
				// EXOP
				text(getExellent(obj),getColor(obj.kind));
				// ソケットOP
				setSocket(obj,form);
				// ソケットボーナス
				setSocketBonus(obj,form);
			}
		}
		private function setRing(label:String,obj:Object,form:Object):void{
			ln();
			text(label);
			// str
			var str:String = i.getItemData(obj,"name") as String;
			var tooltip:String = "";
			if(str!=null){
				if(obj.kind=="EX")
					str = "EX"+str;
				for(var n:String in obj.option)
					if(n!="")
						str += n+"+"+obj.option[n].toString()+" ";
				// tooltip
				// require level
				if(i.getItemData(obj,"lv")>0)
					tooltip += "要求レベル:"+i.getItemData(obj,"lv").toString()+"\n";
				// 表示
				text(str,getColor(obj.kind));
				// EXOP
				text(getExellent(obj),getColor(obj.kind));
			}
		}
		/**
		 * 装備共通の表示
		 */
		private function setEquipBase(obj:Object,form:Object):String{
			var str:String = "";
			// plus
			str += form.getItemAttr().getPlus().selectedLabel+" ";
			// option
			for(var n:String in obj.option)
				if(n!="")
					str += n+"+"+obj.option[n].toString()+" ";
			// luck
			if(obj.luck)
				str += "幸運"+" ";
			// enchant
			str += form.getEnchant().getKind().selectedLabel
					+form.getEnchant().getValue().selectedLabel+" ";
			
			return str;
		}
		/**
		 * EXOPの取得
		 */
		private function getExellent(obj:Object):String{
			var exop:String = "";
			for(var n:String in obj.exop)
				if(n!="")
					exop += n+" ";
			return exop;
		}
		/**
		 * ソケットOPを表示
		 */
		private function setSocket(obj:Object,form:Object):void{
			var socket:String = "";
			for(var n:String in form.getSocket().getNames())
				if(form.getSocket().getNames()[n].selectedLabel!="")
					socket += form.getSocket().getNames()[n].selectedLabel
					           +form.getSocket().getValues()[n].selectedLabel+" ";
			if(socket!=""){
				ln();
				text(socket,getColor(obj.kind));
			}
		}
		/**
		 * ソケットボーナスを表示
		 */
		private function setSocketBonus(obj:Object,form:Object):void{
			// ソケットボーナス
			var bonus:String = "";
			for(var n:String in form.getSocket().getBonuses())
				if(form.getSocket().getBonuses()[n].selectedLabel!="")
					bonus += form.getSocket().getBonuses()[n].selectedLabel+" ";
			if(bonus!=""){
				ln();
				text(bonus,getColor(obj.kind));
			}
		}
		/**
		 * kindから色を決定
		 */
		private function getColor(kind:String):String{
			var color:String = "";
			if(kind=="EX")
				color="green";
			else if(kind=="セット")
				color="cyan";
			else if(kind=="ソケット")
				color="purple";
			return color;
		}
	}
}