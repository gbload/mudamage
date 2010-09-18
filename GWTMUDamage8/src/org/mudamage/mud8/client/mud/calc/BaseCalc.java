package org.mudamage.mud8.client.mud.calc;

import org.mudamage.mud8.client.mud.calc.data.CalcData;
import org.mudamage.mud8.client.mud.static_data.EnchantOptionStaticData;
import org.mudamage.mud8.client.mud.static_data.ExOptionStaticData;
import org.mudamage.mud8.client.mud.static_data.JobStaticData;
import org.mudamage.mud8.client.mud.static_data.PetStaticData;
import org.mudamage.mud8.client.mud.static_data.SetOptionStaticData;
import org.mudamage.mud8.client.mud.static_data.SocketOptionStaticData;
import org.mudamage.mud8.client.mud.static_data.StatusStaticData;
import org.mudamage.mud8.client.mud.static_data.WingStaticData;

/**
 * ステータスなどの計算を行います。
 * @author SINLION
 *
 */
public class BaseCalc {
	/**
	 * ステータスの計算
	 * @param c
	 * @return
	 */
	public static int calcStatus(CalcData c){
		// 基本ステータス
		c.str = c.ori_str;
		c.agi = c.ori_agi;
		c.vit = c.ori_vit;
		c.ene = c.ori_ene;
		c.rec = c.ori_rec;
		/*
		 * 装備類
		 */
		// 防具
		for(int i=0;i<c.equips.length;i++)
			c.vit += c.equips[i].vit;
		// 右手
		c.str += c.right.str;
		c.agi += c.right.agi;
		c.ene += c.right.ene;
		// 左手
		c.str += c.left.str;
		c.agi += c.left.agi;
		c.ene += c.left.ene;
		// ネック
		c.str += c.neck.str;
		c.agi += c.neck.agi;
		c.vit += c.neck.vit;
		c.ene += c.neck.ene;
		// リング1
		c.str += c.ring1.str;
		c.agi += c.ring1.agi;
		c.vit += c.ring1.vit;
		c.ene += c.ring1.ene;
		// リング2
		c.str += c.ring2.str;
		c.agi += c.ring2.agi;
		c.vit += c.ring2.vit;
		c.ene += c.ring2.ene;
		/*
		 * セットオプション
		 */
		c.str += c.setop[SetOptionStaticData.STR];
		c.agi += c.setop[SetOptionStaticData.AGI];
		c.vit += c.setop[SetOptionStaticData.VIT];
		c.ene += c.setop[SetOptionStaticData.ENE];
		c.rec += c.setop[SetOptionStaticData.REC];
		/*
		 * ソケットオプション
		 */
		for(int i=0;i<c.equips.length;i++)
			c.vit += c.equips[i].soop[SocketOptionStaticData.VIT];
		/*
		 * 羽
		 */
		c.rec += c.wing_cop[WingStaticData.COP_REC];
		/*
		 * TODO 課金アイテム
		 */
		
		return 0;
	}
	/**
	 * HPの計算
	 * @param c
	 * @return hp
	 */
	public static int calcHP(CalcData c){
		int init_hp = StatusStaticData.getInitHP(c.job);
		int init_vit = StatusStaticData.getInitStatus(c.job, StatusStaticData.VIT);
		int vit_inc = StatusStaticData.getHPVitInc(c.job);
		double lv_inc = StatusStaticData.getHPLVInc(c.job);
		// ベース計算
		int bhp = (int)Math.floor(
				init_hp + (c.ori_vit - init_vit) * vit_inc + (c.lv - 1) * lv_inc
				);
		int hp = bhp + (int)Math.floor(
				c.add_vit * vit_inc
				);
		// TODO
		// %の部分
		hp += Math.floor(bhp * c.sl/100); //スウェルライフ
		hp += Math.floor(bhp * 4/100)*c.getGuardExops(ExOptionStaticData.HP); // EXOP生命増加
		hp += Math.floor(bhp * c.getSocketOptions(SocketOptionStaticData.HP)); // ソケットOP生命増加
		// 引き算の部分
		if(c.berserker)hp -= Math.floor(bhp * (40 - c.ori_ene/60)); //バーサーカーのHP減少 基本HP * [40 - 純ene/60]%
		// 足し算の部分
		//MLV
		hp += c.setop[SetOptionStaticData.HP];//セットOPの生命
		hp += c.getEnchantOptions(EnchantOptionStaticData.HP);//エンチャントOPの生命
		//ボーナスソケットの生命
		hp += c.wing_cop[WingStaticData.COP_HP];//羽の生命増加
		if(c.pet == PetStaticData.ANGEL)hp += 50;//天使の生命増加
		if(c.pet == PetStaticData.SPIRIT)hp += 50;//守護精霊の生命増加
		//かぼちゃ、課金などでのHP増加
		//380OPの生命増加
		//黄金のフェンリルの生命増加
		
		c.hp = hp;
		return hp;
	}
	/**
	 * SDの計算
	 * @param c
	 * @return sd
	 */
	public static int calcSD(CalcData c){
		// TODO SDの計算
		return 0;
	}
	/**
	 * マナの計算
	 * @param c
	 * @return mana
	 */
	public static int calcMana(CalcData c){
		int init_mana = StatusStaticData.getInitMana(c.job);
		int init_ene = StatusStaticData.getInitStatus(c.job, StatusStaticData.ENE);
		double ene_inc = StatusStaticData.getManaEneInc(c.job);
		double lv_inc = StatusStaticData.getManaLVInc(c.job);
		// ベース計算
		int bmana = (int)Math.floor(
				init_mana + (c.ori_ene - init_ene) * ene_inc + (c.lv - 1) * lv_inc
		);
		int mana = bmana + (int)Math.floor(
				c.add_ene * ene_inc
		);
		// TODO マナ増加オプションの計算
		mana += Math.floor(bmana * 4/100)*c.getGuardExops(ExOptionStaticData.MANA);//EXOP
		
		return mana;
	}
	/**
	 * AGの計算
	 * @param c
	 * @return ag
	 */
	public static int calcAG(CalcData c){
		double str_inc = StatusStaticData.getAgInc(c.job, StatusStaticData.STR);
		double agi_inc = StatusStaticData.getAgInc(c.job, StatusStaticData.AGI);
		double vit_inc = StatusStaticData.getAgInc(c.job, StatusStaticData.VIT);
		double ene_inc = StatusStaticData.getAgInc(c.job, StatusStaticData.ENE);
		double rec_inc = StatusStaticData.getAgInc(c.job, StatusStaticData.REC);
		
		int ag = (int)Math.floor(c.str*str_inc + c.agi*agi_inc 
			+ c.vit*vit_inc + c.ene*ene_inc + c.rec*rec_inc);
		//TODO AG増加計算
		return ag;
	}
	/**
	 * DEFの計算
	 * @param c
	 * @return def
	 */
	public static int calcDef(CalcData c){
		// 敏捷によるDEF増加
		int def = (int)Math.floor(c.agi/StatusStaticData.getDefInc(c.job));
		// 防具によるDEF増加
		for(int i=0;i<c.equips.length;i++)
			def += c.equips[i].def;
		// 羽によるDEF増加
		def += c.wing_def;
		
		// 防具統一ボーナス
		int plus = 999;
		if(true){// TODO 統一されてたら
			for(int i=0;i<c.equips.length - 1;i++)// 盾除く
				if(plus > c.equips[i].plus)
					plus = c.equips[i].plus;
			plus -= 9;
			if(plus > 0)
				def += (int)Math.floor(def * (plus*5));
		}
		
		// TODO DEF%増加系統
		// TODO DEF増加系統
		
		return def;
	}
	/**
	 * 速度の計算
	 * @param c
	 * @return speed
	 */
	public static int calcSpeed(CalcData c){
		int agi_inc = StatusStaticData.getSpeedInc(c.job);
		return baseSpeed(c,agi_inc);
	}
	/**
	 * 魔法速度の計算
	 * @param c
	 * @return magic_speed
	 */
	public static int calcMagicSpeed(CalcData c){
		int agi_inc = StatusStaticData.getMagicSpeedInc(c.job);
		return baseSpeed(c,agi_inc);
	}
	/**
	 * 速度の基本計算
	 * @param c
	 * @param agi_inc
	 * @return speed
	 */
	private static int baseSpeed(CalcData c,int agi_inc){
		if(agi_inc==0)return 0;
		// 敏捷による増加
		int speed = (int)Math.floor(c.agi/agi_inc);
		// 武器による増加
		if(c.isLeft())
			speed += (int)Math.floor((c.right.speed+c.left.speed)/2);
		else
			speed += (int)Math.floor(c.right.speed);
		// 手による増加
		speed += c.glove.speed;
		
		// 速度増加系統
		// EXOPによる増加
		speed += c.getAttackExops(ExOptionStaticData.SPEED);
		// デーモンによる増加
		if(c.pet == PetStaticData.DAEMON)speed += 10;
		// ディノラント速度OPによる増加
		if(c.pet == PetStaticData.DINO)
			if(c.petsub1 == PetStaticData.DINO_SPEED || c.petsub2 == PetStaticData.DINO_SPEED)
				speed += 5;
		// TODO 速度計算
		
		return speed;
	}
	/**
	 * 攻撃成功率の計算
	 * @param c
	 * @return hit
	 */
	public static int calcHit(CalcData c){
		int hit = (int)(Math.floor(c.lv*5));
		// ステータスによる増加
		if(c.job.equals(JobStaticData.DARKLOAD))
			hit = (int)(Math.floor(c.str/6) + Math.floor(c.agi*2.5)+Math.floor(c.rec/10));
		else
			hit = (int)(Math.floor(c.str/4) + Math.floor(c.agi*1.5));
		// TODO その他OPによる増加
		
		return hit;
	}
	/**
	 * 対人攻撃成功率の計算
	 * @param c
	 * @return pvp_hit
	 */
	public static int calcPvPHit(CalcData c){
		double inc = StatusStaticData.getPvPHitInc(c.job);
		// TODO 対人攻撃成功率計算
		int pvphit = (int)(Math.floor(0));
		
		return pvphit;
	}
	/**
	 * 防御成功率の計算
	 * @param c
	 * @return avoid
	 */
	public static int calcAvoid(CalcData c){
		int agi_inc = StatusStaticData.getAvoidInc(c.job);
		
		int avoid = (int)(Math.floor(c.agi/agi_inc));
		// TODO 防御成功率計算
		
		return avoid;
	}
	/**
	 * 対人防御成功率の計算
	 * @param c
	 * @return pvp_avoid
	 */
	public static int calcPvPAvoid(CalcData c){
		int agi_inc = StatusStaticData.getPvPAvoidInc(c.job);
		// TODO 対人防御成功率計算
		int pvpavoid = (int)(Math.floor(0));
		
		return pvpavoid;
	}
	/**
	 * 最小攻撃力の計算
	 * @param c
	 * @return min_attack
	 */
	public static int calcMinAttack(CalcData c){
		// TODO 最小攻撃力計算
		return 0;
	}
	/**
	 * 最大攻撃力の計算
	 * @param c
	 * @return max_attack
	 */
	public static int calcMaxAttack(CalcData c){
		// TODO 最大攻撃力計算
		return 0;
	}
	/**
	 * 攻撃力の基本計算
	 * @param c
	 * @return attack
	 */
	private static int baseAttack(CalcData c){
		// TODO 攻撃力計算
		return 0;
	}
	/**
	 * 最小魔力の計算
	 * @param c
	 * @return min_magic
	 */
	public static int calcMinMagic(CalcData c){
		// TODO 最小魔力計算
		return 0;
	}
	/**
	 * 最大魔力の計算
	 * @param c
	 * @return max_magic
	 */
	public static int calcMaxMagic(CalcData c){
		// TODO 最大魔力計算
		return 0;
	}
	/**
	 * 魔力の基本計算
	 * @param c
	 * @return magic
	 */
	private static int baseMagic(CalcData c){
		// TODO 魔力計算
		return 0;
	}
}
