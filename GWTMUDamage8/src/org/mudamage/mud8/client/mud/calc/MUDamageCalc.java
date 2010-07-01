package org.mudamage.mud8.client.mud.calc;

import org.mudamage.mud8.client.mud.form.data.FormData;

/**
 * 計算を行います。
 * @author SINLION
 *
 */
public class MUDamageCalc {
	private FormData formdata;
	public MUDamageCalc(FormData data){
		formdata = data;
	}
	public Integer getHP(){return new Integer(1);}
}
