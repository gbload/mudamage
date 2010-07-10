package org.mudamage.mud8.client.mud.form.static_data;

public class ExOptionStaticData {
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
	public static final Integer AVOID = 1;
	public static final Integer DEC = 2;
	public static final Integer HP = 3;
	public static final Integer MANA = 4;
	public static final Integer REFLECTION = 5;
	public static final Integer ZEN = 6;
	
	public static final String[][] weapon_exops = {
		{"","0"},
		{"EXD10%",EXD.toString()},
		{"速度+7",SPEED.toString()},
		{"獲得マナ/8",GET_MANA.toString()},
		{"獲得生命/8",GET_HP.toString()}
	};
	public static final String[][] attack_exops = {
		{"攻撃2%",ATTACK_2PER.toString()},
		{"攻撃lv/20",ATTACK_LV20.toString()}
	};
	public static final String[][] magic_exops = {
		{"魔力2%",MAGIC_2PER.toString()},
		{"魔力lv/20",MAGIC_LV20.toString()}
	};
	public static final String[][] guard_exops = {
		{"","0"},
		{"防御成功10%",AVOID.toString()},
		{"ダメ減4%",DEC.toString()},
		{"生命増加4%",HP.toString()},
		{"マナ増加4%",MANA.toString()},
		{"ダメ反5%",REFLECTION.toString()},
		{"獲得ゼン30%",ZEN.toString()}
	};
	/*
	public static final String[] weapon_exops = {
		"","EXD10%","速度+7","獲得マナ/8","獲得生命/8"
	};
	public static final String[] attack_exops = {
		"攻撃2%","攻撃lv/20"
	};
	public static final String[] magic_exops = {
		"魔力2%","魔力lv/20"
	};
	public static final String[] guard_exops = {
		"","防御成功10%","ダメ減4%","生命増加4%","マナ増加4%","ダメ反5%","獲得ゼン30%"
	};
	*/
	/**
	 * 武器EXOPを返す。<br><br>
	 * 物理攻撃系の場合はisAttackを、魔法攻撃系の場合はisMagicをtrueにする。<br>
	 * 両方trueにした場合は、全ての武器EXOPを返す。
	 * @param isAttack
	 * @param isMagic
	 * @return weapon_exops
	 */
	public static String[][] getWeaponExops(Boolean isAttack,Boolean isMagic){
		int size = weapon_exops.length;
		if(isAttack)size += attack_exops.length;
		if(isMagic)size += magic_exops.length;
		String[][] result = new String[weapon_exops.length+attack_exops.length+magic_exops.length][2];
		int i=0;
		for(String[] str : weapon_exops)
			result[i++] = str;
		if(isAttack)
			for(String[] str : attack_exops)
				result[i++] = str;
		if(isMagic)
			for(String[] str : magic_exops)
				result[i++] = str;
		return result;
	}
	/**
	 * 防具EXOPを返す。
	 * @return guard_exops
	 */
	public static String[][] getGuardExops(){
		return guard_exops;
	}

}
