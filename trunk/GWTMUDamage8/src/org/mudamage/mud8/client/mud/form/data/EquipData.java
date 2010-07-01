package org.mudamage.mud8.client.mud.form.data;

public class EquipData extends EnumData {
	enum DataNumber {
		// null
		error,
		// 装備関連
		kind,
		item,
		luck,
		plus,
		op,
		en,
		enop,
		set,
		// ここから配列
		exop1,
		exop2,
		exop3,
		exop4,
		exop5,
		exop6,
		so1,
		soop1,
		so2,
		soop2,
		so3,
		soop3,
		so4,
		soop4,
		so5,
		soop5,
		sobonus1,
		sobonus2,
	}
	/**
	 * コンストラクタ
	 */
	public EquipData(){
		super();
		numbers = DataNumber.values();
		data =  new String[DataNumber.values().length];
		enumdata = new EnumData[DataNumber.values().length];
	}
}
