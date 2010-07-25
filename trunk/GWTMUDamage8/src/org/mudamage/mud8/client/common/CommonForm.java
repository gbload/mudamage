package org.mudamage.mud8.client.common;

import com.google.gwt.user.client.ui.CheckBox;
import com.google.gwt.user.client.ui.Composite;
import com.google.gwt.user.client.ui.FocusWidget;
import com.google.gwt.user.client.ui.ListBox;
import com.google.gwt.user.client.ui.TextBox;
import com.google.gwt.user.client.ui.Widget;

public class CommonForm {
	/**
	 * 文字列の配列optionsをリストボックスのアイテムとしてそれぞれ追加します。
	 * @param listbox
	 * @param options
	 * @return
	 */
	public static ListBox setOption(ListBox listbox,String[] options){
		listbox.clear();
		for(int i=0;i<options.length;i++)
			listbox.addItem(options[i]);
		return listbox;
	}
	/**
	 * 文字列の配列optionsをリストボックスのアイテムとしてそれぞれ追加します。
	 * @param listbox
	 * @param options [option,value]
	 * @return
	 */
	public static ListBox setOption(ListBox listbox,String[][] options){
		listbox.clear();
		for(int i=0;i<options.length;i++){
			listbox.addItem(options[i][0],options[i][1]);
		}
		return listbox;
	}
	/**
	 * ListBoxの値を取得します。
	 * @param listbox
	 * @return
	 */
	public static String getSelectValue(ListBox listbox){
		return listbox.getValue(listbox.getSelectedIndex());
	}
	/**
	 * ListBoxの名前を分割します。
	 * @param listbox
	 * @return
	 */
	public static String[] getSplitName(ListBox listbox){
		return listbox.getName().split("_");
	}
	/**
	 * TextBoxの名前を分割します。
	 * @param textbox
	 * @return
	 */
	public static String[] getSplitName(TextBox textbox){
		return textbox.getName().split("_");
	}
	/**
	 * CheckBoxの名前を分割します。
	 * @param checkbox
	 * @return
	 */
	public static String[] getSplitName(CheckBox checkbox){
		return checkbox.getName().split("_");
	}
	/**
	 * Widgetに名前をセットします。
	 * @param type
	 * @param listbox
	 */
	public static void setTypeName(String type,ListBox listbox){
		listbox.setName(type+"_"+listbox.getName());
	}
	/**
	 * Widgetに名前をセットします。
	 * @param type
	 * @param checkbox
	 */
	public static void setTypeName(String type,CheckBox checkbox){
		checkbox.setName(type+"_"+checkbox.getName());
	}
	/**
	 * アイテムレベルをセットします。
	 * @param plus
	 * @return
	 */
	public static ListBox setPlusOption(ListBox plus){
		plus.clear();
		for(int i=0;i<=15;i++)
			if(i==0)
				plus.addItem("N");
			else
				plus.addItem("+"+Integer.toString(i));
		return plus;
	}
	/**
	 * 装備のOPを返します。
	 * @param opnames
	 * @return
	 */
	public static String[] getItemOption(String[] opnames){
		String[] ops = new String[1 + opnames.length*4];
		int size = 0;
		ops[size++] = "";
		for(String str : opnames)
			for(int i=4;i<=16;i+=4)
				ops[size++] = str + "+" + Integer.toString(i);
		return ops;
	}
	/**
	 * 装備のOPを返します。
	 * @param opname
	 * @return
	 */
	public static String[] getItemOption(String opname){
		String[] ops = new String[1 + 4];
		int size = 0;
		ops[size++] = "";
		for(int i=4;i<=16;i+=4)
			ops[size++] = opname + "+" + Integer.toString(i);
		return ops;
	}
	public static int getSelectIndex(ListBox listbox){
		int index = listbox.getSelectedIndex();
		if(index == -1)index = 0;
		return index;
	}
}
