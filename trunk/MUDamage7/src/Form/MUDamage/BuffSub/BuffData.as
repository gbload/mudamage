package Form.MUDamage.BuffSub {
	import mx.controls.*;
	import mx.containers.*;
	import mx.core.*;
	import mx.collections.*;
	import mx.events.*;
	import flash.events.*;
	
	public class BuffData {
		/**
		 * status
		 */
		public var knight_vit:BuffTextForm = new BuffTextForm("体力",25);
		public var knight_ene:BuffTextForm = new BuffTextForm("エナジー",10);
		public var wizard_agi:BuffTextForm = new BuffTextForm("敏捷",18);
		public var wizard_ene:BuffTextForm = new BuffTextForm("エナジー",408);
		public var elf_ene:BuffTextForm = new BuffTextForm("エナジー",72);
		public var darkload_ene:BuffTextForm = new BuffTextForm("エナジー",102);
		public var darkload_rec:BuffTextForm = new BuffTextForm("統率",300);
		public var summoner_ene:BuffTextForm = new BuffTextForm("エナジー",663);
		/**
		 * master skill
		 */
		public var master_sl1:BuffMasterSkillCanvas = new BuffMasterSkillCanvas("swell_life"); // swell life
		public var master_sl2:BuffMasterSkillCanvas = new BuffMasterSkillCanvas("swell_life_mastery");
		public var master_sl3:BuffMasterSkillCanvas = new BuffMasterSkillCanvas("swell_life_mastery2");
		public var master_sb1:BuffMasterSkillCanvas = new BuffMasterSkillCanvas("soul_barrier"); // soul barrier
		public var master_sb2:BuffMasterSkillCanvas = new BuffMasterSkillCanvas("soul_barrier_mastery");
		public var master_sb3:BuffMasterSkillCanvas = new BuffMasterSkillCanvas("soul_barrier_mastery2");
		public var master_aplus1:BuffMasterSkillCanvas = new BuffMasterSkillCanvas("attack_plus"); // attack plus
		public var master_aplus2:BuffMasterSkillCanvas = new BuffMasterSkillCanvas("attack_plus_mastery");
		public var master_gplus1:BuffMasterSkillCanvas = new BuffMasterSkillCanvas("guard_plus"); // guard plus
		public var master_gplus2:BuffMasterSkillCanvas = new BuffMasterSkillCanvas("guard_plus_mastery");
		public var master_bless1:BuffMasterSkillCanvas = new BuffMasterSkillCanvas("bless"); // bless
		public var master_ba1:BuffMasterSkillCanvas = new BuffMasterSkillCanvas("blood_attack_mastery"); // blood attack
		public var master_cplus1:BuffMasterSkillCanvas = new BuffMasterSkillCanvas("critical_plus1"); // critical plus
		public var master_cplus2:BuffMasterSkillCanvas = new BuffMasterSkillCanvas("critical_plus2");
		public var master_cplus3:BuffMasterSkillCanvas = new BuffMasterSkillCanvas("critical_plus3");
		public var master_cplus4:BuffMasterSkillCanvas = new BuffMasterSkillCanvas("critical_plus_mastery");
		public var master_iv1:BuffMasterSkillCanvas = new BuffMasterSkillCanvas("innovation"); // inner vation
		public var master_wn1:BuffMasterSkillCanvas = new BuffMasterSkillCanvas("weakness"); // weakness
//		public var master_blind1:BuffMasterSkillCanvas = new BuffMasterSkillCanvas("blind"); // blind
		public var master_con1:BuffMasterSkillCanvas = new BuffMasterSkillCanvas("concentration"); // concentration
		public var master_con2:BuffMasterSkillCanvas = new BuffMasterSkillCanvas("concentration_mastery");
		public var master_ht1:BuffMasterSkillCanvas = new BuffMasterSkillCanvas("high_tension"); // high tension
		public var master_aminus1:BuffMasterSkillCanvas = new BuffMasterSkillCanvas("cling_blow_mastery"); // cling blow
		public var master_gminus1:BuffMasterSkillCanvas = new BuffMasterSkillCanvas("beast_upper_mastery"); // beast upper
		/**
		 * etc
		 */
		public var ptm:BuffTextForm = new BuffTextForm("PTM",1,5); // party member number
		/**
		 * display self
		 */
		public var se:Label = new Label();// スペルエンハンス
		public var se_check:CheckBox = new BuffCheckBox(se);
		public var iron:Label = new Label();// アイアンディフェンス
		public var iron_check:CheckBox = new BuffCheckBox(iron);
		public var ber:Label = new Label();// バーサーカー
		public var ber_check:CheckBox = new BuffCheckBox(ber);
		public var demo:Label = new Label();// デモリジョン
		public var demo_check:CheckBox = new BuffCheckBox(demo);
		
		public var sera:Label = new Label();// セラフィー
		public var sera_check:CheckBox = new BuffCheckBox(sera);
		public var ale:Label = new Label();// 酒
		public var ale_check:CheckBox = new BuffCheckBox(ale);
		public var miracle:Label = new Label();// 妙薬
		public var miracle_check:CheckBox = new BuffCheckBox(miracle);
		// etc
		private static var item_data:Array = ["なし","速度+10","攻撃力+25","防御力+100","生命+500","マナ+500"
										,"攻撃力+40","生命+700","マナ+700"
										,"速度+15","攻撃力+30","AG回復+10"];
		private static var scroll_data:Array = ["ｽｸﾛｰﾙなし","速度+15","攻撃力+30","魔力+30"
											,"防御力+60","生命+200","マナ+300","クリダメ+20%","EXDダメ+20%"];
		private static var leap_data:Array = ["秘薬なし","力+50","敏捷+50","体力+50","エナ+50","統率+50"];
		public var item:ComboBox = new BuffComboBox(item_data);
		public var scroll:ComboBox = new BuffComboBox(scroll_data);
		public var leap:ComboBox = new BuffComboBox(leap_data);
		/**
		 * display
		 */
		public var sl:Label = new Label();
		public var sl_check:CheckBox = new BuffCheckBox(sl);
		public var sb:Label = new Label();
		public var sb_check:CheckBox = new BuffCheckBox(sb);
		public var aplus:Label = new Label();
		public var aplus_check:CheckBox = new BuffCheckBox(aplus);
		public var gplus:Label = new Label();
		public var gplus_check:CheckBox = new BuffCheckBox(gplus);
		public var bless:Label = new Label();
		public var bless_check:CheckBox = new BuffCheckBox(bless);
		public var ba:Label = new Label();
		public var ba_check:CheckBox = new BuffCheckBox(ba);
		public var cplus:Label = new Label();
		public var cplus_check:CheckBox = new BuffCheckBox(cplus);
		public var iv:Label = new Label();
		public var iv_check:CheckBox = new BuffCheckBox(iv);
		public var wn:Label = new Label();
		public var wn_check:CheckBox = new BuffCheckBox(wn);
		public var blind:Label = new Label();
		public var blind_check:CheckBox = new BuffCheckBox(blind);
		public var con:Label = new Label();
		public var con_check:CheckBox = new BuffCheckBox(con);
		public var ht:Label = new Label();
		public var ht_check:CheckBox = new BuffCheckBox(ht);
		public var aminus:Label = new Label();
		public var aminus_check:CheckBox = new BuffCheckBox(aminus);
		public var gminus:Label = new Label();
		public var gminus_check:CheckBox = new BuffCheckBox(gminus);
		/**
		 * initialize
		 */
		public function BuffData(){
		}
		/**
		 * savedata
		 */
		public function getSaveData():Array{
			var a:Array = new Array();
			a.push(knight_vit.text);
			a.push(knight_ene.text);
			a.push(wizard_agi.text);
			a.push(wizard_ene.text);
			a.push(elf_ene.text);
			a.push(darkload_ene.text);
			a.push(darkload_rec.text);
			a.push(summoner_ene.text);
			
			a.push(master_sl1.getValue());
			a.push(master_sl2.getValue());
			a.push(master_sl3.getValue());
			a.push(master_sb1.getValue());
			a.push(master_sb2.getValue());
			a.push(master_sb3.getValue());
			a.push(master_aplus1.getValue());
			a.push(master_aplus2.getValue());
			a.push(master_gplus1.getValue());
			a.push(master_gplus2.getValue());
			a.push(master_bless1.getValue());
			a.push(master_ba1.getValue());
			a.push(master_cplus1.getValue());
			a.push(master_cplus2.getValue());
			a.push(master_cplus3.getValue());
			a.push(master_cplus4.getValue());
			a.push(master_iv1.getValue());
			a.push(master_wn1.getValue());
			a.push(master_aminus1.getValue());
			a.push(master_gminus1.getValue());
			
			a.push(ptm.text);
			
			a.push(se_check.selected);
			a.push(iron_check.selected);
			a.push(ber_check.selected);
			a.push(demo_check.selected);
			a.push(sera_check.selected);
			a.push(ale_check.selected);
			a.push(miracle_check.selected);
			
			a.push(item.selectedIndex);
			a.push(scroll.selectedIndex);
			a.push(leap.selectedIndex);
			
			a.push(sl_check.selected);
			a.push(sb_check.selected);
			a.push(aplus_check.selected);
			a.push(gplus_check.selected);
			a.push(bless_check.selected);
			a.push(ba_check.selected);
			a.push(cplus_check.selected);
			a.push(iv_check.selected);
			a.push(wn_check.selected);
			a.push(blind_check.selected);
			a.push(con_check.selected);
			a.push(ht_check.selected);
			a.push(aminus_check.selected);
			a.push(gminus_check.selected);
			
			return a;
		}
		private function setCheck(check:CheckBox,val:String):void{
			check.selected = (val=="true");
			check.dispatchEvent(new Event(Event.CHANGE));
		}
		public function setSaveData(a:Array):void{
			if(a==null)return;
			var index:int = 0;
			knight_vit.text = a[index++];
			knight_ene.text = a[index++];
			wizard_agi.text = a[index++];
			wizard_ene.text = a[index++];
			elf_ene.text = a[index++];
			darkload_ene.text = a[index++];
			darkload_rec.text = a[index++];
			summoner_ene.text = a[index++];
			
			master_sl1.setValue(a[index++]);
			master_sl2.setValue(a[index++]);
			master_sl3.setValue(a[index++]);
			master_sb1.setValue(a[index++]);
			master_sb2.setValue(a[index++]);
			master_sb3.setValue(a[index++]);
			master_aplus1.setValue(a[index++]);
			master_aplus2.setValue(a[index++]);
			master_gplus1.setValue(a[index++]);
			master_gplus2.setValue(a[index++]);
			master_bless1.setValue(a[index++]);
			master_ba1.setValue(a[index++]);
			master_cplus1.setValue(a[index++]);
			master_cplus2.setValue(a[index++]);
			master_cplus3.setValue(a[index++]);
			master_cplus4.setValue(a[index++]);
			master_iv1.setValue(a[index++]);
			master_wn1.setValue(a[index++]);
			master_aminus1.setValue(a[index++]);
			master_gminus1.setValue(a[index++]);
			
			ptm.text = a[index++];
			
			setCheck(se_check,a[index++]);
			setCheck(iron_check,a[index++]);
			setCheck(ber_check,a[index++]);
			setCheck(demo_check,a[index++]);
			setCheck(sera_check,a[index++]);
			setCheck(ale_check,a[index++]);
			setCheck(miracle_check,a[index++]);
			
			item.selectedIndex = a[index++];
			scroll.selectedIndex = a[index++];
			leap.selectedIndex = a[index++];
			
			setCheck(sl_check,a[index++]);
			setCheck(sb_check,a[index++]);
			setCheck(aplus_check,a[index++]);
			setCheck(gplus_check,a[index++]);
			setCheck(bless_check,a[index++]);
			setCheck(ba_check,a[index++]);
			setCheck(cplus_check,a[index++]);
			setCheck(iv_check,a[index++]);
			setCheck(wn_check,a[index++]);
			setCheck(blind_check,a[index++]);
			setCheck(con_check,a[index++]);
			setCheck(ht_check,a[index++]);
			setCheck(aminus_check,a[index++]);
			setCheck(gminus_check,a[index++]);
		}
	}
}