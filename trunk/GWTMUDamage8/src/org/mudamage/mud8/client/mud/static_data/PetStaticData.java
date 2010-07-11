package org.mudamage.mud8.client.mud.static_data;

import org.mudamage.mud8.client.common.CommonEtc;

public class PetStaticData {
	/*
	 * 定数
	 */
	public static final Integer NONE = 0;
	public static final Integer SATAN = 1;
	public static final Integer ANGEL = 2;
	public static final Integer DAEMON = 3;
	public static final Integer SPIRIT = 4;
	public static final Integer UNIRIA = 5;
	public static final Integer DINO = 6;
	public static final Integer FENRIR = 7;
	public static final Integer PONGA = 8;
	public static final Integer ARION = 9;
	public static final Integer DARKHORSE = 10;
	// ディノラントOP
	public static final Integer DINO_AG = 1;
	public static final Integer DINO_SPEED = 2;
	public static final Integer DINO_DEC = 3;
	// フェンリルOP
	public static final Integer FENRIR_NORMAL = 0;
	public static final Integer FENRIR_DESTROY = 1;
	public static final Integer FENRIR_PROTECT = 2;
	public static final Integer FENRIR_GOLD = 3;
	
	/*
	 * Selectフォーム用
	 */
	public static final String[][] names = {
		{"なし",NONE.toString()},
		{"サタン",SATAN.toString()},
		{"守護天使",ANGEL.toString()},
		{"デーモン",DAEMON.toString()},
		{"守護精霊",SPIRIT.toString()},
		{"ユニリア",UNIRIA.toString()},
		{"ディノラント",DINO.toString()},
		{"フェンリル",FENRIR.toString()},
		{"白と黒のポンガ",PONGA.toString()},
		{"白銀のアリオン",ARION.toString()}
	};
	public static final String[][] darkhorse = {
		{"ダークホース",DARKHORSE.toString()}
	};
	public static final String[][] dino_op = {
		{"",NONE.toString()},
		{"AG+50",DINO_AG.toString()},
		{"速度+5",DINO_SPEED.toString()},
		{"ダメージ吸収+5%",DINO_DEC.toString()},
	};
	public static final String[][] fenrir_op = {
		{"ノーマル",FENRIR_NORMAL.toString()},
		{"破壊",FENRIR_DESTROY.toString()},
		{"守護",FENRIR_PROTECT.toString()},
		{"黄金",FENRIR_GOLD.toString()},
	};
	/**
	 * Selectフォーム用の配列を返します。
	 * @return names
	 */
	public static final String[][] getPetNames(){
		return names;
	}
	/**
	 * Selectフォーム用の配列を返します。(DL)
	 * @return dl_names
	 */
	public static final String[][] getDLPetNames(){
		return CommonEtc.concat(names, darkhorse);
	}
	/**
	 * ペット定数を比較します。
	 * @param value
	 * @param target
	 * @return boolean
	 */
	public static Boolean equal(String value,Integer target){
		return value.equals(target.toString());
	}
	/**
	 * ダークホースのLV選択用の配列を返します。
	 * @return level
	 */
	public static final String[] getDarkHorseLv(){
		String[] darkhorselv = new String[50];
		for(int i=1;i<=50;i++)
			darkhorselv[i-1] = "Lv"+i;
		return darkhorselv;
	}
	/**
	 * ディノラントのOP選択用の配列を返します
	 * @return options
	 */
	public static final String[][] getDinoOp(){ return dino_op; }
	/**
	 * フェンリルのOP選択用の配列を返します
	 * @return options
	 */
	public static final String[][] getFenrirOp(){ return fenrir_op; }
}
