package Form.MUDamage {
	import mx.controls.*;
	import mx.containers.*;
	import mx.core.*;
	import mx.collections.*;
	import mx.events.*;
	import mx.managers.*;
	import flash.events.*;

	import Form.MUDamage.SubForm.*;
	import Form.MUDamage.BuffSub.*;
	import Calc.*;
	import Data.Database.*;
	
	public class FormBuff extends Form{
		private var d:BuffData = new BuffData();
		private var mud:FormMUDamage;
		private var funcs:Array = new Array();
		/**
		 * 
		 */
		public function FormBuff(mud:FormMUDamage) {
			this.mud = mud;
			
			selfBox();
			knightBox();
			wizardBox();
			elfBox();
			magicBox();
			darkloadBox();
			summonerBox();
			rageBox();
			
			callFunctions();
		}
		/**
		 * 
		 */
		private function createBox(str:String):VBox{
			var fi:FormItem = new FormItem();
			fi.label = str;
			var vbox:VBox = new VBox();
			vbox.setStyle("borderStyle","solid");
			fi.addChild(vbox);
			this.addChild(fi);
			return vbox;
		}
		/**
		 * 
		 */
		private function createRow(a:Array):HBox{
			var hbox:HBox = new HBox();
			for(var n:Object in a)
				hbox.addChild(a[n]);
			return hbox;
		}
		/**
		 * 
		 */
		private function setEvent(e:Function,a:Array):void{
			funcs.push(e);
			for(var n:Object in a)
				a[n].setEvent(e);
		}
		private function callFunctions():void{
			for(var n:Object in funcs)
				funcs[n](null);
		}
		/**
		 * self
		 */
		private function selfBox():void{
			var vbox:VBox = createBox("自身のサポ");
//			// form
//			vbox.addChild(createRow([d.sb_check, d.sb]));
//			vbox.addChild(createRow([d.wizard_agi, d.wizard_ene]));
//			vbox.addChild(createRow([d.master_sb1,d.master_sb2,d.master_sb3]));
//			// event
//			var func:Function = function(event:Event):void{
//				var sb:int = SupportSkillCalculator.calcSoulBarrier(d);
//				var time:int = SupportSkillCalculator.calcSoulBarrier_Time(d);
//				var mana:int = SupportSkillCalculator.calcSoulBarrier_Mana(d);
//				d.sb = "ソウルバリア:"+sb.toString()+"%";
//				d.sb += " 持続時間"+time.toString()+"秒";
//				if(mana>0)d.sb += " 最大マナ"+"+"+mana.toString()+"%";
//			};
//			setEvent(func,[d.wizard_agi, d.wizard_ene,d.master_sb1,d.master_sb2,d.master_sb3]);
		}
		/**
		 * knight
		 */
		private function knightBox():void{
			var vbox:VBox = createBox("ナイト");
			// form
			vbox.addChild(createRow([d.sl_check,d.sl]));
			vbox.addChild(createRow([d.knight_vit,d.knight_ene,d.ptm
			                         ,d.master_sl1,d.master_sl2,d.master_sl3]));
			// event
			var func:Function = function(event:Event):void{
				var sl:int = SupportSkillCalculator.calcSwellLife(d);
				var time:int = SupportSkillCalculator.calcSwellLife_Time(d);
				var mana:int = SupportSkillCalculator.calcSwellLife_Mana(d);
				var ag:int = SupportSkillCalculator.calcSwellLife_AG(d);
				d.sl.text = "スウェルライフ:"+sl.toString()+"%";
				d.sl.text += " 持続時間"+time.toString()+"秒";
				if(mana>0)d.sl.text += " 最大マナ"+"+"+mana.toString()+"%";
				if(ag>0)d.sl.text += " 最大AG"+"+"+ag.toString()+"%";
			};
			setEvent(func,[d.knight_vit,d.knight_ene,d.ptm,d.master_sl1,d.master_sl2,d.master_sl3]);
		}
		/**
		 * wizard
		 */
		private function wizardBox():void{
			var vbox:VBox = createBox("ウィザード");
			// form
			vbox.addChild(createRow([d.sb_check, d.sb]));
			vbox.addChild(createRow([d.wizard_agi, d.wizard_ene
			                         ,d.master_sb1,d.master_sb2,d.master_sb3]));
			// event
			var func:Function = function(event:Event):void{
				var sb:int = SupportSkillCalculator.calcSoulBarrier(d);
				var time:int = SupportSkillCalculator.calcSoulBarrier_Time(d);
				var mana:int = SupportSkillCalculator.calcSoulBarrier_Mana(d);
				d.sb.text = "ソウルバリア:"+sb.toString()+"%";
				d.sb.text += " 持続時間"+time.toString()+"秒";
				if(mana>0)d.sb.text += " 最大マナ"+"+"+mana.toString()+"%";
			};
			setEvent(func,[d.wizard_agi, d.wizard_ene,d.master_sb1,d.master_sb2,d.master_sb3]);
		}
		/**
		 * elf
		 */
		private function elfBox():void{
			var vbox:VBox = createBox("エルフ");
			// form
			vbox.addChild(createRow([d.aplus_check, d.aplus, d.gplus_check, d.gplus]));
			vbox.addChild(createRow([d.bless_check, d.bless]))
			vbox.addChild(createRow([d.elf_ene
			                         ,d.master_aplus1,d.master_aplus2
			                         ,d.master_gplus1,d.master_gplus2
			                         ,d.master_bless1]));
			// event aplus
			var func:Function = function(event:Event):void{
				var aplus:int = SupportSkillCalculator.calcAttackPlus(d);
				var time:int = SupportSkillCalculator.calcAttackPlus_Time(d);
				d.aplus.text = "A+:"+aplus.toString();
				d.aplus.text += " 持続時間"+time.toString()+"秒";
			};
			setEvent(func,[d.elf_ene,d.master_aplus1,d.master_aplus2]);
			// event gplus
			func = function(event:Event):void{
				var gplus:int = SupportSkillCalculator.calcGuardPlus(d);
				var time:int = SupportSkillCalculator.calcGuardPlus_Time(d);
				d.gplus.text = "G+:"+gplus.toString();
				d.gplus.text += " 持続時間"+time.toString()+"秒";
			};
			setEvent(func,[d.elf_ene,d.master_gplus1,d.master_gplus2]);
			// event bless
			func = function(event:Event):void{
				var bless:int = SupportSkillCalculator.calcBless(d);
//				var time:int = SupportSkillCalculator.calcBless_Time(d);
				d.bless.text = "ブレス:"+"全ステータス"+"+"+bless.toString();
//				d.bless.text += " 持続時間"+time.toString()+"秒";
			};
			setEvent(func,[d.elf_ene,d.master_bless1]);
		}
		/**
		 * magic gladiator
		 */
		private function magicBox():void{
			var vbox:VBox = createBox("魔剣士");
			// form
			vbox.addChild(createRow([d.ba_check, d.ba]));
			vbox.addChild(createRow([d.master_ba1]));
			// event
			var func:Function = function(event:Event):void{
				var ba:int = SupportSkillCalculator.calcBloodAttack(d);
				d.ba.text = "ブラッドアタック:"+"敵の防御力低下"+ba.toString()+"%";
			};
			setEvent(func,[d.master_ba1]);
		}
		/**
		 * dark load
		 */
		private function darkloadBox():void{
			var vbox:VBox = createBox("ダークロード");
			// form
			vbox.addChild(createRow([d.cplus_check, d.cplus]));
			vbox.addChild(createRow([d.darkload_ene, d.darkload_rec
			                         ,d.master_cplus1,d.master_cplus2,d.master_cplus3,d.master_cplus4]));
			// event
			var func:Function = function(event:Event):void{
				var cplus:int = SupportSkillCalculator.calcCriticalPlus(d);
				var time:int = SupportSkillCalculator.calcCriticalPlus_Time(d);
				var cri:int = SupportSkillCalculator.calcCriticalPlus_Cri(d);
				var exd:int = SupportSkillCalculator.calcCriticalPlus_Exd(d);
				d.cplus.text = "C+:"+cplus.toString();
				d.cplus.text += " 持続時間"+time.toString()+"秒";
				if(cri>0)d.cplus.text += " クリティカル確率"+"+"+cri.toString()+"%";
				if(exd>0)d.cplus.text += " EXD確率"+"+"+cri.toString()+"%";
			};
			setEvent(func,[d.darkload_ene, d.darkload_rec,d.master_cplus1,d.master_cplus2,d.master_cplus3,d.master_cplus4]);
		}
		/**
		 * summoner
		 */
		private function summonerBox():void{
			var vbox:VBox = createBox("召喚師");
			// form
			vbox.addChild(createRow([d.iv_check, d.iv, d.wn_check, d.wn, d.blind_check, d.blind]));
			vbox.addChild(createRow([d.summoner_ene
			                         ,d.master_iv1,d.master_wn1]));
			// event iv
			var func:Function = function(event:Event):void{
				var iv:int = SupportSkillCalculator.calcInnovation(d);
				d.iv.text = "インナーベーション:"+"敵の防御力低下"+iv.toString()+"%";
			};
			setEvent(func,[d.summoner_ene,d.master_iv1]);
			// event wn
			func = function(event:Event):void{
				var wn:int = SupportSkillCalculator.calcWeakness(d);
				d.wn.text = "ウィークネス:"+"敵の攻撃力低下"+wn.toString()+"%";
			};
			setEvent(func,[d.summoner_ene,d.master_wn1]);
			// event blind
			func = function(event:Event):void{
				var blind:int = SupportSkillCalculator.calcBlind(d);
				d.blind.text = "ブラインド:"+"敵の攻撃成功率低下"+blind.toString()+"%";
			};
			setEvent(func,[d.summoner_ene]);
		}
		/**
		 * rage fighter
		 */
		private function rageBox():void{
			var vbox:VBox = createBox("レイジファイター");
			// form
			vbox.addChild(createRow([d.con_check, d.con, d.ht_check, d.ht]));
			vbox.addChild(createRow([d.aminus_check, d.aminus, d.gminus_check, d.gminus]));
			vbox.addChild(createRow([d.master_con1,d.master_con2,d.master_ht1,d.master_aminus1,d.master_gminus1]));
			// event con
			var func:Function = function(event:Event):void{
				var con:int = SupportSkillCalculator.calcConcentration(d,parseInt(mud.form_status.getEne().text));
				var def:int = SupportSkillCalculator.calcConcentration_Defense(d);
				d.con.text = "コンセントレーション:"+"防御成功率"+"+"+con.toString();
				if(def>0)d.con.text += " 防御力"+"+"+def.toString();
			};
			setEvent(func,[d.master_con1,d.master_con2]);
			// event ht
			func = function(event:Event):void{
				var ht:int = SupportSkillCalculator.calcHighTension(d,parseInt(mud.form_status.getEne().text));
				d.ht.text = "ハイテンション:"+"体力"+"+"+ht.toString();
			};
			setEvent(func,[d.master_ht1]);
			// event con
			func = function(event:Event):void{
				var aminus:int = SupportSkillCalculator.calcClingBlow(d);
				d.aminus.text = "クリングブロー:"+"敵の攻撃力低下"+aminus.toString()+"%";
			};
			setEvent(func,[d.master_aminus1]);
			// event con
			func = function(event:Event):void{
				var gminus:int = SupportSkillCalculator.calcBeastUpper(d);
				d.gminus.text = "ビーストアッパー:"+"敵の防御力低下"+gminus.toString()+"%";
			};
			setEvent(func,[d.master_gminus1]);
		}
	}
}