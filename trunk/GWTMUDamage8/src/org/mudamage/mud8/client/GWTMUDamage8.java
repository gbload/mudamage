package org.mudamage.mud8.client;

import org.mudamage.mud8.client.mud.calc.MUDamageResultForm;
import org.mudamage.mud8.client.mud.calc.data.CalcData;
import org.mudamage.mud8.client.mud.form.MUDamageForm;
import org.mudamage.mud8.client.mud.form.data.FormData;

import com.google.gwt.core.client.EntryPoint;
import com.google.gwt.user.client.ui.RootPanel;

/**
 * Entry point classes define <code>onModuleLoad()</code>.
 */
public class GWTMUDamage8 implements EntryPoint {
	/**
	 * This is the entry point method.
	 */
	public void onModuleLoad() {
		CalcData calcdata = new CalcData();
		final MUDamageForm mudf = new MUDamageForm(calcdata);
		final MUDamageResultForm mudr = new MUDamageResultForm(calcdata);
		RootPanel.get("mud").add(mudf);
		RootPanel.get("mud_result").add(mudr);
	}
}
