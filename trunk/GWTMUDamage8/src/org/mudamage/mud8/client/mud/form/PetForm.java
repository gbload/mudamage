package org.mudamage.mud8.client.mud.form;

import org.mudamage.mud8.client.common.CommonForm;
import org.mudamage.mud8.client.mud.form.data.FormData;
import org.mudamage.mud8.client.mud.form.event.MUDamageComposite;
import org.mudamage.mud8.client.mud.form.event.ValueEvent;

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
	 * 変数
	 */
	private String[] items = {"なし", "サタン", "守護天使", "デーモン", "守護精霊", "ユニリア", "ディノラント", "フェンリル", "白と黒のポンガ", "白銀のアリオン"};
	private String[] dinoop = {"", "AG+50", "攻撃速度+5", "ダメージ吸収+5%"};
	private String[] fenrirop = {"", "ノーマル", "破壊", "守護", "黄金"};
	private String[] darkhorselv = new String[50];
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
	public void init(FormData formdata){
		data = formdata;
		// ダークホースLvの配列を作成する
		for(int i=1;i<=50;i++){
			darkhorselv[i-1] = "Lv"+i;
		}
		// ペットアイテムを設定する
		CommonForm.setOption(petitem, items);
		// ペットサブフォームの設定をする
		petsub1.setVisible(false);
		petsub2.setVisible(false);
		// イベントの設定
		petitem.addChangeHandler(new ValueEvent(data, petitem));
		petitem.addChangeHandler(new ChangeHandler() {
			@Override
			public void onChange(ChangeEvent event) {
				// TODO 自動生成されたメソッド・スタブ
				// バリデーション
				// 追随する処理
				// サブフォームの表示と非表示の切り替え
				// とりあえず全部非表示
				String value = data.getValue(petitem);
				petsub1.setVisible(false);
				petsub2.setVisible(false);
				if(value.equals("ディノラント")){
					CommonForm.setOption(petsub1, dinoop);
					CommonForm.setOption(petsub2, dinoop);
					petsub1.setName("dinoluntop1");
					petsub2.setName("dinoluntop2");
					petsub1.setVisible(true);
					petsub2.setVisible(true);
				}else if(value.equals("フェンリル")){
					CommonForm.setOption(petsub1, fenrirop);
					petsub1.setName("fenrirop");
					petsub1.setVisible(true);
				}else if(value.equals("ダークホース")){
					CommonForm.setOption(petsub1, darkhorselv);
					petsub1.setName("darkhorselv");
					petsub1.setVisible(true);
				}
			}
		});
		petsub1.addChangeHandler(new ValueEvent(data, petsub1));
		petsub2.addChangeHandler(new ValueEvent(data, petsub2));
	}
	/**
	 * jobを指定して、フォームの状態を変更します。
	 * @param jobname
	 */
	public void initJobChange(String jobname){
		String[] str;
		if(jobname.equals("ダークロード")){
			str = new String[items.length];
			for(int i=0;i<items.length;i++){
				str[i] = items[i];
			}
			str[items.length] = "ダークホース";
		}else{
			str = items;
		}
		// ペットアイテムを設定する
		CommonForm.setOption(petitem, str);
	}
}
