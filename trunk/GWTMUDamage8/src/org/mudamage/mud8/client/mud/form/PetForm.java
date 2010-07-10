package org.mudamage.mud8.client.mud.form;

import org.mudamage.mud8.client.common.CommonForm;
import org.mudamage.mud8.client.mud.calc.data.CalcData;
import org.mudamage.mud8.client.mud.form.data.FormData;
import org.mudamage.mud8.client.mud.form.event.MUDamageComposite;
import org.mudamage.mud8.client.mud.form.event.ValueEvent;
import org.mudamage.mud8.client.mud.form.static_data.PetStaticData;

import com.google.gwt.core.client.GWT;
import com.google.gwt.event.dom.client.ChangeEvent;
import com.google.gwt.event.dom.client.ChangeHandler;
import com.google.gwt.uibinder.client.UiBinder;
import com.google.gwt.uibinder.client.UiField;
import com.google.gwt.user.client.ui.ListBox;
import com.google.gwt.user.client.ui.Widget;

public class PetForm extends MUDamageComposite {

	private static PetFormUiBinder uiBinder = GWT.create(PetFormUiBinder.class);

	interface PetFormUiBinder extends UiBinder<Widget, PetForm> {
	}
	
	/*
	 * UiFiled
	 */
	@UiField ListBox petitem;
	@UiField ListBox petsub1;
	@UiField ListBox petsub2;
	/*
	 * コンストラクタ
	 */
	public PetForm() {
		initWidget(uiBinder.createAndBindUi(this));
	}
	/**
	 * Petフォームを初期化します。
	 * @param formdata
	 */
	public void init(CalcData calcdata){
		data = calcdata;
		// ペットアイテムを設定する
		CommonForm.setOption(petitem, PetStaticData.getPetNames());
		// ペットサブフォームの設定をする
		petsub1.setVisible(false);
		petsub2.setVisible(false);
		// イベントの設定
		petitem.addChangeHandler(new ValueEvent(data.pet, petitem));
		petitem.addChangeHandler(new ChangeHandler() {
			@Override
			public void onChange(ChangeEvent event) {
				// TODO 自動生成されたメソッド・スタブ
				// バリデーション
				// 追随する処理
				// サブフォームの表示と非表示の切り替え
				// とりあえず全部非表示
				Integer value = data.pet;//data.getValue(petitem);
				petsub1.setVisible(false);
				petsub2.setVisible(false);
				if(value.equals(PetStaticData.DINO)){
					CommonForm.setOption(petsub1, PetStaticData.getDinoOp());
					CommonForm.setOption(petsub2, PetStaticData.getDinoOp());
					petsub1.setName("dinoluntop1");
					petsub2.setName("dinoluntop2");
					petsub1.setVisible(true);
					petsub2.setVisible(true);
				}else if(value.equals(PetStaticData.FENRIR)){
					CommonForm.setOption(petsub1, PetStaticData.getFenrirOp());
					petsub1.setName("fenrirop");
					petsub1.setVisible(true);
				}else if(value.equals(PetStaticData.DARKHORSE)){
					CommonForm.setOption(petsub1, PetStaticData.getDarkHorseLv());
					petsub1.setName("darkhorselv");
					petsub1.setVisible(true);
				}
			}
		});
		petsub1.addChangeHandler(new ValueEvent(data.petsub1, petsub1));
		petsub2.addChangeHandler(new ValueEvent(data.petsub2, petsub2));
	}
	/**
	 * jobを指定して、フォームの状態を変更します。
	 * @param jobname
	 */
	public void initJobChange(String jobname){
		// TODO 
		if(jobname.equals("ダークロード")){
		}else{
		}
		// ペットアイテムを設定する
	}
}
