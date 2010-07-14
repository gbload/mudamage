package org.mudamage.mud8.client.mud.static_data;

public class EnchantOptionStaticData {
	/*
	 * 定数
	 */
	// 武器エンチャント
	public static final Integer MIN = 0;
	public static final Integer MAX= 1;
	public static final Integer REQUIRE_STR = 2;
	public static final Integer REQUIRE_AGI = 3;
	public static final Integer ATTACK = 4;
	public static final Integer CRI = 5;
	public static final Integer SKILL = 6;
	public static final Integer PVP_HIT = 7;
	public static final Integer SD_DEC = 8;
	public static final Integer SD_IGNORE = 9;
	// 杖エンチャント
	public static final Integer MAGIC = 10;
	public static final Integer MAGIC_SKILL = 11;
	public static final Integer MAGIC_CRI = 12;
	public static final Integer MAGIC_SD_DEC = 13;
	public static final Integer MAGIC_SD_IGNORE = 14;
	// 防具エンチャント
	public static final Integer DEF = 15;
	public static final Integer AG = 16;
	public static final Integer HP = 17;
	public static final Integer AH = 18;
	public static final Integer AM = 19;
	public static final Integer PVP_AVOID = 20;
	public static final Integer DEC = 21;
	public static final Integer SD_INC = 22;
	/*
	 * 定数　名前
	 */
	// 武器エンチャント
	public static final String[] MIN_NAME = {"最小攻撃力",MIN.toString()};
	public static final String[] MAX_NAME = {"最大攻撃力",MAX.toString()};
	public static final String[] REQUIRE_STR_NAME = {"要求力減",REQUIRE_STR.toString()};
	public static final String[] REQUIRE_AGI_NAME = {"要求敏減",REQUIRE_AGI.toString()};
	public static final String[] ATTACK_NAME = {"攻撃力",ATTACK.toString()};
	public static final String[] CRI_NAME = {"Cダメ",CRI.toString()};
	public static final String[] SKILL_NAME = {"スキル攻撃力",SKILL.toString()};
	public static final String[] PVP_HIT_NAME = {"対人攻撃率",PVP_HIT.toString()};
	public static final String[] SD_DEC_NAME = {"SD比率減(%)",SD_DEC.toString()};
	public static final String[] SD_IGNORE_NAME = {"SD無視(%)",SD_IGNORE.toString()};
	// 杖エンチャント
	public static final String[] MAGIC_NAME = {"魔力上昇",MAGIC.toString()};
	public static final String[] MAGIC_SKILL_NAME = {"スキル攻撃力",MAGIC_SKILL.toString()};
	public static final String[] MAGIC_CRI_NAME = {"Cダメ",MAGIC_CRI.toString()};
	public static final String[] MAGIC_SD_DEC_NAME = {"SD比率減(%)",MAGIC_SD_DEC.toString()};
	public static final String[] MAGIC_SD_IGNORE_NAME = {"SD無視(%)",MAGIC_SD_IGNORE.toString()};
	// 防具エンチャント
	public static final String[] DEF_NAME = {"防御力上昇",DEF.toString()};
	public static final String[] AG_NAME = {"最大AG上昇",AG.toString()};
	public static final String[] HP_NAME = {"最大生命上昇",HP.toString()};
	public static final String[] AH_NAME = {"自動生命回復",AH.toString()};
	public static final String[] AM_NAME = {"自動マナ回復",AM.toString()};
	public static final String[] PVP_AVOID_NAME = {"対人防御成功",PVP_AVOID.toString()};
	public static final String[] DEC_NAME = {"ダメ減(%)",DEC.toString()};
	public static final String[] SD_INC_NAME = {"SD比率上昇(%)",SD_INC.toString()};
	/*
	 * 定数　数値
	 */
	public static final Integer[][] values = {
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
	public static final Integer[] require_lv = {
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
	public static final String[][] enchant_attack_names = {
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
	public static final String[][] enchant_magic_names = {
		MAGIC_NAME,
		REQUIRE_STR_NAME,
		REQUIRE_AGI_NAME,
		MAGIC_CRI_NAME,
		MAGIC_SKILL_NAME,
		PVP_HIT_NAME,
		MAGIC_SD_DEC_NAME,
		MAGIC_SD_IGNORE_NAME
	};
	public static final String[][] enchant_guard_names = {
		DEF_NAME,
		AG_NAME,
		HP_NAME,
		AH_NAME,
		AM_NAME,
		PVP_AVOID_NAME,
		DEC_NAME,
		SD_INC_NAME
	};
	/*
	 * 名前の取得関数
	 */
	public static String[][] getEnchantAttackNames(){
		return enchant_attack_names;
	}
	public static String[][] getEnchantMagicNames(){
		return enchant_magic_names;
	}
	public static String[][] getEnchantGuardNames(){
		return enchant_guard_names;
	}
	/*
	 * 値の取得関数
	 */
	public static String[] getEnchanValues(int name,int plus){
		int size = require_lv[name] - plus + 1;
		if(size <= 0)return null;
		String[] str = new String[size];
		for(int i=0;i<size;i++){
			str[i] = values[i].toString();
		}
		return str;
	}
}
