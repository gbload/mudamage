package Data.Database
{
	public class D
	{	
		public static function getPlus():Array{
			var a:Array=new Array();
			a[0]="N";
			for(var i:int=1;i<=15;i++)
				a[i] = "+"+i.toString();
			return a;
		}
		/**
		 * table_name : array
		 */
		public static final var data:Object = {
			wing:	Wing.data,
			protect:Protect.data,
			weapon:	Weapon.data,
			shield:	Shield.data,
			socket_protect:	SocketProtect.data,
			socket_weapon:	SocketWeapon.data,
			socket_shield:	SocketShield.data,
			set_protect:	SetProtect.data,
			set_weapon:		SetWeapon.data,
			set_shield:		SetShield.data,
			plus:	Etc.plus,
			job_status:	Etc.job_status,
			skill: Skill.data,
			monster: Monster.data
		};
		public static final var keys:Object = {
				
		};
		public static function getData(item:String,index:int=-1,col:String=""):Object{
			if(index==-1)
				return data[item];
			if(col=="")
				return data[item][index];
			else
				return data[item][index][keys[item][col]];
		}
		public static function getSelect():Object{
			
		}
		/**
		 * 右手フォーム用のデータを取得
		 */
		public static function getSelectRight(item:String,job:int):Array{
			var a:Array = [];
			var d:Array = data[item];
			var k:Array = keys[item];
			for(var i:int=0;i<d.length;i++)
				if(d[i][k.job][job])//装備可能職かチェック
					if(d[i][k.hand] != "左手")
						a.push({label:d[i][k.name],index:i});//持ち手を確認し、
			return a;
		}
		//アイテムレベルの配列を取得
		public var plus:Array = ["N","+1","+2","+3","+4","+5","+6","+7","+8","+9","+10","+11","+12","+13","+14","+15"];
		
		//各職の初期ステータス
		private var jobstatus:Array = [
				[28,20,25,10],//ナイト
				[18,18,15,30],//ウィザード
				[22,25,20,15],//エルフ
				[26,26,26,26],//魔剣士
				[26,20,20,15,25],//ダークロード
				[21,21,18,23],//召喚師
				[32,27,25,20]];//レイジファイター
		public function getJobPoint(job:int,status:String):int{
			switch(status){
				case "str":
					return jobstatus[job][0];
				case "agi":
					return jobstatus[job][1];
				case "vit":
					return jobstatus[job][2];
				case "ene":
					return jobstatus[job][3];
				case "rec":
					return jobstatus[job][4];
			}
			return 0;
		}
		//装備データの取得
		public function getRight(job:int):Array{
			return Interface.getRight(job);
		}
		public function getLeft(job:int):Array{
			return Interface.getLeft(job);
		}
		public function getEquip(job:int,kind:String):Array{
			return Interface.getEquip(job,kind);
		}
		public function getSocketRight(job:int):Array{
			return Interface.getSocketRight(job);
		}
		public function getSocketLeft(job:int):Array{
			return Interface.getSocketLeft(job);
		}
		public function getSocketEquip(job:int,kind:String):Array{
			return Interface.getSocketEquip(job,kind);
		}
		public function getSetRight(job:int):Array{
			return Interface.getSetRight(job);
		}
		public function getSetLeft(job:int):Array{
			return Interface.getSetLeft(job);
		}
		public function getSetEquip(job:int,kind:String):Array{
			return Interface.getSetEquip(job,kind);
		}
		public function getItemType(item:Object):int{
			if(item[2] == "通常")return 0;
			if(item[2] == "ソケット")return 1;
			if(item[2] == "セット")return 2;
			return -1;
		}
		//エンチャントOPの取得
		public function getEnchaunt(type:int,plus:int):Array{
			return Interface.getEnchaunt(type,plus);
		}
		public function getEnchauntKind(item:Object):int{
			if(item[0] == "防具")return 2;
			if(item[3] == "杖" || item[3] == "書")return 1;
			return 0;
		}
		//ソケットOPの取得
		public var socket:Array = Interface.getSocketOption(0);
		public var socket_equip:Array = Interface.getSocketOption(1);
		//セットOPの取得
		public var setop:Array = Interface.getSetOption();
		//アクセサリの取得
		public function getSetNeck():Array{
			return Interface.getSetNeck();
		}
		public function getSetRing():Array{
			return Interface.getSetRing();
		}
		public function getShopNeck():Array{
			return Interface.getShopNeck();
		}
		public function getShopRing():Array{
			return Interface.getShopRing();
		}
		public function getNeck():Array{
			return Accessory.neck;
		}
		public function getRing():Array{
			return Accessory.ring;
		}
		//スキルデータの取得
		public var skill:Array = Interface.getSkill();
		//モンスターデータの取得
		public function getMonster(map:String,lv:int=1,ptm:int=1,ilv:int=1):Array{
			return Interface.getMonster(map,lv,ptm,ilv);
		}
		//マップデータの取得
		public var map:Array = Interface.getMap();
		//速度データの取得
		public var speed:Array = Interface.getSpeed();
		//計算結果のHTML出力
		public function htmlExport(hdat:String):void{
			ExternalInterface.call("htmlExport",hdat);
		}
		//経験値データの取得
		public var exp:Array = Interface.getExp();
	}
}