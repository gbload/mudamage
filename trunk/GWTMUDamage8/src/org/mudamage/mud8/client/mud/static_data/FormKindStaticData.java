package org.mudamage.mud8.client.mud.static_data;

public class FormKindStaticData {
	/*
	 * 定数
	 */
	public static final Integer NONE = 0;
	public static final Integer NORMAL = 1;
	public static final Integer EX = 2;
	public static final Integer SET = 3;
	public static final Integer SOCKET = 4;
	public static final Integer DARKSPIRIT = 5;
	/*
	 * 名前定数
	 */
	public static final String NONE_NAME = "なし";
	public static final String NORMAL_NAME = "通常";
	public static final String EX_NAME = "EX";
	public static final String SET_NAME = "セット";
	public static final String SOCKET_NAME = "ソケット";
	public static final String DARKSPIRIT_NAME = "鷹";
	
	/*
	 * 名前配列
	 */
	// 装備用
	public static final String[] kind_names = {
		NONE_NAME,
		NORMAL_NAME,
		EX_NAME,
		SET_NAME,
		SOCKET_NAME
	};
	public static final Integer[] kind_numbers = {
		NONE,
		NORMAL,
		EX,
		SET,
		SOCKET
	};
	// アクセ用
	public static final String[] acc_kind_names = {
		NONE_NAME,
		NORMAL_NAME,
		EX_NAME,
		SET_NAME
	};
	public static final Integer[] acc_kind_numbers = {
		NONE,
		NORMAL,
		EX,
		SET
	};
	// DL左手用
	public static final String[] dl_kind_names = {
		NONE_NAME,
		NORMAL_NAME,
		EX_NAME,
		SET_NAME,
		SOCKET_NAME,
		DARKSPIRIT_NAME
	};
	public static final Integer[] dl_kind_numbers = {
		NONE,
		NORMAL,
		EX,
		SET,
		SOCKET,
		DARKSPIRIT
	};
	
	/*
	 * 名前取得用関数
	 */
	// 装備用
	public static String[] getKindNames(){
		return kind_names;
	}
	public static Integer[] getKindNumbers(){
		return kind_numbers;
	}
	// アクセ用
	public static String[] getAccKindNames(){
		return acc_kind_names;
	}
	public static Integer[] getKindAccNumbers(){
		return acc_kind_numbers;
	}
	// DL左手用
	public static String[] getDLKindNames(){
		return dl_kind_names;
	}
	public static Integer[] getKindDLNumbers(){
		return dl_kind_numbers;
	}
}
