package org.mudamage.mud8.client.mud.form;

import org.mudamage.mud8.client.common.CommonForm;
import org.mudamage.mud8.client.mud.calc.data.CalcData;
import org.mudamage.mud8.client.mud.form.data.FormData;
import org.mudamage.mud8.client.mud.form.event.MUDamageComposite;
import org.mudamage.mud8.client.mud.form.event.ValueEvent;
import org.mudamage.mud8.client.mud.static_data.EquipStaticData;
import org.mudamage.mud8.client.mud.static_data.ExOptionStaticData;

import com.google.gwt.core.client.GWT;
import com.google.gwt.dom.client.AnchorElement;
import com.google.gwt.event.dom.client.ChangeEvent;
import com.google.gwt.event.dom.client.ChangeHandler;
import com.google.gwt.uibinder.client.UiBinder;
import com.google.gwt.uibinder.client.UiField;
import com.google.gwt.user.client.ui.ListBox;
import com.google.gwt.user.client.ui.Widget;

public class AccForm extends MUDamageComposite {

	private static AccFormUiBinder uiBinder = GWT.create(AccFormUiBinder.class);

	interface AccFormUiBinder extends UiBinder<Widget, AccForm> {
	}

	@UiField AnchorElement label;
	@UiField ListBox kind;
	@UiField ListBox item;
	@UiField ListBox exop1;
	@UiField ListBox exop2;
	@UiField ListBox exop3;
	@UiField ListBox exop4;
	@UiField ListBox exop5;
	@UiField ListBox exop6;
	private ListBox[] listboxs;
	private int SUBINDEX = 2;
	/*
	 * 変数
	 */
	private Integer type;

	private String[] neck_kinds = {"なし","EX","セット"};
	private String[] ring_kinds = {"なし","EX","セット"};
	/**
	 * コンストラクタ
	 */
	public AccForm() {
		initWidget(uiBinder.createAndBindUi(this));
		ListBox[] lb = {kind,item,exop1,exop2,exop3,exop4,exop5,exop6};
		listboxs = lb;
	}
	/**
	 * Accフォームを初期化します。
	 */
	@Override
	public void init(CalcData calcdata){
		data = calcdata;
		// kindの設定
		if(type.equals(EquipStaticData.NECK)){
			CommonForm.setOption(kind, neck_kinds);
		}else{
			CommonForm.setOption(kind, ring_kinds);
		}
		// サブフォームを全て非表示にする
		for(int i=SUBINDEX;i<listboxs.length;i++){
			listboxs[i].setVisible(false);
		}
		// イベントの設定
		//for(ListBox listbox : listboxs)
		//	listbox.addChangeHandler(new ValueEvent(data, listbox));
		
		kind.addChangeHandler(new ChangeHandler() {
			@Override
			public void onChange(ChangeEvent event) {
				String value = CommonForm.getSelectValue(kind);
				// サブフォームを全て非表示にする
				for(int i=SUBINDEX;i<listboxs.length;i++){
					listboxs[i].setVisible(false);
				}
				// EXの場合
				if(value.equals("EX")){
					for(int i=SUBINDEX;i<listboxs.length;i++){
						if(type.equals(EquipStaticData.NECK))
							CommonForm.setOption(listboxs[i], ExOptionStaticData.getWeaponExops(true, true));
						else
							CommonForm.setOption(listboxs[i], ExOptionStaticData.getGuardExops());
						listboxs[i].setName(type+"_exop"+Integer.toString(i-SUBINDEX+1));
						listboxs[i].setVisible(true);
					}
				}
				// TODO セットOPの場合
			}
		});
	}
	/*
	 * UiBinderで使うための関数
	 */
	/**
	 * このフォームのラベルを設定します。
	 * @param str
	 */
	public void setLabel(String str){
		label.setInnerText(str);
	}
	/**
	 * このフォームの種類を設定します。<br>
	 * 選択肢：[neck,ring1,ring2]
	 * @param str
	 */
	public void setType(String str){
		type = EquipStaticData.getEquipTypeNumber(str);
	}

}
