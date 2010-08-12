package org.mudamage.mud8.client.mud.static_data;

public class OptionStaticData {
	private static final Integer OPTION_SIZE = 4;
	// オプション定数
	public static final Integer NONE		 = 0;
	public static final Integer ATTACK	 = 1;
	public static final Integer MAGIC		 = 2;
	public static final Integer NOROI		 = 4;
	public static final Integer GUARD		 = 8;
	public static final Integer AVOID		 = 16;
	public static final Integer ATTACK_MAGIC	 = 32;
	
	// オプション名
	public static final String NONE_NAME = "";
	public static final String ATTACK_NAME = "攻撃";
	public static final String MAGIC_NAME = "魔力";
	public static final String NOROI_NAME = "呪い";
	public static final String GUARD_NAME = "防御";
	public static final String AVOID_NAME = "防御率";
	public static final String ATTACK_MAGIC_NAME = "攻撃魔力";
	
	/**
	 * オプション名を作成する
	 * @param name
	 * @return names
	 */
	public static String[] getOptionNames(String[] name){
		String[] names = new String[(OPTION_SIZE*name.length)+1];
		names[0] = "";
		for(int j=0;j<name.length;j++){
			int inc = 4;
			if(name[0].equals(AVOID_NAME))
				inc = 5;
			for(int i=1;i<=OPTION_SIZE;i++)
				names[j*OPTION_SIZE+i] = name[j] + "+" + Integer.toString(i*inc);
		}
		return names;
	}
	/**
	 * オプションのナンバーを作成する
	 * @return numbers
	 */
	public static Integer[] getOptionNumbers(String[] name){
		Integer[] numbers = new Integer[(OPTION_SIZE*name.length)+1];
		numbers[0] = 0;
		for(int j=0;j<name.length;j++){
			int inc = 4;
			if(name[0].equals(AVOID_NAME))
				inc = 5;
			for(int i=1;i<=OPTION_SIZE;i++)
				numbers[j*OPTION_SIZE+i] = i*inc;
		}
		return numbers;
	}
}
