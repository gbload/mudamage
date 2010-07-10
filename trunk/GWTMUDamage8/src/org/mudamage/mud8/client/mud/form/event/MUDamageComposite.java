package org.mudamage.mud8.client.mud.form.event;

import org.mudamage.mud8.client.mud.calc.data.CalcData;

import com.google.gwt.user.client.ui.Composite;

public class MUDamageComposite extends Composite {
	/**
	 * フォームのデータを保持するための変数
	 */
	public CalcData data;
	/**
	 * このフォームを初期化します。
	 * @param calcdata
	 */
	public void init(CalcData calcdata){
		data = calcdata;
	}
	/**
	 * jobでフォームを初期化します。
	 */
	public void initJob(Integer job){
		
	}
}
