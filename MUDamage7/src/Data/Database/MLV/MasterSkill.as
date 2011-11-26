package Data.Database.MLV
{
	/**
	 * マスタースキルデータ
	 * @author sinlion
	 *
	 */
	public class MasterSkill
	{
		public static var ID:int = 0;
		public static var NAME:int = 1;
		public static var VALUE_TYPE:int = 2;
		public static var DISPLAY_TYPE:int = 3;
		public static var IMAGE:int = 4;
		public static var DESCRIPTION:int = 5;
		/*
		 * データ構造
		 * 0.id
		 * 1.name
		 * 2.value type
		 * 3.display_type 0:なし 1:% 2:秒 3:÷
		 * 4.image
		 * 5.description
		 */
		public static var skill:Array =[
		//共通1
		["endurance1","耐久力減少1",9,1,MasterSkillImage.img1_0,""],
		["endurance2","耐久力減少2",9,1,MasterSkillImage.img1_8,""],
		["endurance3","耐久力減少3",9,1,MasterSkillImage.img1_16,""],

		["maximum_sd","最大SD増加",14,0,MasterSkillImage.img1_5,""],
		["sd_recovery","SD回復速度増加",0,1,MasterSkillImage.img1_9,""],
		["defense","防御力増加",12,0,MasterSkillImage.img1_13,""],
		["avoidance","防御成功率増加",0,1,MasterSkillImage.img1_17,""],

		["mana_recovery","自動マナ回復力増加",1,1,MasterSkillImage.img1_6,""],
		["life_recovery","自動生命回復力増加",0,1,MasterSkillImage.img1_10,""],
		["ag_recovery","自動AG回復力増加",0,1,MasterSkillImage.img1_14,""],

		["pvp_avoidance","対人防御成功率増加",15,0,MasterSkillImage.img1_3,""],
		["poison_resistance","毒抵抗力増加",0,1,MasterSkillImage.img1_7,""],
		["lightning_resistance","稲妻抵抗力増加",0,1,MasterSkillImage.img1_11,""],
		["ice_resistance","氷抵抗力増加",0,1,MasterSkillImage.img1_15,""],

		// 共通2
		["hit","攻撃成功率増加",14,0,MasterSkillImage.img1_20,""],
		
		["maximum_life","最大生命増加",13,0,MasterSkillImage.img1_34,""],
		["maximum_mana","最大マナ増加",13,0,MasterSkillImage.img6_39,""],
		
		// 共通3
		["pvp_hit","対人攻撃成功率増加",16,0,MasterSkillImage.img1_40,""],
		
		["mana_consumption","消費マナ減少",4,1,MasterSkillImage.img5_53,""],

		["monster_kill_life","モンスターKill時生命回復",11,0,MasterSkillImage.img5_55,""],
		["monster_kill_mana","モンスターKill時マナ回復",11,0,MasterSkillImage.img1_59,""],
		["monster_kill_sd","モンスターKill時SD回復",11,0,MasterSkillImage.img5_54,""],
		
		// 攻撃魔力強化
		["weapon_master","ウェポンマスター",2,0,MasterSkillImage.img1_35,""],
		["magic_master","マジックマスター",2,0,MasterSkillImage.img6_36,""],
		["minimum_attack","最小攻撃力増加",2,0,MasterSkillImage.img5_58,""],
		["minimum_magic","最小魔力増加",2,0,MasterSkillImage.img2_57,""],
		["minimum_magic_curse","最小魔力/呪い増加",2,0,MasterSkillImage.img6_57,""],
		["command_attack","統率攻撃力増加",10,3,MasterSkillImage.img5_51,""],

		// 防御強化
		["defense_success_rate","防御成功率増加", 8,0,MasterSkillImage.img1_17,""],		
		["defense_switch","防御力変換",10,3,MasterSkillImage.img7_13,""],		
		
		// 武器強化
		["one_hand_sword","片手剣強化",2,0,MasterSkillImage.img1_45,""],
		["one_hand_sword_mastery","片手剣マスタリ",17,0,MasterSkillImage.img1_49,""],
		["two_hand_sword","両手剣強化",6,0,MasterSkillImage.img1_44,""],
		["two_hand_sword_mastery","両手剣マスタリ",8,0,MasterSkillImage.img1_48,""],
		["hammer","ハンマー強化",3,0,MasterSkillImage.img1_46,""],
		["hammer_mastery","ハンマーマスタリ",0,1,MasterSkillImage.img1_50,""],
		["spear","槍強化",3,0,MasterSkillImage.img1_47,""],
		["spear_mastery","槍マスタリ",0,1,MasterSkillImage.img1_51,""],
		["one_hand_staff","片手杖強化",2,0,MasterSkillImage.img2_44,""],
		["one_hand_staff_mastery","片手杖マスタリ",17,0,MasterSkillImage.img2_48,""],
		["two_hand_staff","両手杖強化",6,0,MasterSkillImage.img2_45,""],
		["two_hand_staff_mastery","両手杖マスタリ",8,0,MasterSkillImage.img2_49,""],
		["bow","弓強化",2,0,MasterSkillImage.img3_44,""],
		["bow_mastery","弓マスタリ",17,0,MasterSkillImage.img3_48,""],
		["crossbow","ボウガン強化",3,0,MasterSkillImage.img3_45,""],
		["crossbow_mastery","ボウガンマスタリ",8,0,MasterSkillImage.img3_49,""],
		["scepter","セプター強化",2,0,MasterSkillImage.img5_45,""],
		["scepter_mastery","セプターマスタリ",8,0,MasterSkillImage.img5_49,""],
		["scepter_pet","セプターペット強化",3,0,MasterSkillImage.img5_47,""],
		["rod","ロッド強化",2,0,MasterSkillImage.img6_44,""],
		["rod_mastery","ロッドマスタリ",8,0,MasterSkillImage.img6_48,""],
		["book","神具強化",3,0,MasterSkillImage.img6_45,""],
		["book_mastery","神具マスタリ",17,0,MasterSkillImage.img6_49,""],
		["glove","グローブ強化",2,0,MasterSkillImage.img7_8,""],
		["glove_mastery","グローブマスタリ",0,1,MasterSkillImage.img7_10,"ダブルダメージ確率増加"],
		
		// 防具強化
		["shield","盾強化",5,0,MasterSkillImage.img3_46,""],
		["shield_mastery","盾マスタリ",9,0,MasterSkillImage.img2_50,""],
		["darkhorse","ダークホース強化",9,0,MasterSkillImage.img5_26,""],
		
		// 攻撃スキル強化
		["cyclone","真空斬り強化",0,0,MasterSkillImage.img1_24,""],
		["slash","ファイナルスラッシュ強化",3,0,MasterSkillImage.img1_25,""],
		["falling_slash","烈斬強化",3,0,MasterSkillImage.img1_26,""],
		["lunge","牙突強化",3,0,MasterSkillImage.img1_27,""],
		["twisting_slash","トルネードクラッシュ強化",3,0,MasterSkillImage.img1_28,""],
		["twisting_slash_mastery","トルネードクラッシュマスタリ",0,1,MasterSkillImage.img1_32,""],
		["omega_impact","オメガインパクト強化",2,0,MasterSkillImage.img1_29,""],
		["omega_impact_mastery","オメガインパクトマスタリ",0,1,MasterSkillImage.img1_33,""],
		["god_blow","ゴッドブロー強化",2,0,MasterSkillImage.img1_36,""],
		["absolute_zero","アブソリュートゼロ強化",2,0,MasterSkillImage.img1_37,""],
		["stinger","スティンガー強化",2,0,MasterSkillImage.img3_28,""],
		["triple_shot","乱れ撃ち強化",2,0,MasterSkillImage.img3_26,""],
		["triple_shot_mastery","乱れ撃ちマスタリ",-1,0,MasterSkillImage.img3_30,""],
		["ice_arrow","アイスアロー強化",2,0,MasterSkillImage.img3_38,""],
		["summon_monster1","召喚モンスター強化1",18,1,MasterSkillImage.img3_27,""],
		["summon_monster2","召喚モンスター強化2",18,1,MasterSkillImage.img3_31,""],
		["infinity_arrow","インフィニティーアロー強化",0,1,MasterSkillImage.img3_56,""],
		["blood_attack","ブラッドアタック強化",2,0,MasterSkillImage.img4_37,""],
		["power_slash","パワースラッシュ強化",3,0,MasterSkillImage.img4_27,""],
		["force_wave","フォースウェーブ強化",3,0,MasterSkillImage.img5_25,""],
		["fire_burst","ファイアバースト強化",2,0,MasterSkillImage.img5_24,""],
		["fire_burst_mastery","ファイアバーストマスタリ",0,0,MasterSkillImage.img5_32,""],
		["earth_quake","アースクエイク強化",2,0,MasterSkillImage.img5_30,""],
		["earth_quake_mastery","アースクエイクマスタリ",0,1,MasterSkillImage.img5_34,""],
		["fire_scream","ファイアスクリーム強化",2,0,MasterSkillImage.img5_38,""],
		["darkspirit1","ダークスピリット強化1",3,0,MasterSkillImage.img5_44,""],
		["darkspirit2","ダークスピリット強化2",1,1,MasterSkillImage.img5_48,""],
		["darkspirit3","ダークスピリット強化3",0,1,MasterSkillImage.img5_56,""],
		["killing_blow","クリングブロー強化",2,0,MasterSkillImage.img7_1,""],
		["killing_blow_mastery","クリングブローマスタリ",0,1,MasterSkillImage.img7_3,""],
		["beast_upper","ビーストアッパー強化",2,0,MasterSkillImage.img7_2,""],
		["beast_upper_mastery","ビーストアッパーマスタリ",0,1,MasterSkillImage.img7_4,""],
		["chain_drive","チェーンドライブ強化",2,0,MasterSkillImage.img7_5,""],
		["dark_side","ダークサイド強化",2,0,MasterSkillImage.img7_6,""],
		["dragon_roar","ドラゴンロアー強化",2,0,MasterSkillImage.img7_7,""],
		
		// 魔法スキル強化
		["burning_hammer","バーニングハンマー強化",3,0,MasterSkillImage.img2_24,""],
		["inferno","インフェルノ強化",2,0,MasterSkillImage.img2_28,""],
		["thunder_wire","サンダーワイヤー強化",3,0,MasterSkillImage.img2_25,""],
		["shining_blast","シャイニングブラスト強化",2,0,MasterSkillImage.img2_29,""],
		["soul_the_end","ソウルジエンド強化",2,0,MasterSkillImage.img2_33,""],
		["hell_fire","ヘルファイア強化",3,0,MasterSkillImage.img2_37,""],
		["death_plant","デスプラント強化",3,0,MasterSkillImage.img2_31,""],
		["death_poison","デスポイズン強化",2,0,MasterSkillImage.img2_35,""],
		["blizzard_bind","ブリザードバインド強化",3,0,MasterSkillImage.img2_39,""],
		["fire_book","炎属性の書強化",3,0,MasterSkillImage.img6_24,""],
		["fire_book_mastery","炎属性の書マスタリ",1,1,MasterSkillImage.img6_28,""],
		["wind_book","風属性の書強化",3,0,MasterSkillImage.img6_25,""],
		["wind_book_mastery","風属性の書マスタリ",0,1,MasterSkillImage.img6_29,""],
		["lightning_book","稲妻属性の書強化",3,0,MasterSkillImage.img6_26,""],
		["lightning_book_mastery","稲妻属性の書マスタリ",1,1,MasterSkillImage.img6_30,""],
		["chain_lightning","チェーンライトニング強化",2,0,MasterSkillImage.img6_32,""],
		["lightning_shock","ライトニングショック強化",2,0,MasterSkillImage.img6_33,""],
		["life_drain","ライフドレイン強化",2,0,MasterSkillImage.img6_38,""],
		["sleep","スリープ強化",0,1,MasterSkillImage.img6_31,""],
		
		// サポートスキル強化
		["swell_life","スウェルライフ強化",1,1,MasterSkillImage.img1_52,""],
		["swell_life_mastery","スウェルライフマスタリ",1,1,MasterSkillImage.img1_56,""],
		["spell_enhance","スペルエンハンス強化",0,1,MasterSkillImage.img2_26,""],
		["spell_enhance_mastery","スペルエンハンスマスタリ",0,1,MasterSkillImage.img2_30,""],
		["soul_barrier","ソウルバリア強化",1,1,MasterSkillImage.img2_52,""],
		["soul_barrier_mastery","ソウルバリアマスタリ",5,0,MasterSkillImage.img2_56,""],
		["healing","ヒーリング強化",2,1,MasterSkillImage.img3_24,""],
		["attack_plus","アタックプラス強化",2,1,MasterSkillImage.img3_32,""],
		["attack_plus_mastery","アタックプラスマスタリ",2,1,MasterSkillImage.img3_36,""],
		["guard_plus","ガードプラス強化",2,1,MasterSkillImage.img3_29,""],
		["guard_plus_mastery","ガードプラスマスタリ",2,1,MasterSkillImage.img3_37,""],
		["critical_plus1","クリティカルプラス強化1",3,0,MasterSkillImage.img5_29,""],
		["critical_plus2","クリティカルプラス強化2",5,0,MasterSkillImage.img5_33,""],
		["critical_plus3","クリティカルプラス強化3",1,1,MasterSkillImage.img5_37,""],
		["berserker_mind","バーサーカーマインド強化",1,1,MasterSkillImage.img6_52,""],
		["berserker_mind_mastery","バーサーカーマインドマスタリ",1,1,MasterSkillImage.img6_56,""],
		["concentration","コンセントレーション強化",2,0,MasterSkillImage.img7_9,"防御成功率向上\n10+(ene/50)+X\n※Xはマスタースキルの値"],
		["concentration_mastery","コンセントレーションマスタリ",2,0,MasterSkillImage.img7_11,"防御力増加"],
		["high_tension","ハイテンション強化",8,0,MasterSkillImage.img7_12,""],
		
		// その他
		["pet_endurance","ペット耐久力減少",9,1,MasterSkillImage.img5_57,""],
		];
	}
}