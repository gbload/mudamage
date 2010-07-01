package org.mudamage.mud8.client.mud.form.event;

import org.mudamage.mud8.client.mud.form.data.FormData;

import com.google.gwt.dom.client.Element;
import com.google.gwt.event.dom.client.ChangeEvent;
import com.google.gwt.user.client.Window;

public class FormValue {
	/*
	public static void setValue(ChangeEvent event,FormData data){
		// イベントの呼び出し元の要素を取得
		Element elem = event.getRelativeElement();
		// 要素から名前を取得
		String name = elem.getAttribute("name");
		// 要素から値を取得
		Window.alert(elem.getClassName());
		String value="";
		if(elem.getClassName().equals("gwt-ListBox")){
			value = elem.getAttribute("value");
		}
		data.setValue(name.split("_"), value);
		Window.alert(value);
	}
	*/
	//public static native String getSelectedValue(Element e)
	/*{
		val: function( value ) {
		if ( value === undefined ) {			
			var elem = this[0];

			if ( elem ) {
				if( jQuery.nodeName( elem, 'option' ) )
					return (elem.attributes.value || {}).specified ? elem.value : elem.text;
				
				// We need to handle select boxes special
				if ( jQuery.nodeName( elem, "select" ) ) {
					var index = elem.selectedIndex,
						values = [],
						options = elem.options,
						one = elem.type == "select-one";

					// Nothing was selected
					if ( index < 0 )
						return null;

					// Loop through all the selected options
					for ( var i = one ? index : 0, max = one ? index + 1 : options.length; i < max; i++ ) {
						var option = options[ i ];

						if ( option.selected ) {
							// Get the specifc value for the option
							value = jQuery(option).val();

							// We don't need an array for one selects
							if ( one )
								return value;

							// Multi-Selects return an array
							values.push( value );
						}
					}

					return values;				
				}

				// Everything else, we just grab the value
				return (elem.value || "").replace(/\r/g, "");

			}

			return undefined;
		}

		if ( typeof value === "number" )
			value += '';

		return this.each(function(){
			if ( this.nodeType != 1 )
				return;

			if ( jQuery.isArray(value) && /radio|checkbox/.test( this.type ) )
				this.checked = (jQuery.inArray(this.value, value) >= 0 ||
					jQuery.inArray(this.name, value) >= 0);

			else if ( jQuery.nodeName( this, "select" ) ) {
				var values = jQuery.makeArray(value);

				jQuery( "option", this ).each(function(){
					this.selected = (jQuery.inArray( this.value, values ) >= 0 ||
						jQuery.inArray( this.text, values ) >= 0);
				});

				if ( !values.length )
					this.selectedIndex = -1;

			} else
				this.value = value;
		});
	},
		return e.getChilds()[e.selectedIndex].getValue();
	}*/;
}
