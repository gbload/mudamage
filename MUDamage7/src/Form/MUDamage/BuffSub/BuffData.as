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
	}
}