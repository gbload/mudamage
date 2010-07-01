package org.mudamage.mud8.client.mud.form.static_data;

public class OptionStaticData {
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
	/**
	 * 武器EXOPを返す。<br><br>
	 * 物理攻撃系の場合はisAttackを、魔法攻撃系の場合はisMagicをtrueにする。<br>
	 * 両方trueにした場合は、全ての武器EXOPを返す。
	 * @param isAttack
	 * @param isMagic
	 * @return weapon_exops
	 */
	public static String[] getWeaponExops(Boolean isAttack,Boolean isMagic){
		int size = weapon_exops.length;
		if(isAttack)size += attack_exops.length;
		if(isMagic)size += magic_exops.length;
		String[] result = new String[weapon_exops.length+attack_exops.length+magic_exops.length];
		int i=0;
		for(String str : weapon_exops)
			result[i++] = str;
		if(isAttack)
			for(String str : attack_exops)
				result[i++] = str;
		if(isMagic)
			for(String str : magic_exops)
				result[i++] = str;
		return result;
	}
	/**
	 * 防具EXOPを返す。
	 * @return guard_exops
	 */
	public static String[] getGuardExops(){
		return guard_exops;
	}

}
