package org.mudamage.mud8.client.mud.calc;

import org.mudamage.mud8.client.mud.calc.data.CalcData;
import org.mudamage.mud8.client.mud.form.data.FormData;

/**
 * 計算を行います。
 * @author SINLION
 *
 */
public class DamageCalc {
	private FormData formdata;
	public DamageCalc(FormData data){
		formdata = data;
	}
	public Integer getHP(){return new Integer(1);}
	
	public static int calcSkill(CalcData c){
		return 0;
	}
}
