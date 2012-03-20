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
		if(Etc.wing[i][1][job])a.push(Etc.wing[i]);//1.職を確認し、羽を配列に収める
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
	if(job == 0 || job == 3 || job == 5 || job == 6)//ナイト、魔剣士、召喚師のみ左手に武器を持てる
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
	if(job == 0 || job == 3 || job == 5 || job == 6)//ナイト、魔剣士、召喚師のみ左手に武器を持てる
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
	if(job == 0 || job == 3 || job == 5 || job == 6)//ナイト、魔剣士、召喚師のみ左手に武器を持てる
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
static public function getMonster(map:String,lv:int=1,ptm:int=1,ilv:int=1):Array{//mapのモンスターの配列を返す
	var a:Array = [];
	if(map == "ドッペルゲンガー"){
		var doublegoer:DoubleGoer = new DoubleGoer(lv,ptm);
		a = doublegoer.getMonster();
	}else if(map == "カウンターリベリオン"){
		var imperialguardian:ImperialGuardian = new ImperialGuardian(ilv);
		a = imperialguardian.getMonster();
	}else for(i=0;i<Etc.monster.length;i++)
		if(Etc.monster[i][0] == map)a.push(Etc.monster[i]);
	return a;
}
static public function getMap():Array{return Etc.map;}

static public function getSpeed():Array{return Etc.speed;}

static public function getExp():Array{return Exp.exp;}

static public function getShopNeck():Array{return Shop.neck;}
static public function getShopRing():Array{return Shop.ring;}
	}
}