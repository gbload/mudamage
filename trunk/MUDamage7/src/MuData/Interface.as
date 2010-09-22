package MuData
{
	internal class Interface
	{
		public function Interface()
		{
		}

//javascript
static private var i:int=0;
static private var j:int=0;
static private var all:Array = [Weapon.weapon,Equip.equip,Shield.shield
			,Socket.socket_weapon,Socket.socket_equip,Socket.socket_shield
			,SetItem.set_weapon,SetItem.set_equip,SetItem.set_shield];

static private function getwingname(name:String):Array{//private 名前で羽を1つ選択

	for(i=0;i<Etc.wing.length;i++)
		if(Etc.wing[i][0] == name)return Etc.wing[i];
	return [];
}
static public function getWing(job:int):Array{//job:int 羽の名前の配列を返す

	var a:Array = [];//Array 結果を返すための配列
	for(i=0;i<Etc.wing.length;i++)
		if(Etc.wing[i][1][job])a.push(Etc.wing[i][0]);//1.職を確認し、羽の0.名前だけ配列に収める
	return a;
}
static public function getWingDef(name:String):int{

	var wing:Array = getwingname(name);
	return wing[5];
}
static public function getWingInc(name:String):int{

	var wing:Array = getwingname(name);
	return wing[6];
}
static public function getWingDec(name:String):int{

	var wing:Array = getwingname(name);
	return wing[7];
}
static public function getWingType(name:String):int{

	var wing:Array = getwingname(name);
	return wing[3];
}
static public function getWingOp(wingname:String):Array{

	var a:Array = [];//Array 結果を返すための配列
	var wing:Array = getwingname(wingname);
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
static public function getWingCop(wingname:String):Array{

	var a:Array = [];//Array 結果を返すための配列
	var wing:Array = getwingname(wingname);
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
static public function getRight(job:int):Array{//右手の一覧を返す

	var a:Array = [];
	for(i=0;i<Weapon.weapon.length;i++)
		if(Weapon.weapon[i][5][job])//装備可能職かチェック
			if(Weapon.weapon[i][4] != "左手")a.push(Weapon.weapon[i]);//持ち手を確認し、
	return a;
}
static public function getLeft(job:int):Array{//左手の一覧を返す

	var a:Array = [];
	if(job == 0 || job == 3 || job == 5)//ナイト、魔剣士、召喚師のみ左手に武器を持てる
		for(i=0;i<Weapon.weapon.length;i++)
			if(Weapon.weapon[i][5][job])//装備可能職かチェック
				if(!(job == 5 && Weapon.weapon[i][3] == "杖"))//召喚師は左手にロッドは持てない
				if(Weapon.weapon[i][4] == "片手" || Weapon.weapon[i][4] == "左手")//持ち手を確認
					a.push(Weapon.weapon[i]);//持ち手を確認し、
	for(i=0;i<Shield.shield.length;i++)//盾
		if(Shield.shield[i][5][job])a.push(Shield.shield[i]);
	return a;
}
static public function getEquip(job:int,kind:String):Array{//kindの部位の防具の一覧を返す

	var a:Array = [];
	for(i=0;i<Equip.equip.length;i++)
		if(Equip.equip[i][5][job])
			if(Equip.equip[i][3] == kind)a.push(Equip.equip[i]);//部位を確認し、
	return a;
}
static public function getSocketRight(job:int):Array{//ソケット右手の一覧を返す

	var a:Array = [];
	for(i=0;i<Socket.socket_weapon.length;i++)
		if(Socket.socket_weapon[i][5][job])//装備可能職かチェック
			a.push(Socket.socket_weapon[i]);
	return a;
}
static public function getSocketLeft(job:int):Array{//ソケット左手の一覧を返す

	var a:Array = [];
	if(job == 0 || job == 3 || job == 5)//ナイト、魔剣士、召喚師のみ左手に武器を持てる
		for(i=0;i<Socket.socket_weapon.length;i++)
			if(Socket.socket_weapon[i][5][job])//装備可能職かチェック
				if(!(job == 5 && Socket.socket_weapon[i][3] == "杖"))//召喚師は左手にロッドは持てない
				if(Socket.socket_weapon[i][4] == "片手" || Socket.socket_weapon[i][4] == "左手")//持ち手を確認
					a.push(Socket.socket_weapon[i]);//持ち手を確認し、
	for(i=0;i<Socket.socket_shield.length;i++)//盾
		if(Socket.socket_shield[i][5][job])a.push(Socket.socket_shield[i]);
	return a;
}
static public function getSocketEquip(job:int,kind:String):Array{//ソケット防具の一覧を返す

	var a:Array = [];
	for(i=0;i<Socket.socket_equip.length;i++)
		if(Socket.socket_equip[i][5][job])//装備可能職かチェック
			if(Socket.socket_equip[i][3] == kind)a.push(Socket.socket_equip[i]);//部位を確認し、
	return a;
}
static public function getSetRight(job:int):Array{//ソケット右手の一覧を返す

	var a:Array = [];
	for(i=0;i<SetItem.set_weapon.length;i++)
		if(SetItem.set_weapon[i][5][job])//装備可能職かチェック
			a.push(SetItem.set_weapon[i]);
	return a;
}
static public function getSetLeft(job:int):Array{//ソケット左手の一覧を返す

	var a:Array = [];
	if(job == 0 || job == 3 || job == 5)//ナイト、魔剣士、召喚師のみ左手に武器を持てる
		for(i=0;i<SetItem.set_weapon.length;i++)
			if(SetItem.set_weapon[i][5][job])//装備可能職かチェック
				if(!(job == 5 && SetItem.set_weapon[i][3] == "杖"))//召喚師は左手にロッドは持てない
				if(SetItem.set_weapon[i][4] == "片手" || SetItem.set_weapon[i][4] == "左手")//持ち手を確認
					a.push(SetItem.set_weapon[i]);//持ち手を確認し、配列に
	for(i=0;i<SetItem.set_shield.length;i++)//盾
		if(SetItem.set_shield[i][5][job])a.push(SetItem.set_shield[i]);
	return a;
}
static public function getSetEquip(job:int,kind:String):Array{//ソケット防具の一覧を返す

	var a:Array = [];
	for(i=0;i<SetItem.set_equip.length;i++)
		if(SetItem.set_equip[i][5][job])//装備可能職かチェック
			if(SetItem.set_equip[i][3] == kind)a.push(SetItem.set_equip[i]);//部位を確認し、
	return a;
}
static public function getEnchaunt(type:int,plus:int):Array{//0武器 1杖 2防具  エンチャントOPの配列を返す

	var a:Array = [];
	for(i=0;i<Option.enchaunt.length;i++){
		if(Option.enchaunt[i][1] == type && plus >= Option.enchaunt[i][2])
			a.push(Option.enchaunt[i]);
	}
	return a;
}
static public function getSocketOption(type:int):Array{//0,武器 1,防具 ソケットOPの配列を返す

	if(type)return Option.socket2;
	return Option.socket;
}
static public function getSetOption():Array{return Option.set_option;}
static public function getSetNeck():Array{return SetItem.set_neck;}
static public function getSetRing():Array{return SetItem.set_ring;}
static public function getSkill():Array{return Etc.skill;}
static public function getMonster(map:String,lv:int=1):Array{//mapのモンスターの配列を返す
	var a:Array = [];
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
		for(var i:int=0;i<a.length;i++)
			for(var j:int=2;j<a[i].length;j++)
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
	}else for(i=0;i<Etc.monster.length;i++)
		if(Etc.monster[i][0] == map)a.push(Etc.monster[i]);
	return a;
}
static public function getMap():Array{return Etc.map;}

static public function getSpeed():Array{return Etc.speed;}

static public function getExp():Array{return Exp.exp;}
	}
}