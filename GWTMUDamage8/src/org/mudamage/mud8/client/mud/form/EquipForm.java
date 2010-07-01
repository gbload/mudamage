package org.mudamage.mud8.client.mud.form;

import org.mudamage.mud8.client.common.CommonForm;
import org.mudamage.mud8.client.mud.form.data.FormData;
import org.mudamage.mud8.client.mud.form.event.MUDamageComposite;
import org.mudamage.mud8.client.mud.form.event.ValueEvent;
import org.mudamage.mud8.client.mud.form.static_data.EquipStaticData;
import org.mudamage.mud8.client.mud.form.static_data.JobStaticData;
import org.mudamage.mud8.client.mud.form.static_data.OptionStaticData;

import com.google.gwt.core.client.GWT;
import com.google.gwt.dom.client.AnchorElement;
import com.google.gwt.event.dom.client.ChangeEvent;
import com.google.gwt.event.dom.client.ChangeHandler;
import com.google.gwt.uibinder.client.UiBinder;
import com.google.gwt.uibinder.client.UiField;
import com.google.gwt.user.client.ui.CheckBox;
import com.google.gwt.user.client.ui.Composite;
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
	
	private ListBox[] listboxs;
	private int SUBINDEX = 1;

	private String type;
	private String RIGHT = "right";
	private String LEFT = "left";
	private String HELM = "helm";
	private String ARMOR = "armor";
	private String GLOVE = "glove";
	private String GARTER = "garter";
	private String BOOTS = "boots";
	
	private String[] kinds = {"なし","通常","EX","セット","ソケット"};
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
	public void init(FormData formdata){
		data = formdata;
		/*
		 * <select>に<option>を追加する
		 */
		CommonForm.setPlusOption(plus);
		/*
		 * イベントの設定
		 */
		// 値をセットするイベント
		for(ListBox listbox : listboxs)
			listbox.addChangeHandler(new ValueEvent(data, listbox));
		luck.addClickHandler(new ValueEvent(data, luck));
		
		// kindのイベント
		kind.addChangeHandler(new ChangeHandler() {
			@Override
			public void onChange(ChangeEvent event) {
				String value = data.getValue(kind);
				// サブフォームを全て非表示にする
				for(int i=SUBINDEX;i<listboxs.length;i++){
					listboxs[i].setVisible(false);
				}
				luck.setVisible(true);
				// TODO 通常の場合
				if(value.equals("通常")){
					// サブフォームを表示する
					for(int i=SUBINDEX;i<listboxs.length;i++){
						listboxs[i].setVisible(true);
					}
				}
				// TODO EXの場合
				// TODO セットの場合
			}
		});
		// jobによる初期化
		initJob(JobStaticData.KNIGHT);
	}
	@Override
	public void initJob(String job){
		/*
		 * <select>に<option>を追加する
		 */
		CommonForm.setOption(kind, kinds);
		if(type.equals(RIGHT)||type.equals(LEFT))
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
	private String[] getItem(String job){
		if(type.equals(RIGHT))
			return new String[0];
		else if(type.equals(LEFT))
			return new String[0];
		else if(type.equals(HELM))
			return EquipStaticData.getHelmNames(job);
		else if(type.equals(ARMOR))
			return EquipStaticData.getArmorNames(job);
		else if(type.equals(GLOVE))
			return EquipStaticData.getGloveNames(job);
		else if(type.equals(GARTER))
			return EquipStaticData.getGarterNames(job);
		else if(type.equals(BOOTS))
			return EquipStaticData.getBootsNames(job);
		else
			return new String[0];
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
		type = str;
		// kindとitemフォームの名前付け
		for(ListBox listbox : listboxs)
			listbox.setName(type+"_"+listbox.getName());
		luck.setName(type+"_"+luck.getName());
	}
}
