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
		private var a:AttackData;
	
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
			this.a = muc.a;
			
			init();
		}
		/**
		 * 初期化
		 */
		private function init():void{
			setPet();
			setWing();
			setNeck();
			setWeapon("右:",f.right);
			if(i.is_shield)
				setProtect("左:",f.left,true);
			else if(f.left.kind == "鷹")
				setDarkspirit("左:");
			else
				setWeapon("左:",f.left);
			setProtect("兜:",f.helm);
			setProtect("鎧:",f.armor);
			setProtect("手:",f.glove);
			setProtect("腰:",f.garter);
			setProtect("足:",f.boots);
			setRing("リング1:",f.ring1);
			setRing("リング2:",f.ring2);
			setProperty();
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
			else if(color != "")c = color;
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
			str += " " + f.pet.sub1 + " " + f.pet.sub2 + " ";
			if(f.pet.item == "ダークホース"){
				str += "ダメージ吸収" + (Math.floor(15 + (f.pet.sub1_index+1)/2)).toString() + "%";
				var tooltip:String = "";
				tooltip += "要求LV:" + (218+(f.pet.sub1_index+1)*2).toString() + "\n";
				tooltip += "防御力:" + (5 + (c.agi/20) + ((f.pet.sub1_index+1) * 2)).toString() + "\n";
				tooltip += "ダメージ吸収:" + (Math.floor(15 + (f.pet.sub1_index+1))).toString() + "%\n";
				tooltip += "押し出す距離:" + (1+(f.pet.sub1_index+1)*0.07).toString() + "\n";
				text(str,"",tooltip);
			}else
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
				// セットステータス
				for(var tmp:Object in f.neck.set_status)
					text(tmp+"+"+f.neck.set_status[tmp],getColor(f.neck.kind));
				// EXOP
				text(getExellent(f.neck),getColor(f.neck.kind));
			}
		}
		/**
		 * 武器を表示
		 */
		private function setWeapon(label:String,obj:Object):void{
			ln();
			text(label);
			// str
			var str:String = i.getItemData(obj,"name") as String;
			var tooltip:String = "";
			if(str!=null){
				if(obj.kind=="EX")
					str = "EX"+str;
				str += setEquipBase(obj);
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
				if(i.getRequire(obj,"str")>0){
					tooltip += "要求力:"+i.getRequire(obj,"str").toString();
					// option
					for(var n:String in obj.option)
						if(n!="" && obj.option[n]){
							tooltip += "("+(i.getRequire(obj,"str")+(obj.option[n]/4)*5).toString()+")";
							break;
						}
					tooltip += "?\n";
				}
				if(i.getRequire(obj,"agi")>0)
					tooltip += "要求敏捷:"+i.getRequire(obj,"agi").toString()+"?\n";
				if(i.getRequire(obj,"vit")>0)
					tooltip += "要求体力:"+i.getRequire(obj,"vit").toString()+"?\n";
				if(i.getRequire(obj,"ene")>0)
					tooltip += "要求エナジー:"+i.getRequire(obj,"ene").toString()+"?\n";
				if(i.getRequire(obj,"rec")>0)
					tooltip += "要求統率:"+i.getRequire(obj,"rec").toString()+"?\n";
				// 表示
				text(str,getColor(obj.kind),tooltip);
				
				// セットステータス
				for(var tmp:Object in obj.set_status)
					text(tmp+"+"+obj.set_status[tmp],getColor(obj.kind));
				// EXOP
				text(getExellent(obj),getColor(obj.kind));
				// ソケットOP
				setSocket(obj);
				// ソケットボーナス
				setSocketBonus(obj);
			}
		}
		/**
		 * 鷹を表示
		 */
		private function setDarkspirit(label:String):void{
			ln();
			text(label);
			// str
			var str:String = "鷹 Lv" + f.left.darkspirit;
			var tooltip:String = "";
			//require
			tooltip += "要求統率:"+(185+f.left.darkspirit*15).toString()+"\n";
			// status
			tooltip += "単体:"+c.darkspirit_min_single.toString()+"〜"+c.darkspirit_max_single.toString()+"\n";
			tooltip += "範囲:"+c.darkspirit_min_range.toString()+"〜"+c.darkspirit_max_range.toString()+"\n";
			tooltip += "命中:"+c.darkspirit_hit.toString()+"\n";
			tooltip += "通常攻撃確率:"+(c.darkspirit_normal/100).toString()+"%\n";
			tooltip += "クリティカル確率:"+(c.darkspirit_cri_per/100).toString()+"%\n";
			tooltip += "エクセレントダメージ確率:"+(c.darkspirit_exd_per).toString()+"%\n";
			// 表示
			text(str,"",tooltip);
		}
		/**
		 * 防具を表示
		 */
		private function setProtect(label:String,obj:Object,is_shield:Boolean=false):void{
			ln();
			text(label);
			// str
			var str:String = i.getItemData(obj,"name") as String;
			var tooltip:String = "";
			if(str!=null){
				if(obj.kind=="EX")
					str = "EX"+str;
				str += setEquipBase(obj);
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
				if(i.getRequire(obj,"str")>0){
					tooltip += "要求力:"+i.getRequire(obj,"str").toString();
					// option
					for(var n:String in obj.option)
						if(n!="" && obj.option[n]){
							if(is_shield)
								tooltip += "("+(i.getRequire(obj,"str")+obj.option[n]).toString()+")";
							else
								tooltip += "("+(i.getRequire(obj,"str")+(obj.option[n]/4)*5).toString()+")";
							break;
						}
					tooltip += "?\n";
				}
				if(i.getRequire(obj,"agi")>0)
					tooltip += "要求敏捷:"+i.getRequire(obj,"agi").toString()+"?\n";
				if(i.getRequire(obj,"vit")>0)
					tooltip += "要求体力:"+i.getRequire(obj,"vit").toString()+"?\n";
				if(i.getRequire(obj,"ene")>0)
					tooltip += "要求エナジー:"+i.getRequire(obj,"ene").toString()+"?\n";
				if(i.getRequire(obj,"rec")>0)
					tooltip += "要求統率:"+i.getRequire(obj,"rec").toString()+"?\n";
				// 表示
				text(str,getColor(obj.kind),tooltip);

				// セットステータス
				for(var tmp:Object in obj.set_status)
					text(tmp+"+"+obj.set_status[tmp],getColor(obj.kind));
				// EXOP
				text(getExellent(obj),getColor(obj.kind));
				// ソケットOP
				setSocket(obj);
				// ソケットボーナス
				setSocketBonus(obj);
			}
		}
		private function setRing(label:String,obj:Object):void{
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
				// セットステータス
				for(var tmp:Object in obj.set_status)
					text(tmp+"+"+obj.set_status[tmp],getColor(obj.kind));
				// EXOP
				text(getExellent(obj),getColor(obj.kind));
			}
		}
		/**
		 * 装備共通の表示
		 */
		private function setEquipBase(obj:Object):String{
			var str:String = "";
			// plus
			if(obj.plus==0)
				str += "N"+" ";
			else
				str += "+"+obj.plus+" ";
			// option
			for(var n:String in obj.option)
				if(n!="")
					str += n+"+"+obj.option[n].toString()+" ";
			// luck
			if(obj.luck)
				str += "幸運"+" ";
			// enchant
			for(n in obj.enchant)
				str += n + obj.enchant[n] + " ";
			
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
		private function setSocket(obj:Object):void{
			var socket:String = "";
			for(var n:String in obj.socket)
				if(obj.socket[n]!="")
					socket += n + obj.socket[n]+" ";
			if(socket!=""){
				ln();
				text(socket,getColor(obj.kind));
			}
		}
		/**
		 * ソケットボーナスを表示
		 */
		private function setSocketBonus(obj:Object):void{
			// ソケットボーナス
			var bonus:String = "";
			for(var n:String in obj.socket_bonus)
				if(n!="")
					bonus += n+" ";
			if(bonus!=""){
				ln();
				text(bonus,getColor(obj.kind));
			}
		}
		/**
		 * property
		 */
		private function setProperty():void{
			ln();
			text("属性:")
			if(f.property.name!=""){
				var str:String = "";
				var tooltip:String = "";
				// name
				str += f.property.name;
				// plus
				if(f.property.plus>0)
					str += "+"+f.property.plus;
				else
					str += "N";
				// spec
				tooltip += "属性:" + f.property.attribute + "\n";
				tooltip += "属性攻撃力:" + f.property.min + "〜" + f.property.max + "\n";
				tooltip += "属性防御力:" + f.property.def + "\n";
				tooltip += "要求レベル:" + f.property.item[4] + "\n";
				// color
				var colors:Array = ["#FF0000","#0000FF","#FFDD00","#00FF00","#FF00FF"];
				var color:String = colors[f.property.attribute_num];
				// show
				text(str,color,tooltip);
				/*
				 * ereutel
				 */
				for(var i:int=0;i<f.property.ereutels.length;i++){
					var e:Object = f.property.ereutels[i];
					if(e.name=="")continue;
					str = "";
					tooltip = "";
					// name
					str += e.name;
					// spec
					// rank
					tooltip += "ランク:" + e.rank + "\n";
					// ereutel
					for(var j:int=0;j<e.rank;j++){
						tooltip += e.ranks[j].label + ":";
						tooltip += e.ranks[j].value[e.pluses[j]];
						tooltip += "(アイテムレベル" + e.pluses[j] + ")";
						tooltip += "\n";
					}
					text(str,color,tooltip);
				}
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