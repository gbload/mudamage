// ActionScript file
//ダメージ部分でも
import MuCalc.MuChar;

import mx.containers.HDividedBox;
import mx.containers.VDividedBox;
import mx.controls.DataGrid;
import mx.controls.Label;
import mx.controls.dataGridClasses.DataGridColumn;
import mx.core.ClassFactory;

public namespace damage;

damage var vdiv:VDividedBox;
damage var hdiv:HDividedBox;

damage function ln():void{
	use namespace damage;
	hdiv = new HDividedBox();
	vdiv.addChild(hdiv);
}
damage function text(str:String):void{
	use namespace damage;
	var te:Label = new Label();
	te.text = str;
	hdiv.addChild(te);
}
damage function table(muc:MuChar,canvas:Container):void{
	use namespace dat;
	use namespace calc;
	use namespace damage;
	
	var mon:Array = c.getMonster(d.f_map.selectedLabel,parseInt(d.f_mapLv.text));
	//防御無視
	//モンスター情報を表示
	var mtext:Label = new Label();
	mtext.text = "防御無視";
	canvas.addChild(mtext);
	//DataGrid
	var dg:DataGrid = new DataGrid();
	//列を指定
	var dga:Array = new Array();
	var dgc:DataGridColumn = new DataGridColumn();
		dgc.dataField = "skillname";
		dgc.headerText = "スキル名";
		dga.push(dgc);
		dgc.width = 150;
	dgc = new DataGridColumn();
		dgc.dataField = "hitper";
		dgc.headerText = "1HITダメージ/秒";
		dga.push(dgc);
		dgc.width = 150;
	dgc = new DataGridColumn();
		dgc.dataField = "speed";
		dgc.headerText = "回/分";
		dgc.itemRenderer = new ClassFactory(itemRenderer01);
		dga.push(dgc);
	dgc = new DataGridColumn();
		dgc.dataField = "even";	
		dgc.headerText = "1HIT平均";
		dga.push(dgc);
	dgc = new DataGridColumn();
		dgc.dataField = "minmax";
		dgc.headerText = "最小～最大";
		dga.push(dgc);
		dgc.width = 150;
	dgc = new DataGridColumn();
		dgc.dataField = "cri";
		dgc.headerText = "クリティカル";
		dga.push(dgc);
	dgc = new DataGridColumn();
		dgc.dataField = "exd";
		dgc.headerText = "EXD";
		dga.push(dgc);
	dgc = new DataGridColumn();
		dgc.dataField = "hit";
		dgc.headerText = "命中率";
		dga.push(dgc);
	dg.columns = dga;
	//命中率計算
	var hit:int=10000;
	//データの作成
	var sa:Array = new Array();
	muc.monster_def = 0;//モンスターのDEF
	//ダメージ計算
	var hit1array:Array = new Array();
	var minutearray:Array = new Array();
	//変数
	var r_min:int = 0;
	var l_min:int = 0;
	var r_max:int = 0;
	var l_max:int = 0;
	var x_min:int = 0;
	var x_max:int = 0;
	var x_cri:int = 0;
	var x_exd:int = 0;
	var lefthund:Boolean = (dat::d.f_left.f_kind.selectedLabel != "なし" && dat::d.f_left.f_item.selectedItem[0] == "武器");
	for(var j:int = 0;j<muc.skill.length;j++){
		muc.now_skill = muc.skill[j];
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
		//1HIT当たりのダメージを計算
		var hit1:int=0;//1hit当たりのダメージ
		if(muc.skill[j][0] == "フレイムハンド(単体)"){//ダークスピリット
			hit1 += x_max * muc.darkspirit[5]/100;//クリティカル率
			hit1 += ((x_min + x_max)/2) * (100 - muc.darkspirit[5]) / 100;//通常
		}else if(muc.skill[j][0] == "フレイムハンド(範囲)"){//フレイムハンド範囲
			//クリティカル確率0%
			hit1 += ((x_min + x_max)/2);//通常
		}else{//通常
			hit1 += x_exd * muc.exd / 100;//EXD
			hit1 += x_cri * muc.cri / 10000;//クリ
			hit1 += ((x_min + x_max)/2) * muc.normal / 10000;//通常
			hit1 += hit1 * muc.wd/100;//WD
		}
		hit1array.push(hit1);
		//1分当たりの攻撃回数を計算
		var minute:String;
		if(!muc.skill[j][2][0])minute="0";//0だった場合
		else minute = (Math.floor(600000/muc.skill[j][2][0])/10).toString();//攻撃回数計算
		if(!muc.skill[j][2][0] || muc.skill[j][2][1]==0)minute += "?";//不明又は未検証の場合
		minutearray.push(minute);
		//1HITダメージ/秒
		var second:int=0;
		if(muc.skill[j][2][0])second = hit1 * 1000/muc.skill[j][2][0];
		else second = 0;
		//計算結果をスタック
		sa.push({skillname:muc.skill[j][0]
				,hitper:second
				,speed:minute
				,even:hit1
				,minmax:x_min + "～" + x_max
				,cri:x_cri,exd:x_exd});
	}
	dg.dataProvider = sa;//計算結果を登録
	canvas.addChild(dg);
		
	//データの個数だけ表示
	dg.rowCount = sa.length + 1;
	if(sa.length == 0)dg.rowCount = 1;
	
	for(var re:int = 0;re < mon.length;re++){
		//モンスター======================================================================
		var m:Object = mon[re];
		
		//経験値の取得
		var mexp:Array = c.exp[m[2]];
		var minexp:int = 0;
		var maxexp:int = 0;
		if((muc.lv-muc.add_lv) - m[2] - 10 <= 0){
			//モンスターレベルより低いので減少なし
			minexp = mexp[0];
			maxexp = mexp[1];
		}else{
			//モンスターレベルより高いので減少あり
			minexp = mexp[0] * ((m[2]+10)/(muc.lv-muc.add_lv));
			maxexp = mexp[1] * ((m[2]+10)/(muc.lv-muc.add_lv));
		}
		if(muc.lv >= 400 && m[2] < 95){
			// MLVなので、Lv95より低いモンスターは経験値0
			minexp=0;
			maxexp=0;
		}
		if(d.f_map.selectedLabel.match("ブラッドキャッスル") != null){
			// ブラッドキャッスルの場合、経験値半減
			minexp /= 2;
			maxexp /= 2;
		}
		if(mlvcount.exp){
			// MLV経験値増加がある場合
			minexp *= (1 + (mlvcount.exp * 8)/100);
			maxexp *= (1 + (mlvcount.exp * 8)/100);
		}
		var expup:int = parseInt(d.f_exp.text);
		if(expup){
			// エンブレム・イベントでの経験値増加
			minexp *= expup/100;
			maxexp *= expup/100;
		}
		if(muc.ponga){
			//白と黒のポンガ
			minexp *= 1.5;
			maxexp *= 1.5;
		}
		
		//モンスター情報を表示
		mtext = new Label();
		mtext.text = m[1] + " Lv" + m[2] + " HP" + m[3] + " 攻撃力" + m[4] + "～" + m[5]
						+ "(率" + m[8] + ") 防御力" + m[6] + "(率" + m[7] + ")"
						+ " 経験値" + minexp + "～" + maxexp;
		canvas.addChild(mtext);
		
		//DataGrid
		dg = new DataGrid();
		//列を指定
		dga = new Array();
		dgc = new DataGridColumn();
			dgc.dataField = "skillname";
			dgc.headerText = "スキル名";
			dga.push(dgc);
			dgc.width = 150;
		dgc = new DataGridColumn();
			dgc.dataField = "hitper";
			dgc.headerText = "1HITダメージ/秒";
			dga.push(dgc);
			dgc.width = 150;
		dgc = new DataGridColumn();
			dgc.dataField = "speed";
			dgc.headerText = "回/分";
			dgc.itemRenderer = new ClassFactory(itemRenderer01);
			dga.push(dgc);
		dgc = new DataGridColumn();
			dgc.dataField = "even";	
			dgc.headerText = "1HIT平均";
			dga.push(dgc);
		dgc = new DataGridColumn();
			dgc.dataField = "minmax";
			dgc.headerText = "最小～最大";
			dga.push(dgc);
			dgc.width = 150;
		dgc = new DataGridColumn();
			dgc.dataField = "cri";
			dgc.headerText = "クリティカル";
			dga.push(dgc);
		dgc = new DataGridColumn();
			dgc.dataField = "exd";
			dgc.headerText = "EXD";
			dga.push(dgc);
		dgc = new DataGridColumn();
			dgc.dataField = "hit";
			dgc.headerText = "命中率";
			dga.push(dgc);
		dg.columns = dga;
		//データの作成
		sa = new Array();
		muc.monster_def = m[6];//モンスターのDEF
		muc.monster_def -= Math.floor(muc.monster_def * muc.support_inner/100);//インナーベーション
		muc.monster_def -= Math.floor(muc.monster_def * muc.support_ba/100);//血戦 
		//命中率計算
		hit=0;
		if(muc.hit < m[7])hit=5;
		else if(muc.hit == m[7])hit=0;
		else hit = 10000 - (m[7]*10000/muc.hit);
		var hitdarkspirit:int=0;
		if(muc.darkspirit[4] < m[7])hitdarkspirit=5;
		else if(muc.darkspirit[4]  == m[7])hitdarkspirit=0;
		else hitdarkspirit = 10000 - (m[7]*10000/muc.darkspirit[4] );
		//ダメージ計算
		//変数
		r_min = 0;
		l_min = 0;
		r_max = 0;
		l_max = 0;
		x_min = 0;
		x_max = 0;
		x_cri = 0;
		x_exd = 0;
		lefthund = (dat::d.f_left.f_kind.selectedLabel != "なし" && dat::d.f_left.f_item.selectedItem[0] == "武器");
		for(j = 0;j<muc.skill.length;j++){
			muc.now_skill = muc.skill[j];
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
			    elf = false;//スキル%なし
			    if(muc.skill[j][0] == "乱れ撃ち" || muc.skill[j][0] == "マルチショット")
			    	elf=true;//スキル2倍がない計算
			    x_min = calcDamage(muc,muc.skill_minmax[j][0],elf);//最小
			    x_cri = calcDamage(muc,muc.skill_minmax[j][2],elf,true,false);//クリ
			    x_exd = calcDamage(muc,muc.skill_minmax[j][3],elf,false,true);//EXD
			    x_max = calcDamage(muc,muc.skill_minmax[j][1],elf);//最大
			}
			//1HIT当たりのダメージを計算
			hit1=0;//1hit当たりのダメージ
			if(muc.skill[j][0] == "フレイムハンド(単体)"){//ダークスピリット
				hit1 += x_max * muc.darkspirit[5]/100;//クリティカル率
				if(muc.darkspirit[0] < muc.monster_def + muc.darkspirit[5]/10 && muc.darkspirit[1] > muc.monster_def + muc.darkspirit[5]/10){//固定ダメージ割合計算
					var fix:int = Math.floor(10000*(muc.monster_def + muc.darkspirit[5]/10 - muc.darkspirit[0])/(muc.darkspirit[1] - muc.darkspirit[0]));
					hit1 += ((x_min * fix + ((x_min + x_max)/2) * (10000 - fix))/10000) * (100 - muc.darkspirit[5]) / 100;//通常
				}else
					hit1 += ((x_min + x_max)/2) * (100 - muc.darkspirit[5]) / 100;//通常
				hit1 = hit1 * hitdarkspirit / 10000;//命中
			}else if(muc.skill[j][0] == "フレイムハンド(範囲)"){//フレイムハンド範囲
				//クリティカル確率0%
				if(muc.darkspirit[2] < muc.monster_def + muc.darkspirit[5]/10 && muc.darkspirit[3] > muc.monster_def + muc.darkspirit[5]/10){//固定ダメージ割合計算
					fix = Math.floor(10000*(muc.monster_def + muc.darkspirit[5]/10 - muc.darkspirit[2])/(muc.darkspirit[3] - muc.darkspirit[2]));
					hit1 += (x_min * fix + ((x_min + x_max)/2) * (10000 - fix))/10000;//通常
				}else
					hit1 += ((x_min + x_max)/2);//通常
				hit1 = hit1 * hitdarkspirit / 10000;//命中
			}else{//通常
				hit1 += x_exd * muc.exd / 100;//EXD
				hit1 += x_cri * muc.cri / 10000;//クリ
				if(muc.skill_minmax[j][0] < muc.monster_def + Math.floor((muc.lv - muc.add_lv)/10) && muc.skill_minmax[j][1] > muc.monster_def + Math.floor((muc.lv - muc.add_lv)/10)){//固定ダメージ割合計算
					fix = Math.floor(10000*(muc.monster_def + Math.floor((muc.lv - muc.add_lv)/10) - muc.skill_minmax[j][0])/(muc.skill_minmax[j][1] - muc.skill_minmax[j][0]));
					hit1 += ((x_min * fix + ((x_min + x_max)/2) * (10000 - fix))/10000) * muc.normal / 10000;//通常
				}else
					hit1 += ((x_min + x_max)/2) * muc.normal / 10000;//通常
				hit1 += hit1 * muc.wd/100;//WD
				hit1 = (hit1 * (100-muc.ignore) + hit1array[j] * muc.ignore)/100;//防御無視
				hit1 = hit1 * hit / 10000;//命中
			}
			//1分当たりの攻撃回数を計算
			minute = minutearray[j];
			//1HITダメージ/秒
			if(muc.skill[j][2][0])second = hit1 * 1000/muc.skill[j][2][0];
			else second = 0;
			//計算結果をスタック
			if(muc.skill[j][5] == 4){//ダークスピリット
				sa.push({skillname:muc.skill[j][0]
						,hitper:second
						,speed:minute
						,even:hit1
						,minmax:x_min + "～" + x_max
						,hit:hitdarkspirit/100 + "%"
						,cri:x_cri,exd:x_exd});
			}else{
				sa.push({skillname:muc.skill[j][0]
						,hitper:second
						,speed:minute
						,even:hit1
						,minmax:x_min + "～" + x_max
						,hit:hit/100 + "%"
						,cri:x_cri,exd:x_exd});
			}
		}
		
		//被ダメージの計算
		if(muc.avoid > m[8])hit = 500;//カスリ 5.00%
		else hit = ((m[8] - muc.avoid)*10000)/m[8];
		x_min = calcSuffer(muc,m[4],m[2],(muc.avoid > m[8]));
		x_max = calcSuffer(muc,m[5],m[2],(muc.avoid > m[8]));
		hit1 = (x_min + x_max) * hit;// 1/20000
		sa.push({even:hit1/20000,minmax:x_min + "～" + x_max,hit:hit/100+"%"});
	
		var color:Array = new Array();
		for(var i:int=0;i<sa.length-1;i++){
			if(i%2)color.push("#FFFFFF");
			else color.push("#F5F5F5");
		}
		if(muc.avoid >= m[8])color.push("#DDDDFF");//被ダメージの部分の色、回避
		else color.push("#FFDDDD");//被ダメージの色、通常
		color.push("#FFFFFF");//ダミー
		dg.setStyle("alternatingItemColors",color);
		
		
		dg.dataProvider = sa;//計算結果を登録
		canvas.addChild(dg);
		
		//データの個数だけ表示
		dg.rowCount = sa.length + 1;
		if(sa.length == 0)dg.rowCount = 1;
	}
}
damage function calcDamage(muc:MuChar,d:int,elf:Boolean=false,cri:Boolean=false,exd:Boolean=false):int{
	var d2:int = 0;
	/*
	if(min)d = muc.minmax[0];
	else d = muc.minmax[1];
	*/
    //[セットOP]両手武器装備時ダメージ増加%用
    if(muc.op_hands){
	    d2 = Math.max((d - muc.op_miracle) - muc.monster_def,Math.floor((muc.lv - muc.add_lv)/10));//モンスDEF
		d2 = Math.floor(d2 * muc.op_hands / 100);
    }
	
    //ダメージ計算
    d = Math.max(d - muc.monster_def,Math.floor((muc.lv - muc.add_lv)/10));//モンスDEF
    
    //[セットOP]両手武器装備時ダメージ増加%
    //d += Math.floor(d*muc.op_hands/100);
    if(muc.op_hands)d += d2;
    //[課金アイテム]クリダメ増加%
    if(cri)d += Math.floor(d * muc.etc_cri / 100);
    //[課金アイテム]EXDダメ増加%
    if(exd)d += Math.floor(d * muc.etc_exd / 100);

    if(muc.dinolunt[0])d += Math.floor(d*15/100);//ディノラント
    if(muc.satan)d += Math.floor(d*30/100);//サタン
    //[デーモン]
    //if(muc.deamon){d += Math.floor(d * 0.4);}
    
    d += Math.floor(d * muc.wing_inc/100);//羽
    if(muc.fenrir==2)d += Math.floor(d*10/100);//フェンリル
    
    //スキル%
    if(muc.now_skill[0] == "プラズマストーム")
    	d += Math.floor(d * 1.2);
	else if(muc.job == 0)//ナイトのとき
    	d += Math.floor(d * Math.floor((100 + muc.ene/10))/100);//スキル%
    else if(muc.job == 4){//ダークロードのとき
    	if(muc.now_skill[5] == 5) d += Math.floor(d * Math.floor((100 + muc.ene/25))/100);//スキル%
    	else d += Math.floor(d * Math.floor((100 + muc.ene/20))/100);//スキル%
    }else if(elf)
    	d += 0;//乱れ打ちとか　スキル%なし
    else if(muc.job == 6)//レイジファイターのとき
    	if(muc.now_skill[5] == 10)//チェーンドライブ
    		d += Math.floor(d * Math.floor((50 + muc.vit/10))/100);//スキル%
    	else if(muc.now_skill[5] == 11)//ダークサイド
    		d += Math.floor(d * Math.floor((100 + muc.agi/8 + muc.ene/10))/100);//スキル%
    	else if(muc.now_skill[5] == 12)//ドラゴンロアー
    		d += Math.floor(d * Math.floor((50 + muc.ene/10))/100);//スキル%
    else
    	d += d;//スキル200%
    
    //[セットOP]ダメージ増加
    d += muc.op_damage;
    
    return d;
}
damage function calcMagicDamage(muc:MuChar,d:int):int{	
	//var d:int = 0;
	/*
	if(min)d = muc.minmax[2];
	else d = muc.minmax[3];
	*/
	
    //ダメージ計算===========================
    d = Math.max(d - muc.monster_def,Math.floor((muc.lv - muc.add_lv)/10));//max[攻撃力-モンス,lv/10]
    
    if(muc.dinolunt[0])d += Math.floor(d*15/100);//ディノラント
    if(muc.satan)d += Math.floor(d*30/100);//サタン
    //[デーモン]
    if(muc.deamon){d += Math.floor(d * 0.4);}
    d += Math.floor(d*muc.wing_inc/100);
    if(muc.fenrir==2)d += Math.floor(d*10/100);//フェンリル
    
    //[セットOP]ダメージ増加
    d += muc.op_damage;
    //サドゥンアイス
    if(muc.now_skill[5])d += muc.now_skill[6];
    
    return d;
}
damage function calcSuffer(muc:MuChar,monsterAttack:int=0,monsterLv:int=0,avoided:Boolean=false):int{
	use namespace calc;
	var s:int=0;
	//引き算
	s = monsterAttack - muc.def/2;//(モンス攻撃 - DEF)
	s = s - muc.support_g;//G+
	s = s - muc.support_sera_g;//セラフィー
	//モンスターの攻撃力低下
	s -= Math.floor(s * muc.support_weak/100);//ウイークネス
	//ダメ減加算
	var dec:int = 0;
	dec += exop_dec * 4;//EXOPダメ減
	dec += enop_dec;//エンチャントOPダメ減
	dec += soop_dec;//ソケットOPダメ減
	s = s - Math.floor(s * dec/100);
	//カスリダメージ
	if(avoided)
		s = Math.floor(s * 30/100);//30%
	//最低ダメ判定
	s = Math.max(s,monsterLv/10);
	//天使の吸収
	if(muc.angel)s = (s * 80 / 100);//20%吸収
	//守護精霊の吸収
	if(muc.spirit)s = (s * 70 / 100);//30%吸収
	//ディノラントの吸収
	if(muc.dinolunt[0]){
		if(muc.dinolunt[1]==3 || muc.dinolunt[2]==3)s = (s * 85 / 100);//15%吸収
		else s = (s * 90 / 100);//10%吸収
	}
	//フェンリルの吸収
	if(muc.fenrir==3)s = (s * 90/100);//10%吸収
	//ダークホースの吸収
	if(muc.darkhorse)s = (s * (100 - Math.floor((15 + muc.darkhorse/2))) /100);// 15+Lv/2
	//羽の吸収
	s = (s * (100 - wing_dec) / 100);
	//SBの減少
	s = s - Math.floor(s * support_sb/100);
	return s;
}