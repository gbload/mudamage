package Data.Database
{
	internal class Job
	{
		public static var job:Array =
			["ナイト","ウィザード","エルフ","魔剣士","ダークロード","召喚師","レイジファイター"];
		
		public static var job_status:Array = [
			[28,20,25,10],//ナイト
			[18,18,15,30],//ウィザード
			[22,25,20,15],//エルフ
			[26,26,26,26],//魔剣士
			[26,20,20,15,25],//ダークロード
			[21,21,18,23],//召喚師
			[32,27,25,20]//レイジファイター
		];

		public static var life:Array = [];
		public static var mana:Array = [];
		public static var ag:Array = [];
		public static var min:Array = [];
		public static var max:Array = [];
		public static var hit:Array = [];
		public static var def:Array = [3,4,10,4,7,3,8];
		public static var avoid:Array = [3,3,4,3,7,4,10];
		public static var pvp_avoid:Array = [
  			[2,2],//ナイト
			[2,4],//ウィザード
			[2,10],//エルフ
			[2,4],//魔剣士
			[2,2],//ダークロード
			[2,2],//召喚師
			[1.5,5]//レイジファイター
		];
	}
}