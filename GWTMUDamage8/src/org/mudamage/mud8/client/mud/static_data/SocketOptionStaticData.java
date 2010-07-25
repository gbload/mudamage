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
	 * 定数　属性
	 */
	public static final Integer FIRE = 0;
	public static final Integer LIGHTNING = 1;
	public static final Integer ICE = 2;
	public static final Integer WATER = 3;
	public static final Integer WIND = 4;
	public static final Integer EARTH = 5;
	/*
	 * 定数　名前
	 */
	// 炎
	public static final String ATTACK_LV_NAME = "攻撃魔力lv";
	public static final String MAX_NAME = "最大攻撃魔力";
	public static final String MIN_NAME = "最小攻撃魔力";
	public static final String ATTACK_NAME = "攻撃魔力増加";
	public static final String SPEED_NAME = "速度増加";
	public static final String AG_DEC_NAME = "AG消費減少";
	// 稲妻
	public static final String EXD_DAMAGE_NAME = "EXD増加";
	public static final String EXD_PER_NAME = "EXD確率";
	public static final String CRI_DAMAGE_NAME = "クリ増加";
	public static final String CRI_PER_NAME = "クリ確率";
	// 氷
	public static final String SKILL_NAME = "スキル増加";
	public static final String GET_HP_NAME = "獲得生命";
	public static final String GET_MANA_NAME = "獲得マナ";
	public static final String HIT_NAME = "攻撃成功率";
	public static final String ITEM_ENDURANCE_NAME = "アイテム耐久";
	// 水
	public static final String DEF_NAME = "防御力増加";
	public static final String SHIELD_NAME = "盾装備時増加";
	public static final String DEC_NAME = "ダメ減";
	public static final String REFLECTION_NAME = "ダメ反";
	public static final String AVOID_NAME = "防御成功";
	// 風
	public static final String HP_NAME = "最大生命増加";
	public static final String MANA_NAME = "最大マナ増加";
	public static final String AG_MAX_NAME = "最大AG増加";
	public static final String AH_NAME = "自動生命回復";
	public static final String AM_NAME = "自動マナ回復";
	public static final String AG_AUTO_NAME = "自動AG回復";
	// 地
	public static final String VIT_NAME = "体力増加";
	/*
	 * 定数　名前配列
	 */
	/**
	 * 武器ソケットOP
	 */
	public static final String[] attack_names = {
		ATTACK_LV_NAME,
		MAX_NAME,
		MIN_NAME,
		ATTACK_NAME,
		SPEED_NAME,
		AG_DEC_NAME,
		EXD_DAMAGE_NAME,
		EXD_PER_NAME,
		CRI_DAMAGE_NAME,
		CRI_PER_NAME,
		SKILL_NAME,
		GET_HP_NAME,
		GET_MANA_NAME,
		HIT_NAME,
		ITEM_ENDURANCE_NAME
	};
	public static final Integer[] attack_numbers = {
		ATTACK_LV,
		MAX,
		MIN,
		ATTACK,
		SPEED,
		AG_DEC,
		EXD_DAMAGE,
		EXD_PER,
		CRI_DAMAGE,
		CRI_PER,
		SKILL,
		GET_HP,
		GET_MANA,
		HIT,
		ITEM_ENDURANCE
	};
	/**
	 * 防具ソケットOP
	 */
	public static final String[] guard_names = {
		DEF_NAME,
		SHIELD_NAME,
		DEC_NAME,
		REFLECTION_NAME,
		AVOID_NAME,
		HP_NAME,
		MANA_NAME,
		AG_MAX_NAME,
		AH_NAME,
		AM_NAME,
		AG_AUTO_NAME,
		VIT_NAME,
	};
	public static final Integer[] guard_numbers = {
		DEF,
		SHIELD,
		DEC,
		REFLECTION,
		AVOID,
		HP,
		MANA,
		AG_MAX,
		AH,
		AM,
		AG_AUTO,
		VIT,
	};
	/*
	 * 定数　値
	 */
	// 炎
	public static final Integer[][] fire_values = {
		{20,19,18,17,16}, // 攻撃魔力LV
		{30,33,36,39,42}, // 最大攻撃魔力
		{20,22,24,26,28}, // 最小攻撃魔力
		{20,22,24,26,28}, // 攻撃魔力増加
		{7,8,9,10,11,12}, // 速度増加
		{40,41,42,43,44}, // AG消費減少
	};
	// 稲妻
	public static final Integer[][] lightning_values = {
		{15,16,18,19,21}, // EXD増加
		{10,11,12,13,14}, // EXD確率
		{30,33,36,39,42}, // クリ増加
		{8,9,10,11,12}, // クリ確率
	};
	// 氷
	public static final Integer[][] ice_values = {
		{37,40,43,46,49}, // スキル増加
		{8,7,6,5,4}, // 獲得生命
		{8,7,6,5,4}, // 獲得マナ
		{25,27,30,32,35}, // 攻撃成功率
		{30,31,32,33,34}, // アイテム耐久
	};
	// 水
	public static final Integer[][] water_values = {
		{30,33,36,39,42}, // 防御力増加
		{7,8,9,10,11}, // 盾装備時
		{4,5,6,7,8}, // ダメ減
		{5,6,7,8,9}, // ダメ反
		{10,11,12,13,14}, // 防御成功
	};
	// 風
	public static final Integer[][] wind_values = {
		{4,5,6,7,8}, // 最大生命増加
		{4,5,6,7,8}, // 最大マナ増加
		{25,27,30,32,35}, // 最大AG増加
		{8,9,10,11,12}, // 自動生命回復
		{7,8,9,10,11}, // 自動マナ回復
		{3,4,5,6,7}, // 自動AG回復
	};
	// 地
	public static final Integer[][] earth_values = {
		{30,33,36,39,42}, // 体力増加
	};
	public static final Integer[][][] values = {
		fire_values,
		lightning_values,
		ice_values,
		water_values,
		wind_values,
		earth_values
	};
	/*
	 * 名前とナンバーの取得関数
	 */
	// 武器
	public static String[] getAttackNames(){
		return attack_names;
	}
	public static Integer[] getAttackNumbers(){
		return attack_numbers;
	}
	// 防具
	public static String[] getGuardNames(){
		return guard_names;
	}
	public static Integer[] getGuardNumbers(){
		return guard_numbers;
	}
	/*
	 * 値の取得関数
	 */
	public static String[] getSocketValues(int number){
		String[] result = new String[5];
		int attr = number/10;
		int op = number%10;
		Integer[] val = values[attr][op];
		for(int i=0;i<5;i++)
			result[i] = val[i].toString();
		return result;
	}
}
