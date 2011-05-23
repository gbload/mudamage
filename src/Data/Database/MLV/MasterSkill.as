package Data.Database.MLV
{
	/**
	 * マスタースキルデータ
	 * @author sinlion
	 *
	 */
	public class MasterSkill
	{
		/*
		 * データ構造
		 * 0.name
		 * 1.value type
		 * 2.% boolean
		 * 3.description
		 */
		//共通1
		public static var endurance1:Array =
			["耐久力減少1",9,true,""];
		public static var endurance2:Array =
			["耐久力減少2",9,true,""];
		public static var endurance3:Array =
			["耐久力減少3",9,true,""];

		public static var maximum_sd:Array =
			["最大SD増加",14,false,""];
		public static var sd_recovery:Array =
			["SD回復速度増加",0,true,""];
		public static var defense:Array =
			["防御力増加",12,false,""];
		public static var avoidance:Array =
			["防御成功率増加",0,true,""];

		public static var mana_recovery:Array =
			["自動マナ回復力増加",1,true,""];
		public static var life_recovery:Array =
			["自動生命回復力増加",0,true,""];
		public static var ag_recovery:Array =
			["自動AG回復力増加",0,true,""];

		public static var pvp_avoidance:Array =
			["対人防御成功率増加",15,false,""];
		public static var poison_resistance:Array =
			["毒抵抗力増加",0,true,""];
		public static var lightning_resistance:Array =
			["稲妻抵抗力増加",0,true,""];
		public static var ice_resistance:Array =
			["氷抵抗力増加",0,true,""];

		// 共通2
		public static var hit:Array =
			["攻撃成功率増加",14,false,""];
		
		public static var maximum_life:Array =
			["最大生命増加",13,false,""];
		public static var maximum_mana:Array =
			["最大マナ増加",13,false,""];
		
		// 共通3
		public static var pvp_hit:Array =
			["対人攻撃成功率増加",16,false,""];
		
		public static var mana_consumption:Array =
			["消費マナ減少",4,true,""];

		public static var monster_kill_life:Array =
			["モンスターKill時生命回復",11,false,""];
		public static var monster_kill_mana:Array =
			["モンスターKill時マナ回復",11,false,""];
		public static var monster_kill_sd:Array =
			["モンスターKill時SD回復",11,false,""];
		
		// 攻撃魔力強化
		public static var weapon_master:Array =
			["ウェポンマスター",2,false,""];
		public static var magic_master:Array =
			["マジックマスター",2,false,""];
		public static var minimum_attack:Array =
			["最小攻撃力増加",2,false,""];
		public static var minimum_magic:Array =
			["最小魔力増加",2,false,""];
		public static var minimum_magic_curse:Array =
			["最小魔力/呪い増加",2,false,""];

		// 武器強化
		public static var one_hand_sword:Array =
			["片手剣強化",2,false,""];
		public static var one_hand_swrod_mastery:Array =
			["片手剣マスタリ",17,false,""];
		public static var two_hand_sword:Array =
			["両手剣強化",6,false,""];
		public static var two_hand_sword_mastery:Array =
			["両手剣マスタリ",8,false,""];
		public static var hammer:Array =
			["ハンマー強化",3,false,""];
		public static var hammer_mastery:Array =
			["ハンマーマスタリ",0,true,""];
		public static var spear:Array =
			["槍強化",3,false,""];
		public static var spear_mastery:Array =
			["槍マスタリ",0,true,""];
		public static var one_hand_staff:Array =
			["片手杖強化",2,false,""];
		public static var one_hand_staff_mastery:Array =
			["片手杖マスタリ",17,false,""];
		public static var two_hand_staff:Array =
			["両手杖強化",6,false,""];
		public static var two_hand_staff_mastery:Array =
			["両手杖マスタリ",8,false,""];
		public static var bow:Array =
			["弓強化",2,false,""];
		public static var bow_mastery:Array =
			["弓マスタリ",17,false,""];
		public static var crossbow:Array =
			["ボウガン強化",3,false,""];
		public static var crossbow_mastery:Array =
			["ボウガンマスタリ",8,false,""];
		public static var scepter:Array =
			["セプター強化",2,false,""];
		public static var scepter_mastery:Array =
			["セプターマスタリ",8,false,""];
		public static var scepter_pet:Array =
			["セプターペット強化",3,false,""];
		public static var rod:Array =
			["ロッド強化",2,false,""];
		public static var rod_mastery:Array =
			["ロッドマスタリ",8,false,""];
		public static var book:Array =
			["神具強化",3,false,""];
		public static var book_mastery:Array =
			["神具マスタリ",17,false,""];
		
		// 防具強化
		public static var shield:Array =
			["盾強化",5,false,""];
		public static var shield_mastery:Array =
			["盾マスタリ",9,false,""];
		public static var darkhorse:Array =
			["ダークホース強化",9,false,""];
		
		// 攻撃スキル強化
		public static var cyclone:Array =
			["真空斬り強化",0,false,""];
		public static var slash:Array =
			["ファイナルスラッシュ",3,false,""];
		public static var falling_slash:Array =
			["烈斬強化",3,false,""];
		public static var lunge:Array =
			["牙突強化",3,false,""];
		public static var twisting_slash:Array =
			["トルネードクラッシュ強化",3,false,""];
		public static var twisting_slash_mastery:Array =
			["トルネードクラッシュマスタリ",0,true,""];
		public static var omega_impact:Array =
			["オメガインパクト強化",2,false,""];
		public static var omega_impact_mastery:Array =
			["オメガインパクトマスタリ",0,true,""];
		public static var absolute_zero:Array =
			["アブソリュートゼロ強化",2,false,""];
		public static var stinger:Array =
			["スティンガー強化",2,false,""];
		public static var triple_shot:Array =
			["乱れ撃ち強化",2,false,""];
		public static var triple_shot_mastery:Array =
			["乱れ撃ちマスタリ",-1,false,""];
		public static var ice_arrow:Array =
			["アイスアロー強化",2,false,""];
		public static var summon_monster1:Array =
			["召喚モンスター強化1",-1,true,""];
		public static var summon_monster2:Array =
			["召喚モンスター強化2",-1,true,""];
		public static var infinity_arrow:Array =
			["インフィニティーアロー強化",0,true,""];
		public static var blood_attack:Array =
			["ブラッドアタック強化",2,false,""];
		public static var power_slash:Array =
			["パワースラッシュ強化",3,false,""];
		public static var force_wave:Array =
			["フォースウェーブ強化",3,false,""];
		public static var fire_burst:Array =
			["ファイアバースト強化",2,false,""];
		public static var earth_quake:Array =
			["アースクエイク強化",2,false,""];
		public static var earth_quake_mastery:Array =
			["アースクエイクマスタリ",0,true,""];
		public static var darkspirit1:Array =
			["ダークスピリット強化1",3,false,""];
		public static var darkspirit2:Array =
			["ダークスピリット強化2",1,true,""];
		public static var darkspirit3:Array =
			["ダークスピリット強化3",0,true,""];
		
		// 魔法スキル強化
		public static var burning_hammer:Array =
			["バーニングハンマー強化",3,false,""];
		public static var inferno:Array =
			["インフェルノ強化",2,false,""];
		public static var thunder_wire:Array =
			["サンダーワイヤー強化",3,false,""];
		public static var shining_blast:Array =
			["シャイニングブラスト強化",2,false,""];
		public static var soul_the_end:Array =
			["ソウルジエンド強化",2,false,""];
		public static var hell_fire:Array =
			["ヘルファイア強化",3,false,""];
		public static var death_plant:Array =
			["デスプラント強化",3,false,""];
		public static var death_poison:Array =
			["デスポイズン強化",2,false,""];
		public static var blizzard_bind:Array =
			["ブリザードバインド強化",3,false,""];
		public static var fire_book:Array =
			["炎属性の書強化",3,false,""];
		public static var fire_book_mastery:Array =
			["炎属性の書マスタリ",1,true,""];
		public static var wind_book:Array =
			["風属性の書強化",3,false,""];
		public static var wind_book_mastery:Array =
			["風属性の書マスタリ",0,true,""];
		public static var lightning_book:Array =
			["稲妻属性の書強化",3,false,""];
		public static var lightning_book_mastery:Array =
			["稲妻属性の書マスタリ",1,true,""];
		public static var chain_lightning:Array =
			["チェーンライトニング強化",2,false,""];
		public static var lightning_shock:Array =
			["ライトニングショック強化",2,false,""];
		public static var life_drain:Array =
			["ライフドレイン強化",2,false,""];
		public static var sleep:Array =
			["スリープ強化",0,true,""];
		
		// サポートスキル強化
		public static var swell_life:Array =
			["スウェルライフ強化",1,true,""];
		public static var swell_life_mastery:Array =
			["スウェルライフマスタリ",1,true,""];
		public static var spell_enhance:Array =
			["スペルエンハンス強化",0,true,""];
		public static var spell_enhance_mastery:Array =
			["スペルエンハンスマスタリ",0,true,""];
		public static var soul_barrier:Array =
			["ソウルバリア強化",1,true,""];
		public static var soul_barrier_mastery:Array =
			["ソウルバリアマスタリ",5,false,""];
		public static var healing:Array =
			["ヒーリング強化",2,true,""];
		public static var attack_plus:Array =
			["アタックプラス強化",2,true,""];
		public static var attack_plus_mastery:Array =
			["アタックプラスマスタリ",2,true,""];
		public static var guard_plus:Array =
			["ガードプラス強化",2,true,""];
		public static var guard_plus_mastery:Array =
			["ガードプラスマスタリ",2,true,""];
		public static var critical_plus1:Array =
			["クリティカルプラス強化1",3,false,""];
		public static var critical_plus2:Array =
			["クリティカルプラス強化2",5,false,""];
		public static var critical_plus3:Array =
			["クリティカルプラス強化3",1,true,""];
		// その他
		public static var pet_endurance:Array =
			["ペット耐久力減少",9,true,""];
		
	}
}