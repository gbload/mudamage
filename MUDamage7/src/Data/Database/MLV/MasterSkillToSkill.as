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
			["blood_storm","ブラッドストーム"],
			["stinger","スティンガー"],
			["triple_shot","乱れ撃ち"],
			["ice_arrow","アイスアロー"],
			["multi_shot","マルチショット"],
			["summon_monster1","召喚モンスター1"],
			["summon_monster2","召喚モンスター2"],
			["summon_monster3","召喚モンスター3"],
			["infinity_arrow","インフィニティーアロー"],
			["poison_arrow","ポイズンアロー"],
			["blood_attack","ブラッドアタック"],
			["power_slash","パワースラッシュ"],
			["flame_strike","フレイムストライク"],
			["force_wave","フォースウェーブ"],
			["fire_burst","ファイアバースト"],
			["earth_quake","アースクエイク"],
			["fire_scream","ファイアスクリーム"],
			["darkspirit1","ダークスピリット1"],
			["darkspirit2","ダークスピリット2"],
			["darkspirit3","ダークスピリット3"],
			["electric_spark","エレクトリックスパーク"],
			["fire_scream2","ファイアスクリーム"],
			["chaotic_desire","カオティックディセイアー"],
			["cling_blow","クリングブロー"],
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
			["meteor_strike","メテオストライク"],
			["sudden_ice","サドゥンアイス"],
			["hell_burst","ヘルバースト"],
			["earth_prison","アースプリズン"],
			["gigantic_storm","ギガンティックストーム"],
			["fire_book","炎属性の書"],
			["wind_book","風属性の書"],
			["lightning_book","稲妻属性の書"],
			["chain_lightning","チェーンライトニング"],
			["lightning_shock","ライトニングショック"],
			["life_drain","ライフドレイン"],
			["sleep","スリープ"]
		];
		/**
		 * 
		 * push_out break_armor hit stun attack_dec defense_dec book poison bind slow drain
		 */
		public static var masteries_array:Array = [
				["twisting_slash_mastery","トルネードクラッシュ","push_out"],
				["omega_impact_mastery","オメガインパクト","break_armor"],
				["triple_shot_mastery","乱れ撃ち","hit"],
				["fire_burst_mastery","ファイアバースト","stun"],
				["earth_quake_mastery","アースクエイク","stun"],
				["cling_blow_mastery","クリングブロー","attack_dec"],
				["beast_upper_mastery","ビーストアッパー","defense_dec"],
				["fire_book_mastery","炎属性の書","book"],
				["wind_book_mastery","風属性の書","stun"],
				["lightning_book_mastery","稲妻属性の書","push_out"],
				["god_blow_mastery","ゴッドブロー","poison"],
				["absolute_zero_mastery","アブソリュートゼロ","bind"],
				["god_blow_mastery2","ゴッドブロー","stun"],
				["absolute_zero_mastery2","アブソリュートゼロ","slow"],
				["sudden_ice_mastery","サドゥンアイス","bind"],
				["meteor_strike_mastery","メテオストライク","stun"],
				["multi_shot_mastery","マルチショット","stun"],
				["life_drain_mastery","ライフドレイン","drain"],
				["blizzard_bind_mastery","ブリザードバインド","bind"],
				["flame_strike_mastery","フレイムストライク","push_out"],
				["blood_attack_mastery","ブラッドアタック","defense_dec"]
		];
		public static var enhancements:Object = {};
		public static var masteries:Object = {};
		public static function init():void{
			if(!instance){
				for(var n:String in enhancements_array){
					if(enhancements[enhancements_array[n][1]]==null)
						enhancements[enhancements_array[n][1]] = new Array();
					enhancements[enhancements_array[n][1]].push(enhancements_array[n][0]);
				}
				for(n in masteries_array){
					if(masteries[masteries_array[n][1]]==null)
						masteries[masteries_array[n][1]] = new Array();
					masteries[masteries_array[n][1]].push({name:masteries_array[n][0],type:masteries_array[n][2]});
				}
				instance = true;
			}
		}
		public static function getEnhancement(skill_name:String):Array{
			init();
			if(enhancements[skill_name]==null)return new Array();
			return enhancements[skill_name];
		}
		public static function getMastery(skill_name:String):Array{
			init();
			if(masteries[skill_name]==null)return new Array();
			return masteries[skill_name];
		}
	}
}