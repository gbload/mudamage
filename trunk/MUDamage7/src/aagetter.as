// ActionScript file
import AAgetter.InputData;

import MuCalc.MuChar;

import mx.controls.Alert;

calc function AACalcDamage():void{
	use namespace calc;
	use namespace damage;
	//======================================================================================
	//　キャラクター計算
	//======================================================================================
	//フォームの値を取得
	getForm();
	//MLVのチェック
	var tmpcount:MLVcount;
	if(dat::d.f_lv.text != "400"){
		tmpcount = dat::mlvcount;
		dat::mlvcount = new MLVcount();
	}
	//MuChar
	var muc:MuChar = calcchar::main();
	//MLVのチェック
	if(dat::d.f_lv.text != "400"){
		dat::mlvcount = tmpcount;
	}
	//======================================================================================
	//　ダメージ計算
	//======================================================================================
	var r_min:int = 0;
	var l_min:int = 0;
	var r_max:int = 0;
	var l_max:int = 0;
	var x_min:int = 0;
	var x_max:int = 0;
	var x_cri:int = 0;
	var x_exd:int = 0;
	var speedms:int = 0;
	for(var j:int = 0;j<muc.skill.length;j++){
		muc.now_skill = muc.skill[j];
		//必要なスキル以外の場合はスルー
		if(muc.now_skill[0] != dat::d.aa_skill.selectedLabel)continue;
		//スキル計算
		if(muc.skill[j][5] == 4){//ダークスピリット
			if(muc.skill[j][0] == "フレイムハンド(単体)"){
				x_min = Math.max(muc.darkspirit[0] - muc.monster_def,muc.darkspirit[5]/10);
				x_max = Math.max(muc.darkspirit[1] - muc.monster_def,muc.darkspirit[5]/10);
			}else{
				x_min = Math.max(muc.darkspirit[2] - muc.monster_def,muc.darkspirit[5]/10);
				x_max = Math.max(muc.darkspirit[3] - muc.monster_def,muc.darkspirit[5]/10);
			}
			x_cri=x_max;
			x_exd=0;
		}else if(muc.skill[j][3] == "魔法"){//魔法
			//x_min = calcMagicMinMax(lefthund,true);//MIN
		    //x_max = calcMagicMinMax(lefthund,false);//MAX
		    x_min = calcMagicDamage(muc,muc.skill_minmax[j][0]);//最小
		    x_cri = calcMagicDamage(muc,muc.skill_minmax[j][2]);//クリ
		    x_exd = calcMagicDamage(muc,muc.skill_minmax[j][3]);//EXD
		    x_max = calcMagicDamage(muc,muc.skill_minmax[j][1]);//最大
		}else{
		    var elf:Boolean = false;//スキル%なし
		    if(muc.skill[j][0] == "乱れ撃ち" || muc.skill[j][0] == "マルチショット")
		    	elf=true;//スキル2倍がない計算
		    x_min = calcDamage(muc,muc.skill_minmax[j][0],elf);//最小
		    x_cri = calcDamage(muc,muc.skill_minmax[j][2],elf,true,false);//クリ
		    x_exd = calcDamage(muc,muc.skill_minmax[j][3],elf,false,true);//EXD
		    x_max = calcDamage(muc,muc.skill_minmax[j][1],elf);//最大
		}
		break;
	}
	//======================================================================================
	//　石造破壊シミュレータにデータを追加
	//======================================================================================
	//石造破壊シミュレータにデータを追加
	var id:InputData = new InputData();
	//タイトル
	id.title = dat::d.f_title.text;
	//スキル
	id.skill = dat::d.aa_skill.selectedLabel;
	//速度
	if(id.skill == "チェーンライトニング")id.speed = muc.magicspeed;
	else id.speed = muc.speed;
	//速度ms
	id.speedms = muc.now_skill[2][0];
	//ディレイ
	if(id.skill == "ゴッドブロー")id.delay = 200;
	else if(id.skill == "マルチショット")id.delay = 100;
	else if(id.skill == "ファイアスクリーム")id.delay = 300;
	else if(id.skill == "カオティックディセイアー")id.delay = 300;
	else if(id.skill == "ブラッドアタック")id.delay = 300;
	else if(id.skill == "チェーンライトニング")id.delay = 200;
	//ダメージ
	id.min = x_min;
	id.max = x_max;
	id.cri = x_cri;
	id.exd = x_exd;
	//確率
	id.criper = muc.criper;
	id.exdper = muc.exd;
	id.wdper = muc.wd;
	
	dat::aagetter.setData(id);
}