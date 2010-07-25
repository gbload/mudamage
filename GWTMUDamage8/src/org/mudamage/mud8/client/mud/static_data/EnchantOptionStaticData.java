package org.mudamage.mud8.client.mud.static_data;

import com.google.gwt.user.client.Window;

public class EnchantOptionStaticData {
	/*
	 * 定数
	 */
	public static final Integer NONE = 0;
	// 武器エンチャント
	public static final Integer MIN = 1;
	public static final Integer MAX= 2;
	public static final Integer REQUIRE_STR = 3;
	public static final Integer REQUIRE_AGI = 4;
	public static final Integer ATTACK = 5;
	public static final Integer CRI = 6;
	public static final Integer SKILL = 7;
	public static final Integer PVP_HIT = 8;
	public static final Integer SD_DEC = 9;
	public static final Integer SD_IGNORE = 10;
	// 杖エンチャント
	public static final Integer MAGIC = 11;
	public static final Integer MAGIC_SKILL = 12;
	public static final Integer MAGIC_CRI = 13;
	public static final Integer MAGIC_SD_DEC = 14;
	public static final Integer MAGIC_SD_IGNORE = 15;
	// 防具エンチャント
	public static final Integer DEF = 16;
	public static final Integer AG = 17;
	public static final Integer HP = 18;
	public static final Integer AH = 19;
	public static final Integer AM = 20;
	public static final Integer PVP_AVOID = 21;
	public static final Integer DEC = 22;
	public static final Integer SD_INC = 23;
	/*
	 * 定数　名前
	 */
	private static final String NONE_NAME = "";
	// 武器エンチャント
	private static final String MIN_NAME = "最小攻撃力";
	private static final String MAX_NAME = "最大攻撃力";
	private static final String REQUIRE_STR_NAME = "要求力減";
	private static final String REQUIRE_AGI_NAME = "要求敏減";
	private static final String ATTACK_NAME = "攻撃力";
	private static final String CRI_NAME = "Cダメ";
	private static final String SKILL_NAME = "スキル攻撃力";
	private static final String PVP_HIT_NAME = "対人攻撃率";
	private static final String SD_DEC_NAME = "SD比率減(%)";
	private static final String SD_IGNORE_NAME = "SD無視(%)";
	// 杖エンチャント
	private static final String MAGIC_NAME = "魔力上昇";
	private static final String MAGIC_SKILL_NAME = "スキル攻撃力";
	private static final String MAGIC_CRI_NAME = "Cダメ";
	private static final String MAGIC_SD_DEC_NAME = "SD比率減(%)";
	private static final String MAGIC_SD_IGNORE_NAME = "SD無視(%)";
	// 防具エンチャント
	private static final String DEF_NAME = "防御力上昇";
	private static final String AG_NAME = "最大AG上昇";
	private static final String HP_NAME = "最大生命上昇";
	private static final String AH_NAME = "自動生命回復";
	private static final String AM_NAME = "自動マナ回復";
	private static final String PVP_AVOID_NAME = "対人防御成功";
	private static final String DEC_NAME = "ダメ減(%)";
	private static final String SD_INC_NAME = "SD比率上昇(%)";
	/*
	 * 定数　数値
	 */
	private static final Integer[][] values = {
		{},// NONE
		
		{2,3,4,5,6,7,9,11,12,14,15,16,17,20}, // 最小攻撃力
		{3,4,5,6,7,8,10,12,14,17,20,23,26,29}, // 最大攻撃力
		{6,8,10,12,14,16,20,23,26,29,32,35,37,40}, // 要求力減
		{6,8,10,12,14,16,20,23,26,29,32,35,37,40}, // 要求敏減
		{7,8,9,11,12,14,16,19}, // 攻撃力
		{12,14,16,18,20,22,24,30}, // Cダメ
		{12,14,16,18,22}, // スキル攻撃力
		{5,7,9,11,14}, // 対人攻撃率
		{3,5,7,9,10}, // SD比率減%
		{10}, // SD無視%
		
		{6,8,10,12,14,16,17,18,19,21,23,25,27,31}, // 魔力上昇
		{7,10,13,16,19,22,25,30}, // 魔法スキル攻撃力
		{10,12,14,16,18,20,22,28}, // 魔法クリティカルダメージ
		{4,6,8,10,13}, // 魔法SD比率減%
		{15}, // 魔法SD無視%
		
		{3,4,5,6,7,8,10,12,14,16,18,20,22,25}, // 防御力
		{4,6,8,10,12,14,16,18,20,22,25}, // 最大AG
		{7,9,11,13,15,17,19,21,23,25,30}, // 最大HP
		{1,2,3,4,5,6,7,8}, // 自動生命回復
		{1,2,3,4,5}, // 自動マナ回復
		{3,4,5,6,8}, // 対人防御成功率
		{3,4,5,6,7}, // ダメ減%
		{5}, // SD比率上昇%
	};
	/*
	 * 定数　要求LV
	 */
	private static final Integer[] require_lv = {
		14, // NONE
		
		0, // 最大攻撃力
		0, // 最大攻撃力
		0, // 要求力減
		0, // 要求敏減
		6, // 攻撃力
		6, // Cダメ
		9, // スキル攻撃力
		9, // 対人攻撃率
		9, // SD比率減
		13, // SD無視
		
		0, // 魔力上昇
		6, // 魔法スキル攻撃力
		6, // 魔法クリティカルダメージ
		9, // 魔法SD比率減
		13, // 魔法SD無視
		
		0, // 防御力
		3, // 最大AG
		3, // 最大HP
		6, // 自動生命回復
		9, // 自動マナ回復
		9, // 対人防御成功率
		9, // ダメ減
		13 // SD比率上昇
	};
	/*
	 * 定数　名前配列
	 */
	/**
	 * 剣エンチャント
	 */
	private static final String[] enchant_attack_names = {
		NONE_NAME,
		MIN_NAME,
		MAX_NAME,
		REQUIRE_STR_NAME,
		REQUIRE_AGI_NAME,
		ATTACK_NAME,
		CRI_NAME,
		SKILL_NAME,
		PVP_HIT_NAME,
		SD_DEC_NAME,
		SD_IGNORE_NAME
	};
	private static final Integer[] enchant_attack_numbers = {
		NONE,
		MIN,
		MAX,
		REQUIRE_STR,
		REQUIRE_AGI,
		ATTACK,CRI,
		SKILL,
		PVP_HIT,
		SD_DEC,
		SD_IGNORE
	};
	/**
	 * 杖エンチャント
	 */
	private static final String[] enchant_magic_names = {
		NONE_NAME,
		MAGIC_NAME,
		REQUIRE_STR_NAME,
		REQUIRE_AGI_NAME,
		MAGIC_CRI_NAME,
		MAGIC_SKILL_NAME,
		PVP_HIT_NAME,
		MAGIC_SD_DEC_NAME,
		MAGIC_SD_IGNORE_NAME
	};
	private static final Integer[] enchant_magic_numbers = {
		NONE,
		MAGIC,
		REQUIRE_STR,
		REQUIRE_AGI,
		MAGIC_CRI,
		MAGIC_SKILL,
		PVP_HIT,
		MAGIC_SD_DEC,
		MAGIC_SD_IGNORE
	};
	/**
	 * 防具エンチャント
	 */
	private static final String[] enchant_guard_names = {
		NONE_NAME,
		DEF_NAME,
		AG_NAME,
		HP_NAME,
		AH_NAME,
		AM_NAME,
		PVP_AVOID_NAME,
		DEC_NAME,
		SD_INC_NAME
	};
	private static final Integer[] enchant_guard_numbers = {
		NONE,
		DEF,
		AG,
		HP,
		AH,
		AM,
		PVP_AVOID,
		DEC,
		SD_INC
	};
	/*
	 * 定数　アイテムレベル毎のエンチャント {plus,個数}
	 */
	private static final Integer[][] enchant_attack_lv = {{0,5},{6,7},{9,10},{13,11}};
	private static final Integer[][] enchant_magic_lv = {{0,4},{6,6},{9,8},{13,9}};
	private static final Integer[][] enchant_guard_lv = {{0,2},{3,4},{6,5},{9,8},{13,9}};
	/*
	 * private関数
	 */
	private static Integer getEnchantCount(Integer[][] enchant_lv,int plus){
		for(int i=enchant_lv.length - 1;i>=0;i--)
			if(plus >= enchant_lv[i][0])
				return enchant_lv[i][1];
		return 0;
	}
	private static String[] getEnchantNames(String[] names,int count){
		String[] result = new String[count];
		for(int i=0;i<count;i++)
			result[i] = names[i];
		return result;
	}
	private static Integer[] getEnchantNumbers(Integer[] numbers,int count){
		Integer[] result = new Integer[count];
		for(int i=0;i<count;i++)
			result[i] = numbers[i];
		return result;
	}
	/*
	 * 名前とナンバーの取得関数
	 */
	/**
	 * 剣エンチャント
	 * @param plus
	 * @return attack_enchant
	 */
	public static String[] getEnchantAttackNames(int plus){
		return getEnchantNames(enchant_attack_names, getEnchantCount(enchant_attack_lv, plus));
	}
	public static Integer[] getEnchantAttackNumbers(int plus){
		return getEnchantNumbers(enchant_attack_numbers,getEnchantCount(enchant_attack_lv,plus));
	}
	/**
	 * 杖エンチャント
	 * @param plus
	 * @return magic_enchant
	 */
	public static String[] getEnchantMagicNames(int plus){
		return getEnchantNames(enchant_magic_names, getEnchantCount(enchant_magic_lv, plus));
	}
	public static Integer[] getEnchantMagicNumbers(int plus){
		return getEnchantNumbers(enchant_magic_numbers, getEnchantCount(enchant_magic_lv, plus));
	}
	/**
	 * 防具エンチャント
	 * @param plus
	 * @return guard_enchant
	 */
	public static String[] getEnchantGuardNames(int plus){
		return getEnchantNames(enchant_guard_names, getEnchantCount(enchant_guard_lv, plus));
	}
	public static Integer[] getEnchantGuardNumbers(int plus){
		return getEnchantNumbers(enchant_guard_numbers, getEnchantCount(enchant_guard_lv, plus));
	}
	/*
	 * 値の取得関数
	 */
	public static String[] getEnchantValues(int number,int plus){
		// plusが13以上の場合は13にする
		int plus_value = plus;
		if(plus > 13)plus_value = 13;
		// 要素のサイズを取得
		int size = plus_value - require_lv[number] + 1;
		// サイズがマイナスの場合、0にする
		if(size <= 0)size=0;
		// 名前の配列の準備
		String[] str = new String[size];
		// 名前の配列を作成
		for(int i=0;i<size&&i<=13;i++){
			str[i] = values[number][i].toString();
		}
		return str;
	}
	public static Integer[] getEnchantValueNumbers(int number,int plus){
		// plusが13以上の場合は13にする
		int plus_value = plus;
		if(plus > 13)plus_value = 13;
		// 要素のサイズを取得
		int size = plus_value - require_lv[number] + 1;
		// サイズがマイナスの場合、0にする
		if(size <= 0)size=0;
		// ナンバーの配列を準備
		Integer[] num = new Integer[size];
		// ナンバーの配列を作成
		for(int i=0;i<size&&i<=13;i++){
			num[i] = values[number][i];
		}
		return num;
	}
}
