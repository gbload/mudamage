package org.mudamage.mud8.client.mud.static_data;

public class FormKindStaticData {
	public static final Integer NONE = 0;
	public static final Integer NORMAL = 1;
	public static final Integer EX = 2;
	public static final Integer SET = 3;
	public static final Integer SOCKET = 4;
	public static final Integer DARKSPIRIT = 5;
	
	public static final String[] NONE_STR = {"なし",NONE.toString()};
	public static final String[] NORMAL_STR = {"通常",NORMAL.toString()};
	public static final String[] EX_STR = {"EX",EX.toString()};
	public static final String[] SET_STR = {"セット",SET.toString()};
	public static final String[] SOCKET_STR = {"ソケット",SOCKET.toString()};
	public static final String[] DARKSPIRIT_STR = {"鷹",DARKSPIRIT.toString()};
	
	public static final String[][] kind_names = {
		NONE_STR,
		NORMAL_STR,
		EX_STR,
		SET_STR,
		SOCKET_STR
	};
	public static final String[][] acc_kind_names = {
		NONE_STR,
		NORMAL_STR,
		EX_STR,
		SET_STR
	};
	public static final String[][] dl_kind_names = {
		NONE_STR,
		NORMAL_STR,
		EX_STR,
		SET_STR,
		SOCKET_STR,
		DARKSPIRIT_STR
	};
	
	public static String[][] getKindNames(){
		return kind_names;
	}
	public static String[][] getAccKindNames(){
		return acc_kind_names;
	}
	public static String[][] getDLKindNames(){
		return dl_kind_names;
	}
}
