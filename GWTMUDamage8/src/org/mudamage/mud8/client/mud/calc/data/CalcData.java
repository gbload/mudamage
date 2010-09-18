package org.mudamage.mud8.client.mud.calc.data;

import org.mudamage.mud8.client.mud.calc.BaseCalc;
import org.mudamage.mud8.client.mud.form.data.FormData;
import org.mudamage.mud8.client.mud.static_data.ExOptionStaticData;
import org.mudamage.mud8.client.mud.static_data.SetOptionStaticData;
import org.mudamage.mud8.client.mud.static_data.WingStaticData;

public class CalcData {
	// 職
	public Integer job;
	// ステータス
	public Integer lv=1;
	public Integer str=0;
	public Integer ori_str=0;
	public Integer add_str=0;
	public Integer agi=0;
	public Integer ori_agi=0;
	public Integer add_agi=0;
	public Integer vit=0;
	public Integer ori_vit=0;
	public Integer add_vit=0;
	public Integer ene=0;
	public Integer ori_ene=0;
	public Integer add_ene=0;
	public Integer rec=0;
	public Integer ori_rec=0;
	public Integer add_rec=0;
	// メーター
	public Integer hp=0;
	public Integer sd=0;
	public Integer mana=0;
	public Integer ag=0;
	// ペット関連
	public Integer pet=0;
	public Integer petsub1=0;
	public Integer petsub2=0;
	// 羽関連
	public Integer wing=0;
	public Integer wing_def=0;
	public Integer wing_attack_option=0;
	public Integer wing_magic_option=0;
	public Integer wing_noroi_option=0;
	public Integer wing_inc=0;
	public Integer wing_dec=0;
	public Integer[] wing_cop=new Integer[WingStaticData.COP_LAST];
	// 攻撃関連
	public CalcWeaponData right=new CalcWeaponData();
	public CalcWeaponData left=new CalcWeaponData();
	public CalcWeaponData neck=new CalcWeaponData();
	public Integer speed=0;
	public Integer magic_speed=0;
	public Integer min=0;
	public Integer max=0;
	public Integer magic_min=0;
	public Integer magic_max=0;
	public Integer hit=1;
	public Integer pvp_hit=1;
	// 防御関連
	public CalcEquipData shield=new CalcEquipData();
	public CalcEquipData helm=new CalcEquipData();
	public CalcEquipData armor=new CalcEquipData();
	public CalcEquipData glove=new CalcEquipData();
	public CalcEquipData garter=new CalcEquipData();
	public CalcEquipData boots=new CalcEquipData();
	public CalcEquipData ring1=new CalcEquipData();
	public CalcEquipData ring2=new CalcEquipData();
	public CalcEquipData[] equips = {
		helm,armor,glove,garter,boots,shield
	};
	public Integer def=0;
	public Integer avoid=1;
	public Integer pvp_avoid=1;
	// 特殊確率関連
	public Double normal=100.0;
	public Double cri=0.0;
	public Double exd=0.0;
	public Double ignore=0.0;
	public Double wd=0.0;
	// サポート関連
	public Integer aplus=0;
	public Integer gplus=0;
	public Integer cplus=0;
	public Integer sl=0;
	public Integer sb=0;
	public Integer inner=0;
	public Integer weak=0;
	public Boolean berserker=false;
	public Boolean ba=false;
	// オプション関連
	public Integer[] setsoop; // ソケットのセットオプション
	public Integer[] setop=new Integer[SetOptionStaticData.LAST]; // セットオプション
	// 380OP
	// 課金アイテム、イベントアイテム関連
	
	public FormData formdata;
	public CalcData(FormData data){
		formdata = data;
	}
	public CalcData(){
	}
	
	public void calcAll(){
		this.job = 0;
		
		this.lv = formdata.getValue(FormData.DataNumber.lv);
		this.str = formdata.getValue(FormData.DataNumber.str);
		this.ori_str = this.str;
		this.add_str = 0;
		this.agi = formdata.getValue(FormData.DataNumber.agi);
		this.ori_agi = this.agi;
		this.add_agi = 0;
		this.vit = formdata.getValue(FormData.DataNumber.vit);
		this.ori_vit = this.vit;
		this.add_vit = 0;
		this.ene = formdata.getValue(FormData.DataNumber.ene);
		this.ori_ene = this.ene;
		this.add_ene = 0;
		
		this.hp = (int) BaseCalc.calcHP(this);
		this.sd = 0;
		this.mana = 0;
		this.ag = 0;

		this.speed = 0;
		this.magic_speed = 0;
		this.min = 0;
		this.max = 0;
		this.magic_min = 0;
		this.magic_max = 0;
		this.hit = 0;
		this.pvp_hit = 0;
		
		this.def = 0;
		this.avoid = 0;
		this.pvp_avoid = 0;

		this.normal = 0.0;
		this.cri = 0.0;
		this.exd = 0.0;
		this.ignore = 0.0;
		this.wd = 0.0;
		
		this.aplus = 0;
		this.gplus = 0;
		this.cplus = 0;
		this.sl = 0;
		this.sb = 0;
		this.inner = 0;
		this.weak = 0;
		this.ba = false;
	}
	
	public Integer getHP(){
		this.hp = (int) BaseCalc.calcHP(this);
		return this.hp;
		/*
		 * this.hp = calcHP(vit,formdata);
		 * return this.hp;
		 */
	}
	/*
	 * 取得メソッド
	 */
	public Integer getGuardExops(int kind){
		Integer count=0;
		for(int i=0;i<equips.length;i++)
			if(equips[i].exop[kind])
				count++;
		if(ring1.exop[kind])count++;
		if(ring2.exop[kind])count++;
		return count;
	}
	public Integer getAttackExops(int kind){
		Integer count=0;
		if(neck.exop[kind])count++;
		if(right.exop[kind])count++;
		if(left.exop[kind])count++;
		return count;
	}
	public Integer getSocketOptions(int kind){
		Integer result=0;
		for(int i=0;i<equips.length;i++)
			result += equips[i].soop[kind];
		result += right.soop[kind];
		result += left.soop[kind];
		return result;
	}
	public Integer getEnchantOptions(int kind){
		Integer result=0;
		for(int i=0;i<equips.length;i++)
			result += equips[i].enop[kind];
		result += right.enop[kind];
		result += left.enop[kind];
		return result;
	}
	public Boolean isLeft(){return true;}
}
