package org.mudamage.mud8.client.mud.form.event;

import org.mudamage.mud8.client.mud.form.data.FormData;

import com.google.gwt.user.client.ui.Composite;

public class MUDamageComposite extends Composite {
	/**
	 * フォームのデータを保持するための変数
	 */
	public FormData data;
	/**
	 * このフォームを初期化します。
	 * @param formdata
	 */
	public void init(FormData formdata){
		data = formdata;
	}
	/**
	 * jobでフォームを初期化します。
	 */
	public void initJob(String job){
		
	}
}
