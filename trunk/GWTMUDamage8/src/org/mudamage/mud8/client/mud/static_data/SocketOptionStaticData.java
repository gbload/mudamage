package org.mudamage.mud8.client.mud.static_data;

public class SocketOptionStaticData {
	public static final Integer NONE = -1;
	/*
	 * 定数
	 */
	/*
	 * 攻撃
	 */
	// 炎
	public static final Integer ATTACK_LV = 0;
	public static final Integer MAX = 1;
	public static final Integer MIN = 2;
	public static final Integer ATTACK = 3;
	public static final Integer SPEED = 4;
	public static final Integer AG_DEC = 5;
	// 稲妻
	public static final Integer EXD_DAMAGE = 10;
	public static final Integer EXD_PER = 11;
	public static final Integer CRI_DAMAGE = 12;
	public static final Integer CRI_PER = 13;
	// 氷
	public static final Integer SKILL = 20;
	public static final Integer GET_HP = 21;
	public static final Integer GET_MANA = 22;
	public static final Integer HIT = 23;
	public static final Integer ITEM_ENDURANCE = 24;
	/*
	 * 防御
	 */
	// 水
	public static final Integer DEF = 30;
	public static final Integer SHIELD = 31;
	public static final Integer DEC = 32;
	public static final Integer REFLECTION = 33;
	public static final Integer AVOID = 34;
	// 風
	public static final Integer HP = 40;
	public static final Integer MANA = 41;
	public static final Integer AG_MAX = 42;
	public static final Integer AH = 43;
	public static final Integer AM = 44;
	public static final Integer AG_AUTO = 45;
	// 地
	public static final Integer VIT = 50;
	/*
	 * 定数　名前
	 */
	// 炎
	public static final String[] ATTACK_LV_NAME = {"攻撃魔力lv",ATTACK_LV.toString()};
	public static final String[] MAX_NAME = {"最大攻撃魔力",MAX.toString()};
	public static final String[] MIN_NAME = {"最小攻撃魔力",MIN.toString()};
	public static final String[] ATTACK_NAME = {"攻撃魔力増加",ATTACK.toString()};
	public static final String[] SPEED_NAME = {"速度増加",SPEED.toString()};
	public static final String[] AG_DEC_NAME = {"AG消費減少",AG_DEC.toString()};
	// 稲妻
	public static final String[] EXD_DAMAGE_NAME = {"EXD増加",EXD_DAMAGE.toString()};
	public static final String[] EXD_PER_NAME = {"EXD確率",EXD_PER.toString()};
	public static final String[] CRI_DAMAGE_NAME = {"クリ増加",CRI_DAMAGE.toString()};
	public static final String[] CRI_PER_NAME = {"クリ確率",CRI_PER.toString()};
	// 氷
	public static final String[] SKILL_NAME = {"スキル増加",SKILL.toString()};
	public static final String[] GET_HP_NAME = {"獲得生命",GET_HP.toString()};
	public static final String[] GET_MANA_NAME = {"獲得マナ",GET_MANA.toString()};
	public static final String[] HIT_NAME = {"攻撃成功率",HIT.toString()};
	public static final String[] ITEM_ENDURANCE_NAME = {"アイテム耐久",ITEM_ENDURANCE.toString()};
	// 水
	public static final String[] DEF_NAME = {"防御力増加",DEF.toString()};
	public static final String[] SHIELD_NAME = {"盾装備時増加",SHIELD.toString()};
	public static final String[] DEC_NAME = {"ダメ減",DEC.toString()};
	public static final String[] REFLECTION_NAME = {"ダメ反",REFLECTION.toString()};
	public static final String[] AVOID_NAME = {"防御成功",AVOID.toString()};
	// 風
	public static final String[] HP_NAME = {"最大生命増加",HP.toString()};
	public static final String[] MANA_NAME = {"最大マナ増加",MANA.toString()};
	public static final String[] AG_MAX_NAME = {"最大AG増加",AG_MAX.toString()};
	public static final String[] AH_NAME = {"自動生命回復",AH.toString()};
	public static final String[] AM_NAME = {"自動マナ回復",AM.toString()};
	public static final String[] AG_AUTO_NAME = {"自動AG回復",AG_AUTO.toString()};
	// 地
	public static final String[] VIT_NAME = {"体力増加",VIT.toString()};
	/*
	 * 定数　値
	 */
	// 炎
	public static final Integer[][] fire_values = {
		
	};
	// 稲妻
	public static final Integer[][] lightning_values = {
		
	};
	// 氷
	public static final Integer[][] ice_values = {
		
	};
	// 水
	public static final Integer[][] water_values = {
		
	};
	// 風
	public static final Integer[][] wind_values = {
		
	};
	// 地
	public static final Integer[][] earth_values = {
		
	};

}
