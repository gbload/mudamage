package org.mudamage.mud8.client.mud.static_data;
/**
 * Jobに関するデータ
 * @author SINLION
 *
 */
public class JobStaticData {
	/*
	 * 定数
	 */
	public static final Integer KNIGHT = 0;
	public static final Integer WIZARD = 1;
	public static final Integer ELF = 2;
	public static final Integer MAGIC = 3;
	public static final Integer DARKLOAD = 4;
	public static final Integer SUMMONER = 5;
	
	public static final Integer[] job_numbers = {KNIGHT,WIZARD,ELF,MAGIC,DARKLOAD,SUMMONER};
	/**
	 * ナイトを表す文字列
	 */
	public static final String KNIGHT_NAME = "ナイト";
	/**
	 * ウィザードを表す文字列
	 */
	public static final String WIZARD_NAME = "ウィザード";
	/**
	 * エルフを表す文字列
	 */
	public static final String ELF_NAME = "エルフ";
	/**
	 * 魔剣士を表す文字列
	 */
	public static final String MAGIC_NAME = "魔剣士";
	/**
	 * ダークロードを表す文字列
	 */
	public static final String DARKLOAD_NAME = "ダークロード";
	/**
	 * 召喚師を表す文字列
	 */
	public static final String SUMMONER_NAME = "召喚師";
	/**
	 * 全ての職業の文字列を格納した配列
	 */
	public static final String[] job_names = {KNIGHT_NAME,WIZARD_NAME,ELF_NAME,MAGIC_NAME,DARKLOAD_NAME,SUMMONER_NAME};

	/**
	 * Jobの名前を返す
	 * @return job_names
	 */
	public static String[] getJobNames(){
		return job_names;
	}
	/**
	 * Jobのナンバーを返す
	 * @return job_numbers
	 */
	public static Integer[] getJobNumbers(){
		return job_numbers;
	}
}
