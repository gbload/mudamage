package org.mudamage.mud8.client.common;

public class CommonEtc {
	/**
	 * 文字列の配列を結合します。
	 * @param str1
	 * @param str2
	 * @return
	 */
	public static String[] concat(String[] str1,String[] str2){
		String[] str = new String[str1.length+str2.length];
		int i=0;
		for(String s : str1)
			str[i++] = s;
		for(String s : str2)
			str[i++] = s;
		return str;
	}
}
