var i=0;
var j=0;
var all = [weapon,equip,shield,socket_weapon,socket_equip,socket_shield,set_weapon,set_equip,set_shield];
function getwingname(name){//private 名前で羽を1つ選択
	for(i=0;i<wing.length;i++)
		if(wing[i][0] == name)return wing[i];
	return null;
}
function getWing(job){//job:int 羽の名前の配列を返す
	var a = [];//Array 結果を返すための配列
	for(i=0;i<wing.length;i++)
		if(wing[i][1][job])a.push(wing[i][0]);//1.職を確認し、羽の0.名前だけ配列に収める
	return a;
}
function getWingDef(name){
	var wing = getwingname(name);
	return wing[5];
}
function getWingInc(name){
	var wing = getwingname(name);
	return wing[6];
}
function getWingDec(name){
	var wing = getwingname(name);
	return wing[7];
}
function getWingType(name){
	var wing = getwingname(name);
	return wing[3];
}
function getWingOp(wingname){
	var a = [];//Array 結果を返すための配列
	var wing = getwingname(wingname);
	a.push(["","",0]);
	if(wing[2][0])//攻撃opのBoolean
		for(i=1;i<5;i++)a.push(["攻撃op" + (i*4),"攻撃",i*4]);
	if(wing[2][1])//魔力opのBoolean
		for(i=1;i<5;i++)a.push(["魔力op" + (i*4),"魔力",i*4]);
	if(wing[2][2])//防御opのBoolean
		for(i=1;i<5;i++)a.push(["防御op" + (i*4),"防御",i*4]);
	if(wing[2][3])//呪いopのBoolean
		for(i=1;i<5;i++)a.push(["呪いop" + (i*4),"呪い",i*4]);
	return a;
}
function getWingCop(wingname){
	var a = [];//Array 結果を返すための配列
	var wing = getwingname(wingname);
	a.push("");
	if(wing[3] == 2){//2次羽
		a.push("防御無視3%");
		a.push("生命増加");
		a.push("マナ増加");
	}else if(wing[3] == 3){//3次羽
		a.push("防御無視5%");
		a.push("生命完全回復");
		a.push("マナ完全回復");
		a.push("ダメ反");
	}else if(wing[3] == 4){//マント
		a.push("防御無視3%");
		a.push("生命増加");
		a.push("マナ増加");
		a.push("統率増加");
	}
	return a;
}
function getRight(job){//右手の一覧を返す
	var a = [];
	for(i=0;i<weapon.length;i++)
		if(weapon[i][5][job])//装備可能職かチェック
			if(weapon[i][4] != "左手")a.push(weapon[i]);//持ち手を確認し、
	return a;
}
function getLeft(job){//左手の一覧を返す
	var a = [];
	if(job == 0 || job == 3 || job == 5)//ナイト、魔剣士、召喚師のみ左手に武器を持てる
		for(i=0;i<weapon.length;i++)
			if(weapon[i][5][job])//装備可能職かチェック
				if(!(job == 5 && weapon[i][3] == "杖"))//召喚師は左手にロッドは持てない
				if(weapon[i][4] == "片手" || weapon[i][4] == "左手")//持ち手を確認
					a.push(weapon[i]);//持ち手を確認し、
	for(i=0;i<shield.length;i++)//盾
		if(shield[i][5][job])a.push(shield[i]);
	return a;
}
function getEquip(job,kind){//kindの部位の防具の一覧を返す
	var a = [];
	for(i=0;i<equip.length;i++)
		if(equip[i][5][job])
			if(equip[i][3] == kind)a.push(equip[i]);//部位を確認し、
	return a;
}
function getSocketRight(job){//ソケット右手の一覧を返す
	var a = [];
	for(i=0;i<socket_weapon.length;i++)
		if(socket_weapon[i][5][job])//装備可能職かチェック
			a.push(socket_weapon[i]);
	return a;
}
function getSocketLeft(job){//ソケット左手の一覧を返す
	var a = [];
	if(job == 0 || job == 3 || job == 5)//ナイト、魔剣士、召喚師のみ左手に武器を持てる
		for(i=0;i<socket_weapon.length;i++)
			if(socket_weapon[i][5][job])//装備可能職かチェック
				if(!(job == 5 && socket_weapon[i][3] == "杖"))//召喚師は左手にロッドは持てない
				if(socket_weapon[i][4] == "片手" || socket_weapon[i][4] == "左手")//持ち手を確認
					a.push(socket_weapon[i]);//持ち手を確認し、
	for(i=0;i<socket_shield.length;i++)//盾
		if(socket_shield[i][5][job])a.push(socket_shield[i]);
	return a;
}
function getSocketEquip(job,kind){//ソケット防具の一覧を返す
	var a = [];
	for(i=0;i<socket_equip.length;i++)
		if(socket_equip[i][5][job])//装備可能職かチェック
			if(socket_equip[i][3] == kind)a.push(socket_equip[i]);//部位を確認し、
	return a;
}
function getSetRight(job){//ソケット右手の一覧を返す
	var a = [];
	for(i=0;i<set_weapon.length;i++)
		if(set_weapon[i][5][job])//装備可能職かチェック
			a.push(set_weapon[i]);
	return a;
}
function getSetLeft(job){//ソケット左手の一覧を返す
	var a = [];
	if(job == 0 || job == 3 || job == 5)//ナイト、魔剣士、召喚師のみ左手に武器を持てる
		for(i=0;i<set_weapon.length;i++)
			if(set_weapon[i][5][job])//装備可能職かチェック
				if(!(job == 5 && set_weapon[i][3] == "杖"))//召喚師は左手にロッドは持てない
				if(set_weapon[i][4] == "片手" || set_weapon[i][4] == "左手")//持ち手を確認
					a.push(set_weapon[i]);//持ち手を確認し、配列に
	for(i=0;i<set_shield.length;i++)//盾
		if(set_shield[i][5][job])a.push(set_shield[i]);
	return a;
}
function getSetEquip(job,kind){//ソケット防具の一覧を返す
	var a = [];
	for(i=0;i<set_equip.length;i++)
		if(set_equip[i][5][job])//装備可能職かチェック
			if(set_equip[i][3] == kind)a.push(set_equip[i]);//部位を確認し、
	return a;
}
function getEnchaunt(type,plus){//0武器 1杖 2防具  エンチャントOPの配列を返す
	var a = [];
	for(i=0;i<enchaunt.length;i++){
		if(enchaunt[i][1] == type && plus >= enchaunt[i][2])
			a.push(enchaunt[i]);
	}
	return a;
}
function getSocketOption(type){//0,武器 1,防具 ソケットOPの配列を返す
	if(type)return socket2;
	return socket;
}
function getSetOption(){return set_option;}
function getSetNeck(){return set_neck;}
function getSetRing(){return set_ring;}
function getSkill(){return skill;}
function getMonster(map,lv){//mapのモンスターの配列を返す
	var a = [];
	if(map == "ドッペルゲンガー"){
		//モンスター作成
		a.push([map,"ブービーワーム",(50+lv/10),(50+lv/10)*(50+lv/10)*(50+lv/10)/20,(lv/10)*13+200,(lv/10)*14+220,(lv/10)*8+100,(lv/10)*3+50,(lv/10)*20+300]);
		a.push([map,"ドッペルゲンガー",(50+lv/10),(50+lv/10)*(50+lv/10)*(50+lv/10)/20,(lv/10)*12+200,(lv/10)*14+220,(lv/10)*8+100,(lv/10)*3+50,(lv/10)*20+300]);
		a.push([map,"ドッペルゲンガー・カリス",(50+lv/10),(50+lv/10)*(50+lv/10)*(50+lv/10)/20,(lv/10)*13+200,(lv/10)*14+220,(lv/10)*8+100,(lv/10)*3+50,(lv/10)*20+300]);
		a.push([map,"ドッペルゲンガー・ヴィシャス",(50+lv/10),(50+lv/10)*(50+lv/10)*(50+lv/10)/20,(lv/10)*13+200,(lv/10)*14+220,(lv/10)*8+100,(lv/10)*3+50,(lv/10)*20+300]);
		a.push([map,"ドッペルゲンガー・アヌビス",(50+lv/10),(50+lv/10)*(50+lv/10)*(50+lv/10)/20,(lv/10)*13+200,(lv/10)*14+220,(lv/10)*8+100,(lv/10)*3+50,(lv/10)*20+300]);
		a.push([map,"ドッペルゲンガー・ミュレン",(50+lv/10),(50+lv/10)*(50+lv/10)*(50+lv/10)/20,(lv/10)*13+200,(lv/10)*14+220,(lv/10)*8+100,(lv/10)*3+50,(lv/10)*20+300]);
		a.push([map,"ドッペルゲンガー・ブロイ",(50+lv/10),(50+lv/10)*(50+lv/10)*(50+lv/10)/20,(lv/10)*13+200,(lv/10)*14+220,(lv/10)*8+100,(lv/10)*3+50,(lv/10)*20+300]);
		a.push([map,"ドッペルゲンガー・クロノ",(50+lv/10),(50+lv/10)*(50+lv/10)*(50+lv/10)/20,(lv/10)*13+200,(lv/10)*14+220,(lv/10)*8+100,(lv/10)*3+50,(lv/10)*20+300]);
		a.push([map,"ディメンションウォーカー",(70+lv/10),(70+lv/10)*(70+lv/10)*(70+lv/10)/20,(lv/10)*14+300,(lv/10)*15+330,(lv/10)*9+150,(lv/10)*5+80,(lv/10)*20+450]);
		a.push([map,"ディメンションプリズナー",(80+lv/10),(80+lv/10)*(80+lv/10)*(80+lv/10)/20,(lv/10)*14+300,(lv/10)*15+330,(lv/10)*9+150,(lv/10)*5+80,(lv/10)*20+450]);
		a.push([map,"破壊の化身",(90+lv/10),(90+lv/10)*(90+lv/10)*(90+lv/10)/20,(lv/10)*14+400,(lv/10)*15+500,(lv/10)*10+200,(lv/10)*10+200,(lv/10)*20+700]);
		for(i=0;i<a.length;i++)
			for(j=2;j<a[i].length;j++)
				a[i][j] = Math.floor(a[i][j]);
	}else if(map == "カウンターリベリオン"){
		//モンスター作成
		a.push([map,"ガイオンディフェンダー",(60+lv/10),(60+lv/10)*(60+lv/10)*(60+lv/10),(lv/10)*25+300,(lv/10)*26+330,(lv/10)*12+230,(lv/10)*5+60,(lv/10)*20+400]);
		a.push([map,"ガイオンプリースト",(60+lv/10),(60+lv/10)*(60+lv/10)*(60+lv/10),(lv/10)*25+300,(lv/10)*26+330,(lv/10)*12+140,(lv/10)*5+60,(lv/10)*20+400]);
		a.push([map,"ガイオンナイト",(60+lv/10),(60+lv/10)*(60+lv/10)*(60+lv/10),(lv/10)*25+300,(lv/10)*26+330,(lv/10)*12+200,(lv/10)*5+60,(lv/10)*20+400]);
		a.push([map,"ガイオンガード",(60+lv/10),(60+lv/10)*(60+lv/10)*(60+lv/10),(lv/10)*25+300,(lv/10)*26+330,(lv/10)*12+230,(lv/10)*5+60,(lv/10)*20+400]);
		a.push([map,"クォーターマスター",(65+lv/10),(65+lv/10)*(65+lv/10)*(65+lv/10),(lv/10)*30+400,(lv/10)*32+440,(lv/10)*12+400,(lv/10)*8+80,(lv/10)*20+500]);
		a.push([map,"コンバットマスター",(65+lv/10),(65+lv/10)*(65+lv/10)*(65+lv/10),(lv/10)*30+400,(lv/10)*32+440,(lv/10)*12+400,(lv/10)*8+80,(lv/10)*20+500]);
		a.push([map,"アーティクルマスター",(65+lv/10),(65+lv/10)*(65+lv/10)*(65+lv/10),(lv/10)*30+400,(lv/10)*32+440,(lv/10)*12+400,(lv/10)*8+80,(lv/10)*20+500]);
		a.push([map,"マジックマスター",(65+lv/10),(65+lv/10)*(65+lv/10)*(65+lv/10),(lv/10)*30+400,(lv/10)*32+440,(lv/10)*12+400,(lv/10)*8+80,(lv/10)*20+500]);
		a.push([map,"アサシンマスター",(65+lv/10),(65+lv/10)*(65+lv/10)*(65+lv/10),(lv/10)*30+400,(lv/10)*32+440,(lv/10)*12+400,(lv/10)*8+80,(lv/10)*20+500]);
		a.push([map,"ビーストマスター",(65+lv/10),(65+lv/10)*(65+lv/10)*(65+lv/10),(lv/10)*30+400,(lv/10)*32+440,(lv/10)*12+400,(lv/10)*8+80,(lv/10)*20+500]);
		a.push([map,"第一師団長 月光のデスラー",(80+lv/10),(80+lv/10)*(80+lv/10)*(80+lv/10),(lv/10)*30+500,(lv/10)*40+550,(lv/10)*16+500,(lv/10)*15+100,(lv/10)*20+700]);
		a.push([map,"第二師団長 烈火のベルモント",(80+lv/10),(80+lv/10)*(80+lv/10)*(80+lv/10),(lv/10)*30+500,(lv/10)*40+550,(lv/10)*16+500,(lv/10)*15+100,(lv/10)*20+700]);
		a.push([map,"第三師団長 激流のカト",(80+lv/10),(80+lv/10)*(80+lv/10)*(80+lv/10),(lv/10)*30+500,(lv/10)*40+550,(lv/10)*16+500,(lv/10)*15+100,(lv/10)*20+700]);
		a.push([map,"第四師団長 疾風のガリア",(80+lv/10),(80+lv/10)*(80+lv/10)*(80+lv/10),(lv/10)*30+500,(lv/10)*40+550,(lv/10)*16+500,(lv/10)*15+100,(lv/10)*20+700]);
		a.push([map,"軍団長 大地のエルカン",(80+lv/10),(80+lv/10)*(80+lv/10)*(80+lv/10),(lv/10)*30+500,(lv/10)*40+550,(lv/10)*16+500,(lv/10)*15+100,(lv/10)*20+700]);
		a.push([map,"副司令官 雷撃のレイモンド",(80+lv/10),(80+lv/10)*(80+lv/10)*(80+lv/10),(lv/10)*30+500,(lv/10)*40+550,(lv/10)*16+500,(lv/10)*15+100,(lv/10)*20+700]);
		a.push([map,"参謀長 漆黒のジェリント",(80+lv/10),(80+lv/10)*(80+lv/10)*(80+lv/10),(lv/10)*30+500,(lv/10)*40+550,(lv/10)*16+500,(lv/10)*15+100,(lv/10)*20+700]);
		a.push([map,"ガイオン・カレイン",(100+lv/10),(100+lv/10)*(100+lv/10)*(100+lv/10),(lv/10)*50+1000,(lv/10)*60+1200,(lv/10)*20+800,(lv/10)*20+500,(lv/10)*20+1000]);
		for(i=0;i<a.length;i++)
			for(j=2;j<a[i].length;j++)
				a[i][j] = Math.floor(a[i][j]);
	}else for(i=0;i<monster.length;i++)
		if(monster[i][0] == map)a.push(monster[i]);
	return a;
}
function getMap(){return map;}
function getSpeed(){return speed;}
function getExp(){return exp;}

