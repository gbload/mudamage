package Data.Database
{
	import mx.controls.*;
	import mx.containers.*;
	import mx.core.*;
	import mx.collections.*;
	import mx.events.*;
	import flash.events.*;
	
	public class D
	{	
//		public static function getPlus():Array{
//			var a:Array=new Array();
//			a[0]="N";
//			for(var i:int=1;i<=15;i++)
//				a[i] = "+"+i.toString();
//			return a;
//		}
		/**
		 * table_name : array
		 */
		public static var data:Object = {
			wing:	Wing.data,
			weapon:	Weapon.data,
			shield:	Shield.data,
			protect:Protect.data,
			socket_protect:	SocketProtect.data,
			socket_weapon:	SocketWeapon.data,
			socket_shield:	SocketShield.data,
			set_protect:	SetProtect.data,
			set_weapon:		SetWeapon.data,
			set_shield:		SetShield.data,
			accessory:		Accessory.data,
			plus:	Etc.plus,
			enchant:	Option.enchant,
			socket_option:	Option.socket,
			socket_option2:	Option.socket2,
			skill: Skill.data,
			map:	Etc.map,
			monster: Monster.data,
			pet:	Pet.pet,
			job:	Job.job,
			job_status:	Job.status,
			job_life: Job.life,
			job_mana: Job.mana,
			job_ag: Job.ag,
			job_min: Job.min,
			job_max: Job.max,
			job_hit: Job.hit,
			job_def: Job.def,
			job_avoid: Job.avoid,
			job_pvp_avoid: Job.pvp_avoid
		};
		public static var keys:Object = {
			wing:Key.key[4],
			weapon:Key.key[0],
			shield:Key.key[1],
			protect:Key.key[2],
			socket_weapon:Key.key[0],
			socket_shield:Key.key[1],
			socket_protect:Key.key[2],
			set_protect:null,
			set_weapon:null,
			set_shield:null,
			accessory:Key.key[5],
			plus:null,
			job_status:Key.key[3],
			skill:null,
			monster:null
			
		};
		/**
		 * 関数の対応
		 */
		private static var select:Object = {
			right:			[getSelectRight,[0]],
			set_right:		[getSelectRight,[1]],
			socket_right:	[getSelectRight,[2]],
			left:			[getSelectLeft,[0]],
			set_left:		[getSelectLeft,[1]],
			socket_left:	[getSelectLeft,[2]],
			protect_helm:		[getSelectProtect,[0,"兜"]],
			protect_armor:		[getSelectProtect,[0,"鎧"]],
			protect_garter:		[getSelectProtect,[0,"腰"]],
			protect_glove:		[getSelectProtect,[0,"手"]],
			protect_boots:		[getSelectProtect,[0,"足"]],
			set_protect_helm:		[getSelectProtect,[1,"兜"]],
			set_protect_armor:		[getSelectProtect,[1,"鎧"]],
			set_protect_garter:		[getSelectProtect,[1,"腰"]],
			set_protect_glove:		[getSelectProtect,[1,"手"]],
			set_protect_boots:		[getSelectProtect,[1,"足"]],
			socket_protect_helm:		[getSelectProtect,[2,"兜"]],
			socket_protect_armor:		[getSelectProtect,[2,"鎧"]],
			socket_protect_garter:		[getSelectProtect,[2,"腰"]],
			socket_protect_glove:		[getSelectProtect,[2,"手"]],
			socket_protect_boots:		[getSelectProtect,[2,"足"]],
			pet:	[getSelectSub,["pet"]],
			wing:	[getSelectWing,[]],
			neck:		[getSelectAccessory,["通常","ネックレス"]],
			shop_neck:	[getSelectAccessory,["ショップ","ネックレス"]],
			ring:		[getSelectAccessory,["通常","リング"]],
			shop_ring:	[getSelectAccessory,["ショップ","リング"]]
		};
		/**
		 * データを取得
		 */
		public static function getData(item:Object,d:Object=null):Object{
			if(d==null)d=data;
			if(d[item]==null)
				Alert.show("Error data "+item+"!!");
			return d[item];
		}
//		public static function getDataOld(item:String,index:int=-1,col:String=""):Object{
//			if(index==-1){
//				if(data[item]==null)
//					Alert.show("Error keys "+item+"!!");
//				return data[item];
//			}else if(col==""){
//				if(data[item]==null)
//					Alert.show("Error keys "+item+" "+index.toString()+"!!");
//				return data[item][index];
//			}else{
//				if(data[item]==null)
//					Alert.show("Error keys "+item+" "+index.toString()+" "+keys[item][col]+"!!");
//				return data[item][index][keys[item][col]];
//			}
//		}
		public static function getKey(item:String):Object{
			if(keys[item] == null)
				Alert.show("Error keys "+item+"!!");
			return keys[item];
		}
		/**
		 * フォーム用データの取得
		 */
		public static function getSelect(str:String,job:int=0):Object{
			// validate
			if(select[str] == null)
				Alert.show("Error select "+str+"!!");
			// function call
			var func:Function = select[str][0];
			var args:Array = select[str][1].concat();
			args.unshift(job);
			return func.apply(func,args);
		}
		/**
		 * フォーム用データの取得
		 */
		private static function getSelectSub(job:int,item:String):Object{
			var d:Object = getData(item);
			return d;
 		}
		/**
		 * 羽フォーム用データの取得
		 */
		private static function getSelectWing(job:int):Array{
			var item:String = "wing";
			var a:Array = [];
			var d:Object = getData(item);
			var k:Object = getKey(item);
		
			for(var i:int=0;i<d.length;i++)
				if(d[i][k.job][job])//装備可能職かチェック
					a.push({label:d[i][k.name],index:i,item:item});
			return a;
		}
		/**
		 * 右手フォーム用のデータを取得
		 * 0.normal 1.set 2.socket
		 */
		private static function getSelectRight(job:int,kind:int=0):Array{
			var items:Array = ["weapon","set_weapon","socket_weapon"];
			var item:String = items[kind];
			var a:Array = [];
			var d:Object = getData(item);
			var k:Object = getKey(item);
			for(var i:int=0;i<d.length;i++)
				if(d[i][k.job][job])//装備可能職かチェック
					if(d[i][k.hand] != "左手")
						a.push({label:d[i][k.name],index:i,item:item});//持ち手を確認し、
			return a;
		}
		/**
		 * 左手フォーム用のデータを取得
		 * 0.normal 1.set 2.socket
		 */
		private static function getSelectLeft(job:int,kind:int=0):Array{
			var a:Array = [];
			var i:int = 0;
			// 武器
			var items:Array = ["weapon","set_weapon","socket_weapon"];
			var item:String = items[kind];
			var d:Object = getData(item);
			var k:Object = getKey(item);
			if(job == 0 || job == 3 || job == 5 || job == 6)//ナイト、魔剣士、召喚師のみ左手に武器を持てる
				for(i=0;i<d.length;i++)
					if(d[i][k.job][job])//装備可能職かチェック
						if(!(job == 5 && d[i][k.type] == "杖"))//召喚師は左手にロッドは持てない
						if(d[i][k.hand] == "片手" || d[i][k.hand] == "左手")//持ち手を確認
							a.push({label:d[i][k.name],index:i,item:item});//持ち手を確認し、
			// 盾
			items = ["shield","set_shield","socket_shield"];
			item = items[kind];
			d = getData(item);
			k = getKey(item);
			for(i=0;i<d.length;i++)//盾
				if(d[i][k.job][job])a.push({label:d[i][k.name],index:i+1000});
			return a;
		}
		/**
		 * 防具フォーム用のデータを取得
		 * 0.normal 1.set 2.socket
		 */
		private static function getSelectProtect(job:int,kind:int,type:String):Array{//typeの部位の防具の一覧を返す
			var items:Array = ["protect","set_protect","socket_protect"];
			var item:String = items[kind];
			var a:Array = [];
			var d:Object = getData(item);
			var k:Object = getKey(item);
			for(var i:int=0;i<d.length;i++)
				if(d[i][k.job][job])
					if(d[i][k.type] == type)
						a.push({label:d[i][k.name],index:i,item:item});//部位を確認し、
			return a;
		}
		/**
		 * アクセサリフォーム用のデータを取得
		 */
		private static function getSelectAccessory(job:int,kind:String,type:String):Array{
			var item:String = "accessory";
			var a:Array = [];
			var d:Object = getData(item);
			var k:Object = getKey(item);
			for(var i:int=0;i<d.length;i++)
				if(d[i][k.kind] == kind)
					if(d[i][k.type] == type)
						a.push({label:d[i][k.name],index:i,item:item});//部位を確認し、
			return a;
		}
		/**
		 * enchant
		 */
		public static function getEnchant(type:int,plus:int):Array{
			var d:Object = getData("enchant");
			var a:Array = [];
			for(var i:int=0;i<d.length;i++){
				if(d[i][1] == type && plus >= d[i][2])
					a.push(d[i]);
			}
			return a;
		}
//		//アイテムレベルの配列を取得
//		public var plus:Array = ["N","+1","+2","+3","+4","+5","+6","+7","+8","+9","+10","+11","+12","+13","+14","+15"];
//		
//
//		public function getJobPoint(job:int,status:String):int{
//			switch(status){
//				case "str":
//					return jobstatus[job][0];
//				case "agi":
//					return jobstatus[job][1];
//				case "vit":
//					return jobstatus[job][2];
//				case "ene":
//					return jobstatus[job][3];
//				case "rec":
//					return jobstatus[job][4];
//			}
//			return 0;
//		}
//		//装備データの取得
//		public function getItemType(item:Object):int{
//			if(item[2] == "通常")return 0;
//			if(item[2] == "ソケット")return 1;
//			if(item[2] == "セット")return 2;
//			return -1;
//		}
//		//エンチャントOPの取得
//		public function getEnchaunt(type:int,plus:int):Array{
//			return Interface.getEnchaunt(type,plus);
//		}
//		public function getEnchauntKind(item:Object):int{
//			if(item[0] == "防具")return 2;
//			if(item[3] == "杖" || item[3] == "書")return 1;
//			return 0;
//		}
//		//ソケットOPの取得
//		public var socket:Array = Interface.getSocketOption(0);
//		public var socket_equip:Array = Interface.getSocketOption(1);
//		//セットOPの取得
//		public var setop:Array = Interface.getSetOption();
//		//アクセサリの取得
//		public function getSetNeck():Array{
//			return Interface.getSetNeck();
//		}
//		public function getSetRing():Array{
//			return Interface.getSetRing();
//		}
//		public function getShopNeck():Array{
//			return Interface.getShopNeck();
//		}
//		public function getShopRing():Array{
//			return Interface.getShopRing();
//		}
//		public function getNeck():Array{
//			return Accessory.neck;
//		}
//		public function getRing():Array{
//			return Accessory.ring;
//		}
//		//スキルデータの取得
//		public var skill:Array = Interface.getSkill();
//		//モンスターデータの取得
//		public function getMonster(map:String,lv:int=1,ptm:int=1,ilv:int=1):Array{
//			return Interface.getMonster(map,lv,ptm,ilv);
//		}
//		//マップデータの取得
//		public var map:Array = Interface.getMap();
//		//速度データの取得
//		public var speed:Array = Interface.getSpeed();
//		//計算結果のHTML出力
//		public function htmlExport(hdat:String):void{
//			ExternalInterface.call("htmlExport",hdat);
//		}
//		//経験値データの取得
//		public var exp:Array = Interface.getExp();
	}
}