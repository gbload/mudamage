package org.mudamage.mud8.client.mud.form.static_data;
/**
 * Jobに関するデータ
 * @author SINLION
 *
 */
public class JobStaticData {
	public static final Integer KNIGHT_NUM = 0;
	public static final Integer WIZARD_NUM = 1;
	public static final Integer ELF_NUM = 2;
	public static final Integer MAGIC_NUM = 3;
	public static final Integer DARKLOAD_NUM = 4;
	public static final Integer SUMMONER_NUM = 5;
	/**
	 * ナイトを表す文字列
	 */
	public static final String KNIGHT = "ナイト";
	/**
	 * ウィザードを表す文字列
	 */
	public static final String WIZARD = "ウィザード";
	/**
	 * エルフを表す文字列
	 */
	public static final String ELF = "エルフ";
	/**
	 * 魔剣士を表す文字列
	 */
	public static final String MAGIC = "魔剣士";
	/**
	 * ダークロードを表す文字列
	 */
	public static final String DARKLOAD = "ダークロード";
	/**
	 * 召喚師を表す文字列
	 */
	public static final String SUMMONER = "召喚師";
	/**
	 * 全ての職業の文字列を格納した配列
	 */
	public static String[][] jobs = {
		{KNIGHT,KNIGHT_NUM.toString()},
		{WIZARD,WIZARD_NUM.toString()},
		{ELF,ELF_NUM.toString()},
		{MAGIC,MAGIC_NUM.toString()},
		{DARKLOAD,DARKLOAD_NUM.toString()},
		{SUMMONER,SUMMONER_NUM.toString()}
	};
	/**
	 * 各職業に対応した数字を返します。
	 * @param job
	 * @return job_number
	 */
	public static int getJobNumber(String job){
		for(int i=0;i<jobs.length;i++)
			if(jobs[i].equals(job))
				return i;
		return -1;
	}
	/**
	 * 各職業に対応した数字から各職業の文字列を返します。
	 * @param jobnum
	 * @return job_name
	 */
	/*
	public static String getJobString(int jobnum){
		return jobs[jobnum];
	}
	*/
	/**
	 * 全ての職業の文字列を格納した配列を返します。
	 * @return jobs
	 */
	public static String[][] getJobs(){
		return jobs;
	}
}
