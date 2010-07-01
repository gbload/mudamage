package org.mudamage.mud8.client.mud.form.data;

public class FormData extends EnumData{
	public enum DataNumber {
		// null
		error,
		// ステータス関連
		lv,
		point,
		maxpoint,
		fruit,
		maxfruit,
		str,
		agi,
		vit,
		ene,
		rec,
		// タイトル
		title,
		// 経験値
		exp,
		// クラス
		job,
		// ペット
		petitem,
		dinoluntop1,
		dinoluntop2,
		fenrirop,
		darkhorselv,
		// 羽
		wingitem,
		wingluck,
		wingplus,
		wingop,
		wingcop,
		// ここまでString型
		// ここから別クラス
		// ネックレス
		neck,
		right,
		left,
		helm,
		armor,
		glove,
		garter,
		boots,
		ring1,
		ring2,
	}
	/**
	 * コンストラクタ
	 */
	public FormData(){
		super();
		numbers = DataNumber.values();
		data =  new String[DataNumber.values().length];
		enumdata = new EnumData[DataNumber.values().length];
		
		enumdata[DataNumber.neck.ordinal()] = new AccData();
		enumdata[DataNumber.right.ordinal()] = new EquipData();
		enumdata[DataNumber.left.ordinal()] = new EquipData();
		enumdata[DataNumber.helm.ordinal()] = new EquipData();
		enumdata[DataNumber.armor.ordinal()] = new EquipData();
		enumdata[DataNumber.glove.ordinal()] = new EquipData();
		enumdata[DataNumber.garter.ordinal()] = new EquipData();
		enumdata[DataNumber.boots.ordinal()] = new EquipData();
		enumdata[DataNumber.ring1.ordinal()] = new AccData();
		enumdata[DataNumber.ring2.ordinal()] = new AccData();
	}
}