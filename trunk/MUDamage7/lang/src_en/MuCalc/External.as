package MuCalc
{
	import flash.external.ExternalInterface;
	
	public class External
	{
		public function External()
		{
		}
		//アイテムレベルの配列を取得
		public var plus:Array = ["N","+1","+2","+3","+4","+5","+6","+7","+8","+9","+10","+11","+12","+13","+14","+15"];
		//羽のデータを取得
		public function getWing(job:int):Array{
			return ExternalInterface.call("getWing",job);
		}
		public function getWingDef(name:String):int{
			return ExternalInterface.call("getWingDef",name);
		}
		public function getWingInc(name:String):int{
			return ExternalInterface.call("getWingInc",name);
		}
		public function getWingDec(name:String):int{
			return ExternalInterface.call("getWingDec",name);
		}
		public function getWingType(name:String):int{
			return ExternalInterface.call("getWingType",name);
		}
		public function getWingOp(wingname:String):Array{
			return ExternalInterface.call("getWingOp",wingname);
		}
		public function getWingCop(wingname:String):Array{
			return ExternalInterface.call("getWingCop",wingname);
		}
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
			return ExternalInterface.call("getRight",job);
		}
		public function getLeft(job:int):Array{
			return ExternalInterface.call("getLeft",job);
		}
		public function getEquip(job:int,kind:String):Array{
			return ExternalInterface.call("getEquip",job,kind);
		}
		public function getSocketRight(job:int):Array{
			return ExternalInterface.call("getSocketRight",job);
		}
		public function getSocketLeft(job:int):Array{
			return ExternalInterface.call("getSocketLeft",job);
		}
		public function getSocketEquip(job:int,kind:String):Array{
			return ExternalInterface.call("getSocketEquip",job,kind);
		}
		public function getSetRight(job:int):Array{
			return ExternalInterface.call("getSetRight",job);
		}
		public function getSetLeft(job:int):Array{
			return ExternalInterface.call("getSetLeft",job);
		}
		public function getSetEquip(job:int,kind:String):Array{
			return ExternalInterface.call("getSetEquip",job,kind);
		}
		public function getItemType(item:Object):int{
			if(item[2] == "Normal")return 0;
			if(item[2] == "Socket")return 1;
			if(item[2] == "Set Ancient")return 2;
			return -1;
		}
		//エンチャントOPの取得
		public function getEnchaunt(type:int,plus:int):Array{
			return ExternalInterface.call("getEnchaunt",type,plus);
		}
		public function getEnchauntKind(item:Object):int{
			if(item[0] == "Protect")return 2;
			if(item[3] == "Staff" || item[3] == "Book")return 1;
			return 0;
		}
		//ソケットOPの取得
		public var socket:Array = ExternalInterface.call("getSocketOption",0);
		public var socket_equip:Array = ExternalInterface.call("getSocketOption",1);
		//セットOPの取得
		public var setop:Array = ExternalInterface.call("getSetOption");
		public function getSetNeck():Array{
			return ExternalInterface.call("getSetNeck");
		}
		public function getSetRing():Array{
			return ExternalInterface.call("getSetRing");
		}
		//スキルデータの取得
		public var skill:Array = ExternalInterface.call("getSkill");
		//モンスターデータの取得
		public function getMonster(map:String,lv:int=1):Array{
			return ExternalInterface.call("getMonster",map,lv);
		}
		//マップデータの取得
		public var map:Array = ExternalInterface.call("getMap");
		//速度データの取得
		public var speed:Array = ExternalInterface.call("getSpeed");
		//計算結果のHTML出力
		public function htmlExport(hdat:String):void{
			ExternalInterface.call("htmlExport",hdat);
		}
		//経験値データの取得
		public var exp:Array = ExternalInterface.call("getExp");
	}
}