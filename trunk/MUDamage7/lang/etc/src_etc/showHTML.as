// ActionScript file
import MuCalc.MuChar;

import flash.events.Event;
import flash.events.FocusEvent;
import flash.events.TimerEvent;
import flash.utils.Timer;

import mx.controls.ProgressBar;
import mx.controls.TextArea;

calcform var timerobj:Timer;
calcform var timercount:int=0;
calcform var pro:ProgressBar;
calcform var timercheck:Boolean=false;
calcform var timermuc:MuChar;
calcform var timermon:Array;
calc var hdat:String = "";

public namespace showhtml;

showhtml var hit1array:Array;
showhtml var minutearray:Array;
showhtml var ta:TextArea;

calc function showHTMLTimer(event:Event):void{
	use namespace calcform;
	timercount=0;
	timercheck=false;
	timermon=dat::c.getMonster(dat::d.f_map.selectedLabel);//モンスターの配列
	timerobj = new Timer(10,1000);//10秒
	timerobj.addEventListener(TimerEvent.TIMER,timerEvent);
	timerobj.addEventListener(TimerEvent.TIMER_COMPLETE,timerComplete);
	timerobj.start();
	pro = PopUpManager.createPopUp(this,ProgressBar,true) as ProgressBar;//進捗状況
	pro.label = "Status:";
	pro.mode = "manual";//手動で進捗状況をセット
	pro.minimum = 0;
	pro.maximum = timermon.length + 3;
	PopUpManager.centerPopUp(pro);//中央表示
}
calcform function timerEvent(event:Event):void{
	use namespace calcform;
	if(timercount != -1)timerLoop();
}
calcform function timerComplete(event:Event):void{
	use namespace calcform;
	if(timercount==-1){timerobj.stop();timercheck=true;}
}
calcform function timerLoop():void{
	use namespace calcform;
	
	if(timercount==-1){}
	else if(timercount==0){timercount=-1;timermuc=showHTML1();timercount=1;}
	else if(timercount==1){timercount=-1;showHTML2(timermuc);timercount=2;}
	else if(timercount>=2 && timercount-2 < timermon.length){
		var tmp:int=timercount;
		timercount=-1;
		showHTML3(timermuc,tmp-2,timermon);
		timercount=tmp+1;
	}else if(timercount>=2 && timercount-2 == timermon.length){
		tmp=timercount;
		timercount=-1;
		showHTML4(timermuc);
		timercount=tmp+1;
	}else{//完了
		timerobj.stop();
		PopUpManager.removePopUp(pro as IFlexDisplayObject);
	}
	
	pro.setProgress(timercount,timermon.length + 3);
}
calcform function showHTML(event:Event):void{
	use namespace calcform;
	timercount=0;
	timercheck=false;
	timermon=dat::c.getMonster(dat::d.f_map.selectedLabel);//モンスターの配列
	while(1){
		if(timercount==-1){}
		else if(timercount==0){timercount=-1;timermuc=showHTML1();timercount=1;}
		else if(timercount==1){timercount=-1;showHTML2(timermuc);timercount=2;}
		else if(timercount>=2 && timercount-2 < timermon.length){
			var tmp:int=timercount;
			timercount=-1;
			showHTML3(timermuc,tmp-2,timermon);
			timercount=tmp+1;
		}else if(timercount>=2 && timercount-2 == timermon.length){
			tmp=timercount;
			timercount=-1;
			showHTML4(timermuc);
			timercount=tmp+1;
		}else{//完了
			break;
			PopUpManager.removePopUp(pro as IFlexDisplayObject);
		}
	}
}
calcform function showHTML1():MuChar{
	use namespace dat;
	use namespace calc;
	use namespace damage;
	var i:int=0;
	//フォームの値を取得
	getForm();
	//MuChar
	var muc:MuChar = calcchar::main();
	
	//各種情報の書き込み
	hdat = "";
	hdat += '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd"> ';
	hdat += '<html lang="ja"> ';
	hdat += '<head> ';
	hdat += '<meta http-equiv="Content-Type" content="text/html; charset=utf-8"> ';
	hdat += '<meta http-equiv="Content-Style-Type" content="text/css"> ';
	hdat += '<style type="text/css"> ';
	hdat += '<!--';
	hdat += 'body {margin: 0; padding: 0; font-family: "sans-serif"; font-size: 90%;background-color: white;color: #222;}';
	hdat += 'h1 {margin: 0; padding: 0.2em 0 0.2em 1em; color: #444; font-size: 130%; border-bottom: #aaa 1px dashed;}';
	hdat += 'h1 em {padding-left: 4em; font-size: 64%; color: #aaa; font-weight: normal; font-style: normal; }';
	hdat += 'h2 {font-size: 110%; margin: 0.2em 0 0 1.6em; display: inline; color: #444;}';
	hdat += 'h2.ct {position: absolute;left: 0;top: 0;text-indent: -100em; clear: both; } ';
	hdat += 'ul {list-style-type: none;float: left;margin: 0.6em; margin-bottom: 1.4em;}';
	hdat += 'ul li {margin-top: 0.2em; margin-bottom: 0.2em;}';
	hdat += 'dl, dt, dd {display: inline; margin: 0;}';
	hdat += 'dd {margin-left: 0.6em;}';
	hdat += 'hr {clear: both; border: 1px white solid;}';
	hdat += 'table {margin: 0.2em 0em 2em 2em;font-size: 90%;border-collapse: collapse; }';
	hdat += 'td {text-align: right; white-space: nowrap;}';
	hdat += 'table td, table th {border: 1px solid #444;padding: 0.2em 0.6em 0.2em 0.6em;}';
	hdat += 'table th {background-color: #222; color: white; font-size: 80%; font-weight: normal;}';
	hdat += 'code {margin-left: 2em; font-size: 12px; color: #444}';
	hdat += 'p.st, #mp {margin: 0 0 0 2em; color: #666; font-size: 76%; display: inline;}';
	hdat += '.md {font-weight: bold; color: #EE2462}';
	hdat += '.dm {color: #E54500}';
	hdat += '.dc {color: #121268}';
	hdat += '.de {color: #127812}';
	hdat += '.sa {color: blue;}';
	hdat += '.ht {border-bottom: 1px #EE2462 dashed;}';
	hdat += '.ht a{position:relative; color: #222; text-decoration: none; cursor: help;}';
	hdat += '.ua, .ua a {color: red;}';
	hdat += '.ht a span{position:absolute;font-size: 82%;top:2.2em;left:2em;padding:2px;visibility:hidden;border: black 1px solid;background-color: #FFFFE2;color: black;text-decoration: none;white-space:nowrap;}';
	hdat += '.ht a:hover,.ht a:hover span{visibility:visible; z-index: 10;}';
	hdat += '.an {color: #222}';
	hdat += '.pw {color: #888}';
	hdat += '.anu, .pwu {color: #d88}';
	hdat += 'table tr.gd {background-color: #fee;}';
	hdat += 'table tr.gdd {background-color: #eef;}';
	hdat += '--> ';
	hdat += '</style> ';
	//タイトル
	if(d.f_title.text != "")//ボタンのラベル
		hdat += '<title>'+ d.f_title.text +'</title> ';//タイトル
	else
		hdat += '<title>'+ d.f_map.selectedLabel +'</title> ';//マップ名
	hdat += '</head> ';
	hdat += '<body> ';
	//データ
	hdat += '<h1>'+ d.f_map.selectedLabel +'</h1> ';
	hdat += '<ul> ';
	hdat += '<li>'+ d.f_job.text +'　Lv'+ muc.lv +'</li> ';
	hdat += '<li>力'+ muc.str +'　敏'+ muc.agi +'　体力'+ muc.vit +'　エナ'+ muc.ene;
	if(muc.job==4)hdat += '　統率'+ muc.rec;//ダークロードの場合
	hdat += '</li> ';
	hdat += '<li>HP'+ muc.hp +'　SD'+ muc.sd +'　マナ'+ muc.mana +'　AG'+ muc.ag +'</li> ';
	hdat += '<li>攻撃速度'+ muc.speed +'/攻撃速度'+ muc.magicspeed +'</li> ';
	hdat += '<li>攻撃力<span>'+ muc.minmax[0] +'</span>～<span>'+ muc.minmax[1] +'</span>（率'+ muc.hit +'／対人'+ muc.pvphit +'）</li> ';
	hdat += '<li>魔力<span>'+ muc.minmax[2] +'</span>～<span>'+ muc.minmax[3] +'</span></li> ';
	hdat += '<li>防御力<span>'+ muc.def +'</span>（率'+ muc.avoid +'／対人'+ muc.pvpavoid +'）</li> ';
	hdat += '<li>ノーマル'+ (muc.normal/100) +'％　クリ'+ (muc.cri/100) +'％　EXD'+ muc.exd +'％　</li> ';
	hdat += '<li>無視'+ muc.ignore +'％　WD'+ muc.wd +'％　</li> ';

	//9行目
	hdat += '<li>';
	var setname:String = "";
	var setops:String = "";
	for each(var ii:Object in setop_array)//セット名
		if(ii.num >= 2)//2箇所以上
			for(var j:int=0;j<c.setop.length;j++)//セットOPのデータを繰り返し確認
				if(c.setop[j][0] == ii.label){//セット名の一致
					setname = ii.label;
					setops = setname + "<br>";
					for(var k:int=2;k<=ii.num;k++){
						setops += c.setop[j][k][0] + "<br>";
						if(k == c.setop[j][1] + 1){//フルOPを取得
							setops += "<br>";
							for(var l:int=0;l<c.setop[j][k+1].length;l++){
								setops += c.setop[j][k+1][l][0] + "<br>";
							}
						}
					}
					//表示
					hdat += '<span class="ht"><a href="#">'+ setname + (k-1) +'<span>'+ setops +'</span></a></span>　';
					break;
				}
	hdat += '</li>';
	//サポート			
	hdat += '<li>A+<span>'+ muc.support_a +'</span>　G+<span>'+ muc.support_g +'</span>' + 
			'　C+<span>'+ muc.support_c +'</span>　SL<span>'+ muc.support_sl +'%</span>　SB<span>'+ muc.support_sb +'%</span>　</li> ';

	hdat += '<li>インナーベーション<span>' + muc.support_inner + '</span>%　' + 
			'ウイークネス<span>' + muc.support_inner + '</span>%</li>';
	if(muc.support_ba || muc.support_berserker || muc.support_se){
		hdat += '<li>';
		if(muc.support_ba)hdat += '血戦(敵Def10%低下)　';
		if(muc.support_berserker)hdat += 'バーサーカー' + muc.support_berserker + '%';
		if(muc.support_se)hdat += 'スペルエンハンス(最小魔力20%上昇)';
		hdat += '</li>';
	}
	hdat += '</ul> ';//end
	//2列目
	hdat += '<ul> ';
	//ペット
	if(d.f_pet.selectedLabel != "None")hdat += '<li>'+ d.f_pet.selectedLabel +'</li> ';;
	//羽
	if(d.f_wing.f_item.selectedLabel != "None"){
		var op:String = d.f_wing.f_op.selectedLabel;
		if(op == "opt None")op = "N";
		hdat += '<li>' + d.f_wing.f_item.selectedLabel + d.f_wing.f_plus.selectedLabel
				+ op +'';
		if(d.f_wing.f_luck.selected)hdat += '　幸運';
		hdat += '　攻' + wing_inc +'%';
		if(wing_dec)hdat += '　守' + wing_dec + '%';
		hdat += '　' + d.f_wing.f_cop.selectedLabel +'</li>';
	}
	
	//3行目
	if(d.f_neck.f_kind.selectedLabel == "てすちゅ"){
		hdat += '<li>EXネック　';
		for(i = 0;i < d.f_neck.f_exop.length;i++){
			hdat += d.f_neck.f_exop[i].selectedLabel + '</li>';
		}
	}else if(d.f_neck.f_kind.selectedLabel == "Set Ancient"){
		hdat += '<li>' + d.f_neck.f_item.selectedLabel + '　' + d.f_neck.f_cop.selectedLabel + '</li>';
	}
	//4行目～10行目
	var ia:Array = [d.f_right,d.f_left,d.f_helm,d.f_armor,d.f_glove,d.f_garter,d.f_boots];
	var iname:Array = ["Right:","Left:","Helm:","Armor:","Gloves:","Pants:","Boots:"];
	var spec:Object;
	var specitem:Object;
	var specstr:String;
	for(i = 0;i < ia.length;i++){
		hdat += '<li>' + iname[i] +'　';
		if(ia[i].f_kind.selectedLabel != "None"){
			//"てすちゅ"の表示
			if(ia[i].f_kind.selectedLabel == "てすちゅ" || ia[i].f_kind.selectedLabel == "EXE Socket")
				hdat += 'EX　';
			//OPの取得
			op = ia[i].f_op.selectedLabel;
			if(op == "opt None")op = "N";
			//要求スペックの作成
			specstr = "";
			specitem = ia[i].f_item.selectedItem;
			if(ia[i].f_kind.selectedLabel == "てすちゅ")
				spec = specitem[13][ia[i].f_plus.selectedIndex];//EX
			else
				spec = specitem[12][ia[i].f_plus.selectedIndex];//通常
			if(ia[i].f_item.selectedItem[0] == "Weapon"){
				if(spec[0] > 0 || spec[1] > 0)specstr += "Dmg " + spec[0] + "-" + spec[1] + "<br>";
				if(spec[5] > 0)specstr += "Magic " + spec[5] + "%<br>";
				if(spec[6] > 0)specstr += "Pet" + spec[6] + "%<br>";
				if(spec[7] > 0)specstr += "Curse " + spec[7] + "%<br>";
				specstr += "Speed" + specitem[7]+ "<br>";
				if(spec[2] > 0)specstr += "require Strength" + (spec[2] + (ia[i].f_op.selectedIndex * 5)) + "<br>";
				if(spec[3] > 0)specstr += "require Agility" + spec[3] + "<br>";
				if(spec[4] > 0)specstr += "require Energy" + spec[4] + "<br>";
				if(specitem[6] > 0)specstr += "require Level" + specitem[6] + "<br>";
			}else{
				if(spec[3] > 0)specstr += "Defence " + spec[3]+ "<br>";
				if(spec[4] > 0)specstr += "Defense Success Rate" + spec[4] + "<br>";
				if(specitem[7] > 0)specstr += "Speed" + specitem[7] + "<br>";
				if(spec[0] > 0)specstr += "require Strength" + (spec[0] + (ia[i].f_op.selectedIndex * 5)) + "<br>";
				if(spec[1] > 0)specstr += "require Agility" + spec[1] + "<br>";
				if(spec[2] > 0)specstr += "require Energy" + spec[2] + "<br>";
				if(specitem[6] > 0)specstr += "require Level" + specitem[6] + "<br>";
			}
			//アイテム名　+13 op16
			hdat += '<span class="ht"><a href="#">' + ia[i].f_item.selectedLabel + ia[i].f_plus.selectedLabel + op +'<span>' + specstr + '</span></a></span>';

			//エンチャントの表示
			if(ia[i].f_kind.selectedLabel == "Normal" || ia[i].f_kind.selectedLabel == "てすちゅ")
				if(ia[i].f_enop.selectedIndex > 0)
					hdat += '　' + ia[i].f_enop.selectedLabel + '+' + ia[i].f_enop_value.selectedLabel;
			//幸運の表示
			if(ia[i].f_luck.selected)hdat += '　幸運';
			if(spec[5] > 0)hdat += '　('+spec[5]+'%)';
			//EXOPの表示
			if(ia[i].f_kind.selectedLabel == "てすちゅ" || ia[i].f_kind.selectedLabel == "EXE Socket"){
				for(j = 0;j < ia[i].f_exop.length;j++){
					if(ia[i].f_exop[j].selectedLabel != "")hdat += '　' + ia[i].f_exop[j].selectedLabel;
				}
			}
			//セットのステータス表示
			if(ia[i].f_kind.selectedLabel == "Set Ancient")
				hdat += '　' + ia[i].f_cop.selectedLabel;
			//ソケットOPの表示	
			if(ia[i].f_kind.selectedLabel == "Socket" || ia[i].f_kind.selectedLabel == "EXE Socket"){
				hdat += '<br>';
				for(j = 0;j < ia[i].f_soop.length;j++){
					if(ia[i].f_soop[j].selectedLabel)hdat += '　' + ia[i].f_soop[j].selectedLabel + "+" + ia[i].f_soop_value[j].selectedLabel;
				}
			}
		}
		hdat += '</li>';
	}
	//11行目 12行目
	ia = [d.f_ring1,d.f_ring2];
	for(i = 0;i < 2;i++){
		hdat += '<li>';
		if(ia[i].f_kind.selectedLabel == "てすちゅ"){
			hdat += 'EXリング';
			for(j = 0;j < ia[i].f_exop.length;j++){
				hdat += '　' + ia[i].f_exop[j].selectedLabel;
			}
		}else if(ia[i].f_kind.selectedLabel == "Set Ancient"){
			hdat += ia[i].f_item.selectedLabel;
			hdat += ia[i].f_cop.selectedLabel;
		}else{
			hdat += ia[i].f_kind.selectedLabel;
		}
		hdat += '</li>';
	}
	hdat += '</ul> ';
	hdat += '<hr> ';
	
	return muc;
}

calcform function showHTML2(muc:MuChar):MuChar{
	use namespace dat;
	use namespace calc;
	use namespace damage;
	//計算テーブル
	//防御無視
	//モンスター情報を表示
	hdat += '<h2>防御無視</h2>';
	hdat += '<table summary="Ignore">';
	//テーブルヘッダー
	hdat += '<tr><th>スキル名</th>';
	hdat += '<th>1HITダメージ/秒</th>';
	hdat += '<th>回/分</th>';
	hdat += '<th>1HIT平均</th>';
	hdat += '<th>最小～最大</th>';
	hdat += '<th>クリティカル</th>';
	hdat += '<th>EXD</th>';
	hdat += '<th>命中率</th></tr>';
	//命中率計算
	var hit:int=10000;
	//データの作成
	var sa:Array = new Array();
	muc.monster_def = 0;//モンスターのDEF
	//ダメージ計算
	showhtml::hit1array = new Array();
	showhtml::minutearray = new Array();
	//変数
	var r_min:int = 0;
	var l_min:int = 0;
	var r_max:int = 0;
	var l_max:int = 0;
	var x_min:int = 0;
	var x_max:int = 0;
	var x_cri:int = 0;
	var x_exd:int = 0;
	var lefthund:Boolean = (dat::d.f_left.f_kind.selectedLabel != "None" && dat::d.f_left.f_item.selectedItem[0] == "Weapon");
	for(var j:int = 0;j<muc.skill.length;j++){
		muc.now_skill = muc.skill[j];
		if(muc.skill[j][3] == "Magic"){//魔法
			//x_min = calcMagicMinMax(lefthund,true);//MIN
		    //x_max = calcMagicMinMax(lefthund,false);//MAX
		    x_min = calcMagicDamage(muc,muc.skill_minmax[j][0]);//最小
		    x_cri = calcMagicDamage(muc,muc.skill_minmax[j][2]);//クリ
		    x_exd = calcMagicDamage(muc,muc.skill_minmax[j][3]);//EXD
		    x_max = calcMagicDamage(muc,muc.skill_minmax[j][1]);//最大
		}else{
		    var elf:Boolean = false;//スキル%なし
		    if(muc.skill[j][0] == "Triple Shot" || muc.skill[j][0] == "Multi-Shot")
		    	elf=true;//スキル2倍がない計算
		    x_min = calcDamage(muc,muc.skill_minmax[j][0],elf);//最小
		    x_cri = calcDamage(muc,muc.skill_minmax[j][2],elf);//クリ
		    x_exd = calcDamage(muc,muc.skill_minmax[j][3],elf);//EXD
		    x_max = calcDamage(muc,muc.skill_minmax[j][1],elf);//最大
		}
		//1HIT当たりのダメージを計算
		var hit1:int=0;//1hit当たりのダメージ
		hit1 += x_exd * muc.exd / 100;//EXD
		hit1 += x_cri * muc.cri / 10000;//クリ
		hit1 += ((x_min + x_max)/2) * muc.normal / 10000;//通常
		hit1 += hit1 * muc.wd/100;//WD
		showhtml::hit1array.push(hit1);
		//1分当たりの攻撃回数を計算
		var minute:String;
		if(!muc.skill[j][2][0])minute="0";//0だった場合
		else minute = (Math.floor(600000/muc.skill[j][2][0])/10).toString();//攻撃回数計算
		if(!muc.skill[j][2][0] || muc.skill[j][2][1]==0)minute += "?";//不明又は未検証の場合
		showhtml::minutearray.push(minute);
		//1HITダメージ/秒
		var second:int=0;
		second = hit1 * 1000/muc.skill[j][2][0];
		//計算結果を表示
		hdat += '<tr class="od"><td>'+ muc.skill[j][0] +'</td>' + 
				'<td class="pw">'+ second +'</td>' + 
				'<td class="an">'+ minute +'</td>' + 
				'<td class="md">'+ hit1 +'</td>' + 
				'<td class="dm">'+ x_min +'～'+ x_max +'</td>' + 
				'<td class="dc">'+ x_cri +'</td>' + 
				'<td class="de">'+ x_exd +'</td>' + 
				'<td rowspan="1">'+ hit/100 +'％</td></tr>';
	}
	hdat += '</table>';
	
	return muc;
}

calcform function showHTML3(muc:MuChar,re:int,mon:Array):MuChar{
	use namespace dat;
	use namespace calc;
	use namespace damage;
		//モンスター======================================================================
		var m:Object = mon[re];
		
		//モンスター情報を表示
		hdat += '<h2>'+ m[1] +'</h2>';
		hdat += '<p class="st">Lv'+ m[2] +'' + 
				'　HP'+ m[3] +'' + 
				'　攻撃力'+ m[4] +'～'+ m[5] +'（率'+ m[8] +'）' + 
				'　防御力'+ m[6] +'（率'+ m[7] +'）' + 
				'　経験値?</p>';
		hdat += '<table summary="'+ m[1] +'">';
		//テーブルヘッダー
		hdat += '<tr><th>スキル名</th>';
		hdat += '<th>1HITダメージ/秒</th>';
		hdat += '<th>回/分</th>';
		hdat += '<th>1HIT平均</th>';
		hdat += '<th>最小～最大</th>';
		hdat += '<th>クリティカル</th>';
		hdat += '<th>EXD</th>';
		hdat += '<th>命中率</th></tr>';
		//モンスターのDEF
		muc.monster_def = m[6];//モンスターのDEF
		//命中率計算
		var hit:int=0;
		if(muc.hit < m[7])hit=5;
		else if(muc.hit == m[7])hit=0;
		else hit = 10000 - (m[7]*10000/muc.hit);
		//ダメージ計算
		//変数
		var r_min:int = 0;
		var l_min:int = 0;
		var r_max:int = 0;
		var l_max:int = 0;
		var x_min:int = 0;
		var x_max:int = 0;
		var x_cri:int = 0;
		var x_exd:int = 0;
		var lefthund:Boolean = (dat::d.f_left.f_kind.selectedLabel != "None" && dat::d.f_left.f_item.selectedItem[0] == "Weapon");
		for(var j:int = 0;j<muc.skill.length;j++){
			muc.now_skill = muc.skill[j];
			if(muc.skill[j][3] == "Magic"){//魔法
				//x_min = calcMagicMinMax(lefthund,true);//MIN
			    //x_max = calcMagicMinMax(lefthund,false);//MAX
			    x_min = calcMagicDamage(muc,muc.skill_minmax[j][0]);//最小
			    x_cri = calcMagicDamage(muc,muc.skill_minmax[j][2]);//クリ
			    x_exd = calcMagicDamage(muc,muc.skill_minmax[j][3]);//EXD
			    x_max = calcMagicDamage(muc,muc.skill_minmax[j][1]);//最大
			}else{
			    var elf:Boolean = false;//スキル%なし
			    if(muc.skill[j][0] == "Triple Shot" || muc.skill[j][0] == "Multi-Shot")
			    	elf=true;//スキル2倍がない計算
			    x_min = calcDamage(muc,muc.skill_minmax[j][0],elf);//最小
			    x_cri = calcDamage(muc,muc.skill_minmax[j][2],elf);//クリ
			    x_exd = calcDamage(muc,muc.skill_minmax[j][3],elf);//EXD
			    x_max = calcDamage(muc,muc.skill_minmax[j][1],elf);//最大
			}
			//1HIT当たりのダメージを計算
			var hit1:int=0;//1hit当たりのダメージ
			hit1 += x_exd * muc.exd / 100;//EXD
			hit1 += x_cri * muc.cri / 10000;//クリ
			hit1 += ((x_min + x_max)/2) * muc.normal / 10000;//通常
			hit1 += hit1 * muc.wd/100;//WD
			hit1 = (hit1 * (100-muc.ignore) + showhtml::hit1array[j] * muc.ignore)/100;//防御無視
			hit1 = hit1 * hit / 10000;//命中
			//1分当たりの攻撃回数を計算
			var minute:int = showhtml::minutearray[j];
			//1HITダメージ/秒
			var second:int = hit1 * 1000/muc.skill[j][2][0];
			//計算結果を表示
			hdat += '<tr class="od"><td>'+ muc.skill[j][0] +'</td>' + 
					'<td class="pw">'+ second +'</td>' + 
					'<td class="an">'+ minute +'</td>' + 
					'<td class="md">'+ hit1 +'</td>' + 
					'<td class="dm">'+ x_min +'～'+ x_max +'</td>' + 
					'<td class="dc">'+ x_cri +'</td>' + 
					'<td class="de">'+ x_exd +'</td>' + 
					'<td rowspan="1">'+ hit/100 +'％</td></tr>';
		}
		
		//被ダメージの計算
		if(muc.avoid > m[8])hit = 500;//カスリ 5.00%
		else hit = ((m[8] - muc.avoid)*10000)/m[8];
		x_min = calcSuffer(muc,m[4],m[2],(muc.avoid > m[8]));
		x_max = calcSuffer(muc,m[5],m[2],(muc.avoid > m[8]));
		hit1 = (x_min + x_max) * hit;// 1/20000
		//計算結果を表示
		hdat += '<tr class="gd"><td>被ダメージ</td>' + 
				'<td class="pw"></td>' + 
				'<td class="an"></td>' + 
				'<td class="md">'+ hit1/20000 +'</td>' + 
				'<td class="dm">'+ x_min +'～'+ x_max +'</td>' + 
				'<td class="dc"></td>' + 
				'<td class="de"></td>' + 
				'<td rowspan="1">'+ hit/100 +'％</td></tr>';
	
		hdat += '</table>';
		
	return muc;
}

calcform function showHTML4(muc:MuChar):MuChar{
	use namespace dat;
	use namespace calc;
	use namespace damage;
	
	hdat += '</body></html>';
	
	
	//PopUpManagerでモーダルON（背景をぼやかせる）
	//PopUpはTitleWindowで作成
	var pop:TitleWindow = PopUpManager.createPopUp(this,TitleWindow,true) as TitleWindow;
	pop.width = 820;
	pop.height = 500;
	pop.setStyle("borderColor","black");
	pop.setStyle("borderAlpha","0.3");
	pop.showCloseButton = true;//右上の×ボタン
	pop.addEventListener(CloseEvent.CLOSE,click::mlvclose);//右上の×ボタンのイベント
	PopUpManager.centerPopUp(pop);
	pop.title = "HTML Code";//タイトル
	//ボタン
	var button:Button = new Button();
	button.label = "All Select";
	button.addEventListener(MouseEvent.CLICK,showhtml::sel);
	pop.addChild(button);
	//テキストエリア
	var textarea:TextArea = new TextArea();
	textarea.percentHeight = 100;
	textarea.percentWidth = 100;
	textarea.text = hdat;
	textarea.addEventListener(FocusEvent.FOCUS_IN,showhtml::sel);
	showhtml::ta = textarea;
	pop.addChild(textarea);//テキストを載せるためのエリア
	c.htmlExport(hdat);
	
	return muc;
}
showhtml function sel(event:Event):void{
	showhtml::ta.setFocus();
	showhtml::ta.setSelection(0,showhtml::ta.length);
}