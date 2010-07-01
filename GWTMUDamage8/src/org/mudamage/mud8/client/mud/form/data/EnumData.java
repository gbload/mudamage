package org.mudamage.mud8.client.mud.form.data;

import org.mudamage.mud8.client.common.CommonForm;

import com.google.gwt.user.client.Window;
import com.google.gwt.user.client.ui.CheckBox;
import com.google.gwt.user.client.ui.ListBox;
import com.google.gwt.user.client.ui.TextBox;

public class EnumData {
	enum DataNumber {
		// null
		error,
	}
	public Enum[] numbers; 
	/**
	 * データを保持するための変数
	 */
	public String[] data;
	/**
	 * 更に下層のデータクラスを保持するための変数
	 */
	public EnumData[] enumdata;
	
	public EnumData(){
		numbers = DataNumber.values();
		data =  new String[DataNumber.values().length];
		enumdata = new EnumData[DataNumber.values().length];
	}
	/**
	 * 指定したインデックスのデータを返す
	 * @param number
	 * @return
	 */
	public int getValue(Enum number){
		return Integer.decode(data[number.ordinal()]);
	}
	/**
	 * 指定した名前のデータを返す
	 * @param names 階層構造の名前の配列を渡す
	 * @return value
	 */
	public String getValue(String[] names){
		String name = names[0];
		int num=DataNumber.error.ordinal();
		// enumの探索
		for(Enum n : numbers){
			if(name.equals(n.name())){
				num = n.ordinal();
				break;
			}
		}
		// 見つからなかった場合
		if(num==0){return "";}
		// EnumDataの場合
		if(names.length > 1){
			String[] str = new String[names.length-1];
			for(int i=1;i<names.length;i++){
				str[i-1] = names[i];
			}
			return enumdata[num].getValue(str);
		}
		// Stringの場合
		else{
			return data[num];
		}
	}
	/**
	 * 指定した名前のデータを返す
	 * @param listbox
	 * @return
	 */
	public String getValue(ListBox listbox){
		return getValue(CommonForm.getSplitName(listbox));
	}
	/**
	 * 指定した名前のデータを返す
	 * @param textbox
	 * @return
	 */
	public String getValue(TextBox textbox){
		return getValue(CommonForm.getSplitName(textbox));
	}
	/**
	 * 指定した名前のデータを返す
	 * @param checkbox
	 * @return
	 */
	public String getValue(CheckBox checkbox){
		return getValue(CommonForm.getSplitName(checkbox));
	}
	/**
	 * 指定した名前のデータを保存する
	 * @param names
	 * @param value
	 */
	public void setValue(String[] names,String value){
		String name = names[0];
		int num=DataNumber.error.ordinal();
		// enumの探索
		for(Enum n : numbers){
			if(name.equals(n.name())){
				num = n.ordinal();
				break;
			}
		}
		// 見つからなかった場合
		if(num==0){Window.alert("error setValue()");return;}
		// EnumDataの場合
		if(names.length > 1){
			String[] str = new String[names.length-1];
			for(int i=1;i<names.length;i++){
				str[i-1] = names[i];
			}
			enumdata[num].setValue(str,value);
		}
		// Stringの場合
		else{
			data[num] = value;
		}
	}
	/**
	 * 指定したフォームのデータを保存する
	 * @param listbox
	 */
	public void setValue(ListBox listbox){
		setValue(CommonForm.getSplitName(listbox),CommonForm.getSelectValue(listbox));
	}
	/**
	 * 指定したフォームのデータを保存する
	 * @param textbox
	 */
	public void setValue(TextBox textbox){
		setValue(CommonForm.getSplitName(textbox),textbox.getValue());
	}
	/**
	 * 指定したフォームのデータを保存する
	 * @param checkbox
	 */
	public void setValue(CheckBox checkbox){
		setValue(CommonForm.getSplitName(checkbox),checkbox.getValue().toString());
	}
}
