package org.mudamage.mud8.client.mud.calc;

import org.mudamage.mud8.client.mud.calc.data.CalcData;

import com.google.gwt.core.client.GWT;
import com.google.gwt.dom.client.AnchorElement;
import com.google.gwt.event.dom.client.ClickEvent;
import com.google.gwt.event.dom.client.ClickHandler;
import com.google.gwt.uibinder.client.UiBinder;
import com.google.gwt.uibinder.client.UiField;
import com.google.gwt.user.client.ui.Button;
import com.google.gwt.user.client.ui.Composite;
import com.google.gwt.user.client.ui.Widget;

public class MUDamageResultForm extends Composite {

	private static MUDamageResultFormUiBinder uiBinder = GWT
			.create(MUDamageResultFormUiBinder.class);

	interface MUDamageResultFormUiBinder extends
			UiBinder<Widget, MUDamageResultForm> {
	}
	
	@UiField Button calcbutton;
	
	@UiField AnchorElement job;
	
	@UiField AnchorElement lv;
	@UiField AnchorElement str;
	@UiField AnchorElement agi;
	@UiField AnchorElement vit;
	@UiField AnchorElement ene;
	@UiField AnchorElement rec;
	
	@UiField AnchorElement hp;
	@UiField AnchorElement sd;
	@UiField AnchorElement mana;
	@UiField AnchorElement ag;
	
	@UiField AnchorElement speed;
	@UiField AnchorElement magic_speed;
	
	@UiField AnchorElement min;
	@UiField AnchorElement max;
	@UiField AnchorElement magic_min;
	@UiField AnchorElement magic_max;
	@UiField AnchorElement hit;
	@UiField AnchorElement pvp_hit;
	
	@UiField AnchorElement def;
	@UiField AnchorElement avoid;
	@UiField AnchorElement pvp_avoid;
	
	@UiField AnchorElement normal;
	@UiField AnchorElement cri;
	@UiField AnchorElement exd;
	@UiField AnchorElement ignore;
	@UiField AnchorElement wd;
	
	@UiField AnchorElement aplus;
	@UiField AnchorElement gplus;
	@UiField AnchorElement cplus;
	@UiField AnchorElement sl;
	@UiField AnchorElement sb;
	@UiField AnchorElement inner;
	@UiField AnchorElement weak;
	
	private CalcData data;
	
	/**
	 * コンストラクタ
	 */
	public MUDamageResultForm(CalcData calcdata) {
		initWidget(uiBinder.createAndBindUi(this));
		
		data = calcdata;
		
		calcbutton.addClickHandler(new ClickHandler() {
			
			@Override
			public void onClick(ClickEvent event) {
				// TODO 自動生成されたメソッド・スタブ
				initResult();
			}
		});
	}
	
	public void initResult(){
		data.calcAll();
		
		lv.setInnerHTML(data.lv.toString());
		str.setInnerHTML(data.str.toString());
		agi.setInnerHTML(data.agi.toString());
		vit.setInnerHTML(data.vit.toString());
		ene.setInnerHTML(data.ene.toString());
		
		hp.setInnerHTML(data.hp.toString());
		sd.setInnerHTML(data.sd.toString());
		mana.setInnerHTML(data.mana.toString());
		ag.setInnerHTML(data.ag.toString());
		
		speed.setInnerHTML(data.speed.toString());
		magic_speed.setInnerHTML(data.magic_speed.toString());
		
		min.setInnerHTML(data.min.toString());
		max.setInnerHTML(data.max.toString());
		magic_min.setInnerHTML(data.magic_min.toString());
		magic_max.setInnerHTML(data.magic_max.toString());
		hit.setInnerHTML(data.hit.toString());
		pvp_hit.setInnerHTML(data.pvp_hit.toString());
		
		def.setInnerHTML(data.def.toString());
		avoid.setInnerHTML(data.avoid.toString());
		pvp_avoid.setInnerHTML(data.pvp_avoid.toString());
		
		normal.setInnerHTML(data.normal.toString());
		cri.setInnerHTML(data.cri.toString());
		exd.setInnerHTML(data.exd.toString());
		ignore.setInnerHTML(data.ignore.toString());
		wd.setInnerHTML(data.wd.toString());
		
		aplus.setInnerHTML(data.aplus.toString());
		gplus.setInnerHTML(data.gplus.toString());
		cplus.setInnerHTML(data.cplus.toString());
		sl.setInnerHTML(data.sl.toString());
		sb.setInnerHTML(data.sb.toString());
		inner.setInnerHTML(data.inner.toString());
		weak.setInnerHTML(data.weak.toString());
	}

}
