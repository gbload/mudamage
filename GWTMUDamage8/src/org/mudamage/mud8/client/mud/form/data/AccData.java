package org.mudamage.mud8.client.mud.form.data;

public class AccData extends EnumData {
	enum DataNumber {
		// null
		error,
		// アクセサリ関連
		kind,
		item,
		set,
		// 配列
		exop1,
		exop2,
		exop3,
		exop4,
		exop5,
		exop6,
	}
	/**
	 * コンストラクタ
	 */
	public AccData(){
		super();
		numbers = DataNumber.values();
		data =  new String[DataNumber.values().length];
		enumdata = new EnumData[DataNumber.values().length];
	}
}
