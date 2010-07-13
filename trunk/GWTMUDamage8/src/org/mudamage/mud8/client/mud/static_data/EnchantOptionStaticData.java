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
	public static final String[] SD_DEC_NAME = {"SD比率減",SD_DEC.toString()};
	public static final String[] SD_IGNORE_NAME = {"SD無視",SD_IGNORE.toString()};
	// 杖エンチャント
	public static final String[] MAGIC_NAME = {"魔力上昇",MAGIC.toString()};
	public static final String[] MAGIC_SKILL_NAME = {"スキル攻撃力",MAGIC_SKILL.toString()};
	public static final String[] MAGIC_CRI_NAME = {"Cダメ",MAGIC_CRI.toString()};
	public static final String[] MAGIC_SD_DEC_NAME = {"SD比率減",MAGIC_SD_DEC.toString()};
	public static final String[] MAGIC_SD_IGNORE_NAME = {"対人比率減",MAGIC_SD_IGNORE.toString()};
	// 防具エンチャント
	public static final String[] DEF_NAME = {"防御力上昇",DEF.toString()};
	public static final String[] AG_NAME = {"最大AG上昇",AG.toString()};
	public static final String[] HP_NAME = {"最大生命上昇",HP.toString()};
	public static final String[] AH_NAME = {"自動生命回復",AH.toString()};
	public static final String[] AM_NAME = {"自動マナ回復",AM.toString()};
	public static final String[] PVP_AVOID_NAME = {"対人防御成功",PVP_AVOID.toString()};
	public static final String[] DEC_NAME = {"ダメ減",DEC.toString()};
	public static final String[] SD_INC_NAME = {"SD比率上昇",SD_INC.toString()};
	
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
		
	};
	public static final String[][] enchant_guard_names = {
		
	};
}
