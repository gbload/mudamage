package org.mudamage.mud8.client.mud.form;

import org.mudamage.mud8.client.common.CommonForm;
import org.mudamage.mud8.client.mud.calc.data.CalcData;
import org.mudamage.mud8.client.mud.form.event.EnchantEvent;
import org.mudamage.mud8.client.mud.form.event.EquipKindEvent;
import org.mudamage.mud8.client.mud.form.event.MUDamageComposite;
import org.mudamage.mud8.client.mud.static_data.EquipStaticData;
import org.mudamage.mud8.client.mud.static_data.FormKindStaticData;
import org.mudamage.mud8.client.mud.static_data.JobStaticData;

import com.google.gwt.core.client.GWT;
import com.google.gwt.dom.client.AnchorElement;
import com.google.gwt.uibinder.client.UiBinder;
import com.google.gwt.uibinder.client.UiField;
import com.google.gwt.user.client.ui.CheckBox;
import com.google.gwt.user.client.ui.HTMLPanel;
import com.google.gwt.user.client.ui.ListBox;
import com.google.gwt.user.client.ui.Widget;

public class EquipForm extends MUDamageComposite {

	private static EquipFormUiBinder uiBinder = GWT
			.create(EquipFormUiBinder.class);

	interface EquipFormUiBinder extends UiBinder<Widget, EquipForm> {
	}

	@UiField public AnchorElement label;
	@UiField public ListBox kind;
	@UiField public ListBox item;
	@UiField public CheckBox luck;
	@UiField public ListBox plus;
	@UiField public ListBox op;
	@UiField public ListBox enchant;
	@UiField public ListBox enchant_option;

	@UiField public HTMLPanel exop_box;
	@UiField public ListBox exop1;
	@UiField public ListBox exop2;
	@UiField public ListBox exop3;
	@UiField public ListBox exop4;
	@UiField public ListBox exop5;
	@UiField public ListBox exop6;
	
	public Integer[] kind_numbers;
	public Integer[] item_numbers;
	public Integer[] op_numbers;
	public Integer[] enchant_numbers;
	public Integer[] enchant_option_numbers;
	
	public Widget[] widgets;
	public ListBox[] exops;
	public int SUBINDEX = 1;
	public int COMMONINDEX=4;

	public Integer type;
	public Integer job = JobStaticData.KNIGHT;
	/**
	 * コンストラクタ
	 */
	public EquipForm() {
		initWidget(uiBinder.createAndBindUi(this));
		Widget[] lb = {kind,item,plus,op,luck,enchant,enchant_option,exop_box};
		widgets = lb;
		ListBox[] lb2 = {exop1,exop2,exop3,exop4,exop5,exop6};
		exops = lb2;
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
		// kindのイベント
		kind.addChangeHandler(new EnchantEvent(this));
		kind.addChangeHandler(new EquipKindEvent(this));
		// plusのイベント
		plus.addChangeHandler(new EnchantEvent(this));
		// enchantのイベント
		enchant.addChangeHandler(new EnchantEvent(this));
		
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
		this.kind_numbers = FormKindStaticData.getKindNumbers();
		
		if(type.equals(EquipStaticData.RIGHT)||type.equals(EquipStaticData.LEFT))
			CommonForm.setOption(op, CommonForm.getItemOption("攻撃"));
		else
			CommonForm.setOption(op, CommonForm.getItemOption("防御"));
		CommonForm.setOption(item, getItem(job));
		/*
		 * サブフォームを全て非表示にする
		 */
		for(int i=SUBINDEX;i<widgets.length;i++){
			widgets[i].setVisible(false);
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
