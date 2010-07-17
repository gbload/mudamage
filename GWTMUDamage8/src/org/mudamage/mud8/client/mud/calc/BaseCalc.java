package org.mudamage.mud8.client.mud.calc;

import org.mudamage.mud8.client.mud.calc.data.CalcData;
import org.mudamage.mud8.client.mud.static_data.ExOptionStaticData;
import org.mudamage.mud8.client.mud.static_data.PetStaticData;
import org.mudamage.mud8.client.mud.static_data.StatusStaticData;

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
		hp += Math.floor(bhp * c.sl/100);
		hp += Math.floor(bhp * 4/100)*c.getGuardExops(ExOptionStaticData.HP);
		//hp += Math.floor(bhp*d.support_sl/100);//スウェルライフ
		//hp += Math.floor(bhp*4/100)*exop_hp;//EXOP生命増加
		//ソケットOP生命増加
		// 引き算の部分
		//バーサーカーのHP減少 基本HP * [40 - 純ene/60]%
		// 足し算の部分
		//MLV
		//セットOPの生命
		//エンチャントOPの生命
		//ボーナスソケットの生命
		//羽の生命増加
		//天使の生命増加
		//守護精霊の生命増加
		//かぼちゃ、課金などでのHP増加
		//380OPの生命増加
		//黄金のフェンリルの生命増加
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
}