package org.mudamage.mud8.client.mud.form.event;

import org.mudamage.mud8.client.common.CommonForm;
import org.mudamage.mud8.client.mud.form.EquipForm;
import org.mudamage.mud8.client.mud.static_data.EquipStaticData;
import org.mudamage.mud8.client.mud.static_data.ExOptionStaticData;
import org.mudamage.mud8.client.mud.static_data.FormKindStaticData;

import com.google.gwt.event.dom.client.ChangeEvent;
import com.google.gwt.event.dom.client.ChangeHandler;
import com.google.gwt.user.client.ui.ListBox;
/**
 * Kindフォームによる表示変更のためのイベント
 * @author SINLION
 *
 */
public class EquipKindEvent implements ChangeHandler {
	public EquipKindEvent(EquipForm form){
		this.form = form;
	}
	
	public EquipForm form;
	
	@Override
	public void onChange(ChangeEvent event) {
		int value = form.kind_numbers[CommonForm.getSelectIndex(form.kind)];
		
		// サブフォームを全て非表示にする
		for(int i=form.SUBINDEX;i<form.widgets.length;i++){
			form.widgets[i].setVisible(false);
		}
		
		// TODO 通常/EXの場合
		if(value == FormKindStaticData.NORMAL||value == FormKindStaticData.EX){
			// サブフォームを表示する
			for(int i=form.SUBINDEX;i<form.COMMONINDEX;i++){
				form.widgets[i].setVisible(true);
			}
			// エンチャントの表示
			form.enchant.setVisible(true);
			form.enchant_option.setVisible(true);
			
			// アイテム名をセットする
			CommonForm.setOption(form.item, EquipStaticData.getNames(form.type, form.job));
			
			// EXの場合
			if(value == FormKindStaticData.EX){
				form.exop_box.setVisible(true);
				for(ListBox exop : form.exops)
					CommonForm.setOption(exop, ExOptionStaticData.getGuardExopNames());
			}
		}
		
		// TODO セットの場合
		// TODO ソケットの場合
	}

}
