// ActionScript file
import Csv.Item;

import MuCalc.MLV;
import MuCalc.MuChar;

import mx.controls.Alert;
import mx.controls.ComboBox;

public namespace calcchar;

calcchar function main():MuChar{
	use namespace calcchar;
	var muc:MuChar = new MuChar();
	muc = Pet(muc);
	muc = Support(muc);
	muc = Status(muc);
	muc = Def(muc);
	muc = Hit(muc);
	muc = HP(muc);
	muc = Speed(muc);
	muc = Normal(muc);
	muc = Skill(muc);
	muc = Option(muc);
	muc = MinMax(muc);
	muc = MinMax2(muc);
	muc = calcDarkSpirit(muc);
	
	return muc;
}
calcchar function Pet(muc:MuChar):MuChar{
	use namespace calc;
	muc.satan = satan;//サタン
	muc.angel = angel;//天使
	muc.deamon = (dat::d.f_pet.selectedLabel == "デーモン");
	muc.spirit = (dat::d.f_pet.selectedLabel == "守護精霊");
	muc.uniria = (dat::d.f_pet.selectedLabel == "ユニリア");
	if(dat::d.f_pet.selectedLabel == "ディノラント"){
		muc.dinolunt = [1,0,0];//[有無,op1,op2]
		if(dat::d.f_petsub1.selectedLabel == "AG+50")muc.dinolunt[1]=1;
		if(dat::d.f_petsub1.selectedLabel == "攻撃速度+5")muc.dinolunt[1]=2;
		if(dat::d.f_petsub1.selectedLabel == "ダメージ吸収+5")muc.dinolunt[1]=3;
		if(dat::d.f_petsub2.selectedLabel == "AG+50")muc.dinolunt[2]=1;
		if(dat::d.f_petsub2.selectedLabel == "攻撃速度+5")muc.dinolunt[2]=2;
		if(dat::d.f_petsub2.selectedLabel == "ダメージ吸収+5")muc.dinolunt[2]=3;
	}
	if(dat::d.f_pet.selectedLabel == "フェンリル"){
		if(dat::d.f_petsub1.selectedLabel == "ノーマル")muc.fenrir=1;
		if(dat::d.f_petsub1.selectedLabel == "破壊")muc.fenrir=2;
		if(dat::d.f_petsub1.selectedLabel == "守護")muc.fenrir=3;
		if(dat::d.f_petsub1.selectedLabel == "黄金")muc.fenrir=4;
	}
	if(dat::d.f_pet.selectedLabel == "ダークホース")
		muc.darkhorse = dat::d.f_petsub1.selectedIndex + 1;//LVを代入
	muc.ponga = (dat::d.f_pet.selectedLabel == "白と黒のポンガ");
	muc.arion = (dat::d.f_pet.selectedLabel == "白銀のアリオン");
	muc.skelton = (dat::d.f_pet.selectedLabel == "スケルトンパージドラゴン");
	return muc;
}
calcchar function Support(muc:MuChar):MuChar{
	use namespace calc;
	if(dat::d.f_job.selectedLabel=="ナイト")muc.support_a = Math.floor(support_a * 1.1);//A+
	else muc.support_a = support_a;//A+
	if(dat::d.f_job.selectedLabel=="ナイト")muc.support_g = Math.floor(support_g * 1.1);//G+
	else muc.support_g = support_g;//G+
	muc.support_c = support_c;//C+
	muc.support_sl = support_sl;//SL
	muc.support_sb = support_sb;//SB
	if(etc_sera)muc.support_sera_a = Math.floor(lv/3) + 45;//セラ　攻撃力
	if(etc_sera)muc.support_sera_g = Math.floor(lv/5) + 50;//セラ　防御力
	if(dat::d.s_se.selected)muc.support_se = 20;//スペルエンハンス
	if(dat::d.s_ba.selected)muc.support_ba = 10;//BA
	muc.support_inner = parseInt(dat::d.s_inner.text);//インナーベーション
	muc.support_weak = parseInt(dat::d.s_weak.text);//ウイークネス
	if(dat::d.s_berserker.selected)
		muc.support_berserker = Math.floor(ene/30);//バーサーカー
	if(dat::d.s_vit.selected)
		muc.support_vit = 16 + Math.ceil(ene/10);//体力上昇
	if(dat::d.s_avoid.selected)
		muc.support_avoid = Math.min(Math.ceil(agi/3),200);//防御成功率上昇
	if(dat::d.s_ignore.selected)
		muc.support_ignore = Math.floor(vit/200);//敵の防御力無視
	return muc;
}
calcchar function Status(muc:MuChar):MuChar{
	use namespace calc;
	muc.job = dat::d.f_job.selectedIndex;
	if(lv==400)muc.add_lv = parseInt(dat::d.f_mlv.text);
	muc.add_str = setop_str + etc_str;
	muc.add_agi = setop_agi + etc_agi;
	muc.add_vit = setop_vit + etc_vit + soop_vit + muc.support_vit;
	muc.add_ene = setop_ene + etc_ene;
	muc.add_rec = setop_rec + etc_rec + wing_rec;
	muc.lv = lv + muc.add_lv;
	muc.str = str + muc.add_str;
	muc.agi = agi + muc.add_agi;
	muc.vit = vit + muc.add_vit;
	muc.ene = ene + muc.add_ene;
	muc.rec = rec + muc.add_rec;
	muc.lefthund = (dat::d.f_left.f_kind.selectedLabel != "なし" && dat::d.f_left.f_item.selectedItem[0] == "武器");
	muc.magic = weapon_magic;//魔力%
	muc.wing_inc = wing_inc;//羽のダメージ増加
	muc.wing_dec = wing_dec;//羽のダメージ吸収
	return muc;
}
calcchar function Def(muc:MuChar):MuChar{
	use namespace dat;
	use namespace calc;
	var de:int = 0;//防御力
	var bde:int = 0;//純防御力
	var avoid:int = 0;//防御成功率
	var pvpavoid:int = 0;//対人防御成功率
	if(d.f_job.selectedLabel == "ナイト"){
		de += muc.agi/3;
		avoid = muc.agi/3;
		pvpavoid = lv*2 + muc.agi/2;
	}else if(d.f_job.selectedLabel == "ウィザード"){
		de += muc.agi/4
		avoid = muc.agi/3;
		pvpavoid = lv*2 + muc.agi/4;
	}else if(d.f_job.selectedLabel == "エルフ"){
		de += muc.agi/10;
		avoid = muc.agi/4;
		pvpavoid = lv*2 + muc.agi/10;
	}else if(d.f_job.selectedLabel == "魔剣士"){
		de += muc.agi/4;
		avoid = muc.agi/3;
		pvpavoid = lv*2 + muc.agi/4;
	}else if(d.f_job.selectedLabel == "ダークロード"){
		de += muc.agi/7;
		avoid = muc.agi/7;
		pvpavoid = lv*2 + muc.agi/2;
	}else if(d.f_job.selectedLabel == "召喚師"){
		de += muc.agi/3;
		avoid = muc.agi/4;
		pvpavoid = lv*2 + muc.agi/2;
	}else if(d.f_job.selectedLabel == "レイジファイター"){
		de += muc.agi/8;
		avoid = muc.agi/10;
		pvpavoid = lv*2 + muc.agi/2;
	}
	bde = de;//純粋なDEF
	//防御力=============================================================
	//防具のDEF
	var a:Array = [d.f_helm,d.f_armor,d.f_glove,d.f_garter,d.f_boots];
	var series:Array = new Array();
	var plus:int = 15;//最も低いアイテムレベル(+10~15ボーナス確認用
	for each(var item:Item in a)
		if(item.f_kind.selectedLabel != "なし"){
			//380OPの対人防御成功率加算
			if(item.f_380.visible && item.f_380.selected)
				pvpavoid += 10;//380OP 
			//DEFを加算
			if(item.f_kind.selectedLabel == "EX")
				de += item.f_item.selectedItem[13][item.f_plus.selectedIndex][3];
			else
				de += item.f_item.selectedItem[12][item.f_plus.selectedIndex][3];
			de += item.f_op.selectedItem.value;
			//アイテムレベルの確認
			if(plus > item.f_plus.selectedIndex)plus = item.f_plus.selectedIndex;
			//シリーズと装備可能職をスタック
			series.push([item.f_item.selectedItem[11],item.f_item.selectedItem[5]]);
		}
	
	//統一ボーナスの確認
	var ch:Boolean = true;//魔の装備かチェック
	var count:int = 0;//シリーズ名をカウント
	var uniform:Boolean = false;//統一ボーナスの有無
	var tmp:String = "";//シリーズ名を一時的に保管
	if(series.length >= 4)
		tmp = series[0][0];
		for each(var i:Object in series){
			//魔剣士専用装備か確認
			if((!i[1][3] && !i[1][6]) //魔剣士とレイジファイターのどちらも装備不可 
				|| ( i[1][0] || i[1][1] || i[1][2] || i[1][4] || i[1][5] )) //それ以外の職で装備可能
				ch=false;
			//シリーズが統一されているか確認
			if(tmp == i[0])count++;//同じシリーズ名のものをカウント
		}
	if(ch && count==4)uniform=true;//魔orレイジファイターの場合
	if(!ch && count==5)uniform=true;
	
	//盾の防御力
	var shield_check:Boolean = false;
	if(d.f_left.f_kind.selectedLabel != "なし")
		if(d.f_left.f_item.selectedItem[0] == "防具"){//盾
			de += d.f_left.f_item.selectedItem[12][d.f_left.f_plus.selectedIndex][3];
			shield_check = true;
		}
	
	//羽のDEF
	de += wing_def;
	//ダークホースのDEF
	if(muc.darkhorse)de += 5 + (muc.agi/20) + (muc.darkhorse * 2);//5＋（敏捷性/20）＋（ダークホースレベル×2）

	//+10~15統一ボーナス
	if(uniform){//全部装備が同じ種類
		if(plus==10)
			de += Math.floor(de*5/100);
		if(plus==11)
			de += Math.floor(de*10/100);
		if(plus==12)
			de += Math.floor(de*15/100);
		if(plus==13)
			de += Math.floor(de*20/100);
		if(plus==14)
			de += Math.floor(de*25/100);
		if(plus==15)
			de += Math.floor(de*30/100);
	}
	//MLVDEF
	if(mlvcount.def)de += MLV.inf_def[mlvcount.def];
	//セットの盾装備時
	if(shield_check)de += Math.floor(de*setop_shield/100);
	//ソケットの盾装備時
	if(shield_check)de += Math.floor(de*soop_shield/100);
	//セットのDEF増加
	de += setop_def;
	//ソケットのDEF増加
	de += soop_def * 2;
	//ボーナスソケットのDEF増加
	de += sobonus_def * 2;
	//エンチャントのDEF増加
	de += enop_def;
	//かぼちゃ、課金などのでDEF増加
	de += etc_def * 2;
	//ペットによるDEF増加
	if(muc.ponga)de += 100;//防御力+50 → DEF+100
	//ペットによるDEF増加
	if(muc.arion)de += 100;//防御力+50 → DEF+100
	//バーサーカーによるDEF減少
	if(muc.support_berserker)
		de -= Math.floor(bde * (50 - Math.floor((muc.ene - muc.add_ene)/45))/100);
	
	//防御成功率====================================================================
	if(d.f_left.f_kind.selectedLabel != "なし" && d.f_left.f_item.selectedItem[0] == "防具"){
		if(d.f_left.f_kind.selectedLabel == "EX")//盾から取得
			avoid += d.f_left.f_item.selectedItem[13][d.f_left.f_plus.selectedIndex][4];
		else
			avoid += d.f_left.f_item.selectedItem[12][d.f_left.f_plus.selectedIndex][4];
		avoid += d.f_left.f_op.selectedItem.value;
	}
	for(var j:int=0;j<exop_avoid;j++)//EXOPの防御成功
		avoid += Math.floor(avoid * 0.1);
	for each(i in soop_avoid)//ソケットOPの防御成功
		avoid += Math.floor(avoid * (i as int)/100);
	var avoid_ori:int = avoid;
	//サポートスキル
	avoid += muc.support_avoid;
	if(uniform)avoid += Math.floor(avoid_ori * 0.1);//統一ボーナス
	
	pvpavoid += enop_pvpavoid;//エンチャントOPの対人防御成功
	//MLVの対人防御成功率
	if(mlvcount.pvpavoid)pvpavoid += MLV.inf_pvpavoid[mlvcount.pvpavoid];
	
	//代入
	muc.def = de;
	muc.avoid = avoid;
	muc.pvpavoid = pvpavoid;
	return muc;
}
calcchar function Hit(muc:MuChar):MuChar{
	use namespace dat;
	use namespace calc;
	//攻撃成功率
	if(d.f_job.selectedLabel == "ナイト"){
		muc.hit = lv*5 + muc.agi*1.5 + muc.str/4;
		muc.pvphit = lv*3 + muc.agi*4.5;
	}else if(d.f_job.selectedLabel == "ウィザード"){
		muc.hit = lv*5 + muc.agi*1.5 + muc.str/4;
		muc.pvphit = lv*3 + muc.agi*4;
	}else if(d.f_job.selectedLabel == "エルフ"){
		muc.hit = lv*5 + muc.agi*1.5 + muc.str/4;
		muc.pvphit = lv*3 + muc.agi*0.6;//ここまで完了
	}else if(d.f_job.selectedLabel == "魔剣士"){
		muc.hit = lv*5 + muc.agi*1.5 + muc.str/4;
		muc.pvphit = lv*3 + muc.agi*3.5;
	}else if(d.f_job.selectedLabel == "ダークロード"){
		muc.hit = lv*5 + muc.agi*2.5 + muc.str/6 + muc.rec/10;
		muc.pvphit = lv*3 + muc.agi*4;
	}else if(d.f_job.selectedLabel == "召喚師"){
		muc.hit = lv*5 + muc.agi*1.5 + muc.str/4;
		muc.pvphit = lv*3 + muc.agi*3.5;
	}else if(d.f_job.selectedLabel == "レイジファイター"){
		muc.hit = lv*5 + muc.agi*2.5 + muc.str/6;
		muc.pvphit = lv*3 + muc.agi*4;
	}
	muc.hit += setop_hit;//セットOP攻撃成功率
	muc.hit += soop_hit;//ソケットOP攻撃成功率
	if(dat::mlvcount.hit)muc.hit += MLV.inf_hit[dat::mlvcount.hit];//MLVの攻撃成功率

	muc.pvphit += enop_pvphit;//エンチャントOP対人攻撃成功率
	if(dat::mlvcount.pvphit)muc.pvphit += MLV.inf_pvphit[dat::mlvcount.pvphit];//MLVの対人攻撃成功率
	if(dat::d.f_right.f_380.visible && dat::d.f_right.f_380.selected)
		muc.pvphit += 10;//380OP 
	if(dat::d.f_left.f_380.visible && dat::d.f_left.f_380.selected)
		muc.pvphit += 10;//380OP 
	return muc;
}
calcchar function HP(muc:MuChar):MuChar{
	use namespace dat;
	use namespace calc;

	var bhp:int=0;//ベースとなるHP
	var hp:int = 0;
	var bmana:int=0;//ベースとなるマナ
	var mana:int=0;
	var ag:int=0;
	if(d.f_job.selectedLabel == "ナイト"){
		bhp = 110 + (vit - c.getJobPoint(0,"vit")) * 3 + (muc.lv-1) * 2;//ベースとなるHP
		hp += muc.add_vit * 3;//セットとソケットの体力＋
		bmana = 20 + (ene - c.getJobPoint(0,"ene")) + (muc.lv-1)*0.5;//ベースとなるマナ
		mana += (setop_ene + etc_ene) * 1;//セットのエナ＋
	}else if(d.f_job.selectedLabel == "ウィザード"){
		bhp = 60 + (vit - c.getJobPoint(1,"vit")) * 2 + (muc.lv-1) * 1;//ベースとなるHP
		hp += muc.add_vit * 2;//セットとソケットの体力＋
		bmana = 60 + (ene - c.getJobPoint(1,"ene"))*2 + (muc.lv-1)*2;//ベースとなるマナ
		mana += (setop_ene + etc_ene) * 2;//セットのエナ＋
	}else if(d.f_job.selectedLabel == "エルフ"){
		bhp = 80 + (vit - c.getJobPoint(2,"vit")) * 2 + (muc.lv-1) * 1;//ベースとなるHP
		hp += muc.add_vit * 2;//セットとソケットの体力＋
		bmana = 30 + (ene - c.getJobPoint(2,"ene"))*1.5 + (muc.lv-1)*1.5;//ベースとなるマナ
		mana += (setop_ene + etc_ene) * 1.5;//セットのエナ＋
	}else if(d.f_job.selectedLabel == "魔剣士"){
		bhp = 110 + (vit - c.getJobPoint(3,"vit")) * 2 + (muc.lv-1) * 1;//ベースとなるHP
		hp += muc.add_vit * 2;//セットとソケットの体力＋
		bmana = 60 + (ene - c.getJobPoint(3,"ene"))*2 + (muc.lv-1)*1;//ベースとなるマナ
		mana += (setop_ene + etc_ene) * 2;//セットのエナ＋
	}else if(d.f_job.selectedLabel == "ダークロード"){
		bhp = 90 + (vit - c.getJobPoint(4,"vit")) * 2 + (muc.lv-1) * 1.5;//ベースとなるHP
		hp += muc.add_vit * 2;//セットとソケットの体力＋
		bmana = 40 + (ene - c.getJobPoint(4,"ene"))*1.5 + (muc.lv-1)*1;//ベースとなるマナ
		mana += (setop_ene + etc_ene) * 1.5;//セットのエナ＋
	}else if(d.f_job.selectedLabel == "召喚師"){
		bhp = 70 + (vit - c.getJobPoint(5,"vit")) * 2 + (muc.lv-1) * 1;//ベースとなるHP
		hp += muc.add_vit * 2;//セットとソケットの体力＋
		bmana = 40 + (ene - c.getJobPoint(5,"ene"))*1.5 + (muc.lv-1)*1.5;//ベースとなるマナ
		mana += (setop_ene + etc_ene) * 1.5;//セットのエナ＋
	}else if(d.f_job.selectedLabel == "レイジファイター"){
		bhp = 100 + (vit - c.getJobPoint(6,"vit")) * 2 + (muc.lv-1) * 1;//ベースとなるHP
		hp += muc.add_vit * 2;//セットとソケットの体力＋
		bmana = 40 + (ene - c.getJobPoint(6,"ene"))*1.3 + (muc.lv-1)*1;//ベースとなるマナ
		mana += (setop_ene + etc_ene) * 1.3;//セットのエナ＋
	}
	//HP
	hp += bhp;
	//％の部分
	hp += Math.floor(bhp * support_sl/100);//SL スウェルライフ
	hp += Math.floor(bhp * 4/100) * exop_hp;//EXOPの生命増加
	for each(var i:int in soop_hp)
		hp += Math.floor(bhp * i/100);//ソケットOPの生命増加
	//引き算の部分
	//バーサーカーのHP減少 基本HP * [40 - 純ene/60]%
	if(muc.support_berserker)
		hp -= Math.floor(bhp * ((40 - Math.floor((muc.ene - muc.add_ene)/60))/100));
	//足し算の部分
	if(mlvcount.hp)hp += MLV.inf_hp[mlvcount.hp];//MLV
	hp += setop_hp;//セットOPの生命
	hp += enop_hp;//エンチャントOPの生命
	hp += sobonus_hp;//ボーナスソケットの生命増加
	hp += wing_hp;//羽の生命増加
	if(angel)hp += 50;//天使の生命増加
	if(muc.spirit)hp += 50;//守護精霊の生命増加
	hp += etc_hp;//かぼちゃ、課金などでのHP増加
	if(dat::d.f_glove.f_380.visible && dat::d.f_glove.f_380.selected)
		hp += 200;//380OP
	if(muc.fenrir == 4)hp += muc.lv/2;//黄金のフェンリルの生命増加
	
	//SD
	var sd:int = Math.floor((muc.lv * muc.lv / 30));
	sd += Math.floor(muc.str*1.2) + Math.floor(muc.agi*1.2) + Math.floor(muc.vit*1.2) +
			Math.floor(muc.ene*1.2) + Math.floor(muc.rec*1.2);
	//sd += Math.floor((muc.str+muc.agi+muc.vit+muc.ene+muc.rec)*1.2);
	sd += muc.def/2;
	if(mlvcount.sd)sd += MLV.inf_sd[mlvcount.sd];//MLV
	if(dat::d.f_boots.f_380.visible && dat::d.f_boots.f_380.selected)
		sd += 700;//380OP
	
	//マナ
	mana += bmana;
	mana += Math.floor(bmana * 4/100) * exop_mana;//EXOPのマナ増加
	for each(i in soop_mana)
		mana += Math.floor(bmana * i/100);//ソケットOPのマナ増加
	//バーサーカー [純ene/30]%
	if(muc.support_berserker)
		mana += bmana - Math.floor(bmana * (100 - Math.floor((muc.ene - muc.add_ene)/30))/100);
	mana += setop_mana;//セットOPのマナ＋
	mana += wing_mana;//羽
	mana += etc_mana;//かぼちゃ、課金などでのマナ増加
	if(muc.fenrir == 4)mana += muc.lv/2;//黄金のフェンリルのマナ増加
	
	//AG
	if(d.f_job.selectedLabel == "ナイト")
		ag = Math.floor((muc.str*0.15)+(muc.agi*0.2)+(muc.vit*0.3)+(muc.ene*1.0));
	else if(d.f_job.selectedLabel == "ウィザード")
		ag = Math.floor((muc.str*0.2)+(muc.agi*0.4)+(muc.vit*0.3)+(muc.ene*0.2));
	else if(d.f_job.selectedLabel == "エルフ")
		ag = Math.floor((muc.str*0.3)+(muc.agi*0.2)+(muc.vit*0.3)+(muc.ene*0.2));
	else if(d.f_job.selectedLabel == "魔剣士")
		ag = Math.floor((muc.str*0.2)+(muc.agi*0.25)+(muc.vit*0.3)+(muc.ene*0.15));
	else if(d.f_job.selectedLabel == "ダークロード")
		ag = Math.floor((muc.str*0.3)+(muc.agi*0.2)+(muc.vit*0.1)+(muc.ene*0.15)+(muc.rec*0.3));
	else if(d.f_job.selectedLabel == "召喚師")
		ag = Math.floor((muc.str*0.2)+(muc.agi*0.25)+(muc.vit*0.3)+(muc.ene*0.15));
	else if(d.f_job.selectedLabel == "レイジファイター")
		ag = Math.floor((muc.str*0.15)+(muc.agi*0.2)+(muc.vit*0.3)+(muc.ene*1.0));
	if(mlvcount.ag)ag += MLV.inf_ag[mlvcount.ag];//MLV
	ag += setop_ag;//セットOP
	ag += enop_ag;//エンチャントOP
	ag += soop_ag;//ソケットOP
	if(muc.dinolunt[0] && (muc.dinolunt[1] == 1 || muc.dinolunt[2] == 1))ag += 50;
	
	muc.hp = hp;
	muc.mana = mana;
	muc.sd = sd;
	muc.ag = ag;
	return muc;
}
calcchar function Speed(muc:MuChar):MuChar{
	use namespace dat;
	use namespace calc;
	//攻撃速度
	var speed:int=0;
	var ms:int=0;//魔法速度
	if(d.f_job.selectedLabel == "ナイト"){
		speed = muc.agi/15;
	}else if(d.f_job.selectedLabel == "ウィザード"){
		speed = muc.agi/10;
		ms = muc.agi/10;
	}else if(d.f_job.selectedLabel == "エルフ"){
		speed = muc.agi/50;
	}else if(d.f_job.selectedLabel == "魔剣士"){
		speed = muc.agi/15;
		ms = muc.agi/20;
	}else if(d.f_job.selectedLabel == "ダークロード"){
		speed = muc.agi/10;
	}else if(d.f_job.selectedLabel == "召喚師"){
		speed = muc.agi/20;
		ms = muc.agi/20;
	}else if(d.f_job.selectedLabel == "レイジファイター"){
		speed = muc.agi/9;
	}
	
	//武器の攻撃速度
	var ws:int = 0;
	if(d.f_right.f_item.dataProvider != "")ws = d.f_right.f_item.selectedItem[7];
	if(d.f_left.f_kind.selectedLabel != "なし" && d.f_left.f_item.dataProvider != "" && d.f_left.f_kind.selectedLabel != "鷹"){
		if(d.f_left.f_item.selectedItem[0] == "武器"){
			if(ws != 0)ws = (ws + d.f_left.f_item.selectedItem[7])/2;
			else ws = d.f_left.f_item.selectedItem[7];
		}
	}
	speed += ws;
	ms += ws;
	
	//EXOPの攻撃速度
	if(exopspeed){speed += 7;ms += 7;}
	if(exopleftspeed){speed += 7;ms += 7;}
	if(exopacspeed){speed += 7;ms += 7;}
	
	//グラブの攻撃速度
	if(d.f_glove.f_kind.selectedLabel != "なし"){
		speed += d.f_glove.f_item.selectedItem[7];
		ms += d.f_glove.f_item.selectedItem[7];
	}
	
	//ソケットOPの攻撃速度
	speed += soop_speed;
	ms += soop_speed;
	
	//その他
	if(etc_mahouring || etc_daimahouring){speed += 10;ms += 10;}//魔法師
	if(etc_sake){speed += 20;ms += 20;}//酒
	speed += etc_speed;//かぼちゃ、課金など
	ms += etc_speed;
	if(muc.deamon){speed += 10;ms += 10;}//デーモン
	if(muc.skelton){speed += 10;ms += 10;}//スケルトンパージドラゴン
	
	//代入
	muc.speed = speed;
	muc.magicspeed = ms;
	return muc;
}
calcchar function Normal(muc:MuChar):MuChar{
	use namespace dat;
	use namespace calc;
	//通常　クリ　EXD
	//EXD
	var exd:int = 0;
	if(exopexd)exd += 10;
	if(exopleftexd)exd += 10;
	if(exopacexd)exd += 10;
	exd += setop_exdper;//セットOPEXD
	exd += soop_exdper;//ソケットOPEXD
	//クリ
	var cri:int = 0;
	if(d.f_wing.f_item.selectedLabel != "なし" && d.f_wing.f_luck.selected)cri += 4;
	if(d.f_right.f_kind.selectedLabel != "なし" && d.f_right.f_luck.selected)cri += 4;
	if(d.f_left.f_kind.selectedLabel != "なし" && d.f_left.f_luck.selected)cri += 4;
	if(d.f_helm.f_kind.selectedLabel != "なし" && d.f_helm.f_luck.selected)cri += 4;
	if(d.f_armor.f_kind.selectedLabel != "なし" && d.f_armor.f_luck.selected)cri += 4;
	if(d.f_glove.f_kind.selectedLabel != "なし" && d.f_glove.f_luck.selected)cri += 4;
	if(d.f_garter.f_kind.selectedLabel != "なし" && d.f_garter.f_luck.selected)cri += 4;
	if(d.f_boots.f_kind.selectedLabel != "なし" && d.f_boots.f_luck.selected)cri += 4;
	cri += setop_criper;//セットOPクリ
	cri += soop_criper;//ソケットOPクリ
	muc.criper = cri;//クリティカル確率合計
	cri = (100 - exd) * cri;
	var crif:int = cri % 100;//小数点部分
	cri = cri / 100;//整数部分
	//通常
	var nor:int = 0;
	nor = 100 - exd - cri;
	var norf:int = 0;
	if(crif){
		nor--;
		norf = 100 - crif;
	}
	
	
	//代入
	muc.normal = nor * 100 + norf;
	muc.cri = cri * 100 + crif;
	muc.exd = exd;
	
	//セットソケットオプション
	var a:Array = [d.f_right,d.f_left,d.f_helm,d.f_armor,d.f_glove,d.f_garter,d.f_boots];
	var att:Array=new Array();// 0.炎 1.稲妻 2.氷 3.水 4.風 5.地
	for(var n:int=0;n<6;n++)att[n]=0;//初期値0を代入
	for each(var i:Item in a){
		if(i.f_kind.selectedLabel == "ソケット" || i.f_kind.selectedLabel == "EXソケット"){
			for each(var j:ComboBox in i.f_soop){
				//ボーナスソケットの確認
				if(j.selectedIndex <= 0)continue;
				if(j.selectedItem[1] == "炎")att[0]++;
				if(j.selectedItem[1] == "稲妻")att[1]++;
				if(j.selectedItem[1] == "氷")att[2]++;
				if(j.selectedItem[1] == "水")att[3]++;
				if(j.selectedItem[1] == "風")att[4]++;
				if(j.selectedItem[1] == "地")att[5]++;
			}
		}
	}
	if(att[0] && att[1] && att[2] && att[3] && att[4] && att[5])
		muc.wd += 3;//WD3%の発生条件
	if(att[0] && att[1] && att[2] && att[3]>=3 && att[4]>=3 && att[5]>=2)
		muc.ignore += 1;//防御無視1%発生条件
	
	//防御無視
	muc.ignore += wing_ignore;//羽
	muc.ignore += setop_ignore;//セットOP
	muc.ignore += muc.support_ignore;//レイジファイターバフ
	
	//ダブルダメージ
	muc.wd += setop_w;//セットOP
	
	return muc;
}
calcchar function Skill(muc:MuChar):MuChar{
	// 0 スキル名 1 スキル威力 2 速度[ms,検証] 3 魔法orスキル 4 属性ダメージ 5 特殊スキル 6 特殊係数
	//スキルを選択
	var skill:Array = dat::c.skill;
	var attribute:int = 0;//属性ダメージ
	var checknumber:int=0;
	var special:int=0;//特殊係数
	for each(var i:Array in skill)
		if(i[5][muc.job])//職確認
			if(i[4][0] <= muc.lv && i[4][1] <= muc.str && i[4][2] <= muc.agi
				&& i[4][3] <= muc.ene && i[4][4] <= muc.rec){//要求ステ確認
					//乗り物チェック
					if(muc.uniria || muc.dinolunt[0])checknumber=1;//ユニリア・ディノラント
					else if(muc.fenrir)checknumber=2;//フェンリル
					else if(muc.darkhorse)checknumber=3;//ダークホース
					else checknumber=0;//なし
					if(i[2][checknumber] == -1)continue;
					//ペット
					if(i[6]){
						if(i[6] == "ディノラント" && !muc.dinolunt[0])continue;//ディノラントの確認
						if(i[6] == "フェンリル" && !muc.fenrir)continue;//フェンリルの確認
						if(i[6] == "ダークホース" && !muc.darkhorse)continue;//ダークホースの確認
					}else if(i[7]){//武器S
						if(!((dat::d.f_right.f_kind.selectedLabel != "なし"//右手の有無
							&& i[0] == dat::d.f_right.f_item.selectedItem[8])//スキル名が一致するか
							||(dat::d.f_left.f_kind.selectedLabel != "なし"//左手の有無
							&& dat::d.f_left.f_item.selectedItem[0] == "武器"//左手が武器であるか
							&& i[0] == dat::d.f_left.f_item.selectedItem[8])))//スキル名が一致するか
							continue;
					}else if(i[9] == 4){//ダークスピリット
						if(dat::d.f_left.f_kind.selectedLabel != "鷹")continue;//鷹の有無
					}
					//スキルを追加
					//属性ダメージ計算
					attribute = 0;//初期化
					if(dat::d.f_neck.f_kind.selectedLabel == "セット"
						&& dat::d.f_neck.f_item.selectedItem[8] == i[8])//セットアイテム8番目の配列に属性、スキル8番目の配列に属性
						attribute +=5;//属性ダメージ＋5
					if(dat::d.f_ring1.f_kind.selectedLabel == "セット"
						&& dat::d.f_ring1.f_item.selectedItem[8] == i[8])//セットアイテム8番目の配列に属性、スキル8番目の配列に属性
						attribute +=5;//属性ダメージ＋5
					if(dat::d.f_ring2.f_kind.selectedLabel == "セット"
						&& dat::d.f_ring2.f_item.selectedItem[8] == i[8])//セットアイテム8番目の配列に属性、スキル8番目の配列に属性
						attribute +=5;//属性ダメージ＋5
					//特殊係数の追加
					special=0;
					//サドゥンアイス
					if(i[9] == 6 && dat::mlvcount.sudden_ice)
						special = 80 + 5 * dat::mlvcount.sudden_ice;
					muc.skill.push([i[0],i[1],i[2],i[3],attribute,i[9],special]);//スキルを追加
				}
	//スキル速度計算
	var check:Boolean=true;
	for each(i in muc.skill){
		//騎乗ペットの確認
		if(muc.uniria || muc.dinolunt[0])checknumber=1;//ユニリア・ディノラント
		else if(muc.fenrir)checknumber=2;//フェンリル
		else if(muc.darkhorse)checknumber=3;//ダークホース
		else checknumber=0;//なし
		//速度変化点
		var sp:Array=dat::c.speed[i[2][checknumber]];//速度変化点のデータを参照
		check=true;
		for(var k:int=sp.length - 1;k>=0;k--)
			if((i[3] == "スキル" && muc.speed >= sp[k][0]) || (i[3] == "魔法" && muc.magicspeed >= sp[k][0])){
				i[2] = [sp[k][1],sp[k][2]];
				check=false;
				break;
			}
		if(check)i[2] = [0,0];
	}
	//スキル強化
	var a:Array = [["トルネードクラッシュ",dat::mlvcount.tc,MLV.inf_tc]
					,["ゴッドブロー",dat::mlvcount.gb,MLV.inf_gb]
					,["オメガインパクト",dat::mlvcount.oi,MLV.inf_oi]
					,["ヘルファイア",dat::mlvcount.hell_fire,MLV.inf_hell_fire]
					,["ソウルジエンド",dat::mlvcount.soul_the_end,MLV.inf_soul_the_end]
					,["ソウルジエンド",dat::mlvcount.soul_the_end_ma,MLV.inf_soul_the_end_ma]
					,["サドゥンアイス",dat::mlvcount.sudden_ice,MLV.inf_sudden_ice]
					,["乱れ撃ち",dat::mlvcount.midareuti,MLV.inf_midareuti]
					,["パワースラッシュ",dat::mlvcount.ps,MLV.inf_ps]
					,["ブラッドアタック",dat::mlvcount.ba,MLV.inf_ba]
					,["シャイニングブラスト",dat::mlvcount.shining_blast,MLV.inf_shining_blast]
					,["トルネードクラッシュ",dat::mlvcount.tc_ma,MLV.inf_tc_ma]
					,["アースシェイク",dat::mlvcount.earth_shake,MLV.inf_earth_shake]
					,["ファイアバースト",dat::mlvcount.fb,MLV.inf_fb]
					,["ファイアスクリーム",dat::mlvcount.fs,MLV.inf_fs]
					,["チェーンライトニング",dat::mlvcount.chain,MLV.inf_chain]
					,["ライフドレイン",dat::mlvcount.life,MLV.inf_life]
					,["ライトニングショック",dat::mlvcount.light,MLV.inf_light]];
	for each(i in muc.skill)
		for each(var j:Array in a)
			if(j[1] && i[0] == j[0])i[1] += j[2][j[1]].skill;
			
	return muc;
}
calcchar function Option(muc:MuChar):MuChar{
	use namespace calc;
	//妙薬などのダメージ増加
	if(etc_miracle)muc.op_miracle += 15;//妙薬
	if(muc.job==0)muc.op_miracle += Math.floor(support_a*1.1);//ナイトのA+　1.1倍
	else muc.op_miracle += support_a;//A+
	//muc.op_miracle += etc_attack;//課金攻撃力増加
	muc.op_miracle += muc.support_sera_a;//セラフィー
	//スキル攻撃力増加
    muc.op_skill += setop_skill;//[セットOP]スキル攻撃力増加
    muc.op_skill += enop_skill;//[エンチャントOP]スキル攻撃力
    muc.op_skill += soop_skill;//[ソケットOP]スキル攻撃力
    muc.op_skill += sobonus_skill;//[ソケットボーナス]スキル攻撃力増加
    //クリダメ増加
    muc.op_cri += setop_cri;//セットOPクリダメ増加
    muc.op_cri += enop_cri;//[エンチャントOP]クリダメ増加
    muc.op_cri += support_c;//C+
    muc.op_cri += soop_cri;//[ソケットOP]クリダメ増加
    //EXD増加
    muc.op_exd += setop_exd;//セットOPEXD増加
    muc.op_exd += soop_exd;//[ソケットOP]EXD増加
    //ダメージ増加
    muc.op_damage += setop_damage;//セットOPダメージ増加
    if(dat::d.f_right.f_380.visible && dat::d.f_right.f_380.selected)
    	muc.op_pvpdamage += 200;
    if(dat::d.f_left.f_380.visible && dat::d.f_left.f_380.selected)
    	muc.op_pvpdamage += 200;
    //両手武器装備時ダメージ増加
    if(dat::d.f_right.f_kind.selectedLabel != "なし"
    	&& dat::d.f_right.f_item.selectedItem[4] == "両手")
    muc.op_hands += setop_hands;//セットOP両手武器装備時ダメージ増加
    //クリダメ増加%
    muc.etc_cri = etc_cri;
    //EXDダメ増加%
    muc.etc_exd = etc_exd;
    //セットOP名
    muc.setop_names = setop_array;
    //ダメ減
    muc.guard_op_exop_dec = exop_dec;
    muc.guard_op_enop_dec = enop_dec;
    muc.guard_op_soop_dec = soop_dec;
    return muc;
}
/*
calcchar function MinMax(muc:MuChar):MuChar{
	return muc;
}
*/
calcchar function MinMax2(muc:MuChar):MuChar{
	use namespace calcchar;
	use namespace calc;
	//変数
	var r_min:int = 0;
	var l_min:int = 0;
	var r_max:int = 0;
	var l_max:int = 0;
	var r_cri:int = 0;
	var l_cri:int = 0;
	var r_exd:int = 0;
	var l_exd:int = 0;
	var plus:int = 0;
	var plus_cri:int = 0;
	var plus_exd:int = 0;
	var x_min:int = 0;
	var x_max:int = 0;
	var lefthund:Boolean = (dat::d.f_left.f_kind.selectedLabel != "なし" && dat::d.f_left.f_item.selectedItem[0] == "武器");
    //攻撃力
    //最小
	//最大
	//クリ
	//EXD
    r_min = calcMinMax(muc,false,false,true);//右手
    r_max = calcMinMax(muc,false,false,false);//右手
    r_cri = calcMinMax(muc,true,false,false);//右手
    r_exd = calcMinMax(muc,true,true,false);//右手
    if(lefthund){//左手
    	l_min = calcMinMaxLeft(muc,false,false,true);
    	l_max = calcMinMaxLeft(muc,false,false,false);
    	l_cri = calcMinMaxLeft(muc,true,false,false);
    	l_exd = calcMinMaxLeft(muc,true,true,false);
    }else{
    	l_min=0;
    	l_max=0;
    	l_cri=0;
    	l_exd=0;
    }

	//魔力
	x_min = calcMagicMinMax(muc,lefthund,true);//MIN
    x_max = calcMagicMinMax(muc,lefthund,false);//MAX
    //呪い
    muc = calcNoroi(muc);//muc.noroi[]
    //スキルごとに計算
    for(var i:int=0;i<muc.skill.length;i++){
    	muc.now_skill = muc.skill[i];
    	muc.skill_minmax[i] = new Array();//配列初期化
    	muc.add_minmax[i] = new Array();//配列初期化
    	if(muc.now_skill[0] == "プラズマストーム"){
	    		//最小
			    muc.skill_minmax[i][0] = calcPlasmaStorm(muc,false,false,true);//右手左手A+
			    //クリ
			    muc.skill_minmax[i][2] = calcPlasmaStorm(muc,true,false,false);//右手左手A+
			    //EXD
			    muc.skill_minmax[i][3] = calcPlasmaStorm(muc,false,true,false);//右手左手A+
			    //最大
			    muc.skill_minmax[i][1] = calcPlasmaStorm(muc,false,false,false);//右手左手A+
    	}else if(muc.now_skill[3] == "スキル"){
    		//追加分
    		muc.add_minmax[i][0] = calcMinMax3(muc,false,false);//A+とか
		    muc.add_minmax[i][1] = calcMinMax3(muc,true,false);//クリの場合
		    muc.add_minmax[i][2] = calcMinMax3(muc,false,true);//EXDの場合
	    	//最小
		    muc.skill_minmax[i][0] = l_min + calcMinMax2(r_min,muc,false,false,true) + muc.add_minmax[i][0];//右手左手A+
		    //クリ
		    muc.skill_minmax[i][2] = l_cri + calcMinMax2(r_cri,muc,true,false,false) + muc.add_minmax[i][1];//右手左手A+
		    //EXD
		    muc.skill_minmax[i][3] = l_exd + calcMinMax2(r_exd,muc,true,true,false) + muc.add_minmax[i][2];//右手左手A+
		    //最大
		    muc.skill_minmax[i][1] = l_max + calcMinMax2(r_max,muc,false,false,false) + muc.add_minmax[i][0];//右手左手A+
	    }else{//魔法
	    	if(muc.now_skill[5] == 3){
		    	//最小
			    muc.skill_minmax[i][0] = calcNoroi2(muc.noroi[0],muc,false,false,true);//右手左手A+
			    //クリ
			    muc.skill_minmax[i][2] = calcNoroi2(muc.noroi[1],muc,true,false,false);//右手左手A+
			    //EXD
			    muc.skill_minmax[i][3] = calcNoroi2(muc.noroi[1],muc,false,true,false);//右手左手A+
			    //最大
			    muc.skill_minmax[i][1] = calcNoroi2(muc.noroi[1],muc,false,false,false);//右手左手A+
		    }else{
	    		//最小
			    muc.skill_minmax[i][0] = calcMagicMinMax2(x_min,muc,false,false,true);//右手左手A+
			    //クリ
			    muc.skill_minmax[i][2] = calcMagicMinMax2(x_max,muc,true,false,false);//右手左手A+
			    //EXD
			    muc.skill_minmax[i][3] = calcMagicMinMax2(x_max,muc,false,true,false);//右手左手A+
			    //最大
			    muc.skill_minmax[i][1] = calcMagicMinMax2(x_max,muc,false,false,false);//右手左手A+
		    }
	    }
    }
	return muc;
}
calcchar function MinMax(muc:MuChar):MuChar{
	use namespace calcchar;
	use namespace calc;
	//変数
	var r_min:int = 0;
	var l_min:int = 0;
	var r_max:int = 0;
	var l_max:int = 0;
	var x_min:int = 0;
	var x_max:int = 0;
	var lefthund:Boolean = (dat::d.f_left.f_kind.selectedLabel != "なし" && dat::d.f_left.f_item.selectedItem[0] == "武器");
    //攻撃力
    r_min = calcMinMax(muc,false,false,true);//右手
    if(lefthund){l_min = calcMinMaxLeft(muc,false,false,true);}else{l_min=0;}//左手
    x_min = r_min + l_min;//右手と左手を足す
    r_max = calcMinMax(muc,true,false,false);//右手
    if(lefthund){l_max = calcMinMaxLeft(muc,true,false,false);}else{l_max=0;}//左手
    	
    x_max = r_max + l_max;//右手と左手を足す
	//最小最大
	muc.minmax.push(x_min);
	muc.minmax.push(x_max);
	//魔力
	x_min = calcMagicMinMax(muc,lefthund,true);//MIN
    x_max = calcMagicMinMax(muc,lefthund,false);//MAX
	//最小最大
	muc.minmax.push(x_min);
	muc.minmax.push(x_max);
	return muc;
}
calcchar function calcMinMax(muc:MuChar,cri:Boolean,exd:Boolean,min:Boolean):int{
	use namespace calc;
    var d:int = 0;
    
    var bowcheck:Boolean = true;//弓の場合、左手でfalse
    if(muc.job == 2 && dat::d.f_right.f_kind.selectedLabel != "なし"
    	&& dat::d.f_right.f_item.selectedItem[3] == "弓"
    	&& dat::d.f_right.f_item.selectedItem[4] == "片手")
    		bowcheck = false;
	
    //最小最大攻撃力=================================================================
	if(dat::d.f_job.selectedLabel == "ナイト"){
	    if(min)d = Math.floor(muc.str/6);//Ｒ ＝ ステータス最小攻撃力
	    else d = Math.floor(muc.str/4);//Ｒ ＝ ステータス最大攻撃力
	}else if(dat::d.f_job.selectedLabel == "ウィザード"){
	    if(min)d = Math.floor(muc.str/8);//Ｒ ＝ ステータス最小攻撃力
	    else d = Math.floor(muc.str/4);//Ｒ ＝ ステータス最大攻撃力
	}else if(dat::d.f_job.selectedLabel == "エルフ"){
	    if(min) d = Math.floor(muc.str/14) + Math.floor(muc.agi/7);//Ｒ ＝ ステータス最小攻撃力
	    else d = Math.floor(muc.str/8) + Math.floor(muc.agi/4);//Ｒ ＝ ステータス最大攻撃力
	}else if(dat::d.f_job.selectedLabel == "魔剣士"){
	    if(min)d = Math.floor(muc.str/6) + Math.floor(muc.ene/12);//Ｒ ＝ ステータス最小攻撃力
	    else d = Math.floor(muc.str/4) + Math.floor(muc.ene/8);//Ｒ ＝ ステータス最大攻撃力
	}else if(dat::d.f_job.selectedLabel == "ダークロード"){
	    if(min)d = Math.floor(muc.str/7) + Math.floor(muc.ene/14);//Ｒ ＝ ステータス最小攻撃力
	    else d = Math.floor(muc.str/5) + Math.floor(muc.ene/10);//Ｒ ＝ ステータス最大攻撃力
	}else if(dat::d.f_job.selectedLabel == "召喚師"){
	    if(min)d = Math.floor((muc.str-1)/9);//Ｒ ＝ ステータス最小攻撃力
	    else d = Math.floor((muc.str-1)/4);//Ｒ ＝ ステータス最大攻撃力
	}else if(dat::d.f_job.selectedLabel == "レイジファイター"){
	    if(min)d = Math.floor(muc.str/7) + Math.floor(muc.vit/15);//Ｒ ＝ ステータス最小攻撃力
	    else d = Math.floor(muc.str/5) + Math.floor(muc.vit/12);//Ｒ ＝ ステータス最大攻撃力
	}
	//追加OP
    d += weapon_op;//武器の追加攻撃力
    d += wing_op;//Ｒ ＝ Ｒ ＋ 羽追加攻撃力 
    
    //マスタースキル最小最大
    if(min){//最小
    	d += weapon_min;
        //マスタースキル
        if(dat::mlvcount.min_attack)d += MLV.inf_min_attack[dat::mlvcount.min_attack];
        if(dat::mlvcount.min_attack_magic)d += MLV.inf_min_attack_magic[dat::mlvcount.min_attack_magic];
    }else{//最大
        //マスタースキル
        d += weapon_max;
        if(dat::mlvcount.max_attack)d += MLV.inf_max_attack[dat::mlvcount.max_attack];
        if(dat::mlvcount.max_attack_magic)d += MLV.inf_max_attack_magic[dat::mlvcount.max_attack_magic];
    }
    //サンタ、かぼちゃ、桜
    d += etc_attack;
	
    //[魔法師の指輪装備時]　Ｘ ＝ int(Ｘ × 1.1)
    if(etc_mahouring){d = Math.floor(d * 1.1);}
    //[大魔法師の爪装備時] Y = int(Y * 1.15)
    if(etc_daimahouring){d = Math.floor(d * 1.15);}
    //[デーモン]
    if(muc.deamon){d += Math.floor(d * 0.4);}
    
    //[スケルトンパージドラゴン装備時] Y = int(Y * 1.2)
    if(muc.skelton){d = Math.floor(d * 1.2);}
    
    //[武器のEXOPに攻撃力増加+LV/20がある時]　Ｒ ＝ Ｒ ＋ int(レベル ÷ 20) 
    if(bowcheck){
    	if(exoplv20)d += Math.floor((muc.lv)/20);
    }else{
    	if(exoplv20)d += Math.floor((muc.lv - muc.add_lv)/20);
    }
    //[武器のEXOPに攻撃力増加+2%がある時]　Ｒ ＝ Ｒ ＋ int((ステータス最大攻撃力 ＋ 武器最大攻撃力) × 0.02) 
    if(exop2per)d += Math.floor(d*0.02);
    //[アクセのEXOPに攻撃力増加+LV/20がある時]　Ｒ ＝ Ｒ ＋ int(レベル ÷ 20) 
    if(bowcheck){
    	if(exopaclv20)d += Math.floor(muc.lv/20);
    }else{
    	if(exopaclv20)d += Math.floor((muc.lv-muc.add_lv)/20);
    }
    //[ソケットOP]攻撃力LV20
    for each(var v:int in soop_lv20)
    	d += Math.floor(muc.lv/v);
    for each(v in soop_lv20_left)
    	d += Math.floor(muc.lv/v);
    //[アクセのEXOPに攻撃力増加+2%がある時]　Ｒ ＝ Ｒ ＋ int(Ｒ × 0.02)数
    if(exopac2per)d += + Math.floor(d*0.02);
    
    if(min){//最小
        d += setop_min;//[セットOP]X = X + 最小攻撃力増加
        d += enop_min;//[エンチャントOP]X = X + 最小攻撃力増加
        d += soop_min;//[ソケットOP]X = X + 最小攻撃力増加
    }else{//最大
        d += setop_max;//[セットOP]X = X + 最大攻撃力増加
        d += enop_max;//[エンチャントOP]X = X + 最大攻撃力増加
        d += soop_max;//[ソケットOP]X = X + 最大攻撃力増加
    }
    d += setop_attack;//[セットOP]X = X + 攻撃力増加
    d += enop_attack;//[エンチャントOP]X = X + 攻撃力増加
    d += soop_attack;//[ソケットOP]X = X + 攻撃力増加
    d += sobonus_attack;//[ソケットボーナス]X = X +攻撃力増加 
    
    //エルフの矢による攻撃力増加
    if(dat::d.f_right.f_kind.selectedIndex != 0
    	&& dat::d.f_right.f_item.selectedItem[3] == "弓"){
    		if(dat::d.f_right.f_arrow.selectedIndex == 1){d += Math.floor(d * 3/100);d++;}//矢+1 ダメージ増加3%と追加攻撃力+1
    		if(dat::d.f_right.f_arrow.selectedIndex == 2){d += Math.floor(d * 5/100);d++;}//矢+2 ダメージ増加5%と追加攻撃力+1
    		if(dat::d.f_right.f_arrow.selectedIndex == 3){d += Math.floor(d * 7/100);d++;}//矢+3 ダメージ増加7%と追加攻撃力+1
    	}
	
    //二刀流攻撃力1.1倍
    if(muc.lefthund){
    	if(muc.job == 6){
    		if(min){//レイジファイターの場合最小1.2倍
    			d = Math.floor(d * 0.60);
    		}else{//レイジファイターの場合最大1.3倍
    			d = Math.floor(d * 0.65);
    		}
		}else{
			d = Math.floor(d * 0.55);
		}
	}

    return d;
}
calcchar function calcMinMaxLeft(muc:MuChar,cri:Boolean,exd:Boolean,min:Boolean):int{
	use namespace calc;
    var d:int = 0;
    //最小最大攻撃力=================================================================
	if(dat::d.f_job.selectedLabel == "ナイト"){
	    if(min){//最小
	        d = Math.floor(muc.str/6);//Ｒ ＝ ステータス最小攻撃力
	    }else{//最大
	        d = Math.floor(muc.str/4);//Ｒ ＝ ステータス最大攻撃力
	    }
	}else if(dat::d.f_job.selectedLabel == "魔剣士"){
	    if(min){//最小
	        d = Math.floor(muc.str/6) + Math.floor(muc.ene/12);//Ｒ ＝ ステータス最小攻撃力
	    }else{//最大
	        d = Math.floor(muc.str/4) + Math.floor(muc.ene/8);//Ｒ ＝ ステータス最大攻撃力
	    }
	}else if(dat::d.f_job.selectedLabel == "召喚師"){
	    if(min){//最小
	        d = Math.floor((muc.str-1)/9);//Ｒ ＝ ステータス最小攻撃力
	    }else{//最大
	        d = Math.floor((muc.str-1)/4);//Ｒ ＝ ステータス最大攻撃力
	    }
	}else if(dat::d.f_job.selectedLabel == "レイジファイター"){
	    if(min){//最小
	        d = Math.floor(muc.str/7) + Math.floor(muc.vit/15);//Ｒ ＝ ステータス最小攻撃力
	    }else{//最大
	        d = Math.floor(muc.str/5) + Math.floor(muc.vit/12);//Ｒ ＝ ステータス最大攻撃力
	    }
	}
	//追加OP
    d += left_weapon_op;//武器の追加攻撃力
    d += wing_op;//Ｒ ＝ Ｒ ＋ 羽追加攻撃力
    
    //マスタースキル最小最大
    if(min){//最小
    	d += left_weapon_min;
        //マスタースキル
        if(dat::mlvcount.min_attack)d += MLV.inf_min_attack[dat::mlvcount.min_attack];
        if(dat::mlvcount.min_attack_magic)d += MLV.inf_min_attack_magic[dat::mlvcount.min_attack_magic];
    }else{//最大
        d += left_weapon_max;
        //マスタースキル
        if(dat::mlvcount.max_attack)d += MLV.inf_max_attack[dat::mlvcount.max_attack];
        if(dat::mlvcount.max_attack_magic)d += MLV.inf_max_attack_magic[dat::mlvcount.max_attack_magic];
    }
    //サンタ、かぼちゃ、桜
    d += etc_attack;
    
    //[魔法師の指輪装備時]　Ｘ ＝ int(Ｘ × 1.1)
    if(etc_mahouring){d = Math.floor(d * 1.1);}
    //[大魔法師の爪装備時] Y = int(Y * 1.15)
    if(etc_daimahouring){d = Math.floor(d * 1.15);}
    //[デーモン]
    if(muc.deamon){d += Math.floor(d * 0.4);}
    
    //[武器のEXOPに攻撃力増加+LV/20がある時]　Ｒ ＝ Ｒ ＋ int(レベル ÷ 20) 
    if(exopleftlv20)d += Math.floor((muc.lv-muc.add_lv)/20);
    //[武器のEXOPに攻撃力増加+2%がある時]　Ｒ ＝ Ｒ ＋ int((ステータス最大攻撃力 ＋ 武器最大攻撃力) × 0.02) 
    if(exopleft2per)d += Math.floor(d*0.02);
    //[アクセのEXOPに攻撃力増加+LV/20がある時]　Ｒ ＝ Ｒ ＋ int(レベル ÷ 20) 
    if(exopaclv20)d += Math.floor((muc.lv-muc.add_lv)/20);
    //[ソケットOP]攻撃力LV20
    for each(var v:int in soop_lv20)
    	d += Math.floor(muc.lv/v);
    for each(v in soop_lv20_left)
    	d += Math.floor(muc.lv/v);
    //[アクセのEXOPに攻撃力増加+2%がある時]　Ｒ ＝ Ｒ ＋ int(Ｒ × 0.02)数
    if(exopac2per)d += Math.floor(d*0.02);
    	
    if(min){//最小
        d += setop_min;//[セットOP]X = X + 最小攻撃力増加
        d += enop_min;//[エンチャントOP]X = X + 最小攻撃力増加
        d += soop_min;//[ソケットOP]X = X + 最小攻撃力増加
    }else{//最大
        d += setop_max;//[セットOP]X = X + 最大攻撃力増加
        d += enop_max;//[エンチャントOP]X = X + 最大攻撃力増加
        d += soop_max;//[ソケットOP]X = X + 最大攻撃力増加
    }
    d += setop_attack;//[セットOP]X = X + 攻撃力増加
    d += enop_attack;//[エンチャントOP]X = X + 攻撃力増加
    d += soop_attack;//[ソケットOP]X = X + 攻撃力増加
    d += sobonus_attack;//[ソケットボーナス]X = X +攻撃力増加 
    if(muc.fenrir==4)d += muc.lv/12;//黄金のフェンリル　攻撃力増加

    //二刀流攻撃力1.1倍
    if(muc.lefthund)
    	if(muc.job == 6)//レイジファイターのみ1.3倍
    		d = Math.floor(d * 0.65);
		else
			d = Math.floor(d * 0.55);
	//後半ダメージ計算=============================================
	//スキル攻撃力増加
	d += muc.op_skill;

    //[EXD]エクセレントダメージ
    if(exd){d += Math.floor(d*0.2);}
    
    //ダメージ増加系統
	if(exd)d += muc.op_exd;//EXD増加
    if(cri||exd){
    	//クリダメ増加
    	d += soop_cri;//ソケットOP
    	d += enop_cri;//エンチャントOP
    	d += support_c;//C+
    }
    return d;
}
calcchar function calcMinMax2(d:int,muc:MuChar,cri:Boolean,exd:Boolean,min:Boolean):int{
	use namespace calc;
	var s:int=0;//スキル威力保持用
	var i:int=1;
	
    var bowcheck:Boolean = true;//弓の場合、左手でfalse
    if(muc.job == 2 && dat::d.f_right.f_kind.selectedLabel != "なし"
    	&& dat::d.f_right.f_item.selectedItem[3] == "弓"
    	&& dat::d.f_right.f_item.selectedItem[4] == "片手")
    		bowcheck = false;
	
	if(muc.lefthund)i=2;//二刀流計算時
	
	//ダークロード特殊ダメージ
	if(muc.job == 4 && muc.now_skill[5] != 2){
		d += Math.floor(muc.str/25) + Math.floor(muc.ene/50);
	}
	//スキル攻撃力
	//アースシェイク
	if(muc.now_skill[5] == 2){
		d += ((muc.darkhorse * 10) + Math.floor(muc.str/10) + Math.floor(muc.rec/5));
	}else if(muc.now_skill[5] == 5){//カオス
		//if(exd)d += 87;
		//else d += Math.floor(muc.rec/20);
		d += Math.floor(muc.rec/20);
	}
	//弓の場合、マルチショット特殊減少
	if(!bowcheck && muc.now_skill[0] == "マルチショット"){
		muc.now_skill[1] = 32;//スキル威力40→32調整用
		d -= muc.op_skill - Math.floor(muc.op_skill*0.8);//スキル威力２０％減少
	}
	//通常のスキル
    if(min){//最小
        d += muc.now_skill[1];//スキル威力
    }else{
        d += Math.floor(muc.now_skill[1]*1.5);//スキル威力
    }
    //属性ダメージ
    //本当は左手に持っていくものだけど倍率係数で変化がないので、簡略化のためここで2倍
	d += muc.now_skill[4]*i;
	
	//スキル攻撃力増加
	d += muc.op_skill;
	
	if(exd)d += Math.floor(d*0.2);
    
    //ダメージ増加系統
    if(exd)d += muc.op_exd;//EXD増加
    if(cri||exd){
    	//クリダメ増加
    	d += soop_cri;//ソケットOP
    	d += enop_cri;//エンチャントOP
    	d += support_c;//C+
    	d += setop_cri;//クリダメ増加
    }
	return d;
}
calcchar function calcMinMax3(muc:MuChar,cri:Boolean,exd:Boolean):int{
	use namespace calc;
	var d:int=0;
	var i:int=1;//二刀流チェック
	if(muc.lefthund)i=2;//二刀流チェック
    //妙薬・A＋・セラ
    d += muc.op_miracle;
    //課金アイテム
    d += etc_attack2;
    
	return d;
}
calcchar function calcMagicMinMax(muc:MuChar,lefthund:Boolean,min:Boolean):int{
	use namespace calc;
    var d:int=0;
    //最大魔力==================================================================
    if(!min){d = Math.floor(muc.ene/4) + weapon_magicop;}
    else{d =  Math.floor(muc.ene/9) + weapon_magicop;}
    //if(lefthund){d = d + left_weapon_magicop;}//Y = ステータス最大魔力 ＋　武器追加魔力
    d += wing_magicop;//Y = Y ＋　羽追加魔力
    //[魔法師の指輪装備時] Y = int(Y * 1.1)
    if(etc_mahouring){d = Math.floor(d * 1.1);}
    //[大魔法師の爪装備時] Y = int(Y * 1.15)
    if(etc_daimahouring){d = Math.floor(d * 1.15);}
    //[スケルトンパージドラゴン装備時] Y = int(Y * 1.2)
    if(muc.skelton){d = Math.floor(d * 1.2);}
    d += enop_magic;//[エンチャントOP]魔力増加
    d += soop_attack;//[ソケットOP]魔力増加
    d += sobonus_magic;//[ソケットボーナス]魔力増加
    if(muc.fenrir==4)d += muc.lv/25;//黄金のフェンリル　魔力増加
    //[武器のEXOPに魔力増加+LV/20がある時]　Ｒ ＝ Ｒ ＋ int(レベル ÷ 20) 
    if(exopmagiclv20){d = d + Math.floor(muc.lv/20);}
    //[ソケットOP]魔力LV20
    for each(var v:int in soop_lv20)
    	d += Math.floor(muc.lv/v);
    //[武器のEXOPに魔力増加+2%がある時]　Ｒ ＝ Ｒ ＋ int(Ｒ × 0.02) 
    if(exopmagic2per){d = d + Math.floor(d*0.02);}
    if(lefthund)d += enop_left_magic;//[エンチャントOP]左手 魔力増加
    //[ソケットOP]魔力LV20
    for each(v in soop_lv20_left)
    	d += Math.floor(muc.lv/v);
    //[左手武器のEXOPに魔力増加+LV/20がある時]　Ｒ ＝ Ｒ ＋ int(レベル ÷ 20) 
    if(exopleftmagiclv20){d = d + Math.floor(muc.lv/20);}
    //[左手武器のEXOPに魔力増加+2%がある時]　Ｒ ＝ Ｒ ＋ int(Ｒ × 0.02) 
    if(exopleftmagic2per){d = d + Math.floor(d*0.02);}
    //[アクセのEXOPに魔力増加+LV/20がある時]　Ｒ ＝ Ｒ ＋ int(レベル ÷ 20) 
    if(exopacmagiclv20){d = d + Math.floor(muc.lv/20);}
    //[アクセのEXOPに魔力増加+2%がある時]　Ｒ ＝ Ｒ ＋ int(Ｒ × 0.02)
    if(exopacmagic2per){d = d + Math.floor(d*0.02);}
    
    
    if(min){//最小
        d += soop_min;//[ソケットOP]最小魔力
        //マスタースキル
        if(dat::mlvcount.min_magic)d += MLV.inf_min_magic[dat::mlvcount.min_magic];
        if(dat::mlvcount.min_attack_magic)d += MLV.inf_min_attack_magic[dat::mlvcount.min_attack_magic];
    }else{//最大
        d += soop_max;//[ソケットOP]最大魔力
        //マスタースキル
        if(dat::mlvcount.max_magic)d += MLV.inf_max_magic[dat::mlvcount.max_magic];
        if(dat::mlvcount.max_attack_magic)d += MLV.inf_max_attack_magic[dat::mlvcount.max_attack_magic];
    }
    
    var tmp_d:int = d;//スペルエンハンス用
    
    d += Math.floor(d * setop_magicper/100);//[セットOP]Y = Y + int(Y * 魔力%);
    
    //スペルエンハンス
    if(min)d += Math.floor(tmp_d * muc.support_se/100);//20%上昇
    //バーサーカー エナ/30
    if(!min){d += Math.floor(muc.ene/4 * muc.support_berserker/100);}
    else{d += Math.floor(muc.ene/9 * muc.support_berserker/100);}
    
    d += etc_magic;//[かぼちゃ、サンタ]魔力増加
    
    return d;
}
calcchar function calcMagicMinMax2(d:int,muc:MuChar,cri:Boolean,exd:Boolean,min:Boolean):int{
    //後半ダメージ計算====================================================
    //スキル攻撃力追加
	if(muc.now_skill[5] == 1){//ヘルバースト
		d += 1320 + Math.floor(muc.str/2);
	}else{//通常のスキル
	    if(min){d += muc.now_skill[1];}
	    else{d += Math.floor(muc.now_skill[1]*1.5);}
	}
	if(muc.job!=5)d += muc.op_skill;
    //杖魔力%
    d += Math.floor(d * muc.magic/100);
    //[セットOP]スキル攻撃力
    if(muc.job==5)d += muc.op_skill;
    //EXD
    if(exd)d += Math.floor(d*0.2);
    //[課金]魔力増加(バグ？)
    d += calc::etc_magic2;
    
    if(cri)d += muc.op_cri;//クリダメ増加
    if(exd)d += muc.op_exd;//EXD増加
    
    //属性ダメージ
    //d += muc.now_skill[4];
    //妙薬・A+・セラ
    d += muc.op_miracle; 
    	
	return d;
}

calcchar function calcDarkSpirit(muc:MuChar):MuChar{
	if(dat::d.f_left.f_kind.selectedLabel == "鷹"){
		var plus:int = dat::d.f_left.f_op.selectedIndex + 1;//鷹のLV
		var per:int = calc::weapon_pet + 100;
		//フレイムハンド単体の最小攻撃力
		muc.darkspirit[0] = Math.floor(((plus*15) + Math.floor(muc.rec/8) + 180) * per / 100);
		//フレイムハンド単体の最大攻撃力
		muc.darkspirit[1] = Math.floor(((plus*15) + Math.floor(muc.rec/4) + 200) * per / 100); 	
		//フレイムハンド範囲の最小攻撃力
		muc.darkspirit[2] = Math.floor(((plus*10) + Math.floor(muc.rec/12) + 120) * per / 100); 	
		//フレイムハンド範囲の最大攻撃力
		muc.darkspirit[3] = Math.floor(((plus*10) + Math.floor(muc.rec/6) + 133) * per / 100); 	
		//鷹の攻撃成功率
		muc.darkspirit[4] = (plus*16) + 1000; 	
		//鷹のLv(クリティカル率)
		muc.darkspirit[5] = plus; 
	}
	return muc;
}
calcchar function calcNoroi(muc:MuChar):MuChar{
	use namespace calc;
	muc.noroi[0]=0;//最小
	muc.noroi[1]=0;//最大
	if(muc.job==5){
		for(var i:int=0;i<2;i++){
			//エナジー
			if(i==0)muc.noroi[i] += Math.floor(muc.ene/9);
			else muc.noroi[i] += Math.floor(muc.ene/4);
			//スケルトン変身
			muc.noroi[i] += etc_noroi;
		    //[スケルトンパージドラゴン装備時] Y = int(Y * 1.2)
		    if(muc.skelton){muc.noroi[i] += Math.floor(muc.noroi[i] * 1.2);}
			//バーサーカー
			if(muc.support_berserker)
				muc.noroi[i] += Math.floor(muc.noroi[i] * muc.support_berserker/100);
			//武器OP　羽OP
			muc.noroi[i] += calc::left_weapon_noroiop + calc::wing_noroi;
		}
	}
	return muc;
}
calcchar function calcNoroi2(d:int,muc:MuChar,cri:Boolean,exd:Boolean,min:Boolean):int{
	if(muc.job==5){
		//スキル威力
		if(min)d += muc.now_skill[1];
		else d += Math.floor(muc.now_skill[1]*1.5);
		//呪い上昇%
		d += Math.floor(d * calc::left_weapon_noroi/100);
	    //[セットOPなど]スキル攻撃力
	    d += muc.op_skill;
	    //EXD
	    if(exd)d += Math.floor(d*0.2);
	    
	    if(cri)d += muc.op_cri;//クリダメ増加
	    if(exd)d += muc.op_exd;//EXD増加
	    
	    //属性ダメージ
	    //d += muc.now_skill[4];
	    //妙薬・A+・セラ
	    d += muc.op_miracle;
	}
	return d;
}
calcchar function calcPlasmaStorm(muc:MuChar,cri:Boolean,exd:Boolean,min:Boolean):int{
	use namespace calc;
	var d:int=0;
    //攻撃力=================================================================
	if(dat::d.f_job.selectedLabel == "ナイト"){
	    d = Math.floor(muc.str/3 + muc.agi/5 + muc.vit/5 + muc.ene/7);
	}else if(dat::d.f_job.selectedLabel == "ウィザード"){
	    d = Math.floor(muc.str/5 + muc.agi/5 + muc.vit/7 + muc.ene/3);
	}else if(dat::d.f_job.selectedLabel == "エルフ"){
	    d = Math.floor(muc.str/5 + muc.agi/3 + muc.vit/7 + muc.ene/5);
	}else if(dat::d.f_job.selectedLabel == "魔剣士"){
	    d = Math.floor(muc.str/3 + muc.agi/5 + muc.vit/5 + muc.ene/7);
	}else if(dat::d.f_job.selectedLabel == "ダークロード"){
	    d = Math.floor(muc.str/5 + muc.agi/5 + muc.vit/7 + muc.ene/3 + muc.rec/3);
	}else if(dat::d.f_job.selectedLabel == "召喚師"){
	    d = Math.floor(muc.str/5 + muc.agi/5 + muc.vit/7 + muc.ene/3);
	}else if(dat::d.f_job.selectedLabel == "レイジファイター"){
	    d = Math.floor(muc.str/5 + muc.agi/5 + muc.vit/3 + muc.ene/7);
	}
	//スキル威力
    if(min){//最小
        d += muc.now_skill[1];//スキル威力
    }else{
        d += Math.floor(muc.now_skill[1]*1.5);//スキル威力
    }
    //EXD
	if(exd)d += Math.floor(d*0.2);
    //ダメージ増加系統
    if(exd)d += muc.op_exd;//EXD増加
    if(cri||exd){
    	//クリダメ増加
    	d += soop_cri;//ソケットOP
    	d += enop_cri;//エンチャントOP
    	d += support_c;//C+
    	d += setop_cri;//クリダメ増加
    }
    
    return d;
}