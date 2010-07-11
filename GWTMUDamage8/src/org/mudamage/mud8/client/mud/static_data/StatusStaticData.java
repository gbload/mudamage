package org.mudamage.mud8.client.mud.static_data;
/**
 * ステータスに関するデータ
 * @author SINLION
 *
 */
public class StatusStaticData {
	/*
	 * 表現
	 */
	public static final int STR = 0;
	public static final int AGI = 1;
	public static final int VIT = 2;
	public static final int ENE = 3;
	public static final int REC = 4;
	/*
	 * データ
	 */
	public static final int[][] init_status = {
		{28,20,25,10,0},
		{18,18,15,30,0},
		{22,25,20,15,0},
		{26,26,26,26,0},
		{26,20,20,15,25},
		{21,21,18,23,0}
	};
	
	public static final int[] init_hp = {110,60,80,110,90,70};
	public static final double[] hp_lv_inc = {2,1,1,1,1.5,1};
	public static final int[] hp_vit_inc = {3,2,2,2,2,2};
	
	public static final int[] init_mana = {20,60,30,60,40,40};
	public static final double[] mana_lv_inc = {0.5,2,1.5,1,1.5,1.5};
	public static final double[] mana_ene_inc = {1,2,1.5,2,1.5,1.5};
	
	public static final double[][] ag_inc = {
		{0.15,0.2,0.3,1.0,0},
		{0.2,0.4,0.3,0.2,0},
		{0.3,0.2,0.3,0.2,0},
		{0.2,0.25,0.3,0.15,0},
		{0.3,0.2,0.1,0.15,0.3},
		{0.2,0.25,0.3,0.15,0}
	};
	
	public static final int[] speed_inc = {15,0,50,15,10,0};
	public static final int[] magic_speed_inc = {0,10,0,20,0,20};
	
	public static final double[] pvp_hit_inc = {4.5,4,0.6,3.5,4,3.5};
	
	public static final int[] def_inc = {3,4,10,4,7,3};
	public static final int[] avoid_inc = {3,3,4,3,7,4};
	public static final int[] pvp_avoid_inc = {2,4,10,4,2,2};
	
	/*
	 * メソッド
	 */
	public static int getInitStatus(int job,int status){return init_status[job][status];};
		
	public static int getInitHP(int job){return init_hp[job];}
	public static double getHPLVInc(int job){return hp_lv_inc[job];}
	public static int getHPVitInc(int job){return hp_vit_inc[job];}
	
	public static int getInitMana(int job){return init_mana[job];}
	public static double getManaLVInc(int job){return mana_lv_inc[job];}
	public static double getManaEneInc(int job){return mana_ene_inc[job];}
	
	public static double getAgInc(int job,int status){return ag_inc[job][status];};
	
	public static int getSpeedInc(int job){return speed_inc[job];}
	public static int getMagicSpeedInc(int job){return magic_speed_inc[job];}
	public static double getPvPHitInc(int job){return pvp_hit_inc[job];}
	public static int getDefInc(int job){return def_inc[job];}
	public static int getAvoidInc(int job){return avoid_inc[job];}
	public static int getPvPAvoidInc(int job){return pvp_avoid_inc[job];}
}
