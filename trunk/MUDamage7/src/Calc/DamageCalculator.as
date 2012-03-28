package Calc {
	import mx.controls.*;
	import mx.containers.*;
	import mx.core.*;
	import mx.collections.*;
	import mx.events.*;
	import mx.formatters.*;
	import flash.events.*;

	import Form.MUDamage.SubForm.*;
	import Data.Database.*;
	import Data.Database.MLV.*;
	/**
	 * 対人ダメージ計算
	 */
	public class DamageCalculator {
		protected var f:Object;
		protected var i:ItemData;
		protected var c:CharacterData;
		protected var a:AttackData;
		protected var m:Object;

		protected static var mk:Object = D.getKey("monster");
		/**
		 * コンストラクタ
		 */
		public function DamageCalculator(muc:Object){
			this.f = muc.f;
			this.i = muc.i;
			this.c = muc.c;
			this.a = muc.a;
		}
		/**
		 * モンスター登録
		 */
		public function setMonster(m:Object):void{
			this.m = m;
		}
		/**
		 * 攻撃ダメージを計算します。
		 */
		public function calcDamage(
				skill:Object,
				d:int,
				cri:Boolean=false,
				exd:Boolean=false,
				min:Boolean=false):int{
			
			var d2:int = 0;
		    //[セットOP]両手武器装備時ダメージ増加%用
		    if(i.setop_hands){
				d2 = calcGuard1(d);
			    d2 = Math.max(d2,Math.floor(f.status.lv/10));//モンスDEF
			    // 両手武器装備時ダメージ増加%用
			    d2 = Math.floor(d2 * i.setop_hands / 100);
		    }
			
		    //追加攻撃力(A+等)
		    d += a.add;
		    /* 
		     * 固定ダメージ前計算
		     */
			d = calcGuard1(d);
			/*
			 * 固定ダメージ判断
			 */
		    d = Math.max(d,Math.floor(f.status.lv/10));//モンスDEF
		    
		    //[セットOP]両手武器装備時ダメージ増加%
		    if(i.setop_hands)d += d2;
		    //[課金アイテム]クリダメ増加%
		    if(cri)d += Math.floor(d * i.etc_cri / 100);
		    //[課金アイテム]EXDダメ増加%
		    if(exd)d += Math.floor(d * i.etc_exd / 100);
	
		    if(f.pet.item=="ディノラント")d += Math.floor(d*15/100);//ディノラント
		    if(f.pet.item=="サタン")d += Math.floor(d*30/100);//サタン
		    
		    d += Math.floor(d * i.getSpec(f.wing,"inc")/100);//羽
		    
		    //スキル%
		    if(skill.skill[a.key.name] == "プラズマストーム"){
		    	d += Math.floor(d * 1.2);
			}else if(f.job == "ナイト"){//ナイトのとき
		    	d += Math.floor(d * Math.floor((100 + c.ene/10))/100);//スキル%
		    }else if(f.job == "ダークロード"){//ダークロードのとき
		    	if(skill.skill[a.key.name] == "カオティックディセイアー") d += Math.floor(d * Math.floor((100 + c.ene/25))/100);//スキル%
		    	else d += Math.floor(d * Math.floor((100 + c.ene/20))/100);//スキル%
		    }else if(f.job == "エルフ"){//エルフのとき TODO 乱れ打ちなどを特殊スキルに
		    	d += 0;//乱れ打ちとか　スキル%なし
		    }else if(f.job == "レイジファイター"){//レイジファイターのとき
		    	if(skill.skill[a.key.special] == "近接")//武器スキル、チェーンドライブ
		    		d = Math.floor(d * Math.floor((50 + c.vit/10))/100);//スキル%
		    	else if(skill.skill[a.key.special] == "広域")//ダークサイド
		    		d = Math.floor(d * Math.floor((100 + c.agi/8 + c.ene/10))/100);//スキル%
		    	else if(skill.skill[a.key.special] == "連続")//ドラゴンロアー
		    		d = Math.floor(d * Math.floor((50 + c.ene/10))/100);//スキル%
		    }else{
		    	d += d;//スキル200%
		    }
		    
		    /*
		     * 固定ダメージ後計算
		     */
		    d = calcGuard2(d);
		    
		    //[セットOP]ダメージ増加
		    d += i.setop_damage;
		    //コンボスキル
		    if(skill.skill[a.key.special] == "コンボ"){
		    	d += Math.floor((c.str + c.agi + c.ene)/2 * (100 + f.master_skill.getSkillValue("combo")) / 100);
		    }
		    //[PVP]
		    d += calcPVPAttack();
		    
		    if(f.pet.item=="フェンリル" && f.pet.sub1=="破壊")d += Math.floor(d*10/100);//フェンリル
		    /*
		     * 最終ダメージ後計算
		     */
		    d = calcGuard3(d);
		    
		    return d;
		}
		/**
		 * 魔法ダメージを計算します。
		 */
		public function calcMagicDamage(
				skill:Object,
				d:int,
				cri:Boolean=false,
				exd:Boolean=false,
				min:Boolean=false):int{
		    //ダメージ計算===========================
			d = calcGuard1(d);
			d = Math.max(d,Math.floor(f.status.lv/10));//max[攻撃力-モンス,lv/10]
			
			if(f.pet.item=="ディノラント")d += Math.floor(d*15/100);//ディノラント
			if(f.pet.item=="サタン")d += Math.floor(d*30/100);//サタン
			
			d += Math.floor(d*i.getSpec(f.wing,"inc")/100);//羽
			
			//[課金アイテム]クリダメ増加%
			if(cri)d += Math.floor(d * i.etc_cri / 100);
			//[課金アイテム]EXDダメ増加%
			if(exd)d += Math.floor(d * i.etc_exd / 100);
			
			//[固定ダメージ]
			d = calcGuard2(d);
			
			//[セットOP]ダメージ増加
			d += i.setop_damage;
		    //[PVP]
		    d += calcPVPMagic();
		    
			if(f.pet.item=="フェンリル" && f.pet.sub1=="破壊")d += Math.floor(d*10/100);//フェンリル
		    /*
		     * 最終ダメージ後計算
		     */
		    d = calcGuard3(d);
			
			return d;			
		}
		public function calcDarkSpiritDamage(
				skill:Object,
				d:int,
				cri:Boolean=false,
				exd:Boolean=false):int{
			d = calcGuard1Darkspirit(d);
			d = Math.max(d,Math.floor(f.left.darkspirit/10));
			d = calcGuard2(d);
			return d;
		}
		/**
		 * 最低ダメ判定前の防御計算を行ないます。
		 */
		protected function calcGuard1(s:int):int{
			var def:int = m[mk.def];
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
			s = s - def;//(モンス攻撃 - DEF)
			//カスリダメージ
			if(c.hit < m[mk.avoid])
				s = Math.floor(s*0.3);
			return s;
		}
		/**
		 * 最低ダメ判定前の防御計算を行ないます。
		 */
		protected function calcGuard1Darkspirit(s:int):int{
			var def:int = m[mk.def];
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
			s = s - def;//(モンス攻撃 - DEF)
			//カスリダメージ
			if(c.darkspirit_hit < m[mk.avoid])
				s = Math.floor(s*0.3);
			return s;
		}
		/**
		 * 最低ダメ判定後の防御計算を行ないます。
		 */
		protected function calcGuard2(s:int):int{
			return s;
		}
		/**
		 * 最終ダメ後の防御計算を行ないます。
		 */
		protected function calcGuard3(s:int):int{
			return s;
		}
		/**
		 * 対人攻撃力
		 */
		protected function calcPVPAttack():int{
			return 0;
		}
		/**
		 * 対人魔力
		 */
		protected function calcPVPMagic():int{
			return 0;
		}
		/**
		 * 被ダメージを計算します。
		 */
		public function calcSuffer(s:int):int{
			s = calcGuardCommon1(s,{f:f,i:i,c:c});
			s = calcAvoidance(s);
		    s = Math.max(s,Math.floor(m[mk.lv]/10));// 固定ダメ計算
			s = calcGuardCommon2(s,{f:f,i:i,c:c});
			s = calcGuardCommon3(s,{f:f,i:i,c:c});
			return s;
		}
		/**
		 * カスリダメージ計算
		 */
		protected function calcAvoidance(s:int):int{
			if(m[mk.hit] != 0 && c.avoid > m[mk.hit])
				s = Math.floor(s * 30/100);//30%
			
			return s;
		}
		/**
		 * 共通:固定ダメージ前計算
		 */
		protected function calcGuardCommon1(s:int,muc:Object):int{
			var f:Object = muc.f;
			var i:ItemData = muc.i;
			var c:CharacterData = muc.c;
			
			s = s - c.def/2;//(モンス攻撃 - DEF)
			
			/*
			 * 固定
			 */
		    if(f.support.wn_check.selected)//ウィークネス
		    	s -= SupportSkillCalculator.calcWeakness_Fixed(f.support);
		    /*
		     * 割合
		     */
			//モンスターの攻撃力低下
			s -= Math.floor(s * c.support_weak/100);//ウイークネス
			if(f.support.gminus_check.selected)// クリングブロー
				s -= Math.floor(s * SupportSkillCalculator.calcBeastUpper(f.support)/100);
			
			// ダメ減
			var dec:int = 0;
			for each(var exop:Object in i.exops)
				if(exop["ダメ減"])
					dec += 4;
			dec += i.getEnchantProtects("ダメ減");
			s -= Math.floor(s*dec/100);
			
			return s;
		}
		/**
		 * 共通:固定ダメージ後計算
		 */
		protected function calcGuardCommon2(s:int,muc:Object):int{
			var f:Object = muc.f;
			var i:ItemData = muc.i;
			var c:CharacterData = muc.c;
		
		    //天使の吸収
			if(f.pet.item == "守護天使")s = (s * 80 / 100);//20%吸収
			//守護精霊の吸収
			if(f.pet.item == "守護精霊")s = (s * 70 / 100);//30%吸収
			//ディノラントの吸収
			if(f.pet.item == "ディノラント"){
				if(f.pet.sub1 == "ダメージ吸収+5%" || f.pet.sub2 == "ダメージ吸収+5%")
					s = (s * 85 / 100);//15%吸収
				else s = (s * 90 / 100);//10%吸収
			}
			//ダークホースの吸収
			if(f.pet.item == "ダークホース")s = (s * (100 - Math.floor(15 + (f.pet.sub1_index+1)/2)) /100);// 15+Lv/2
			//羽の吸収
			s = (s * (100 - (i.getSpec(f.wing,"dec"))) / 100);
			//SBの減少
			s = s - Math.floor(s * c.support_sb/100);
			
			return s;
		}
		/**
		 * 共通:最終ダメージ後計算
		 */
		protected function calcGuardCommon3(s:int,muc:Object):int{
			var f:Object = muc.f;
			var i:ItemData = muc.i;
			var c:CharacterData = muc.c;
			//フェンリルの吸収
			if(f.pet.item == "フェンリル" && f.pet.sub1 == "守護")s = (s * 90/100);//10%吸収
			return s;
			
		}
		
	}
}