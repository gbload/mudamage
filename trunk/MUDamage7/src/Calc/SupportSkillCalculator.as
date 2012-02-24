package Calc {
	import mx.controls.*;
	import mx.containers.*;
	import mx.core.*;
	import mx.collections.*;
	import mx.events.*;
	import flash.events.*;

	import Form.MUDamage.SubForm.*;
	import Form.MUDamage.BuffSub.*;
	import Data.Database.*;
	import Data.Database.MLV.*;
	/**
	 * キャラクターステータスを計算
	 * @author sinlion
	 *
	 */
	public class SupportSkillCalculator{
		/**
		 * etc
		 */
		public static function calcSeraphy_Attack(lv:int):int{
			return Math.floor(lv/3) + 45;
		}
		public static function calcSeraphy_Defense(lv:int):int{
			return Math.floor(lv/5) + 50;
		}
		/**
		 * self
		 */
		public static function calcSpellEnhance():int{
			return 20;
		}
		public static function calcSpellEnhance_Max(master:int):int{
			return master;
		}
		public static function calcSpellEnhance_Cri(master:int):int{
			return master;
		}
		public static function calcIronDefense_Defense(master:int):int{
			return master+800;
		}
		public static function calcIronDefense_Life(master:int):int{
			return master+800;
		}
		public static function calcBerserkerMind_Magic(master:int,ene:int):int{
			return master+Math.floor(ene/30);
		}
		public static function calcBerserkerMind_MagicFixed(master:int):int{
			return master;
		}
		public static function calcBerserkerMind_Life(master:int,ene:int):int{
			return master+Math.floor(ene/60) - 40;
		}
		public static function calcBerserkerMind_Defense(master:int,ene:int):int{
			return master+Math.floor(ene/45) - 50;
		}
		public static function calcBerserkerMind_Mana(master:int,ene:int):int{
			return master+Math.floor(ene/30);
		}
		public static function calcDemolition(ene:int):int{
			return 2 + ene/200;
		}
		/**
		 * other
		 */
		public static function calcSwellLife(d:BuffData):int{
			return Math.floor(parseInt(d.knight_vit.text)/100)
				+ Math.floor(parseInt(d.knight_ene.text)/20)
				+ Math.floor(parseInt(d.ptm.text)-1)
				+ 12 + d.master_sl1.getSkillValue();
		}
		public static function calcSwellLife_Mana(d:BuffData):int{
			return d.master_sl2.getSkillValue();
		}
		public static function calcSwellLife_AG(d:BuffData):int{
			return d.master_sl3.getSkillValue();
		}
		public static function calcSwellLife_Time(d:BuffData):int{
			return 60 + Math.floor(parseInt(d.knight_ene.text)/10);
		}
		public static function calcSoulBarrier(d:BuffData):int{
			return Math.floor(parseInt(d.wizard_agi.text)/50)
				+ Math.floor(parseInt(d.wizard_ene.text)/200)
				+ 10 + d.master_sb1.getSkillValue();
		}
		public static function calcSoulBarrier_Time(d:BuffData):int{
			return 60 + Math.floor(parseInt(d.wizard_ene.text)/40)
				+ d.master_sb2.getSkillValue();
		}
		public static function calcSoulBarrier_Mana(d:BuffData):int{
			return d.master_sb3.getSkillValue();
		}
		public static function calcAttackPlus(job:String,d:BuffData):int{
			var val:int = Math.floor(Math.floor(parseInt(d.elf_ene.text)/7)+3)
			* (100 + d.master_aplus1.getSkillValue() + d.master_aplus2.getSkillValue())/100;
			if(job=="ナイト")return val*1.1;
			else return val;
		}
		public static function calcAttackPlus_Time(d:BuffData):int{
			return 60 + (parseInt(d.master_aplus2.getValue()) * 4);
		}
		public static function calcGuardPlus(job:String,d:BuffData):int{
			var val:int = Math.floor(Math.floor(parseInt(d.elf_ene.text)/8)+2)
			* (100 + d.master_gplus1.getSkillValue() + d.master_gplus2.getSkillValue())/100;
			if(job=="ナイト")return val*1.1;
			else return val;
		}
		public static function calcGuardPlus_Time(d:BuffData):int{
			return 60 + (parseInt(d.master_gplus2.getValue()) * 4);
		}
		public static function calcBless(d:BuffData):int{
			return Math.floor(parseInt(d.elf_ene.text)/100)+d.master_bless1.getSkillValue();
		}
		public static function calcBloodAttack(d:BuffData):int{
			return 10 + d.master_ba1.getSkillValue();
		}
		public static function calcCriticalPlus(d:BuffData):int{
			return Math.floor(parseInt(d.darkload_ene.text)/30)
				+ Math.floor(parseInt(d.darkload_rec.text)/25)
				+ Math.floor(d.master_cplus1.getSkillValue());
		}
		public static function calcCriticalPlus_Time(d:BuffData):int{
			return 60 + Math.floor(parseInt(d.darkload_ene.text)/10)
				+ d.master_cplus2.getSkillValue();
		}
		public static function calcCriticalPlus_Cri(d:BuffData):int{
			return d.master_cplus3.getSkillValue();
		}
		public static function calcCriticalPlus_Exd(d:BuffData):int{
			return d.master_cplus4.getSkillValue();
		}
		public static function calcInnovation(d:BuffData):int{
			return Math.floor(parseInt(d.summoner_ene.text)/90) + 20;
		}
		public static function calcInnovation_Fixed(d:BuffData):int{
			return d.master_iv1.getSkillValue();
		}
		public static function calcWeakness(d:BuffData):int{
			return Math.floor(parseInt(d.summoner_ene.text)/65) + 7;
		}
		public static function calcWeakness_Fixed(d:BuffData):int{
			return d.master_wn1.getSkillValue();
		}
		public static function calcBlind(d:BuffData):int{
			return 0;
		}
		public static function calcConcentration(d:BuffData,ene:int):int{
			var master:int = d.master_con1.getSkillValue();
			var con:int = 2 + Math.floor(ene/10);
			if(master>0)con = 10 + Math.floor(ene/50) + master;
			return con;
		}
		public static function calcConcentration_Defense(d:BuffData):int{
			return d.master_con2.getSkillValue();
		}
		public static function calcHighTension(d:BuffData,ene:int):int{
			var ht:int = 16 + Math.ceil(ene/10) + d.master_ht1.getSkillValue();
			return  ht;//max200?
		}
		public static function calcClingBlow(d:BuffData):int{
			return 10 + d.master_aminus1.getSkillValue();
		}
		public static function calcBeastUpper(d:BuffData):int{
			return 10 + d.master_gminus1.getSkillValue();
		}
	}
}