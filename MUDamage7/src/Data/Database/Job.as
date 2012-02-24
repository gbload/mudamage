package Data.Database
{
	internal class Job
	{
		public static var job:Array =
			["ナイト","ウィザード","エルフ","魔剣士","ダークロード","召喚師","レイジファイター"];
		
		public static var status:Array = [
			[28,20,25,10],//ナイト
			[18,18,15,30],//ウィザード
			[22,25,20,15],//エルフ
			[26,26,26,26],//魔剣士
			[26,20,20,15,25],//ダークロード
			[21,21,18,23],//召喚師
			[32,27,25,20]//レイジファイター
		];

		public static var life:Array = [
            [110,3,2],
            [60,2,1],
            [80,2,1],
            [110,2,1],
            [90,2,1.5],
            [70,2,1],
            [100,2,1.3]
        ];
		public static var mana:Array = [
            [20,1,0.5],
            [60,2,2],
            [30,1.5,1.5],
            [60,2,1],
            [40,1.5,1],
            [40,1.5,1.5],
            [40,1.3,1]
        ];
		public static var ag:Array = [
		    [0.15,0.2,0.3,1.0,0],
		    [0.2,0.4,0.3,0.2,0],
		    [0.3,0.2,0.3,0.2,0],
		    [0.2,0.25,0.3,0.15,0],
		    [0.3,0.2,0.1,0.15,0.3],
		    [0.2,0.25,0.3,0.15,0],
		    [0.15,0.2,0.3,1.0,0]
	    ];
		public static var speed:Array = [
 		    [15,15],
 		    [10,10],
 		    [50,50],
 		    [15,20],
 		    [10,10],
 		    [20,20],
 		    [9,9]
	    ];
		public static var min:Array = [];
		public static var max:Array = [];
		public static var hit:Array = [
           [5,1.5,4],
           [5,1.5,4],
           [5,1.5,4],
           [5,1.5,4],
           [5,2.5,6,10],
           [5,1.5,4],
           [3,1.25,6]
        ];
		public static var pvp_hit:Array = [
           [3,4.5],
           [3,4],
           [3,0.6],
           [3,3.5],
           [3,4],
           [3,3.5],
           [2.6,3.6]
        ];
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
		public static var attr_min:Array = [
   			[8,0,0,0,0],//ナイト
 			[0,0,0,8,0],//ウィザード
 			[16,8,0,0,0],//エルフ
 			[12,0,0,12,0],//魔剣士
 			[12,0,0,12,12],//ダークロード
 			[0,0,0,8,0],//召喚師
 			[12,0,12,0,0]//レイジファイター
 		];
		public static var attr_max:Array = [
  			[4,0,0,0,0],//ナイト
			[0,0,0,4,0],//ウィザード
			[0,4,0,0,0],//エルフ
			[6,0,0,6,0],//魔剣士
			[6,0,0,6,6],//ダークロード
			[0,0,0,4,0],//召喚師
			[6,0,6,0,0]//レイジファイター
		];
		public static var attr_def:Array = [
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