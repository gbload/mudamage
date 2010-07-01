package org.mudamage.mud8.client.mud.form;

import org.mudamage.mud8.client.common.CommonForm;
import org.mudamage.mud8.client.mud.form.data.FormData;
import org.mudamage.mud8.client.mud.form.event.ValueEvent;
import org.mudamage.mud8.client.mud.form.static_data.JobStaticData;

import com.google.gwt.core.client.GWT;
import com.google.gwt.event.dom.client.ChangeEvent;
import com.google.gwt.event.dom.client.ChangeHandler;
import com.google.gwt.uibinder.client.UiBinder;
import com.google.gwt.uibinder.client.UiField;
import com.google.gwt.user.client.ui.Composite;
import com.google.gwt.user.client.ui.ListBox;
import com.google.gwt.user.client.ui.TextBox;
import com.google.gwt.user.client.ui.Widget;

public class MUDamageForm extends Composite {

	private static MUDamageFormUiBinder uiBinder = GWT
			.create(MUDamageFormUiBinder.class);

	interface MUDamageFormUiBinder extends UiBinder<Widget, MUDamageForm> {
	}

	@UiField StatusForm status;
	@UiField TextBox title;
	@UiField TextBox exp;
	@UiField ListBox job;
	@UiField PetForm pet;
	@UiField WingForm wing;
	@UiField AccForm neck;
	@UiField EquipForm right;
	@UiField EquipForm left;
	@UiField EquipForm helm;
	@UiField EquipForm armor;
	@UiField EquipForm glove;
	@UiField EquipForm garter;
	@UiField EquipForm boots;
	@UiField AccForm ring1;
	@UiField AccForm ring2;
	
	FormData data;
	
	public MUDamageForm(FormData formdata) {
		initWidget(uiBinder.createAndBindUi(this));
		
		// フォームデータのセット
		data = formdata;
		status.init(data);
		pet.init(data);
		wing.init(data);
		neck.init(data);
		right.init(data);
		left.init(data);
		helm.init(data);
		armor.init(data);
		glove.init(data);
		garter.init(data);
		boots.init(data);
		ring1.init(data);
		ring2.init(data);
		
		// 値のセット
		CommonForm.setOption(job, JobStaticData.getJobs());
		
		// イベントの設定
		title.addChangeHandler(new ValueEvent(data, title));
		exp.addChangeHandler(new ValueEvent(data, exp));
		job.addChangeHandler(new ChangeHandler() {
			@Override
			public void onChange(ChangeEvent event) {
				// TODO 自動生成されたメソッド・スタブ
				String value = CommonForm.getSelectValue(job);
				// 前処理
				// 全体的なフォームの変更
				pet.initJobChange(value);
				// 値の保存
				data.setValue(CommonForm.getSplitName(job), CommonForm.getSelectValue(job));
				// 追随する処理
			}
		});
		
	}

}
