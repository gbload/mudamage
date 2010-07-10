package org.mudamage.mud8.client.mud.form;

import org.mudamage.mud8.client.mud.calc.data.CalcData;
import org.mudamage.mud8.client.mud.form.data.FormData;
import org.mudamage.mud8.client.mud.form.event.MUDamageComposite;
import org.mudamage.mud8.client.mud.form.event.ValueEvent;

import com.google.gwt.core.client.GWT;
import com.google.gwt.dom.client.AnchorElement;
import com.google.gwt.uibinder.client.UiBinder;
import com.google.gwt.uibinder.client.UiField;
import com.google.gwt.user.client.ui.TextBox;
import com.google.gwt.user.client.ui.Widget;

public class StatusForm extends MUDamageComposite {

	private static StatusFormUiBinder uiBinder = GWT
			.create(StatusFormUiBinder.class);

	interface StatusFormUiBinder extends UiBinder<Widget, StatusForm> {
	}
	
	@UiField TextBox lv;

	@UiField AnchorElement point;
	@UiField AnchorElement maxpoint;
	@UiField AnchorElement fruit;
	@UiField AnchorElement maxfruit;
	
	@UiField TextBox str;
	@UiField TextBox agi;
	@UiField TextBox vit;
	@UiField TextBox ene;
	@UiField TextBox rec;
	
	private TextBox[] textboxs;

	/**
	 * コンストラクタ
	 */
	public StatusForm() {
		initWidget(uiBinder.createAndBindUi(this));
		TextBox[] tb = {lv,str,agi,vit,ene,rec};
		textboxs = tb;
	}
	/**
	 * Statusフォームを初期化します。
	 */
	@Override
	public void init(CalcData calcdata){
		data = calcdata;
		/*
		 * <select>に<option>を追加する
		 */
		/*
		 * イベントの設定
		 */
		// 値の保存イベント
		lv.addChangeHandler(new ValueEvent(data.lv, lv));
		str.addChangeHandler(new ValueEvent(data.str, lv));
		agi.addChangeHandler(new ValueEvent(data.agi, lv));
		vit.addChangeHandler(new ValueEvent(data.vit, lv));
		ene.addChangeHandler(new ValueEvent(data.ene, lv));
		rec.addChangeHandler(new ValueEvent(data.rec, lv));
	}	

	@Override
	public void initJob(Integer job){
		
	}
}
