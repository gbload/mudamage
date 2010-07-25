package org.mudamage.mud8.client.mud.form.event;

import org.mudamage.mud8.client.common.CommonForm;
import org.mudamage.mud8.client.mud.form.EquipForm;
import org.mudamage.mud8.client.mud.static_data.EnchantOptionStaticData;
import org.mudamage.mud8.client.mud.static_data.FormKindStaticData;

import com.google.gwt.event.dom.client.ChangeEvent;
import com.google.gwt.event.dom.client.ChangeHandler;
/**
 * エンチャント及びOPフォームを変更するためのイベント
 * @author SINLION
 *
 */
public class EnchantEvent implements ChangeHandler {
	public EnchantEvent(EquipForm form){
		this.form = form;
	}
	/*
	 * 外部から読み込む変数
	 */
	private EquipForm form;
	/*
	 * 内部で使う変数
	 */
	/**
	 * Enchantフォームを変更する。
	 * @param plus_value
	 */
	private void changeEnchant(int plus_value){
		// enchantの表示用データ取得
		String[] enchant_names = EnchantOptionStaticData.getEnchantGuardNames(plus_value);
		form.enchant_numbers = EnchantOptionStaticData.getEnchantGuardNumbers(plus_value);

		// enchantのselect indexを取得
		int enchant_index = form.enchant.getSelectedIndex();

		// 現在選択中のenchantが選択できなくなった場合、0を選択
		if (enchant_index >= enchant_names.length) {
			enchant_index = 0;
		}

		// enchantの設定
		CommonForm.setOption(form.enchant, enchant_names);

		// enchantのindexの設定
		form.enchant.setSelectedIndex(enchant_index);
	}
	/**
	 * EnchantOptionフォームを変更する
	 * @param plus_value
	 */
	private void changeEnchantOption(int plus_value){
		// enchantの現在選択されているデータを取得
		int enchant_number = form.enchant_numbers[CommonForm.getSelectIndex(form.enchant)];
		
		// enchant_optionのselect index取得
		int enchant_option_index = form.enchant_option.getSelectedIndex();
		
		// enchant_optionの表示用データ取得
		String[] enchant_option_names = EnchantOptionStaticData.getEnchantValues(enchant_number, plus_value);
		form.enchant_option_numbers = EnchantOptionStaticData.getEnchantValueNumbers(enchant_number, plus_value);
		
		// 現在選択中のenchant_optionが選択できなくなった場合、選択可能な最大値を選択
		if(enchant_option_index >= enchant_option_names.length){
			enchant_option_index = enchant_option_names.length - 1;
		}
		
		// enchant_optionの設定
		CommonForm.setOption(form.enchant_option, enchant_option_names);
		
		// enchant_optionのindexの設定
		form.enchant_option.setSelectedIndex(enchant_option_index);
	}
	/**
	 * ChangeEvent
	 */
	@Override
	public void onChange(ChangeEvent event) {
		/*
		 * 変更条件
		 */
		// kindが通常かEX
		Integer kind_value = form.kind_numbers[CommonForm.getSelectIndex(form.kind)];
		if(kind_value == FormKindStaticData.NORMAL
				|| kind_value == FormKindStaticData.EX){
			
			// アイテムレベルの取得
			int plus_value = CommonForm.getSelectIndex(form.plus);
			
			// Enchantフォームの変更
			changeEnchant(plus_value);
			
			// EnchantOptionフォームの変更
			changeEnchantOption(plus_value);
		}
	}
}
