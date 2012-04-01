package PVP {
	import mx.controls.*;
	import mx.containers.*;
	import mx.core.*;
	import mx.collections.*;
	import mx.events.*;
	import mx.formatters.*;
	import flash.events.*;

	import Form.MUDamage.SubForm.*;
	import Calc.*;
	import Data.Database.*;
	import Data.Database.MLV.*;
	/**
	 * 対人ダメージ計算
	 */
	public class PVPDamageCalculator extends DamageCalculator{
		protected var pvp_type:int;
		protected var f2:Object;
		protected var i2:ItemData;
		protected var c2:CharacterData;
		protected var a2:AttackData;
		private var muc2:Object
		/**
		 * コンストラクタ
		 */
		public function PVPDamageCalculator(muc:Object,muc2:Object,pvp_type:int){
			super(muc);
			this.pvp_type = pvp_type;
			this.f2 = muc2.f;
			this.i2 = muc2.i;
			this.c2 = muc2.c;
			this.a2 = muc2.a;
			this.muc2 = muc2;
		}
		/**
		 * 対人攻撃力
		 */
		override protected function calcPVPAttack():int{
			var d:int = 0;
		    //[PVP]ダメージ増加
		    if(f.right.op380)d += 200;
		    if(f.left.op380)d += 200;
		    //マスタースキル武器強化
		    if(i.getItemData(f.right,"type")=="両手剣"){
			    d += f.master_skill.getSkillValue("two_hand_sword_mastery");
		    }else if(i.getItemData(f.right,"type")=="ボウガン"){
			    d += f.master_skill.getSkillValue("crossbow_mastery");
		    }else if(i.getItemData(f.right,"type")=="セプター"){
			    d += f.master_skill.getSkillValue("scepter_mastery");
		    }
		    return d;
		}
		/**
		 * 対人魔力
		 */
		override protected function calcPVPMagic():int{
			var d:int = 0;
		    //[PVP]ダメージ増加
		    if(f.right.op380)d += 200;
		    if(f.left.op380)d += 200;
		    //マスタースキル武器強化
		    if(i.getItemData(f.right,"type")=="両手杖"){
			    d += f.master_skill.getSkillValue("two_hand_staff_mastery");
		    }else if(i.getItemData(f.right,"type")=="ロッド"){
			    d += f.master_skill.getSkillValue("rod_mastery");
		    }
		    return d;
		}
		/**
		 * 最低ダメ判定前の防御計算を行ないます。
		 */
		override protected function calcGuard1(s:int):int{
			var def:int = c2.def;
			var def_tmp:int = def;
			/*
			 * 固定
			 */
		    if(f.support.iv_check.selected)// インナーベーション
		    	def -= SupportSkillCalculator.calcInnovation_Fixed(f.support);
		    /*
		     * 割合
		     */
			def -= Math.floor(def_tmp * c.support_inner/100);// インナーベーション
			def -= Math.floor(def_tmp * c.support_ba/100);// 血戦
			if(f.support.aminus_check.selected)// クリングブロー
				def -= Math.floor(def_tmp * SupportSkillCalculator.calcClingBlow(f.support)/100);
		    if(def < 0)def = 0;
			//引き算
			s = s + (def_tmp - def);//(モンス攻撃 - DEF)
			// ダメ減関連
			s = calcGuardCommon1(s,muc2);
			return s;
		}
		/**
		 * 最低ダメ判定前の防御計算を行ないます。
		 */
		override protected function calcGuard1Darkspirit(s:int):int{
			var def:int = c2.def;
			var def_tmp:int = def;
			/*
			 * 固定
			 */
		    if(f.support.iv_check.selected)// インナーベーション
		    	def -= SupportSkillCalculator.calcInnovation_Fixed(f.support);
		    /*
		     * 割合
		     */
			def -= Math.floor(def_tmp * c.support_inner/100);// インナーベーション
			def -= Math.floor(def_tmp * c.support_ba/100);// 血戦
			if(f.support.aminus_check.selected)// クリングブロー
				def -= Math.floor(def_tmp * SupportSkillCalculator.calcClingBlow(f.support)/100);
		    if(def < 0)def = 0;
			//引き算
			s = s + (def_tmp - def);//(モンス攻撃 - DEF)
			// ダメ減関連
			s = calcGuardCommon1(s,muc2);
			return s;
		}
		/**
		 * 最低ダメ判定後の防御計算を行ないます。
		 */
		override protected function calcGuard2(s:int):int{
			s = calcGuardCommon2(s,muc2);
			return s;
		}
		/**
		 * 最終ダメ後の防御計算を行ないます。
		 */
		override protected function calcGuard3(s:int):int{
			s = calcGuardCommon3(s,muc2);
			if(pvp_type==1){
				s = Math.floor(s*0.4);
			}
			return s;
		}
	}
}