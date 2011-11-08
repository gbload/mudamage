package Data.Database.MLV
{
	/**
	 * マスタースキルとスキルの組み合わせ
	 * @author sinlion
	 *
	 */
	public class MasterSkillToSkill
	{
		public static var instance:Boolean = false;
		public static var enhancements_array:Array = [
			// 攻撃スキル
			["cyclone","真空斬り"],
			["slash","ファイナルスラッシュ"],
			["falling_slash","烈斬"],
			["lunge","牙突"],
			["twisting_slash","トルネードクラッシュ"],
			["omega_impact","オメガインパクト"],
			["god_blow","ゴッドブロー"],
			["absolute_zero","アブソリュートゼロ"],
			["stinger","スティンガー"],
			["triple_shot","乱れ撃ち"],
			["ice_arrow","アイスアロー"],
			["summon_monster1","召喚モンスター1"],
			["summon_monster2","召喚モンスター2"],
			["infinity_arrow","インフィニティーアロー"],
			["blood_attack","ブラッドアタック"],
			["power_slash","パワースラッシュ"],
			["force_wave","フォースウェーブ"],
			["fire_burst","ファイアバースト"],
			["earth_quake","アースクエイク"],
			["fire_scream","ファイアスクリーム"],
			["darkspirit1","ダークスピリット1"],
			["darkspirit2","ダークスピリット2"],
			["darkspirit3","ダークスピリット3"],
			["killing_blow","クリングブロー"],
			["beast_upper","ビーストアッパー"],
			["chain_drive","チェーンドライブ"],
			["dark_side","ダークサイド"],
			["dragon_roar","ドラゴンロアー"],
			// 魔法スキル
			["burning_hammer","バーニングハンマー"],
			["inferno","インフェルノ"],
			["thunder_wire","サンダーワイヤー"],
			["shining_blast","シャイニングブラスト"],
			["soul_the_end","ソウルジエンド"],
			["hell_fire","ヘルファイア"],
			["death_plant","デスプラント"],
			["death_poison","デスポイズン"],
			["blizzard_bind","ブリザードバインド"],
			["fire_book","炎属性の書"],
			["wind_book","風属性の書"],
			["lightning_book","稲妻属性の書"],
			["chain_lightning","チェーンライトニング"],
			["lightning_shock","ライトニングショック"],
			["life_drain","ライフドレイン"],
			["sleep","スリープ"]
		];
		public static var masteries_array:Array = [
//				["twisting_slash_mastery","トルネードクラッシュマスタリ"],
//				["omega_impact_mastery","オメガインパクトマスタリ"],
//				["triple_shot_mastery","乱れ撃ちマスタリ"],
//				["fire_burst_mastery","ファイアバーストマスタリ"],
//				["earth_quake_mastery","アースクエイクマスタリ"],
//				["killing_blow_mastery","クリングブローマスタリ"],
//				["beast_upper_mastery","ビーストアッパーマスタリ"],
//				["fire_book_mastery","炎属性の書マスタリ"],
//				["wind_book_mastery","風属性の書マスタリ"],
//				["lightning_book_mastery","稲妻属性の書マスタリ"]
		];
		public static var enhancements:Object = {};
		public static var masteries:Object = {};
		public static var masteries_type:Object = {};
		public static function init():void{
			if(!instance){
				for(var n:String in enhancements_array){
					enhancements[enhancements_array[n][1]] = enhancements_array[n][0];
				}
				for(n in masteries_array){
					masteries[masteries_array[n][1]] = masteries_array[n][0];
					masteries_type[masteries_array[n][1]] = masteries_array[n][2];
				}
			}
		}
		public static function getEnhancement(skill_name:String):String{
			return enhancements[skill_name];
		}
		public static function getMastery(skill_name:String):String{
			return masteries[skill_name];
		}
		public static function getMasteryType(skill_name:String):String{
			return masteries_type[skill_name];
		}
	}
}