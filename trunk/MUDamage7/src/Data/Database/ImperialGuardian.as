package Data.Database{
	public class ImperialGuardian{
		/**
		 * DoubleGoerコンストラクタ
		 * @param lv,ptm
		 */
		public function ImperialGuardian(lv:int){
			calculateMonster(lv);	
		}
		/**
		 * モンスターデータを取得します。
		 * @return monster
		 */
		public function getMonster():Array{
			return monster;
		}
		/**
		 * マップ選択時に表示するサブフォーム内データを提供する。
		 * @return level_options
		 */
		public static function getLvOptions():Array{
			var options:Array = new Array();
			for(var i:int=0;i<60;i++){
				options.push("PT内最小Lv" + (i*10+1) + "-" + ((i+1)*10) );
			}
			return options;
		}
		/**
		 * モンスターデータを計算します。
		 */
		private function calculateMonster(l:int):void{
			for each(var m:Array in monster){
				m[INDEX_LVL] = Math.floor(m[INDEX_LVL] * lv[l]);
				m[INDEX_HP] = Math.floor(m[INDEX_HP] * hp[l]);
				m[INDEX_MIN] = Math.floor(m[INDEX_MIN] * attack[l]);
				m[INDEX_MAX] = Math.floor(m[INDEX_MAX] * attack[l]);
				m[INDEX_DEF] = Math.floor(m[INDEX_DEF] * defense[l]);
			}
		}
		/**
		 * モンスターデータの配列要素のインデックス
		 */
		private static var INDEX_LVL:int = 2;
		private static var INDEX_HP:int = 3;
		private static var INDEX_MIN:int = 4;
		private static var INDEX_MAX:int = 5;
		private static var INDEX_DEF:int = 6;
		/**
		 * 基本モンスターデータ
		 */
		private var monster:Array = [
			["カウンターリベリオン","ガイオンガード",1,570,30,35,18,NaN,NaN],
			["カウンターリベリオン","ガイオンナイト",1,550,28,33,17,NaN,NaN],
			["カウンターリベリオン","ガイオンプリースト",1,500,25,30,15,NaN,NaN],
			["カウンターリベリオン","ガイオンディフェンダー",1,580,30,35,20,NaN,NaN],
			
			["カウンターリベリオン","ビーストマスター",1,650,33,38,22,NaN,NaN],
			["カウンターリベリオン","アサシンマスター",1,650,33,38,22,NaN,NaN],
			["カウンターリベリオン","マジックマスター",1,650,33,38,22,NaN,NaN],
			["カウンターリベリオン","アーティクルマスター",1,650,33,38,22,NaN,NaN],
			["カウンターリベリオン","コンバットマスター",1,650,33,38,22,NaN,NaN],
			["カウンターリベリオン","クォーターマスター",1,650,33,38,22,NaN,NaN],
			
			["カウンターリベリオン","第一師団長 月光のデスラー",1,780,36,41,27,NaN,NaN],
			["カウンターリベリオン","第二師団長 烈火のベルモント",1,780,36,41,27,NaN,NaN],
			["カウンターリベリオン","第三師団長 激流のカト",1,780,36,41,27,NaN,NaN],
			["カウンターリベリオン","第四師団長 疾風のガリア",1,780,36,41,27,NaN,NaN],
			["カウンターリベリオン","軍団長 大地のエルカン",1,800,39,44,28,NaN,NaN],
			["カウンターリベリオン","副司令官 雷撃のレイモンド",1,800,39,44,28,NaN,NaN],
			["カウンターリベリオン","参謀長 漆黒のジェリント",1,930,42,47,30,NaN,NaN],
			
			["カウンターリベリオン","ガイオン・カレイン",1,1250,45,50,35,NaN,NaN],
		];
		/**
		 * モンスターレベルの乗数<br>
		 * キャラクターLV10から10刻みで600まで。<br>
		 * また、列方向はPTMの人数。
		 */		
		private static var lv:Array = [
45,
46,
47,
48,
49,
50,
51,
52,
53,
54,
55,
56,
57,
58,
59,
60,
61,
62,
63,
64,
66,
68,
70,
72,
74,
76,
78,
80,
82,
85,
87,
89,
91,
93,
95,
97,
99,
101,
103,
105,
107,
109,
111,
113,
115,
117,
119,
121,
123,
125,
127,
129,
131,
133,
135,
137,
139,
141,
143,
145
		];
		/**
		 * モンスターHPの乗数
		 */
		private static var hp:Array = [
10,
10,
20,
40,
50,
50,
50,
60,
60,
70,
70,
70,
80,
80,
90,
90,
90,
90,
100,
500,
600,
600,
700,
700,
800,
800,
900,
900,
900,
1000,
1100,
1200,
1300,
1400,
1500,
1500,
1550,
1600,
1700,
1800,
1810,
1820,
1830,
1840,
1850,
1860,
1870,
1880,
1890,
1900,
1910,
1920,
1930,
1940,
1950,
1960,
1970,
1980,
1990,
2000
		];
		/**
		 * モンスター攻撃力の乗数
		 */
		private static var attack:Array = [
3,
4,
5,
6,
7,
8,
9,
10,
11,
12,
13,
14,
15,
16,
17,
18,
19,
20,
21,
22,
23,
24,
25,
26,
27,
28,
29,
30,
31,
32,
33,
34,
35,
36,
37,
38,
39,
40,
41,
42,
42,
43,
43,
44,
44,
45,
45,
46,
46,
47,
48,
48,
49,
49,
50,
50,
51,
51,
52,
53
		];
		/**
		 * モンスター防御力の乗数
		 */
		private static var defense:Array = [
3,
4,
4,
4,
5,
5,
5,
6,
6,
6,
7,
7,
7,
8,
8,
8,
9,
9,
9,
10,
10,
11,
11,
12,
12,
13,
13,
14,
14,
15,
16,
17,
18,
19,
20,
21,
22,
23,
24,
25,
26,
27,
28,
29,
30,
31,
32,
33,
34,
35,
36,
37,
38,
39,
40,
41,
42,
43,
44,
45
		];
		
	}
}