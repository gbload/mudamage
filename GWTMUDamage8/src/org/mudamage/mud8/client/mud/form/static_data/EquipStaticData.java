package org.mudamage.mud8.client.mud.form.static_data;

import org.mudamage.mud8.client.mud.form.static_data.equip.EquipEquip;

public class EquipStaticData {
	/*
	 * 必要な関数
	 */
	/**
	 * 兜の名前の配列を返します。
	 * @param job
	 * @return names
	 */
	public static String[] getHelmNames(String job){
		return EquipEquip.getNames(0, job);
	}
	/**
	 * 鎧の名前の配列を返します。
	 * @param job
	 * @return names
	 */
	public static String[] getArmorNames(String job){
		return EquipEquip.getNames(1, job);
	}
	/**
	 * 手の名前の配列を返します。
	 * @param job
	 * @return names
	 */
	public static String[] getGloveNames(String job){
		return EquipEquip.getNames(2, job);
	}
	/**
	 * 腰の名前の配列を返します。
	 * @param job
	 * @return names
	 */
	public static String[] getGarterNames(String job){
		return EquipEquip.getNames(3, job);
	}
	/**
	 * 足の名前の配列を返します。
	 * @param job
	 * @return names
	 */
	public static String[] getBootsNames(String job){
		return EquipEquip.getNames(4, job);
	}
	
}
