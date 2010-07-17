package org.mudamage.mud8.client.mud.static_data;

import org.mudamage.mud8.client.mud.static_data.equip.EquipEquip;

public class EquipStaticData {
	/*
	 * 定数
	 */

	public static final Integer RIGHT = 6;
	public static final Integer LEFT = 7;
	public static final Integer NECK = 8;
	public static final Integer HELM = 0;
	public static final Integer ARMOR = 1;
	public static final Integer GLOVE = 2;
	public static final Integer GARTER = 3;
	public static final Integer BOOTS = 4;
	public static final Integer SHIELD = 5;
	public static final Integer RING1 = 9;
	public static final Integer RING2 = 10;
	private static final String[] type_names = {
		"helm",
		"armor",
		"glove",
		"garter",
		"boots",
		"shield",
		"right",
		"left",
		"neck",
		"ring1",
		"ring2"
	};
	/*
	 * 必要な関数
	 */
	/**
	 * 装備タイプを表す数字を返します。
	 * @param equip_name
	 * @return number
	 */
	public static Integer getEquipTypeNumber(String str){
		for(int i=0;i<type_names.length;i++)
			if(type_names[i].equals(str))
				return i;
		return 0;
	}
	/**
	 * 通常装備/EX装備の名前の配列を返します。
	 * @param type
	 * @param job
	 * @return names
	 */
	public static String[][] getNames(Integer type,Integer job){
		return EquipEquip.getNames(type, job);
	}
	/**
	 * 通常装備のDEFを返します。
	 * @param name
	 * @param plus
	 * @return
	 */
	public static Integer getDef(int name,int plus){
		return EquipEquip.getDef(name, plus);
	}
	/**
	 * EX装備のDEFを返します。
	 * @param name
	 * @param plus
	 * @return
	 */
	public static Integer getExDef(int name,int plus){
		return EquipEquip.getExDef(name, plus);
	}
	
}
