package Data.Database{
	public class DoubleGoer{
		/**
		 * DoubleGoerコンストラクタ
		 * @param lv,ptm
		 */
		public function DoubleGoer(lv:int, ptm:int){
			calculateMonster(lv,ptm);	
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
				options.push("Lv" + ((i+1)*10) );
			}
			return options;
		}
		/**
		 * マップ選択時に表示するサブフォーム内データを提供する。
		 * @return ptm_options
		 */
		public static function getPTMOptions():Array{
			var options:Array = new Array();
			for(var i:int=0;i<5;i++){
				options.push("PT" + (i+1) + "人" );
			}
			return options;
		}
		/**
		 * モンスターデータを計算します。
		 */
		private function calculateMonster(l:int, p:int):void{
			for each(var m:Array in monster){
				m[INDEX_LVL] = Math.floor(m[INDEX_LVL] * lv[l][p]);
				m[INDEX_HP] = Math.floor(m[INDEX_HP] * hp[l][p]);
				m[INDEX_MIN] = Math.floor(m[INDEX_MIN] * attack[l][p]);
				m[INDEX_MAX] = Math.floor(m[INDEX_MAX] * attack[l][p]);
				m[INDEX_DEF] = Math.floor(m[INDEX_DEF] * defense[l][p]);
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
			["ドッペルゲンガー","召喚師",14,500,65,70,30,0,0,0,0,0,5],
			["ドッペルゲンガー","ダークロード",17,900,85,90,55,0,0,0,0,0,5],
			["ドッペルゲンガー","魔剣士",14,500,65,70,30,0,0,0,0,0,5],
			["ドッペルゲンガー","ウィザード",14,500,65,70,30,0,0,0,0,0,5],
			["ドッペルゲンガー","ナイト",14,500,65,70,30,0,0,0,0,0,5],
			["ドッペルゲンガー","エルフ",14,500,65,70,30,0,0,0,0,0,5],
			["ドッペルゲンガー","ブービーワーム",15,600,80,85,45,0,0,0,0,0,5],
			["ドッペルゲンガー","槌の子",16,1000,75,80,55,0,0,0,0,0,5],
			["ドッペルゲンガー","ディメンジョンウォーカー",19,1500,85,90,60,0,0,0,0,0,5],
			["ドッペルゲンガー","ディメンジョンプリズナー",18,2000,110,120,73,0,0,0,0,0,5],
			["ドッペルゲンガー","破壊の化身",20,2500,125,135,83,0,0,0,0,0,5]
		];
		/**
		 * モンスターレベルの乗数<br>
		 * キャラクターLV10から10刻みで600まで。<br>
		 * また、列方向はPTMの人数。
		 */		
		private static var lv:Array = [
[1,1,1,1,1],//10
[1.2,1.2,1.2,1.2,1.2],
[1.6,1.6,1.6,1.6,1.6],
[1.9,1.9,1.9,1.9,1.9],
[2.2,2.2,2.2,2.2,2.2],
[2.5,2.5,2.5,2.5,2.5],
[2.7,2.7,2.7,2.7,2.7],
[3,3,3,3,3],
[3.3,3.3,3.3,3.3,3.3],
[3.6,3.6,3.6,3.6,3.6],
[3.65,3.65,3.65,3.65,3.65],
[3.69,3.69,3.69,3.69,3.69],
[3.73,3.73,3.73,3.73,3.73],
[3.77,3.77,3.77,3.77,3.77],
[3.81,3.81,3.81,3.81,3.81],
[3.85,3.85,3.85,3.85,3.85],
[3.89,3.89,3.89,3.89,3.89],
[3.93,3.93,3.93,3.93,3.93],
[3.97,3.97,3.97,3.97,3.97],
[4.01,4.01,4.01,4.01,4.01],
[4.05,4.05,4.05,4.05,4.05],
[5,4.09,4.09,4.09,4.09],
[5.05,4.13,4.13,4.13,4.13],
[5.1,4.17,4.17,4.17,4.17],
[5.15,4.21,4.21,4.21,4.21],
[5.2,4.25,4.25,4.25,4.25],
[5.25,4.29,4.29,4.29,4.29],
[5.3,4.33,4.33,4.33,4.33],
[5.35,4.37,4.37,4.37,4.37],
[5.4,4.41,4.41,4.41,4.41],
[5.45,4.45,4.45,4.45,4.45],
[5.5,4.49,4.49,4.49,4.49],
[5.55,4.53,4.53,4.53,4.53],
[5.6,4.57,4.57,4.57,4.57],
[5.65,4.61,4.61,4.61,4.61],
[5.7,4.65,4.65,4.65,4.65],
[5.75,4.69,4.69,4.69,4.69],
[5.8,4.73,4.73,4.73,4.73],
[5.85,4.77,4.77,4.77,4.77],
[6.79,6.79,6.79,6.79,6.79],
[6.79,6.79,6.79,6.79,6.79],
[6.79,6.79,6.79,6.79,6.79],
[6.79,6.79,6.79,6.79,6.79],
[6.79,6.79,6.79,6.79,6.79],
[6.79,6.79,6.79,6.79,6.79],
[6.79,6.79,6.79,6.79,6.79],
[6.79,6.79,6.79,6.79,6.79],
[6.79,6.79,6.79,6.79,6.79],
[6.79,6.79,6.79,6.79,6.79],
[6.79,6.79,6.79,6.79,6.79],
[6.79,6.79,6.79,6.79,6.79],
[6.79,6.79,6.79,6.79,6.79],
[6.79,6.79,6.79,6.79,6.79],
[6.79,6.79,6.79,6.79,6.79],
[6.79,6.79,6.79,6.79,6.79],
[6.79,6.79,6.79,6.79,6.79],
[6.79,6.79,6.79,6.79,6.79],
[6.79,6.79,6.79,6.79,6.79],
[6.79,6.79,6.79,6.79,6.79],
[6.79,6.79,6.79,6.79,6.79]//600
		];
		/**
		 * モンスターHPの乗数
		 */
		private static var hp:Array = [
[1,1.2,1.5,2,2.7],
[1.2,1.4,1.7,2.2,2.9],
[1.5,1.7,2,2.5,3.2],
[1.8,2,2.3,2.8,3.5],
[2.1,2.3,2.6,3.1,3.8],
[2.4,2.6,2.9,3.4,4.1],
[2.7,2.9,3.2,3.7,4.4],
[3,3.2,3.5,4,4.7],
[4,4.2,4.5,5,5.7],
[5,5.2,5.5,6,6.7],
[6,6.2,6.5,7,7.7],
[7,7.2,7.5,8,8.7],
[8,8.2,8.5,9,9.7],
[9,9.2,9.5,10,10.7],
[10,10.2,10.5,11,11.7],
[11,11.2,11.5,12,12.7],
[12,12.2,12.5,13,13.7],
[13,13.2,13.5,14,14.7],
[14,14.2,14.5,15,15.7],
[15,15.2,15.5,16,16.7],
[16,16.2,16.5,17,17.7],
[17,17.2,17.5,18,18.7],
[18,18.2,18.5,19,19.7],
[21,21.2,21.5,22,22.7],
[24,24.2,24.5,25,25.7],
[26,26.2,26.5,27,27.7],
[28,28.2,28.5,29,29.7],
[30,30.2,30.5,31,31.7],
[32,32.2,32.5,33,33.7],
[34,34.2,34.5,35,35.7],
[36,36.2,36.5,37,37.7],
[38,38.2,38.5,39,39.7],
[40,40.2,40.5,41,41.7],
[41,41.2,41.5,42,42.7],
[42,42.2,42.5,43,43.7],
[43,43.2,43.5,44,44.7],
[44,44.2,44.5,45,45.7],
[46,46.2,46.5,47,47.7],
[48,48.2,48.5,49,49.7],
[50,50.2,50.5,51,51.7],
[51,51.2,51.5,52,52.7],
[52,52.2,52.5,53,53.7],
[53,53.2,53.5,54,54.7],
[54,54.2,54.5,55,55.7],
[55,55.2,55.5,56,56.7],
[56,56.2,56.5,57,57.7],
[62,62.2,62.5,63,63.7],
[64,64.2,64.5,65,65.7],
[66,66.2,66.5,67,67.7],
[68,68.2,68.5,69,69.7],
[70,70.2,70.5,71,71.7],
[78,78.2,78.5,79,79.7],
[82,82.2,82.5,83,83.7],
[86,86.2,86.5,87,87.7],
[90,90.2,90.5,91,91.7],
[95,95.2,95.5,96,96.7],
[100,100.2,100.5,101,101.7],
[105,105.2,105.5,106,106.7],
[110,110.2,110.5,111,111.7],
[115,115.2,115.5,116,116.7]
		];
		/**
		 * モンスター攻撃力の乗数
		 */
		private static var attack:Array = [
[0.8,1,1.3,1.6,1.9],
[0.9,1.1,1.4,1.7,2],
[1,1.2,1.5,1.8,2.1],
[1.1,1.3,1.6,1.9,2.2],
[1.2,1.4,1.7,2,2.3],
[1.3,1.5,1.8,2.1,2.4],
[1.4,1.6,1.9,2.2,2.5],
[1.5,1.7,2,2.3,2.6],
[1.7,1.9,2.2,2.5,2.8],
[1.8,2,2.3,2.6,2.9],
[1.9,2.1,2.4,2.7,3],
[2,2.2,2.5,2.8,3.1],
[2.1,2.3,2.6,2.9,3.2],
[2.3,2.5,2.8,3.1,3.4],
[2.4,2.6,2.9,3.2,3.5],
[2.5,2.7,3,3.3,3.6],
[2.6,2.8,3.1,3.4,3.7],
[2.7,2.9,3.2,3.5,3.8],
[2.8,3,3.3,3.6,3.9],
[2.9,3.1,3.4,3.7,4],
[3,3.2,3.5,3.8,4.1],
[3.1,3.3,3.6,3.9,4.2],
[3.2,3.4,3.7,4,4.3],
[3.4,3.6,3.9,4.2,4.5],
[3.5,3.7,4,4.3,4.6],
[3.6,3.8,4.1,4.4,4.7],
[3.7,3.9,4.2,4.5,4.8],
[3.8,4,4.3,4.6,4.9],
[4.1,4.3,4.6,4.9,5.2],
[4.4,4.6,4.9,5.2,5.5],
[4.7,4.9,5.2,5.5,5.8],
[5,5.2,5.5,5.8,6.1],
[5.3,5.5,5.8,6.1,6.4],
[5.4,5.6,5.9,6.2,6.5],
[5.5,5.7,6,6.3,6.6],
[5.7,5.9,6.2,6.5,6.8],
[5.9,6.1,6.4,6.7,7],
[6.1,6.3,6.6,6.9,7.2],
[6.3,6.5,6.8,7.1,7.4],
[6.5,6.7,7,7.3,7.6],
[6.7,6.9,7.2,7.5,7.8],
[6.9,7.1,7.4,7.7,8],
[7.1,7.3,7.6,7.9,8.2],
[7.3,7.5,7.8,8.1,8.4],
[7.5,7.7,8,8.3,8.6],
[7.7,7.9,8.2,8.5,8.8],
[8,8.2,8.5,8.8,9.1],
[8.3,8.5,8.8,9.1,9.4],
[8.6,8.8,9.1,9.4,9.7],
[8.9,9.1,9.4,9.7,10],
[9.2,9.4,9.7,10,10.3],
[9.6,9.8,10.1,10.4,10.7],
[9.9,10.1,10.4,10.7,11],
[10.2,10.4,10.7,11,11.3],
[10.5,10.7,11,11.3,11.6],
[10.8,11,11.3,11.6,11.9],
[11.1,11.3,11.6,11.9,12.2],
[11.4,11.6,11.9,12.2,12.5],
[11.7,11.9,12.2,12.5,12.8],
[12,12.2,12.5,12.8,13.1]
		];
		/**
		 * モンスター防御力の乗数
		 */
		private static var defense:Array = [
[1.3,1.5,1.8,2.1,2.4],
[1.4,1.6,1.9,2.2,2.5],
[1.5,1.7,2,2.3,2.6],
[1.6,1.8,2.1,2.4,2.7],
[1.7,1.9,2.2,2.5,2.8],
[1.8,2,2.3,2.6,2.9],
[1.9,2.1,2.4,2.7,3],
[2,2.2,2.5,2.8,3.1],
[3,3.2,3.5,3.8,4.1],
[3.1,3.3,3.6,3.9,4.2],
[3.2,3.4,3.7,4,4.3],
[3.3,3.5,3.8,4.1,4.4],
[3.4,3.6,3.9,4.2,4.5],
[3.6,3.8,4.1,4.4,4.7],
[3.8,4,4.3,4.6,4.9],
[4.1,4.3,4.6,4.9,5.2],
[4.3,4.5,4.8,5.1,5.4],
[5,5.2,5.5,5.8,6.1],
[5.4,5.6,5.9,6.2,6.5],
[5.6,5.8,6.1,6.4,6.7],
[5.8,6,6.3,6.6,6.9],
[6,6.2,6.5,6.8,7.1],
[6.2,6.4,6.7,7,7.3],
[6.3,6.5,6.8,7.1,7.4],
[6.5,6.7,7,7.3,7.6],
[6.6,6.8,7.1,7.4,7.7],
[6.8,7,7.3,7.6,7.9],
[7,7.2,7.5,7.8,8.1],
[7.5,7.7,8,8.3,8.6],
[8,8.2,8.5,8.8,9.1],
[8.5,8.7,9,9.3,9.6],
[9,9.2,9.5,9.8,10.1],
[9.4,9.6,9.9,10.2,10.5],
[11.8,12,12.3,12.6,12.9],
[12,12.2,12.5,12.8,13.1],
[12.2,12.4,12.7,13,13.3],
[12.4,12.6,12.9,13.2,13.5],
[12.6,12.8,13.1,13.4,13.7],
[12.8,13,13.3,13.6,13.9],
[13,13.2,13.5,13.8,14.1],
[14,14.2,14.5,14.8,15.1],
[14.2,14.4,14.7,15,15.3],
[14.4,14.6,14.9,15.2,15.5],
[14.6,14.8,15.1,15.4,15.7],
[14.8,15,15.3,15.6,15.9],
[15,15.2,15.5,15.8,16.1],
[16,16.2,16.5,16.8,17.1],
[16.4,16.6,16.9,17.2,17.5],
[16.8,17,17.3,17.6,17.9],
[17.2,17.4,17.7,18,18.3],
[17.5,17.7,18,18.3,18.6],
[18,18.2,18.5,18.8,19.1],
[18.2,18.4,18.7,19,19.3],
[18.5,18.7,19,19.3,19.6],
[19,19.2,19.5,19.8,20.1],
[19.5,19.7,20,20.3,20.6],
[20,20.2,20.5,20.8,21.1],
[20.5,20.7,21,21.3,21.6],
[21,21.2,21.5,21.8,22.1],
[21.5,21.7,22,22.3,22.6]
		];
		
	}
}