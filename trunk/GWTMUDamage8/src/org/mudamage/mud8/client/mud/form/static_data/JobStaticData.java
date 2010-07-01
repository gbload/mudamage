package org.mudamage.mud8.client.mud.form.static_data;
/**
 * Jobに関するデータ
 * @author SINLION
 *
 */
public class JobStaticData {
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
	public static String[] jobs = {KNIGHT,WIZARD,ELF,MAGIC,DARKLOAD,SUMMONER};
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
	public static String getJobString(int jobnum){
		return jobs[jobnum];
	}
	/**
	 * 全ての職業の文字列を格納した配列を返します。
	 * @return jobs
	 */
	public static String[] getJobs(){
		return jobs;
	}
}
