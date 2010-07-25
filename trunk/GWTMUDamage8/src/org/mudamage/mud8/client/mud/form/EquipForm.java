package org.mudamage.mud8.client.mud.form;

import org.mudamage.mud8.client.common.CommonForm;
import org.mudamage.mud8.client.mud.calc.data.CalcData;
import org.mudamage.mud8.client.mud.form.event.EnchantEvent;
import org.mudamage.mud8.client.mud.form.event.MUDamageComposite;
import org.mudamage.mud8.client.mud.static_data.EnchantOptionStaticData;
import org.mudamage.mud8.client.mud.static_data.EquipStaticData;
import org.mudamage.mud8.client.mud.static_data.ExOptionStaticData;
import org.mudamage.mud8.client.mud.static_data.FormKindStaticData;
import org.mudamage.mud8.client.mud.static_data.JobStaticData;

import com.google.gwt.core.client.GWT;
import com.google.gwt.dom.client.AnchorElement;
import com.google.gwt.event.dom.client.ChangeEvent;
import com.google.gwt.event.dom.client.ChangeHandler;
import com.google.gwt.uibinder.client.UiBinder;
import com.google.gwt.uibinder.client.UiField;
import com.google.gwt.user.client.ui.CheckBox;
import com.google.gwt.user.client.ui.ListBox;
import com.google.gwt.user.client.ui.Widget;

public class EquipForm extends MUDamageComposite {

	private static EquipFormUiBinder uiBinder = GWT
			.create(EquipFormUiBinder.class);

	interface EquipFormUiBinder extends UiBinder<Widget, EquipForm> {
	}

	@UiField AnchorElement label;
	@UiField ListBox kind;
	@UiField ListBox item;
	@UiField CheckBox luck;
	@UiField ListBox plus;
	@UiField ListBox op;
	@UiField ListBox en;
	@UiField ListBox enop;
	
	private ListBox[] listboxs;
	private int SUBINDEX = 1;

	private Integer type;
	private Integer job = JobStaticData.KNIGHT;
	/**
	 * コンストラクタ
	 */
	public EquipForm() {
		initWidget(uiBinder.createAndBindUi(this));
		ListBox[] lb = {kind,item,plus,op};
		listboxs = lb;
	}
	/**
	 * Equipフォームを初期化します。
	 */
	@Override
	public void init(CalcData calcdata){
		data = calcdata;
		/*
		 * <select>に<option>を追加する
		 */
		CommonForm.setPlusOption(plus);
		/*
		 * イベントの設定
		 */
		// 値をセットするイベント
		//for(ListBox listbox : listboxs)
		//	listbox.addChangeHandler(new ValueEvent(data, listbox));
		//luck.addClickHandler(new ValueEvent(data, luck));
		
		// kindのイベント
		kind.addChangeHandler(new EnchantEvent(kind, plus, en, enop));
		kind.addChangeHandler(new ChangeHandler() {
			@Override
			public void onChange(ChangeEvent event) {
				int value = Integer.decode(CommonForm.getSelectValue(kind));
				// サブフォームを全て非表示にする
				for(int i=SUBINDEX;i<listboxs.length;i++){
					listboxs[i].setVisible(false);
				}
				luck.setVisible(true);
				// TODO 通常/EXの場合
				if(value == FormKindStaticData.NORMAL||value == FormKindStaticData.EX){
					Integer plus_value = plus.getSelectedIndex();
					// サブフォームを表示する
					for(int i=SUBINDEX;i<listboxs.length;i++){
						listboxs[i].setVisible(true);
					}
					// アイテム名をセットする
					CommonForm.setOption(item, EquipStaticData.getNames(type, job));
					// エンチャントOPをセットする
					CommonForm.setOption(en, EnchantOptionStaticData.getEnchantGuardNames(plus_value));
				}
				// TODO セットの場合
				// TODO ソケットの場合
			}
		});
		// plusのイベント
		plus.addChangeHandler(new EnchantEvent(kind, plus, en, enop));
		// enのイベント
		en.addChangeHandler(new EnchantEvent(kind, plus, en, enop));
		
		// jobによる初期化
		initJob(job);
	}
	/**
	 * 職変更による初期化
	 * @param job
	 */
	@Override
	public void initJob(Integer job){
		this.job = job;
		/*
		 * <select>に<option>を追加する
		 */
		CommonForm.setOption(kind,FormKindStaticData.getKindNames());
		if(type.equals(EquipStaticData.RIGHT)||type.equals(EquipStaticData.LEFT))
			CommonForm.setOption(op, CommonForm.getItemOption("攻撃"));
		else
			CommonForm.setOption(op, CommonForm.getItemOption("防御"));
		CommonForm.setOption(item, getItem(job));
		/*
		 * サブフォームを全て非表示にする
		 */
		for(int i=SUBINDEX;i<listboxs.length;i++){
			listboxs[i].setVisible(false);
		}
		luck.setVisible(false);
	}
	/**
	 * アイテム名を取得します。
	 * @param job
	 * @return names
	 */
	private String[][] getItem(Integer job){
		if(type.equals(EquipStaticData.RIGHT))
			return new String[0][0];
		else if(type.equals(EquipStaticData.LEFT))
			return new String[0][0];
		else
			return EquipStaticData.getNames(type, job);
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
	 * 選択肢：[right,left,helm,armor,glove,garter,boots]
	 * @param str
	 */
	public void setType(String str){
		type = EquipStaticData.getEquipTypeNumber(str);
	}
}
