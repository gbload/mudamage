// ActionScript file
import Csv.Item;

import mx.controls.Alert;
import mx.controls.ComboBox;

public namespace calc;

//キャラクター
calc var lv:int=0;//キャラクターのレベル
calc var str:int=0;//キャラクターの力
calc var agi:int=0;//キャラクターの敏捷
calc var vit:int=0;//キャラクターの体力
calc var ene:int=0;//キャラクターのエナジー
calc var rec:int=0;//キャラクターの統率
//キャラクター能力
calc var char_minmax:Array=new Array;//攻撃力
calc var char_hit:int=0;//攻撃成功率
calc var char_pvphit:int=0;//対人攻撃成功率
calc var char_def:int=0;//防御力
calc var char_avoid:int=0;//防御成功率
calc var char_pvpavoid:int=0;//対人防御成功率
calc var char_speed:int=0;//攻撃速度
calc var char_magicspeed:int=0;//魔法攻撃速度
//キャラクター確率
calc var char_normal:int=0;//通常率
calc var char_cri:int=0;//クリ率
calc var char_exd:int=0;//EXD率
//キャラクター特殊確率
calc var char_ignore:int=0;//防御無視確率
calc var char_wd:int=0;//WD確率
//武器
calc var weapon_min:int=0;//武器の最小攻撃力
calc var weapon_max:int=0;//武器の最大攻撃力
calc var weapon_op:int=0;//武器の追加攻撃力
calc var weapon_magic:int=0;//武器の魔力%
calc var weapon_magicop:int=0;//武器の追加魔力
calc var weapon_pet:int=0;//武器のペット攻撃力上昇
calc var left_weapon_min:int=0;//左手武器の最小攻撃力
calc var left_weapon_max:int=0;//左手武器の最大攻撃力
calc var left_weapon_op:int=0;//左手武器の追加攻撃力
calc var left_weapon_magicop:int=0;//左手の追加魔力
calc var left_weapon_noroi:int=0;//武器の呪い上昇
calc var left_weapon_noroiop:int=0;//武器の呪いOP
//ペット
calc var pet_inc:int=0;//ペットのダメージ増加%
calc var pet_dec:int=0;//ペットのダメージ吸収%
calc var pet_fen_inc:int=0;//フェンリルのダメージ増加%
calc var pet_fen_dec:int=0;//フェンリルのダメージ吸収%
calc var satan:Boolean=false;//サタン
calc var angel:Boolean=false;//守護天使
//羽
calc var wing_inc:int=0;//羽のダメージ増加%
calc var wing_dec:int=0;//羽のダメージ吸収%
calc var wing_op:int=0;//羽の追加攻撃力
calc var wing_magicop:int=0;//羽の追加魔力
calc var wing_noroi:int=0;//羽の呪い
calc var wing_def:int=0;//羽の防御力
calc var wing_hp:int=0;//羽のCOP生命増加
calc var wing_mana:int=0;//羽のCOPマナ増加
calc var wing_ignore:int=0;//羽のCOP防御無視
calc var wing_rec:int=0;//羽のCOP統率増加
//スキル
calc var skill:int=0;//スキル威力
calc var magic_skill:int=0;//魔法スキル威力
//サポート
calc var support_a:Number=0.0;//A+
calc var support_g:int=0;//G+
calc var support_c:int=0;//C+
calc var support_sb:int=0;//SB
calc var support_sl:int=0;//SL
//特殊
calc var etc_daimahouring:Boolean=false;//大魔法師の爪の有無
calc var etc_mahouring:Boolean=false;//魔法師の指輪の有無
calc var etc_miracle:Boolean=false;//妙薬
calc var etc_sake:Boolean=false;//酒
calc var etc_sera:Boolean=false;//セラフィー
calc var etc_attack:int=0;//かぼちゃや課金アイテムでの攻撃力上昇分
calc var etc_attack2:int=0;//課金攻撃力上昇分
calc var etc_magic:int=0;//魔力
calc var etc_magic2:int=0;//課金魔力
calc var etc_noroi:int=0;//呪い
calc var etc_speed:int=0;//速度
calc var etc_def:int=0;//防御力上昇
calc var etc_hp:int=0;//生命
calc var etc_mana:int=0;//マナ
calc var etc_agah:int=0;//AG回復＋
calc var etc_cri:int=0;//クリダメ＋
calc var etc_exd:int=0;//EXDダメ＋
calc var etc_str:int=0;//力
calc var etc_agi:int=0;//敏
calc var etc_vit:int=0;//体力
calc var etc_ene:int=0;//エナジー
calc var etc_rec:int=0;//統率
//EXOP
calc var exop2per:Boolean=false;//EXOP攻撃力2%
calc var exoplv20:Boolean=false;//EXOP攻撃力LV/20
calc var exopmagic2per:Boolean=false;//EXOP魔力2%
calc var exopmagiclv20:Boolean=false;//EXOP魔力LV/20
calc var exopexd:Boolean=false;//EXOPEXD
calc var exopspeed:Boolean=false;//EXOP速度
//EXOP左手
calc var exopleft2per:Boolean=false;//EXOP攻撃力2%
calc var exopleftlv20:Boolean=false;//EXOP攻撃力LV/20
calc var exopleftmagic2per:Boolean=false;//EXOP魔力2%
calc var exopleftmagiclv20:Boolean=false;//EXOP魔力LV/20
calc var exopleftexd:Boolean=false;//EXOPEXD
calc var exopleftspeed:Boolean=false;//EXOP速度
//EXOPアクセ
calc var exopac2per:Boolean=false;//EXOP攻撃力2%
calc var exopaclv20:Boolean=false;//EXOP攻撃力LV/20
calc var exopacmagic2per:Boolean=false;//EXOP魔力2%
calc var exopacmagiclv20:Boolean=false;//EXOP魔力LV/20
calc var exopacexd:Boolean=false;//EXOPEXD
calc var exopacspeed:Boolean=false;//EXOP速度
//EXOP防具
calc var exop_dec:int=0;//EXOPダメ減4%
calc var exop_ref:int=0;//EXOPダメージ反射5%
calc var exop_avoid:int=0;//EXOP防御成功率増加10%
calc var exop_hp:int=0;//EXOP最大生命増加4%
calc var exop_mana:int=0;//EXOP最大マナ増加4%
//セットOP
calc var setop_array:Array=new Array();//セット名の配列でも・・・
//ステータス系
calc var setop_str:int=0;//力+
calc var setop_agi:int=0;//敏+
calc var setop_vit:int=0;//体力+
calc var setop_ene:int=0;//エナ+
calc var setop_rec:int=0;//統率+
calc var setop_hp:int=0;//HP+
calc var setop_mana:int=0;//マナ+
calc var setop_ag:int=0;//AG+
calc var setop_agah:int=0;//AG自動回復量+
//攻撃力（魔力）系
calc var setop_min:int=0;//最小攻撃力増加
calc var setop_max:int=0;//最大攻撃力増加
calc var setop_attack:int=0;//攻撃力増加
calc var setop_magicper:int=0;//魔力増加%
calc var setop_skill:int=0;//スキル攻撃力増加
calc var setop_hit:int=0;//攻撃成功率増加
calc var setop_hands:int=0;//両手剣装備時ダメージ増加%
//防御系
calc var setop_def:int=0;//防御力増加
calc var setop_shield:int=0;//盾装備時防御力増加%
//特殊系
calc var setop_cri:int=0;//クリティカルダメージ増加
calc var setop_criper:int=0;//クリティカル確率増加
calc var setop_exd:int=0;//エクセレントダメージ増加
calc var setop_exdper:int=0;//エクセレント確率増加
calc var setop_damage:int=0;//ダメージ増加
calc var setop_ignore:int=0;//防御無視%
calc var setop_w:int=0;//ダブルダメージ確率%
//エンチャントOP
//武器類
calc var enop_min:int=0;//最小攻撃力上昇
calc var enop_max:int=0;//最大攻撃力上昇
calc var enop_attack:int=0;//攻撃力上昇
calc var enop_cri:int=0;//クリティカルダメージ上昇
calc var enop_skill:int=0;//スキル攻撃力上昇
calc var enop_pvphit:int=0;//対人攻撃成功率上昇
calc var enop_sddec:int=0;//SD減少率%
calc var enop_sdignore:int=0;//SD無視%
calc var enop_magic:int=0;//魔力上昇
calc var enop_left_magic:int=0;//魔力上昇（左手）
//防具類
calc var enop_def:int=0;//防御力上昇
calc var enop_ag:int=0;//最大AG上昇
calc var enop_hp:int=0;//最大生命上昇
calc var enop_ah:int=0;//自動生命回復量上昇
calc var enop_mana:int=0;//マナ自動回復量上昇
calc var enop_pvpavoid:int=0;//対人防御成功率上昇
calc var enop_dec:int=0;//ダメージ減少%
calc var enop_sdrate:int=0;//SD比率上昇%
//ソケットOP
//炎のシード
calc var soop_lv20:Array=new Array();//攻撃力・魔力上昇LV/x
calc var soop_lv20_left:Array=new Array();//左手攻撃力・魔力上昇LV/x
calc var soop_min:int=0;//最小攻撃力・魔力上昇
calc var soop_max:int=0;//最大攻撃力・魔力上昇
calc var soop_attack:int=0;//攻撃力・魔力上昇
calc var soop_speed:int=0;//攻撃速度上昇
calc var soop_agdec:Array=new Array();//AG消耗量減少%
//稲妻のシード
calc var soop_exd:int=0;//EXD増加
calc var soop_exdper:int=0;//EXD確率増加%
calc var soop_cri:int=0;//クリダメ増加
calc var soop_criper:int=0;//クリ確率増加%
//氷のシード
calc var soop_skill:int=0;//スキル攻撃力上昇
calc var soop_hit:int=0;//攻撃成功率上昇
//水のシード
calc var soop_def:int=0;//防御力増加
calc var soop_shield:int=0;//盾装備時防御力増加%
calc var soop_dec:int=0;//ダメージ減少%
calc var soop_ref:int=0;//ダメージ反射%
calc var soop_avoid:Array=new Array();//防御成功率増加%
//風のシード
calc var soop_hp:Array=new Array();//最大生命増加%
calc var soop_mana:Array=new Array();//最大マナ増加%
calc var soop_ag:int=0;//最大AG増加
calc var soop_ah:int=0;//生命自動回復増加
calc var soop_manaah:int=0;//マナ自動回復量増加
calc var soop_agah:int=0;//AG自動回復量増加
//地のシード
calc var soop_vit:int=0;//体力増加
//ボーナスソケット
calc var sobonus_attack:int=0;//攻撃力上昇
calc var sobonus_skill:int=0;//スキル攻撃力上昇
calc var sobonus_magic:int=0;//魔力上昇
calc var sobonus_def:int=0;//防御力上昇
calc var sobonus_hp:int=0;//最大生命増加
//モンスター
calc var monster_def:int=0;//モンスター防御力

calc var undefine:Boolean = false;
calc function cv(n:int):int{
	if(n == -1){
		calc::undefine = true;
		return 0;
	}
	return n;
}
calc function equipExop(item:Item):Boolean{
	use namespace calc;
	if(!(item.f_kind.selectedLabel == "EX" || item.f_kind.selectedLabel == "EXソケット"))return false;
	for(var i:int = 0;i<item.f_exop.length;i++){
		if(item.f_exop[i].selectedLabel == "防御成功")exop_avoid++;
		if(item.f_exop[i].selectedLabel == "ダメ減")exop_dec++;
		if(item.f_exop[i].selectedLabel == "ダメ反")exop_ref++;
		if(item.f_exop[i].selectedLabel == "生命増")exop_hp++;
		if(item.f_exop[i].selectedLabel == "マナ増")exop_mana++;
	}
	return true;
}
calc function fact(i:int):int{
	if(i<1)return 0;
	if(i<2)return i;
	return i+calc::fact(i-1);
}
calc function getForm():void{
	use namespace calc;
	use namespace dat;
	initData();
	
	//キャラクター
	lv=parseInt(d.f_lv.text);//キャラクターのレベル
	str=parseInt(d.f_str.text);//キャラクターの力
	agi=parseInt(d.f_agi.text);//キャラクターの敏捷
	vit=parseInt(d.f_vit.text);//キャラクターの体力
	ene=parseInt(d.f_ene.text);//キャラクターのエナジー
	rec=parseInt(d.f_rec.text);//キャラクターの統率
	//武器
	var sp:Object;//スペック保持用
	if(d.f_right.f_kind.selectedLabel != "なし"){
		if(d.f_right.f_kind.selectedLabel == "EX")
			sp = d.f_right.f_item.selectedItem[13][d.f_right.f_plus.selectedIndex];
		else
			sp = d.f_right.f_item.selectedItem[12][d.f_right.f_plus.selectedIndex];
		weapon_min=cv(sp[0]);//武器の最小攻撃力
		weapon_max=cv(sp[1]);//武器の最大攻撃力
		weapon_magic=cv(sp[5]);//武器の魔力%
		weapon_pet=sp[6];//ペット攻撃力%
		if(d.f_right.f_item.selectedItem[3] != "杖")
			weapon_op=cv(d.f_right.f_op.selectedItem.value);//武器の追加攻撃力
		if(d.f_right.f_item.selectedItem[3] == "杖"
			|| (d.f_right.f_item.selectedItem[3] == "剣" && d.f_right.f_item.selectedItem[5][3]//魔の装備で且つ剣であるもの
				&& d.f_right.f_item.selectedItem[1] != "雷神剣"))//雷神剣を除く
			weapon_magicop=cv(d.f_right.f_op.selectedItem.value);//武器の追加魔力
	}
	if(d.f_left.f_kind.selectedLabel != "なし" && d.f_left.f_item.selectedItem[0] == "武器"){
		if(d.f_left.f_kind.selectedLabel == "EX")
			sp = d.f_left.f_item.selectedItem[13][d.f_left.f_plus.selectedIndex];
		else
			sp = d.f_left.f_item.selectedItem[12][d.f_left.f_plus.selectedIndex];
		left_weapon_min=cv(sp[0]);//左手武器の最小攻撃力
		left_weapon_max=cv(sp[1]);//左手武器の最大攻撃力
		left_weapon_noroi=sp[7];//呪い%
		if(d.f_left.f_item.selectedItem[3] == "書")
			left_weapon_noroiop=cv(d.f_left.f_op.selectedItem.value);//左手武器の追加呪い
		else if(d.f_left.f_item.selectedItem[3] != "杖")
			left_weapon_op=cv(d.f_left.f_op.selectedItem.value);//左手武器の追加攻撃力
	}
	//ペット
	if(d.f_pet.selectedLabel == "サタン")satan = true;
	if(d.f_pet.selectedLabel == "守護天使")angel = true;
	pet_inc=0;//ペットのダメージ増加% サタン
	pet_dec=0;//ペットのダメージ吸収%
	pet_fen_inc=0;//フェンリルのダメージ増加%
	pet_fen_dec=0;//フェンリルのダメージ吸収%
	//羽
	if(d.f_wing.f_item.selectedLabel != "なし"){
		if(c.getWingType(d.f_wing.f_item.selectedLabel) == 1){//1次羽
			wing_inc = c.getWingInc(d.f_wing.f_item.selectedLabel) + 2*d.f_wing.f_plus.selectedIndex;
			wing_dec = c.getWingDec(d.f_wing.f_item.selectedLabel) + 2*d.f_wing.f_plus.selectedIndex;
			wing_def = c.getWingDef(d.f_wing.f_item.selectedLabel) + 3*d.f_wing.f_plus.selectedIndex + calc::fact(d.f_wing.f_plus.selectedIndex - 9);
		}else if(c.getWingType(d.f_wing.f_item.selectedLabel) == 2){//2次羽
			wing_inc = c.getWingInc(d.f_wing.f_item.selectedLabel) + 1*d.f_wing.f_plus.selectedIndex;
			wing_dec = c.getWingDec(d.f_wing.f_item.selectedLabel) + 2*d.f_wing.f_plus.selectedIndex;
			wing_def = c.getWingDef(d.f_wing.f_item.selectedLabel) + 2*d.f_wing.f_plus.selectedIndex + Math.max(0,d.f_wing.f_plus.selectedIndex - 9) + calc::fact(d.f_wing.f_plus.selectedIndex - 9);
			if(d.f_wing.f_cop.selectedLabel == "生命増加")wing_hp = 50 + d.f_wing.f_plus.selectedIndex * 5;
			if(d.f_wing.f_cop.selectedLabel == "マナ増加")wing_mana = 50 + d.f_wing.f_plus.selectedIndex * 5;
			if(d.f_wing.f_cop.selectedLabel == "防御無視3%")wing_ignore = 3;
		}else if(c.getWingType(d.f_wing.f_item.selectedLabel) == 3){//3次羽
			wing_inc = c.getWingInc(d.f_wing.f_item.selectedLabel) + 2*d.f_wing.f_plus.selectedIndex;
			wing_dec = c.getWingDec(d.f_wing.f_item.selectedLabel)+ 2*d.f_wing.f_plus.selectedIndex;
			wing_def = c.getWingDef(d.f_wing.f_item.selectedLabel) + 4*d.f_wing.f_plus.selectedIndex + calc::fact(d.f_wing.f_plus.selectedIndex - 9);
			if(d.f_wing.f_cop.selectedLabel == "防御無視5%")wing_ignore = 5;
		}else if(c.getWingType(d.f_wing.f_item.selectedLabel) == 4){//マント
			wing_inc = c.getWingInc(d.f_wing.f_item.selectedLabel) + 2*d.f_wing.f_plus.selectedIndex;
			wing_def = c.getWingDef(d.f_wing.f_item.selectedLabel) + 2*d.f_wing.f_plus.selectedIndex + Math.max(0,d.f_wing.f_plus.selectedIndex - 9) + calc::fact(d.f_wing.f_plus.selectedIndex - 9);
			if(d.f_wing.f_cop.selectedLabel == "生命増加")wing_hp = 50 + d.f_wing.f_plus.selectedIndex * 5;
			if(d.f_wing.f_cop.selectedLabel == "マナ増加")wing_mana = 50 + d.f_wing.f_plus.selectedIndex * 5;
			if(d.f_wing.f_cop.selectedLabel == "防御無視3%")wing_ignore = 3;
			if(d.f_wing.f_cop.selectedLabel == "統率増加")wing_rec = 10 + d.f_wing.f_plus.selectedIndex * 5;
		}
		if(d.f_wing.f_op.selectedItem[1] == "攻撃")//羽の追加攻撃力
			wing_op = d.f_wing.f_op.selectedItem[2];
		if(d.f_wing.f_op.selectedItem[1] == "魔力")//羽の追加魔力
			wing_magicop = d.f_wing.f_op.selectedItem[2];
		if(d.f_wing.f_op.selectedItem[1] == "防御")//羽の追加防御
			wing_def += d.f_wing.f_op.selectedItem[2];
		if(d.f_wing.f_op.selectedItem[1] == "呪い")//羽の追加呪い
			wing_noroi += d.f_wing.f_op.selectedItem[2];
	}
	//スキル
	skill=0;//スキル威力
	magic_skill=0;//魔法スキル威力
	//サポート
	support_a=parseFloat(d.s_aplus.text);//A+
	support_g=parseInt(d.s_gplus.text);//G+
	support_c=parseInt(d.s_cplus.text);//C+
	support_sb=parseInt(d.s_sb.text);//SB
	support_sl=parseInt(d.s_sl.text);//SL
	//特殊
	if(d.f_ring1.f_kind.selectedLabel == "パンダ変化" || d.f_ring2.f_kind.selectedLabel == "パンダ変化")
	{etc_attack+=30;etc_magic+=30;}
	if(d.f_ring1.f_kind.selectedLabel == "魔法師" || d.f_ring2.f_kind.selectedLabel == "魔法師")
		etc_mahouring=true;//魔法師の指輪の有無
	if(d.f_ring1.f_kind.selectedLabel == "大魔法師" || d.f_ring2.f_kind.selectedLabel == "大魔法師")
		etc_daimahouring=true;//大魔法師の爪の有無
	if(d.f_ring1.f_kind.selectedLabel == "スケルトン" || d.f_ring2.f_kind.selectedLabel == "スケルトン")
	{etc_attack+=40;etc_magic+=40;etc_noroi+=40;}
	if(d.s_myou.selected)etc_miracle=true;//妙薬
	if(d.s_sake.selected)etc_sake=true;//酒
	if(d.s_sera.selected)etc_sera=true;//セラフィー
	for each(var item:ComboBox in [d.s_item]){
		if(item.selectedLabel == "攻撃力+25"){etc_attack+=25;etc_magic+=25;}//かぼちゃや課金アイテムでの攻撃力上昇分
		if(item.selectedLabel == "攻撃力+30"){etc_attack+=30;etc_magic+=30;}//かぼちゃや課金アイテムでの攻撃力上昇分
		if(item.selectedLabel == "攻撃力+40"){etc_attack+=40;etc_magic+=40;}//かぼちゃや課金アイテムでの攻撃力上昇分
		if(item.selectedLabel == "速度+10")etc_speed+=10;//速度
		if(item.selectedLabel == "速度+15")etc_speed+=15;//速度
		if(item.selectedLabel == "防御力+60")etc_def+=60;//防御力上昇
		if(item.selectedLabel == "防御力+100")etc_def+=100;//防御力上昇
		if(item.selectedLabel == "生命+200")etc_hp+=200;//生命
		if(item.selectedLabel == "生命+500")etc_hp+=500;//生命
		if(item.selectedLabel == "生命+700")etc_hp+=700;//生命
		if(item.selectedLabel == "マナ+300")etc_mana+=300;//マナ
		if(item.selectedLabel == "マナ+500")etc_mana+=500;//マナ
		if(item.selectedLabel == "マナ+700")etc_mana+=700;//マナ
		if(item.selectedLabel == "AG回復+10")etc_agah+=10;//AG回復＋
	}
	for each(item in [d.s_scroll,d.s_hiyaku]){
		if(item.selectedLabel == "攻撃力+30"){etc_attack+=30;etc_attack2+=30;}//課金アイテムでの攻撃力上昇分
		if(item.selectedLabel == "魔力+30"){etc_magic+=30;etc_magic2+=30;}//魔力
		if(item.selectedLabel == "速度+15")etc_speed+=15;//速度
		if(item.selectedLabel == "防御力+60")etc_def+=60;//防御力上昇
		if(item.selectedLabel == "生命+200")etc_hp+=200;//生命
		if(item.selectedLabel == "マナ+300")etc_mana+=300;//マナ
		if(item.selectedLabel == "クリダメ+20%")etc_cri+=20;//クリダメ＋
		if(item.selectedLabel == "EXDダメ+20%")etc_exd+=20;//ＥＸＤダメ＋
		if(item.selectedLabel == "力+50")etc_str+=50;//力
		if(item.selectedLabel == "敏捷+50")etc_agi+=50;//敏
		if(item.selectedLabel == "体力+50")etc_vit+=50;//体力
		if(item.selectedLabel == "エナ+50")etc_ene+=50;//エナジー
		if(item.selectedLabel == "統率+50")etc_rec+=50;//統率
	}
	//EXOP
	if(d.f_right.f_kind.selectedLabel == "EX" || d.f_right.f_kind.selectedLabel == "EXソケット"){
		for(var i:int = 0;i<d.f_right.f_exop.length;i++){
			var e:String = d.f_right.f_exop[i].selectedLabel;
			if(e == "攻撃2%")exop2per=true;//EXOP攻撃力2%
			if(e == "攻撃lv20")exoplv20=true;//EXOP攻撃力LV/20
			if(e == "魔力2%")exopmagic2per=true;//EXOP魔力2%
			if(e == "魔力lv20")exopmagiclv20=true;//EXOP魔力LV/20
			if(e == "EXD")exopexd=true;//EXOPEXD
			if(e == "速度+7")exopspeed=true;//EXOP速度
		}
	}
	//EXOP左手
	if(d.f_left.f_kind.selectedLabel == "EX" || d.f_left.f_kind.selectedLabel == "EXソケット"){
		if(d.f_left.f_item.selectedItem[0] == "武器"){
			for(i = 0;i<d.f_left.f_exop.length;i++){
				e = d.f_left.f_exop[i].selectedLabel;
				if(e == "攻撃2%")exopleft2per=true;//EXOP攻撃力2%
				if(e == "攻撃lv20")exopleftlv20=true;//EXOP攻撃力LV/20
				if(e == "魔力2%")exopleftmagic2per=true;//EXOP魔力2%
				if(e == "魔力lv20")exopleftmagiclv20=true;//EXOP魔力LV/20
				if(e == "EXD")exopleftexd=true;//EXOPEXD
				if(e == "速度+7")exopleftspeed=true;//EXOP速度
			}
		}
	}
	//EXOPアクセ
	if(d.f_neck.f_kind.selectedLabel == "EX" || d.f_neck.f_kind.selectedLabel == "EXソケット"){
		for(i = 0;i<d.f_neck.f_exop.length;i++){
			e = d.f_neck.f_exop[i].selectedLabel;
			if(e == "攻撃2%")exopac2per=true;//EXOP攻撃力2%
			if(e == "攻撃lv20")exopaclv20=true;//EXOP攻撃力LV/20
			if(e == "魔力2%")exopacmagic2per=true;//EXOP魔力2%
			if(e == "魔力lv20")exopacmagiclv20=true;//EXOP魔力LV/20
			if(e == "EXD")exopacexd=true;//EXOPEXD
			if(e == "速度+7")exopacspeed=true;//EXOP速度
		}
	}
	//EXOP防具
	equipExop(d.f_helm);
	equipExop(d.f_armor);
	equipExop(d.f_glove);
	equipExop(d.f_garter);
	equipExop(d.f_boots);
	if(d.f_left.f_item.dataProvider != "" && d.f_left.f_item.selectedItem[0] == "防具")equipExop(d.f_left);//盾のとき
	equipExop(d.f_ring1);
	equipExop(d.f_ring2);
	
	//ショップアイテムの場合
	for each(var shopitem:Item in [d.f_neck,d.f_ring1,d.f_ring2]){
		if(shopitem.f_kind.selectedLabel == "ショップ"){
			e = shopitem.f_shopitem.selectedLabel;
			if(e == "アメジストリング")exop_dec++;
			if(e == "トパーズリング");
			if(e == "ルビーリング")exop_hp++;
			if(e == "サファイアリング")exop_mana++;
			if(e == "サファイアネックレス");
			if(e == "エメラルドネックレス")exopacspeed=true;
			if(e == "ルビーネックレス")exopacexd=true;
		}
	}
	
	//セットOP
	var a:Array = [d.f_neck,d.f_right,d.f_left,d.f_helm,d.f_armor,d.f_glove,d.f_garter,d.f_boots,d.f_ring1,d.f_ring2];
	var a2:Array = new Array();//セット名をスタックする
	var string:String = new String();
	var ch:Boolean = false;
	for(i=0;i<a.length;i++){
		if(a[i].f_kind.selectedLabel == "セット"){
			//セットOPのステータス部分
			if(a[i].f_cop.selectedItem.type == "力")setop_str += a[i].f_cop.selectedItem.value;
			else if(a[i].f_cop.selectedItem.type == "敏捷")setop_agi += a[i].f_cop.selectedItem.value;
			else if(a[i].f_cop.selectedItem.type == "体力")setop_vit += a[i].f_cop.selectedItem.value;
			else if(a[i].f_cop.selectedItem.type == "エナジー")setop_ene += a[i].f_cop.selectedItem.value;
			else if(a[i].f_cop.selectedItem.type == "統率")setop_rec += a[i].f_cop.selectedItem.value;
			//セット名の取得
			if(i==2 || i==9){//左手又はリング2のとき
				if(a[i-1].f_kind.selectedLabel == "セット"
				 && (a[i-1].f_item.selectedLabel == a[i].f_item.selectedLabel))
				 	continue;
			}
			for(var j:int=0;j<a2.length;j++){//セット名の収集
				if(a2[j].label == a[i].f_item.selectedItem[10]){a2[j].num++;ch = true;break;}
			}
			if(!ch)a2.push({label:a[i].f_item.selectedItem[10],num:1});
			ch = false;
		}
	}
	setop_array = a2;//セット名を保存しておく
	var a3:Array = new Array();
	for(i=0;i<a2.length;i++){//セットOPの取り出し
		for(j=0;j<c.setop.length;j++){//セットOPの一覧
			if(a2[i].label == c.setop[j][0]){//名前の確認
				for(var k:int=2;k<=a2[i].num;k++){
					if(k <= c.setop[j][1]+1){//k個つけたときのセットOPを取得
						var v:int = c.setop[j][k][2];//セットOPの数値
							//ステータス系
						if(c.setop[j][k][1] == "力")setop_str+=v;//力+
						else if(c.setop[j][k][1] == "敏捷")setop_agi+=v;//敏+
						else if(c.setop[j][k][1] == "体力")setop_vit+=v;//体力+
						else if(c.setop[j][k][1] == "エナジー")setop_ene+=v;//エナ+
						else if(c.setop[j][k][1] == "統率")setop_rec+=v;//統率+
						else if(c.setop[j][k][1] == "生命")setop_hp+=v;//HP+
						else if(c.setop[j][k][1] == "マナ")setop_mana+=v;//マナ+
						else if(c.setop[j][k][1] == "AG")setop_ag+=v;//AG+
						else if(c.setop[j][k][1] == "AG 増加量")setop_agah+=v;//AG自動回復量+
							//攻撃力（魔力）系
						else if(c.setop[j][k][1] == "最小攻撃力")setop_min+=v;//最小攻撃力増加
						else if(c.setop[j][k][1] == "最大攻撃力")setop_max+=v;//最大攻撃力増加
						//else if(c.setop[j][k][1] == "")setop_attack+=v;//攻撃力増加
						else if(c.setop[j][k][1] == "魔力")setop_magicper+=v;//魔力増加%
						else if(c.setop[j][k][1] == "スキル攻撃力")setop_skill+=v;//スキル攻撃力増加
						else if(c.setop[j][k][1] == "攻撃成功率")setop_hit+=v;//攻撃成功率増加
						else if(c.setop[j][k][1] == "両手剣装備時ダメージ増加")setop_hands+=v;//両手剣装備時ダメージ増加%
							//防御系
						else if(c.setop[j][k][1] == "防御力")setop_def+=v;//防御力増加
						else if(c.setop[j][k][1] == "盾装備時、防御力")setop_shield+=v;//盾装備時防御力増加%
							//特殊系
						else if(c.setop[j][k][1] == "クリティカルダメージ")setop_cri+=v;//クリティカルダメージ増加
						else if(c.setop[j][k][1] == "クリティカルダメージ確率")setop_criper+=v;//クリティカル確率増加
						else if(c.setop[j][k][1] == "エクセレントダメージ")setop_exd+=v;//エクセレントダメージ増加
						else if(c.setop[j][k][1] == "エクセレントダメージ確率")setop_exdper+=v;//エクセレント確率増加
						else if(c.setop[j][k][1] == "ダメージ増加")setop_damage+=v;//ダメージ増加
						else if(c.setop[j][k][1] == "敵の防御力無視")setop_ignore+=v;//防御無視%
						else if(c.setop[j][k][1] == "ダブルダメージ確率")setop_w+=v;//ダブルダメージ確率%
						else Alert.show("Error:セットOP"+c.setop[j][k][1]);
					}
					if(k == c.setop[j][1]+1){//フルOPを取得
						for(var l:int=0;l<c.setop[j][k+1].length;l++){
							v = c.setop[j][k+1][l][2];//セットOPの数値
								//ステータス系
							if(c.setop[j][k+1][l][1] == "力")setop_str+=v;//力+
							else if(c.setop[j][k+1][l][1] == "敏捷")setop_agi+=v;//敏+
							else if(c.setop[j][k+1][l][1] == "体力")setop_vit+=v;//体力+
							else if(c.setop[j][k+1][l][1] == "エナジー")setop_ene+=v;//エナ+
							else if(c.setop[j][k+1][l][1] == "統率")setop_rec+=v;//統率+
							else if(c.setop[j][k+1][l][1] == "生命")setop_hp+=v;//HP+
							else if(c.setop[j][k+1][l][1] == "マナ")setop_mana+=v;//マナ+
							else if(c.setop[j][k+1][l][1] == "AG")setop_ag+=v;//AG+
							else if(c.setop[j][k+1][l][1] == "AG 増加量")setop_agah+=v;//AG自動回復量+
								//攻撃力（魔力）系
							else if(c.setop[j][k+1][l][1] == "最小攻撃力")setop_min+=v;//最小攻撃力増加
							else if(c.setop[j][k+1][l][1] == "最大攻撃力")setop_max+=v;//最大攻撃力増加
							//else if(c.setop[j][k+1][l][1] == "")setop_attack+=v;//攻撃力増加
							else if(c.setop[j][k+1][l][1] == "魔力")setop_magicper+=v;//魔力増加%
							else if(c.setop[j][k+1][l][1] == "スキル攻撃力")setop_skill+=v;//スキル攻撃力増加
							else if(c.setop[j][k+1][l][1] == "攻撃成功率")setop_hit+=v;//攻撃成功率増加
							else if(c.setop[j][k+1][l][1] == "両手剣装備時ダメージ増加")setop_hands+=v;//両手剣装備時ダメージ増加%
								//防御系
							else if(c.setop[j][k+1][l][1] == "防御力")setop_def+=v;//防御力増加
							else if(c.setop[j][k+1][l][1] == "盾装備時、防御力")setop_shield+=v;//盾装備時防御力増加%
								//特殊系
							else if(c.setop[j][k+1][l][1] == "クリティカルダメージ")setop_cri+=v;//クリティカルダメージ増加
							else if(c.setop[j][k+1][l][1] == "クリティカルダメージ確率")setop_criper+=v;//クリティカル確率増加
							else if(c.setop[j][k+1][l][1] == "エクセレントダメージ")setop_exd+=v;//エクセレントダメージ増加
							else if(c.setop[j][k+1][l][1] == "エクセレントダメージ確率")setop_exdper+=v;//エクセレント確率増加
							else if(c.setop[j][k+1][l][1] == "ダメージ増加")setop_damage+=v;//ダメージ増加
							else if(c.setop[j][k+1][l][1] == "敵の防御力無視")setop_ignore+=v;//防御無視%
							else if(c.setop[j][k+1][l][1] == "ダブルダメージ確率")setop_w+=v;//ダブルダメージ確率%
							else Alert.show("Error:セットOP"+c.setop[j][k+1][l][1]);
						}
					}
				}
			}
		}
	}
	/*
	//セットOP
	var a:Array = [d.f_neck,d.f_right,d.f_left,d.f_helm,d.f_armor,d.f_glove,d.f_garter,d.f_boots,d.f_ring1,d.f_ring2];
	var a2:Array = new Array();//セット名をスタックする
	var string:String = new String();
	var ch:Boolean = false;
	for(i=0;i<a.length;i++){//[0]:名前 [1][2~7]:OP [2]:フルOP
		if(a[i].f_kind.selectedLabel == "セット"){
			string = a[i].f_item.selectedLabel.substr(0,a[i].f_item.selectedLabel.indexOf("の"));//セット名の取得
			for(var j:int=0;j<a2.length;j++){
				if(a2[j].label == string){a2[j].num++;ch = true;break;}
			}
			if(!ch)a2.push({label:string,num:1});
			ch = false;
			//セットOPのステータス部分
			if(a[i].f_cop.selectedItem.type == "力")setop_str += a[i].f_cop.selectedItem.value;
			else if(a[i].f_cop.selectedItem.type == "敏捷")setop_agi += a[i].f_cop.selectedItem.value;
			else if(a[i].f_cop.selectedItem.type == "体力")setop_vit += a[i].f_cop.selectedItem.value;
			else if(a[i].f_cop.selectedItem.type == "エナジー")setop_ene += a[i].f_cop.selectedItem.value;
			else if(a[i].f_cop.selectedItem.type == "統率")setop_rec += a[i].f_cop.selectedItem.value;
		}
	}
	var a3:Array = new Array();
	for(i=0;i<a2.length;i++){//セットOPの取り出し
		for(j=0;j<c.setop.length;j++){//セットOPの一覧
			if(a2[i].label == c.setop[j][0]){//名前の確認
				for(var k:int=2;k<=a2[i].num;k++){
					if(k < c.setop[j][1].length){//k個つけたときのセットOPを取得
						a = c.setop[j][1][k].split(/ \+/);//名前と値に分割
						a3 = a[1].match(/[0-9]/g);
						string = "";
						while(a3.length != 0){
							string += a3.shift();
						}
						var v:int = parseInt(string);
							//ステータス系
						if(a[0] == "力")setop_str+=v;//力+
						else if(a[0] == "敏捷")setop_agi+=v;//敏+
						else if(a[0] == "体力")setop_vit+=v;//体力+
						else if(a[0] == "エナジー")setop_ene+=v;//エナ+
						else if(a[0] == "統率")setop_rec+=v;//統率+
						else if(a[0] == "生命")setop_hp+=v;//HP+
						else if(a[0] == "マナ")setop_mana+=v;//マナ+
						else if(a[0] == "AG")setop_ag+=v;//AG+
						else if(a[0] == "AG 増加量")setop_agah+=v;//AG自動回復量+
							//攻撃力（魔力）系
						else if(a[0] == "最小攻撃力")setop_min+=v;//最小攻撃力増加
						else if(a[0] == "最大攻撃力")setop_max+=v;//最大攻撃力増加
						//else if(a[0] == "")setop_attack+=v;//攻撃力増加
						else if(a[0] == "魔力")setop_magicper+=v;//魔力増加%
						else if(a[0] == "スキル攻撃力")setop_skill+=v;//スキル攻撃力増加
						else if(a[0] == "攻撃成功率")setop_hit+=v;//攻撃成功率増加
						else if(a[0] == "両手剣装備時ダメージ増加")setop_hands+=v;//両手剣装備時ダメージ増加%
							//防御系
						else if(a[0] == "防御力")setop_def+=v;//防御力増加
						else if(a[0] == "盾装備時、防御力")setop_shield+=v;//盾装備時防御力増加%
							//特殊系
						else if(a[0] == "クリティカルダメージ")setop_cri+=v;//クリティカルダメージ増加
						else if(a[0] == "クリティカルダメージ確率")setop_criper+=v;//クリティカル確率増加
						else if(a[0] == "エクセレントダメージ")setop_exd+=v;//エクセレントダメージ増加
						else if(a[0] == "エクセレントダメージ確率")setop_exdper+=v;//エクセレント確率増加
						else if(a[0] == "ダメージ増加")setop_damage+=v;//ダメージ増加
						else if(a[0] == "敵の防御力無視")setop_ignore+=v;//防御無視%
						else if(a[0] == "ダブルダメージ確率")setop_w+=v;//ダブルダメージ確率%
						else Alert.show("Error:セットOP"+a[0]);
					}
					if(k == c.setop[j][1].length - 1){//フルOPを取得
						for(var l:int=1;l<c.setop[j][2].length;l++){
							a = c.setop[j][2][l].split(/ \+/);//名前と値に分割
							a3 = a[1].match(/[0-9]/g);
							string = "";
							while(a3.length != 0){
								string += a3.shift();
							}
							v = parseInt(string);
								//ステータス系
							if(a[0] == "力")setop_str+=v;//力+
							else if(a[0] == "敏捷")setop_agi+=v;//敏+
							else if(a[0] == "体力")setop_vit+=v;//体力+
							else if(a[0] == "エナジー")setop_ene+=v;//エナ+
							else if(a[0] == "統率")setop_rec+=v;//統率+
							else if(a[0] == "生命")setop_hp+=v;//HP+
							else if(a[0] == "マナ")setop_mana+=v;//マナ+
							else if(a[0] == "AG")setop_ag+=v;//AG+
							else if(a[0] == "AG 増加量")setop_agah+=v;//AG自動回復量+
								//攻撃力（魔力）系
							else if(a[0] == "最小攻撃力")setop_min+=v;//最小攻撃力増加
							else if(a[0] == "最大攻撃力")setop_max+=v;//最大攻撃力増加
							//else if(a[0] == "")setop_attack+=v;//攻撃力増加
							else if(a[0] == "魔力")setop_magicper+=v;//魔力増加%
							else if(a[0] == "スキル攻撃力")setop_skill+=v;//スキル攻撃力増加
							else if(a[0] == "攻撃成功率")setop_hit+=v;//攻撃成功率増加
							else if(a[0] == "両手剣装備時ダメージ増加")setop_hands+=v;//両手剣装備時ダメージ増加%
								//防御系
							else if(a[0] == "防御力")setop_def+=v;//防御力増加
							else if(a[0] == "盾装備時、防御力")setop_shield+=v;//盾装備時防御力増加%
								//特殊系
							else if(a[0] == "クリティカルダメージ")setop_cri+=v;//クリティカルダメージ増加
							else if(a[0] == "クリティカルダメージ確率")setop_criper+=v;//クリティカル確率増加
							else if(a[0] == "エクセレントダメージ")setop_exd+=v;//エクセレントダメージ増加
							else if(a[0] == "エクセレントダメージ確率")setop_exdper+=v;//エクセレント確率増加
							else if(a[0] == "ダメージ増加")setop_damage+=v;//ダメージ増加
							else if(a[0] == "敵の防御力無視")setop_ignore+=v;//防御無視%
							else if(a[0] == "ダブルダメージ確率")setop_w+=v;//ダブルダメージ確率%
							else Alert.show("Error:セットOP"+a[0]);
						}
					}
				}
			}
		}
	}
	*/
	//エンチャントOP
	a = [d.f_right,d.f_left,d.f_helm,d.f_armor,d.f_glove,d.f_garter,d.f_boots];
	string = "";
	v = 0;
	for(i=0;i<a.length;i++){
		if(a[i].f_kind.selectedLabel == "通常" || a[i].f_kind.selectedLabel == "EX"){
			if(a[i].f_enop.selectedLabel == "")continue;
			v = parseInt(a[i].f_enop_value.selectedLabel);//数値取得
			//武器類
			if(a[i].f_enop.selectedLabel == "最小攻撃力")enop_min+=v;//最小攻撃力上昇
			else if(a[i].f_enop.selectedLabel == "最大攻撃力")enop_max+=v;//最大攻撃力上昇
			else if(a[i].f_enop.selectedLabel == "スキル攻撃力")enop_skill+=v;//スキル攻撃力上昇
			else if(a[i].f_enop.selectedLabel == "攻撃力")enop_attack+=v;//攻撃力上昇
			else if(a[i].f_enop.selectedLabel == "Cダメ")enop_cri+=v;//クリティカルダメージ上昇
			else if(a[i].f_enop.selectedLabel == "対人攻撃率")enop_pvphit+=v;//対人攻撃成功率上昇
			else if(a[i].f_enop.selectedLabel == "SD比率減")enop_sddec+=v;//SD減少率%
			else if(a[i].f_enop.selectedLabel == "SD無視")enop_sdignore+=v;//SD無視%
			else if(a[i].f_enop.selectedLabel == "魔力上昇" && a[i] == d.f_right)enop_magic+=v;//魔力上昇
			else if(a[i].f_enop.selectedLabel == "魔力上昇")enop_left_magic+=v;//魔力上昇（左手）
			//防具類
			else if(a[i].f_enop.selectedLabel == "防御力上昇")enop_def+=v;//防御力上昇
			else if(a[i].f_enop.selectedLabel == "最大AG上昇")enop_ag+=v;//最大AG上昇
			else if(a[i].f_enop.selectedLabel == "最大生命上昇")enop_hp+=v;//最大生命上昇
			else if(a[i].f_enop.selectedLabel == "自動生命回復")enop_ah+=v;//自動生命回復量上昇
			else if(a[i].f_enop.selectedLabel == "自動マナ回復")enop_mana+=v;//マナ自動回復量上昇
			else if(a[i].f_enop.selectedLabel == "対人防御成功")enop_pvpavoid+=v;//対人防御成功率上昇
			else if(a[i].f_enop.selectedLabel == "ダメ減")enop_dec+=v;//ダメージ減少%
			else if(a[i].f_enop.selectedLabel == "SD比率上昇")enop_sdrate+=v;//SD比率上昇%
			else Alert.show("Error:エンチャントOP"+a[i].f_enop.selectedLabel);
		}
	}
	//ソケットOP
	a = [d.f_right,d.f_left,d.f_helm,d.f_armor,d.f_glove,d.f_garter,d.f_boots];
	string = "";
	v = 0;
	for(i=0;i<a.length;i++){
		if(a[i].f_kind.selectedLabel == "ソケット" || a[i].f_kind.selectedLabel == "EXソケット"){
			for(j=0;j<a[i].f_soop.length;j++){
				if(!a[i].f_soop[j].visible)continue;
				if(a[i].f_soop[j].selectedLabel == "")continue;
				v = parseInt(a[i].f_soop_value[j].selectedLabel);//数値取得
				//炎のシード
				if(a[i].f_soop[j].selectedLabel == "攻撃魔力lv" && a[i] == d.f_right)soop_lv20.push(v);//攻撃力・魔力上昇LV/x
				else if(a[i].f_soop[j].selectedLabel == "攻撃魔力lv")soop_lv20_left.push(v);//左手攻撃力・魔力上昇LV/x
				else if(a[i].f_soop[j].selectedLabel == "最小攻撃魔力")soop_min+=v;//最小攻撃力・魔力上昇
				else if(a[i].f_soop[j].selectedLabel == "最大攻撃魔力")soop_max+=v;//最大攻撃力・魔力上昇
				else if(a[i].f_soop[j].selectedLabel == "攻撃魔力増加")soop_attack+=v;//攻撃力・魔力上昇
				else if(a[i].f_soop[j].selectedLabel == "速度増加")soop_speed+=v;//攻撃速度上昇
				else if(a[i].f_soop[j].selectedLabel == "AG消費減少")soop_agdec.push(v);//AG消耗量減少%
				//稲妻のシード
				else if(a[i].f_soop[j].selectedLabel == "EXD増加")soop_exd+=v;//EXD増加
				else if(a[i].f_soop[j].selectedLabel == "EXD確率")soop_exdper+=v;//EXD確率増加%
				else if(a[i].f_soop[j].selectedLabel == "クリ増加")soop_cri+=v;//クリダメ増加
				else if(a[i].f_soop[j].selectedLabel == "クリ確率")soop_criper+=v;//クリ確率増加%
				//氷のシード
				else if(a[i].f_soop[j].selectedLabel == "スキル増加")soop_skill+=v;//スキル攻撃力上昇
				else if(a[i].f_soop[j].selectedLabel == "攻撃成功率")soop_hit+=v;//攻撃成功率上昇
				//水のシード
				else if(a[i].f_soop[j].selectedLabel == "防御力増加")soop_def+=v;//防御力増加
				else if(a[i].f_soop[j].selectedLabel == "盾装備時増加")soop_shield+=v;//盾装備時防御力増加%
				else if(a[i].f_soop[j].selectedLabel == "ダメ減")soop_dec+=v;//ダメージ減少%
				else if(a[i].f_soop[j].selectedLabel == "ダメ反")soop_ref+=v;//ダメージ反射%
				else if(a[i].f_soop[j].selectedLabel == "防御成功")soop_avoid.push(v);//防御成功率増加%
				//風のシード
				else if(a[i].f_soop[j].selectedLabel == "最大生命増加")soop_hp.push(v);//最大生命増加%
				else if(a[i].f_soop[j].selectedLabel == "最大マナ増加")soop_mana.push(v);//最大マナ増加%
				else if(a[i].f_soop[j].selectedLabel == "最大AG増加")soop_ag+=v;//最大AG増加
				else if(a[i].f_soop[j].selectedLabel == "自動生命回復")soop_ah+=v;//生命自動回復増加
				else if(a[i].f_soop[j].selectedLabel == "自動マナ回復")soop_manaah+=v;//マナ自動回復量増加
				else if(a[i].f_soop[j].selectedLabel == "自動AG回復")soop_agah+=v;//AG自動回復量増加
				//地のシード
				else if(a[i].f_soop[j].selectedLabel == "体力増加")soop_vit+=v;//体力増加
				else Alert.show("Error:ソケットOP"+a[i].f_soop[j].selectedLabel);
			}
			for(j=0;j<a[i].f_sobonus.length;j++){
				if(!a[i].f_sobonus[j].visible)continue;
				//ボーナスソケット
				if(a[i].f_sobonus[j].selectedLabel == "攻撃力+11")sobonus_attack+=11;//攻撃力増加
				else if(a[i].f_sobonus[j].selectedLabel == "スキル+11")sobonus_skill+=11;//スキル増加
				else if(a[i].f_sobonus[j].selectedLabel == "魔力+5")sobonus_magic+=5;//魔力増加
				else if(a[i].f_sobonus[j].selectedLabel == "防御力+24")sobonus_def+=24;//防御力増加
				else if(a[i].f_sobonus[j].selectedLabel == "最大生命+29")sobonus_hp+=29;//最大生命増加
			}
		}
	}
	//モンスター
	monster_def=0;//モンスター防御力
}
calc function initData():void{
	use namespace calc;
	//キャラクター
	lv=0;//キャラクターのレベル
	str=0;//キャラクターの力
	agi=0;//キャラクターの敏捷
	vit=0;//キャラクターの体力
	ene=0;//キャラクターのエナジー
	rec=0;//キャラクターの統率
	//キャラクター能力
	char_minmax=new Array;//攻撃力
	char_hit=0;//攻撃成功率
	char_pvphit=0;//対人攻撃成功率
	char_def=0;//防御力
	char_avoid=0;//防御成功率
	char_pvpavoid=0;//対人防御成功率
	char_speed=0;//攻撃速度
	char_magicspeed=0;//魔法攻撃速度
	//キャラクター確率
	char_normal=0;//通常率
	char_cri=0;//クリ率
	char_exd=0;//EXD率
	//キャラクター特殊確率
	char_ignore=0;//防御無視確率
	char_wd=0;//WD確率
	//武器
	weapon_min=0;//武器の最小攻撃力
	weapon_max=0;//武器の最大攻撃力
	weapon_op=0;//武器の追加攻撃力
	weapon_magic=0;//武器の魔力%
	weapon_magicop=0;//武器の追加魔力
	weapon_pet=0;//武器のペット攻撃力上昇
	left_weapon_min=0;//左手武器の最小攻撃力
	left_weapon_max=0;//左手武器の最大攻撃力
	left_weapon_op=0;//左手武器の追加攻撃力
	left_weapon_magicop=0;//左手の追加魔力
	left_weapon_noroi=0;//武器の呪い上昇
	left_weapon_noroiop=0;//武器の呪いOP
	//ペット
	pet_inc=0;//ペットのダメージ増加%
	pet_dec=0;//ペットのダメージ吸収%
	pet_fen_inc=0;//フェンリルのダメージ増加%
	pet_fen_dec=0;//フェンリルのダメージ吸収%
	satan=false;//サタン
	angel=false;//守護天使
	//羽
	wing_inc=0;//羽のダメージ増加%
	wing_dec=0;//羽のダメージ吸収%
	wing_op=0;//羽の追加攻撃力
	wing_magicop=0;//羽の追加魔力
	wing_noroi=0;//羽の呪い
	wing_def=0;//羽の防御力
	wing_hp=0;//羽のCOP生命増加
	wing_mana=0;//羽のCOPマナ増加
	wing_ignore=0;//羽のCOP防御無視
	wing_rec=0;//羽のCOP統率増加
	//スキル
	skill=0;//スキル威力
	magic_skill=0;//魔法スキル威力
	//サポート
	support_a=0.0;//A+
	support_g=0;//G+
	support_c=0;//C+
	support_sb=0;//SB
	support_sl=0;//SL
	//特殊
	etc_daimahouring=false;//大魔法師の爪の有無
	etc_mahouring=false;//魔法師の指輪の有無
	etc_miracle=false;//妙薬
	etc_sake=false;//酒
	etc_sera=false;//セラフィー
	etc_attack=0;//かぼちゃや課金アイテムでの攻撃力上昇分
	etc_attack2=0;//課金攻撃力上昇分
	etc_magic=0;//魔力
	etc_magic2=0;//課金魔力
	etc_noroi=0;//呪い
	etc_speed=0;//速度
	etc_def=0;//防御力上昇
	etc_hp=0;//生命
	etc_mana=0;//マナ
	etc_agah=0;//AG回復＋
	etc_cri=0;//クリダメ＋
	etc_exd=0;//EXDダメ＋
	etc_str=0;//力
	etc_agi=0;//敏
	etc_vit=0;//体力
	etc_ene=0;//エナジー
	etc_rec=0;//統率
	//EXOP
	exop2per=false;//EXOP攻撃力2%
	exoplv20=false;//EXOP攻撃力LV/20
	exopmagic2per=false;//EXOP魔力2%
	exopmagiclv20=false;//EXOP魔力LV/20
	exopexd=false;//EXOPEXD
	exopspeed=false;//EXOP速度
	//EXOP左手
	exopleft2per=false;//EXOP攻撃力2%
	exopleftlv20=false;//EXOP攻撃力LV/20
	exopleftmagic2per=false;//EXOP魔力2%
	exopleftmagiclv20=false;//EXOP魔力LV/20
	exopleftexd=false;//EXOPEXD
	exopleftspeed=false;//EXOP速度
	//EXOPアクセ
	exopac2per=false;//EXOP攻撃力2%
	exopaclv20=false;//EXOP攻撃力LV/20
	exopacmagic2per=false;//EXOP魔力2%
	exopacmagiclv20=false;//EXOP魔力LV/20
	exopacexd=false;//EXOPEXD
	exopacspeed=false;//EXOP速度
	//EXOP防具
	exop_dec=0;//EXOPダメ減4%
	exop_ref=0;//EXOPダメージ反射5%
	exop_avoid=0;//EXOP防御成功率増加10%
	exop_hp=0;//EXOP最大生命増加4%
	exop_mana=0;//EXOP最大マナ増加4%
	//セットOP
	setop_array=new Array();//セット名の配列でも・・・
	//ステータス系
	setop_str=0;//力+
	setop_agi=0;//敏+
	setop_vit=0;//体力+
	setop_ene=0;//エナ+
	setop_rec=0;//統率+
	setop_hp=0;//HP+
	setop_mana=0;//マナ+
	setop_ag=0;//AG+
	setop_agah=0;//AG自動回復量+
	//攻撃力（魔力）系
	setop_min=0;//最小攻撃力増加
	setop_max=0;//最大攻撃力増加
	setop_attack=0;//攻撃力増加
	setop_magicper=0;//魔力増加%
	setop_skill=0;//スキル攻撃力増加
	setop_hit=0;//攻撃成功率増加
	setop_hands=0;//両手剣装備時ダメージ増加%
	//防御系
	setop_def=0;//防御力増加
	setop_shield=0;//盾装備時防御力増加%
	//特殊系
	setop_cri=0;//クリティカルダメージ増加
	setop_criper=0;//クリティカル確率増加
	setop_exd=0;//エクセレントダメージ増加
	setop_exdper=0;//エクセレント確率増加
	setop_damage=0;//ダメージ増加
	setop_ignore=0;//防御無視%
	setop_w=0;//ダブルダメージ確率%
	//エンチャントOP
	//武器類
	enop_min=0;//最小攻撃力上昇
	enop_max=0;//最大攻撃力上昇
	enop_attack=0;//攻撃力上昇
	enop_cri=0;//クリティカルダメージ上昇
	enop_skill=0;//スキル攻撃力上昇
	enop_pvphit=0;//対人攻撃成功率上昇
	enop_sddec=0;//SD減少率%
	enop_sdignore=0;//SD無視%
	enop_magic=0;//魔力上昇
	enop_left_magic=0;//魔力上昇（左手）
	//防具類
	enop_def=0;//防御力上昇
	enop_ag=0;//最大AG上昇
	enop_hp=0;//最大生命上昇
	enop_ah=0;//自動生命回復量上昇
	enop_mana=0;//マナ自動回復量上昇
	enop_pvpavoid=0;//対人防御成功率上昇
	enop_dec=0;//ダメージ減少%
	enop_sdrate=0;//SD比率上昇%
	//ソケットOP
	//炎のシード
	soop_lv20=new Array();//攻撃力・魔力上昇LV/x
	soop_lv20_left=new Array();//左手攻撃力・魔力上昇LV/x
	soop_min=0;//最小攻撃力・魔力上昇
	soop_max=0;//最大攻撃力・魔力上昇
	soop_attack=0;//攻撃力・魔力上昇
	soop_speed=0;//攻撃速度上昇
	soop_agdec=new Array();//AG消耗量減少%
	//稲妻のシード
	soop_exd=0;//EXD増加
	soop_exdper=0;//EXD確率増加%
	soop_cri=0;//クリダメ増加
	soop_criper=0;//クリ確率増加%
	//氷のシード
	soop_skill=0;//スキル攻撃力上昇
	soop_hit=0;//攻撃成功率上昇
	//水のシード
	soop_def=0;//防御力増加
	soop_shield=0;//盾装備時防御力増加%
	soop_dec=0;//ダメージ減少%
	soop_ref=0;//ダメージ反射%
	soop_avoid=new Array();//防御成功率増加%
	//風のシード
	soop_hp=new Array();//最大生命増加%
	soop_mana=new Array();//最大マナ増加%
	soop_ag=0;//最大AG増加
	soop_ah=0;//生命自動回復増加
	soop_manaah=0;//マナ自動回復量増加
	soop_agah=0;//AG自動回復量増加
	//地のシード
	soop_vit=0;//体力増加
	//ボーナスソケット
	sobonus_attack=0;//攻撃力上昇
	sobonus_skill=0;//スキル攻撃力上昇
	sobonus_magic=0;//魔力上昇
	sobonus_def=0;//防御力上昇
	sobonus_hp=0;//最大生命増加
	//モンスター
	monster_def=0;//モンスター防御力
	
	undefine = false;
}