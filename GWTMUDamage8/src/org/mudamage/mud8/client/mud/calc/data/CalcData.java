package org.mudamage.mud8.client.mud.calc.data;

import org.mudamage.mud8.client.mud.calc.BaseCalc;
import org.mudamage.mud8.client.mud.form.data.FormData;
import org.mudamage.mud8.client.mud.static_data.ExOptionStaticData;

public class CalcData {
	// 職
	public Integer job;
	// ステータス
	public Integer lv;
	public Integer str;
	public Integer ori_str;
	public Integer add_str;
	public Integer agi;
	public Integer ori_agi;
	public Integer add_agi;
	public Integer vit;
	public Integer ori_vit;
	public Integer add_vit;
	public Integer ene;
	public Integer ori_ene;
	public Integer add_ene;
	public Integer rec;
	public Integer ori_rec;
	public Integer add_rec;
	// メーター
	public Integer hp;
	public Integer sd;
	public Integer mana;
	public Integer ag;
	// ペット関連
	public Integer pet;
	public Integer petsub1;
	public Integer petsub2;
	// 羽関連
	public Integer wing;
	public Integer wing_def;
	public Integer wing_attack_option;
	public Integer wing_magic_option;
	public Integer wing_noroi_option;
	public Integer wing_inc;
	public Integer wing_dec;
	// 攻撃関連
	public CalcWeaponData right;
	public CalcWeaponData left;
	public CalcWeaponData neck;
	public Integer speed;
	public Integer magic_speed;
	public Integer min;
	public Integer max;
	public Integer magic_min;
	public Integer magic_max;
	public Integer hit;
	public Integer pvp_hit;
	// 防御関連
	public CalcEquipData shield;
	public CalcEquipData helm;
	public CalcEquipData armor;
	public CalcEquipData glove;
	public CalcEquipData garter;
	public CalcEquipData boots;
	public CalcEquipData ring1;
	public CalcEquipData ring2;
	public CalcEquipData[] equips = {
		helm,armor,glove,garter,boots,shield
	};
	public Integer def;
	public Integer avoid;
	public Integer pvp_avoid;
	// 特殊確率関連
	public Double normal;
	public Double cri;
	public Double exd;
	public Double ignore;
	public Double wd;
	// サポート関連
	public Integer aplus;
	public Integer gplus;
	public Integer cplus;
	public Integer sl;
	public Integer sb;
	public Integer inner;
	public Integer weak;
	public Boolean ba;
	// オプション関連
	public Integer[] setsoop; // ソケットのセットオプション
	public Integer[] setop; // セットオプション
	
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
	public Boolean isLeft(){return true;}
}
