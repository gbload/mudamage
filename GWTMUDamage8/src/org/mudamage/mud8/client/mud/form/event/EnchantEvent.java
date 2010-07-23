package org.mudamage.mud8.client.mud.form.event;

import org.mudamage.mud8.client.common.CommonForm;
import org.mudamage.mud8.client.mud.static_data.EnchantOptionStaticData;
import org.mudamage.mud8.client.mud.static_data.FormKindStaticData;

import com.google.gwt.event.dom.client.ChangeEvent;
import com.google.gwt.event.dom.client.ChangeHandler;
import com.google.gwt.user.client.ui.ListBox;
/**
 * エンチャント及びOPフォームを変更するためのイベント
 * @author sinlion
 *
 */
public class EnchantEvent implements ChangeHandler {
	public EnchantEvent(ListBox kind,ListBox plus,ListBox en,ListBox enop){
		this.kind = kind;
		this.plus = plus;
		this.enchant = en;
		this.enchant_option = enop;
		
		this.now_plus = this.plus.getSelectedIndex();
	}
	public ListBox kind;
	public ListBox plus;
	public ListBox enchant;
	public ListBox enchant_option;
	
	public int now_plus;
	public int now_size;
	@Override
	public void onChange(ChangeEvent event) {
		/*
		 * 変更条件
		 */
		// kindが通常かEX
		Integer kind_value = Integer.decode(CommonForm.getSelectValue(kind));
		if(kind_value == FormKindStaticData.NORMAL
				|| kind_value == FormKindStaticData.EX){
			
			// アイテムレベルの取得
			int plus_value = plus.getSelectedIndex();
			if(now_plus == plus_value)return;
			else now_plus=plus_value;
			
			// enchantのselect indexを取得
			int enchant_index = enchant.getSelectedIndex();
			
			// enchantの表示用データ取得
			String[][] enchant_names = EnchantOptionStaticData.getEnchantGuardNames(now_plus);
			
			// enchantの変更が必要な場合
			if(now_size != enchant_names.length){
				now_size = enchant_names.length;
				
				// 現在選択中のenchantが選択できなくなった場合、選択可能な最大値を選択
				if(enchant_index >= enchant_names.length){
					enchant_index = 0;
				}
				
				// enchantの設定
				CommonForm.setOption(enchant, enchant_names);
				
				// enchantのindexの設定
				enchant.setSelectedIndex(enchant_index);
			}
			
			// enchant_optionのselect index取得
			int enchant_option_index = enchant.getSelectedIndex();
			
			// enchantの現在選択されているデータを取得
			int enchant_name = Integer.decode(CommonForm.getSelectValue(enchant));
			
			// enchant_optionの表示用データ取得
			String[] enchant_option_names = EnchantOptionStaticData.getEnchantValues(enchant_name, now_plus);
			
			// 現在選択中のenchant_optionが選択できなくなった場合、選択可能な最大値を選択
			if(enchant_option_index >= enchant_option_names.length){
				enchant_option_index = enchant_option_names.length - 1;
			}
			
			// enchant_optionの設定
			CommonForm.setOption(enchant_option, enchant_option_names);
			
			// enchant_optionのindexの設定
			enchant_option.setSelectedIndex(enchant_option_index);
		}
	}
}
