package org.mudamage.mud8.client.mud.form.static_data;
/**
 * 羽のデータベース構造
 * @author SINLION
 *
 */
public class WingStaticDataStructure {
	/**
	 * 羽のデータベースを作成
	 * @param name
	 * @param jobs
	 * @param ops
	 * @param type
	 * @param def
	 * @param inc
	 * @param dec
	 */
	public WingStaticDataStructure(String name,String jobs,String ops,Integer type,Integer def,Integer inc,Integer dec){
		this.name = name;
		this.jobs = jobs.split(",");
		this.ops = ops.split(",");
		this.type = type;
		this.def = def;
		this.inc = inc;
		this.dec = dec;
	}
	/**
	 * 名前
	 */
	public String name;
	/**
	 * 装備可能職
	 */
	public String[] jobs;
	/**
	 * オプションの種類(攻撃,魔力,防御,呪い)
	 */
	public String[] ops;
	/**
	 * 羽のタイプ<br>
	 * 0:なし<br>
	 * 1:1次羽<br>
	 * 2:2次羽<br>
	 * 3:3次羽,帝王のマント<br>
	 * 4:君主のマント<br>
	 */
	public Integer type;
	/**
	 * Nでの防御力
	 */
	public Integer def;
	/**
	 * Nでのダメージ増加％
	 */
	public Integer inc;
	/**
	 * Nでのダメージ吸収％
	 */
	public Integer dec;
	
	public Boolean equalJobs(String job){
		for(String j : jobs)
			if(j.equals(job))
				return true;
		return false;
	}
}
