package org.mudamage.mud8.client.mud.calc;

import org.mudamage.mud8.client.mud.form.static_data.StatusStaticData;

/**
 * ステータスなどの計算を行います。
 * @author SINLION
 *
 */
public class MUDamageBaseCalc {
	public static double calcHP(int job,int lv,int ori_vit,int add_vit){

		/*
		 * HPの計算 
		 */
		double init_hp = StatusStaticData.getInitHP(job);
		double init_vit = StatusStaticData.getInitStatus(job, StatusStaticData.VIT);
		double vit_inc = StatusStaticData.getHPVitInc(job);
		double lv_inc = StatusStaticData.getHPLVInc(job);
		
		double bhp = Math.floor(
				init_hp + (ori_vit - init_vit) * vit_inc + (lv - 1) * lv_inc
				);
		double hp = bhp + Math.floor(
				add_vit * vit_inc
				);
		// TODO
		// %の部分
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
