package org.mudamage.mud8.client.mud.calc;

import org.mudamage.mud8.client.mud.calc.data.CalcData;
import org.mudamage.mud8.client.mud.form.static_data.ExOptionStaticData;
import org.mudamage.mud8.client.mud.form.static_data.StatusStaticData;

/**
 * ステータスなどの計算を行います。
 * @author SINLION
 *
 */
public class BaseCalc {
	public static double calcHP(CalcData c){

		/*
		 * HPの計算 
		 */
		double init_hp = StatusStaticData.getInitHP(c.job);
		double init_vit = StatusStaticData.getInitStatus(c.job, StatusStaticData.VIT);
		double vit_inc = StatusStaticData.getHPVitInc(c.job);
		double lv_inc = StatusStaticData.getHPLVInc(c.job);
		
		double bhp = Math.floor(
				init_hp + (c.ori_vit - init_vit) * vit_inc + (c.lv - 1) * lv_inc
				);
		double hp = bhp + Math.floor(
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
	
}
