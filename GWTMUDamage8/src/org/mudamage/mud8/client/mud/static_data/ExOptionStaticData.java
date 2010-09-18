package org.mudamage.mud8.client.mud.static_data;

public class ExOptionStaticData {
	public static final Integer NONE = 0;
	//武器EXOP定数
	public static final Integer EXD = 1;
	public static final Integer SPEED = 2;
	public static final Integer GET_MANA = 3;
	public static final Integer GET_HP = 4;
	public static final Integer ATTACK_LV20 = 5;
	public static final Integer ATTACK_2PER = 6;
	public static final Integer MAGIC_LV20 = 7;
	public static final Integer MAGIC_2PER = 8;
	//防具EXOP定数
	public static final Integer AVOID = 9;
	public static final Integer DEC = 10;
	public static final Integer HP = 11;
	public static final Integer MANA = 12;
	public static final Integer REFLECTION = 13;
	public static final Integer ZEN = 14;
	
	public static final Integer LAST = 15;
	
	
	public static final String NONE_NAME = "";
	//武器EXOP名前
	public static final String EXD_NAME = "EXD10%";
	public static final String SPEED_NAME = "速度+7";
	public static final String GET_MANA_NAME = "獲得マナ/8";
	public static final String GET_HP_NAME = "獲得生命/8";
	public static final String ATTACK_LV20_NAME = "攻撃lv/20";
	public static final String ATTACK_2PER_NAME = "攻撃2%";
	public static final String MAGIC_LV20_NAME = "魔力lv/20";
	public static final String MAGIC_2PER_NAME = "魔力2%";
	//防具EXOP名前
	public static final String AVOID_NAME = "防御成功10%";
	public static final String DEC_NAME = "ダメ減4%";
	public static final String HP_NAME = "生命増加4%";
	public static final String MANA_NAME = "マナ増加4%";
	public static final String REFLECTION_NAME = "ダメ反5%";
	public static final String ZEN_NAME = "獲得ゼン30%";
	
	//攻撃EXOP
	public static final String[] weapon_attack_exop_names = {NONE_NAME,EXD_NAME,SPEED_NAME,GET_MANA_NAME,GET_HP_NAME,ATTACK_LV20_NAME,ATTACK_2PER_NAME};
	public static final Integer[] weapon_attack_exop_numbers = {NONE,EXD,SPEED,GET_MANA,GET_HP,ATTACK_LV20,ATTACK_2PER};
	//魔法EXOP
	public static final String[] weapon_magic_exop_names = {NONE_NAME,EXD_NAME,SPEED_NAME,GET_MANA_NAME,GET_HP_NAME,MAGIC_LV20_NAME,MAGIC_2PER_NAME};
	public static final Integer[] weapon_magic_exop_numbers = {NONE,EXD,SPEED,GET_MANA,GET_HP,MAGIC_LV20,MAGIC_2PER};
	//攻撃魔法EXOP
	public static final String[] weapon_exop_names = {NONE_NAME,EXD_NAME,SPEED_NAME,GET_MANA_NAME,GET_HP_NAME,ATTACK_LV20_NAME,ATTACK_2PER_NAME,MAGIC_LV20_NAME,MAGIC_2PER_NAME};
	public static final Integer[] weapon_exop_numbers = {NONE,EXD	,SPEED,GET_MANA,GET_HP,ATTACK_LV20,ATTACK_2PER,MAGIC_LV20,MAGIC_2PER};
	//防具EXOP
	public static final String[] guard_exop_names = {NONE_NAME,AVOID_NAME,DEC_NAME,HP_NAME,MANA_NAME,REFLECTION_NAME,ZEN_NAME};
	public static final Integer[] guard_exop_numbers = {NONE,AVOID,DEC,HP,MANA,REFLECTION,ZEN};

	/**
	 * 攻撃EXOPの名前を返す
	 * @return attack_exop_names
	 */
	public static String[] getWeaponAttackExopNames(){
		return weapon_attack_exop_names;
	}
	/**
	 * 攻撃EXOPのナンバーを返す
	 * @return attack_exop_numbers
	 */
	public static Integer[] getWeaponAttackExopNumbers(){
		return weapon_attack_exop_numbers;
	}
	/**
	 * 魔法EXOPの名前を返す
	 * @return attack_exop_names
	 */
	public static String[] getWeaponMagicExopNames(){
		return weapon_magic_exop_names;
	}
	/**
	 * 魔法EXOPのナンバーを返す
	 * @return magic_exop_numbers
	 */
	public static Integer[] getWeaponMagicExopNumbers(){
		return weapon_exop_numbers;
	}
	/**
	 * 攻撃魔法EXOPの名前を返す
	 * @return _exop_names
	 */
	public static String[] getWeaponExopNames(){
		return weapon_exop_names;
	}
	/**
	 * 攻撃魔法EXOPのナンバーを返す
	 * @return attack_exop_numbers
	 */
	public static Integer[] getWeaponExopNumbers(){
		return weapon_attack_exop_numbers;
	}
	/**
	 * 防具EXOPの名前を返す
	 * @return attack_exop_names
	 */
	public static String[] getGuardExopNames(){
		return guard_exop_names;
	}
	/**
	 * 防具EXOPのナンバーを返す
	 * @return attack_exop_numbers
	 */
	public static Integer[] getGuardExopNumbers(){
		return guard_exop_numbers;
	}
}
