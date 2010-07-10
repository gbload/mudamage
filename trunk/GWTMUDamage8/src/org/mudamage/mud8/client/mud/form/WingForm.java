package org.mudamage.mud8.client.mud.form;

import org.mudamage.mud8.client.common.CommonEtc;
import org.mudamage.mud8.client.common.CommonForm;
import org.mudamage.mud8.client.mud.calc.data.CalcData;
import org.mudamage.mud8.client.mud.form.data.FormData;
import org.mudamage.mud8.client.mud.form.event.MUDamageComposite;
import org.mudamage.mud8.client.mud.form.event.ValueEvent;
import org.mudamage.mud8.client.mud.form.static_data.WingStaticData;

import com.google.gwt.core.client.GWT;
import com.google.gwt.event.dom.client.ChangeEvent;
import com.google.gwt.event.dom.client.ChangeHandler;
import com.google.gwt.uibinder.client.UiBinder;
import com.google.gwt.uibinder.client.UiField;
import com.google.gwt.user.client.ui.CheckBox;
import com.google.gwt.user.client.ui.ListBox;
import com.google.gwt.user.client.ui.Widget;

public class WingForm extends MUDamageComposite {

	private static WingFormUiBinder uiBinder = GWT
			.create(WingFormUiBinder.class);

	interface WingFormUiBinder extends UiBinder<Widget, WingForm> {
	}
	/*
	 * UiField
	 */
	@UiField ListBox item;
	@UiField CheckBox luck;
	@UiField ListBox plus;
	@UiField ListBox op;
	@UiField ListBox cop;
	/*
	 * 変数
	 */
	public WingForm() {
		initWidget(uiBinder.createAndBindUi(this));
	}
	/**
	 * Wingフォームを初期化します。
	 */
	@Override
	public void init(CalcData calcdata){
		data = calcdata;
		// アイテムをフォームに追加する
		CommonForm.setOption(item, WingStaticData.getNames("ナイト"));
		CommonForm.setPlusOption(plus);
		// 非表示設定
		luck.setVisible(false);
		plus.setVisible(false);
		op.setVisible(false);
		cop.setVisible(false);
		// イベントの設定
		/*
		item.addChangeHandler(new ValueEvent(data, item));
		luck.addClickHandler(new ValueEvent(data, luck));
		plus.addChangeHandler(new ValueEvent(data, plus));
		op.addChangeHandler(new ValueEvent(data, op));
		cop.addChangeHandler(new ValueEvent(data, cop));
		*/
		item.addChangeHandler(new ChangeHandler() {
			@Override
			public void onChange(ChangeEvent event) {
				// TODO 自動生成されたメソッド・スタブ
				String value = CommonForm.getSelectValue(item);
				
				// luck,plusの表示
				luck.setVisible((!value.equals("なし")));
				plus.setVisible((!value.equals("なし")));
				
				// OPの作成
				String[] ops = new String[0];
				int j = 0;
				ops = CommonEtc.concat(ops, CommonForm.getItemOption(WingStaticData.getOps(value)));
				if(ops.length!=0){
					CommonForm.setOption(op, ops);
					op.setVisible(true);
				}else{
					op.setVisible(false);
				}
				
				// COPの作成
				ops = WingStaticData.getCops(value);
				if(ops != null){
					CommonForm.setOption(cop, ops);
					cop.setVisible(true);
				}else{
					cop.setVisible(false);
				}
			}
		});
	}
}
