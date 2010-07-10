package org.mudamage.mud8.client.mud.form.event;

import org.mudamage.mud8.client.common.CommonForm;
import org.mudamage.mud8.client.mud.form.data.FormData;

import com.google.gwt.event.dom.client.ChangeEvent;
import com.google.gwt.event.dom.client.ChangeHandler;
import com.google.gwt.event.dom.client.ClickEvent;
import com.google.gwt.event.dom.client.ClickHandler;
import com.google.gwt.user.client.ui.CheckBox;
import com.google.gwt.user.client.ui.ListBox;
import com.google.gwt.user.client.ui.TextBox;

public class ValueEvent implements ChangeHandler,ClickHandler {
	public ValueEvent(Integer data,ListBox listbox){
		super();
		this.data = data;
		this.listbox = listbox;
		this.type = "listbox";
	}
	public ValueEvent(Integer data,TextBox textbox){
		super();
		this.data = data;
		this.textbox = textbox;
		this.type = "textbox";
	}
	public ValueEvent(Integer data,CheckBox checkbox){
		super();
		this.data = data;
		this.checkbox = checkbox;
		this.type = "textbox";
	}
	private Integer data;
	private String type;
	private ListBox listbox;
	private TextBox textbox;
	private CheckBox checkbox;
	@Override
	public void onChange(ChangeEvent event) {
		// 値のセット
		if(type.equals("listbox"))data = Integer.decode(CommonForm.getSelectValue(listbox));
		if(type.equals("textbox"))data = Integer.decode(textbox.getValue());
	}
	@Override
	public void onClick(ClickEvent event) {
		// 値のセット
		//if(type.equals("checkbox"))data.setValue(checkbox);
	}
}
