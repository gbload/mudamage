package Data.Database.MLV
{
	import mx.controls.*;
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
		
		public static var skills:Object = null;
		/**
		 * skillsの初期化
		 */
		private static function initSkills():void{
			skills = new Object();
			for(var i:int=0;i<MasterSkill.skill.length;i++)
				skills[MasterSkill.skill[i][MasterSkill.ID]] = MasterSkill.skill[i];
		};
		/**
		 * マスタースキルを返す
		 */
		public static function getSkill(name:String):Array{
			if(skills==null)initSkills();
			if(skills[name]==null)Alert.show("Error:"+name);
			return skills[name];
		};
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
		["monster_kill_sd","モンスターKill時SD回復",7,0,MasterSkillImage.img5_54,""],
		
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
		["one_hand_sword_mastery","片手剣マスタリ",17,0,MasterSkillImage.img1_49,"攻撃速度増加"],
		["two_hand_sword","両手剣強化",6,0,MasterSkillImage.img1_44,""],
		["two_hand_sword_mastery","両手剣マスタリ",8,0,MasterSkillImage.img1_48,"対人攻撃力増加"],
		["hammer","ハンマー強化",3,0,MasterSkillImage.img1_46,""],
		["hammer_mastery","ハンマーマスタリ",0,1,MasterSkillImage.img1_50,"x%の確率でスタン状態にする"],
		["spear","槍強化",3,0,MasterSkillImage.img1_47,""],
		["spear_mastery","槍マスタリ",0,1,MasterSkillImage.img1_51,"ダブルダメージ確率増加"],
		["one_hand_staff","片手杖強化",2,0,MasterSkillImage.img2_44,""],
		["one_hand_staff_mastery","片手杖マスタリ",17,0,MasterSkillImage.img2_48,"攻撃速度増加"],
		["two_hand_staff","両手杖強化",6,0,MasterSkillImage.img2_45,""],
		["two_hand_staff_mastery","両手杖マスタリ",8,0,MasterSkillImage.img2_49,"対人攻撃力増加"],
		["bow","弓強化",3,0,MasterSkillImage.img3_44,""],
		["bow_mastery","弓マスタリ",17,0,MasterSkillImage.img3_48,"攻撃速度増加"],
		["crossbow","ボウガン強化",3,0,MasterSkillImage.img3_45,""],
		["crossbow_mastery","ボウガンマスタリ",8,0,MasterSkillImage.img3_49,"対人攻撃力増加"],
		["scepter","セプター強化",2,0,MasterSkillImage.img5_45,""],
		["scepter_mastery","セプターマスタリ",8,0,MasterSkillImage.img5_49,"対人攻撃力増加"],
		["scepter_pet","セプターペット強化",3,0,MasterSkillImage.img5_47,""],
		["rod","ロッド強化",2,0,MasterSkillImage.img6_44,""],
		["rod_mastery","ロッドマスタリ",8,0,MasterSkillImage.img6_48,"対人攻撃力増加"],
		["book","神具強化",3,0,MasterSkillImage.img6_45,""],
		["book_mastery","神具マスタリ",17,0,MasterSkillImage.img6_49,"攻撃速度増加"],
		["glove","グローブ強化",2,0,MasterSkillImage.img7_8,""],
		["glove_mastery","グローブマスタリ",0,1,MasterSkillImage.img7_10,"ダブルダメージ確率増加"],
		
		// 防具強化
		["shield","盾強化",5,0,MasterSkillImage.img3_46,"盾装備時防御力増加"],
		["shield_mastery","盾マスタリ",9,0,MasterSkillImage.img2_50,"盾装備時防御成功率増加"],
		["darkhorse","ダークホース強化",9,0,MasterSkillImage.img5_26,"ダークホース装備時防御力増加"],
		
		// 攻撃スキル強化
		["cyclone","真空斬り強化",3,0,MasterSkillImage.img1_24,""],
		["slash","ファイナルスラッシュ強化",6,0,MasterSkillImage.img1_25,""],
		["falling_slash","烈斬強化",6,0,MasterSkillImage.img1_26,""],
		["lunge","牙突強化",6,0,MasterSkillImage.img1_27,""],
		["twisting_slash","トルネードクラッシュ強化",6,0,MasterSkillImage.img1_28,""],
		["twisting_slash_mastery","トルネードクラッシュマスタリ",0,1,MasterSkillImage.img1_32,"x%の確率で2マス外へ押し出す"],
		["omega_impact","オメガインパクト強化",2,0,MasterSkillImage.img1_29,""],
		["omega_impact_mastery","オメガインパクトマスタリ",0,1,MasterSkillImage.img1_33,"x%の確率で一つの防具の耐久を10%減少させる"],
		["god_blow","ゴッドブロー強化",2,0,MasterSkillImage.img1_36,""],
		["absolute_zero","アブソリュートゼロ強化",2,0,MasterSkillImage.img1_37,""],
		["stinger","スティンガー強化",3,0,MasterSkillImage.img3_28,""],
		["triple_shot","乱れ撃ち強化",3,0,MasterSkillImage.img3_26,""],
		["triple_shot_mastery","乱れ撃ちマスタリ",-1,0,MasterSkillImage.img3_30,"10ポイント消費して、放つ矢を1本追加する(MAX10ポイント)"],
		["ice_arrow","アイスアロー強化",2,0,MasterSkillImage.img3_38,""],
		["summon_monster1","召喚モンスター強化1",18,1,MasterSkillImage.img3_27,""],
		["summon_monster2","召喚モンスター強化2",18,1,MasterSkillImage.img3_31,""],
		["infinity_arrow","インフィニティーアロー強化",0,1,MasterSkillImage.img3_56,""],
		["blood_attack","ブラッドアタック強化",2,0,MasterSkillImage.img4_37,""],
		["power_slash","パワースラッシュ強化",3,0,MasterSkillImage.img4_27,""],
		["force_wave","フォースウェーブ強化",6,0,MasterSkillImage.img5_25,""],
		["fire_burst","ファイアバースト強化",3,0,MasterSkillImage.img5_24,""],
		["fire_burst_mastery","ファイアバーストマスタリ",0,0,MasterSkillImage.img5_32,"x%の確率で2秒間スタン状態にする"],
		["earth_quake","アースクエイク強化",2,0,MasterSkillImage.img5_30,""],
		["earth_quake_mastery","アースクエイクマスタリ",0,1,MasterSkillImage.img5_34,"x%の確率で2秒間スタン状態にする"],
		["fire_scream","ファイアスクリーム強化",2,0,MasterSkillImage.img5_38,""],
		["darkspirit1","ダークスピリット強化1",3,0,MasterSkillImage.img5_44,"ダークスピリットの攻撃力増加"],
		["darkspirit2","ダークスピリット強化2",1,1,MasterSkillImage.img5_48,"ダークスピリットのクリティカルダメージ確率増加"],
		["darkspirit3","ダークスピリット強化3",0,1,MasterSkillImage.img5_56,"ダークスピリットのエクセレントダメージ確率増加"],
		["cling_blow","クリングブロー強化",2,0,MasterSkillImage.img7_1,""],
		["cling_blow_mastery","クリングブローマスタリ",0,1,MasterSkillImage.img7_3,"攻撃力減少効果がx%増加"],
		["beast_upper","ビーストアッパー強化",2,0,MasterSkillImage.img7_2,""],
		["beast_upper_mastery","ビーストアッパーマスタリ",0,1,MasterSkillImage.img7_4,"防御力減少効果がx%増加"],
		["chain_drive","チェーンドライブ強化",2,0,MasterSkillImage.img7_5,""],
		["dark_side","ダークサイド強化",2,0,MasterSkillImage.img7_6,""],
		["dragon_roar","ドラゴンロアー強化",2,0,MasterSkillImage.img7_7,""],
		
		// 魔法スキル強化
		["burning_hammer","バーニングハンマー強化",3,0,MasterSkillImage.img2_24,""],
		["inferno","インフェルノ強化",2,0,MasterSkillImage.img2_28,""],
		["thunder_wire","サンダーワイヤー強化",3,0,MasterSkillImage.img2_25,""],
		["shining_blast","シャイニングブラスト強化",2,0,MasterSkillImage.img2_29,""],
		["soul_the_end","ソウルジエンド強化",3,0,MasterSkillImage.img2_33,""],
		["hell_fire","ヘルファイア強化",3,0,MasterSkillImage.img2_37,""],
		["death_plant","デスプラント強化",3,0,MasterSkillImage.img2_31,""],
		["death_poison","デスポイズン強化",2,0,MasterSkillImage.img2_35,""],
		["blizzard_bind","ブリザードバインド強化",3,0,MasterSkillImage.img2_39,""],
		["fire_book","炎属性の書強化",3,0,MasterSkillImage.img6_24,""],
		["fire_book_mastery","炎属性の書マスタリ",1,1,MasterSkillImage.img6_28,"書の持続ダメージx%増加"],
		["wind_book","風属性の書強化",3,0,MasterSkillImage.img6_25,""],
		["wind_book_mastery","風属性の書マスタリ",0,1,MasterSkillImage.img6_29,"x%の確率で2秒間スタン状態にする"],
		["lightning_book","稲妻属性の書強化",3,0,MasterSkillImage.img6_26,""],
		["lightning_book_mastery","稲妻属性の書マスタリ",1,1,MasterSkillImage.img6_30,"x%の確率で2マス外へ押し出す"],
		["chain_lightning","チェーンライトニング強化",2,0,MasterSkillImage.img6_32,""],
		["lightning_shock","ライトニングショック強化",2,0,MasterSkillImage.img6_33,""],
		["life_drain","ライフドレイン強化",2,0,MasterSkillImage.img6_38,""],
		["sleep","スリープ強化",0,1,MasterSkillImage.img6_31,"スリープの成功確率上昇"],
		
		// サポートスキル強化
		["swell_life","スウェルライフ強化",1,1,MasterSkillImage.img1_52,"最大HP増加x%"],
		["swell_life_mastery","スウェルライフマスタリ",1,1,MasterSkillImage.img1_56,"追加で最大マナ増加x%"],
		["spell_enhance","スペルエンハンス強化",0,1,MasterSkillImage.img2_26,"追加で最大魔力増加x%"],
		["spell_enhance_mastery","スペルエンハンスマスタリ",0,1,MasterSkillImage.img2_30,"追加でクリティカルダメージ確率増加x%"],
		["soul_barrier","ソウルバリア強化",1,1,MasterSkillImage.img2_52,"ダメージ減少x%"],
		["soul_barrier_mastery","ソウルバリアマスタリ",5,0,MasterSkillImage.img2_56,"効果持続時間増加"],
		["healing","ヒーリング強化",2,1,MasterSkillImage.img3_24,"回復量増加x%"],
		["attack_plus","アタックプラス強化",2,1,MasterSkillImage.img3_32,"攻撃力増加x%"],
		["attack_plus_mastery","アタックプラスマスタリ",2,1,MasterSkillImage.img3_36,"攻撃力増加x%、1ポイント振る毎に4秒持続時間増加"],
		["guard_plus","ガードプラス強化",2,1,MasterSkillImage.img3_29,"防御力増加x%"],
		["guard_plus_mastery","ガードプラスマスタリ",2,1,MasterSkillImage.img3_37,"防御力増加x%、1ポイント振る毎に4秒持続時間増加"],
		["critical_plus1","クリティカルプラス強化1",3,0,MasterSkillImage.img5_29,"クリティカルダメージ増加効果上昇"],
		["critical_plus2","クリティカルプラス強化2",5,0,MasterSkillImage.img5_33,"効果持続時間増加"],
		["critical_plus3","クリティカルプラス強化3",1,1,MasterSkillImage.img5_37,"追加でクリティカルダメージ確率増加x%"],
		["berserker_mind","バーサーカーマインド強化",1,1,MasterSkillImage.img6_52,"バーサーカーマインドの効果上昇、デメリットも上昇"],
		["berserker_mind_mastery","バーサーカーマインドマスタリ",1,1,MasterSkillImage.img6_56,"攻撃力、魔力、最大マナ増加"],
		["concentration","コンセントレーション強化",2,0,MasterSkillImage.img7_9,"防御成功率向上\n10+(ene/50)+X\n※Xはマスタースキルの値"],
		["concentration_mastery","コンセントレーションマスタリ",2,0,MasterSkillImage.img7_11,"追加で防御力増加"],
		["high_tension","ハイテンション強化",8,0,MasterSkillImage.img7_12,"体力向上効果増加"],
		
		// その他
		["pet_endurance","ペット耐久力減少",9,1,MasterSkillImage.img5_57,""],
		
		// rank6 ~
		// 共通
		["set_defense","セット防御力増加",3,0,MasterSkillImage.blade_pro_icon_15,"防具統一時に防御力増加"],
		["reflection","ダメージ反射",0,1,MasterSkillImage.blade_pro_icon_16,"ダメージを受けた時、x%の確率で対象から受けたダメージを一度反射"],
		
		["energy","エナジー増加",9,0,MasterSkillImage.blade_pro_icon_17,""],
		["vitality","体力増加",9,0,MasterSkillImage.blade_pro_icon_18,""],
		["agility","敏捷増加",9,0,MasterSkillImage.blade_pro_icon_19,""],
		["strength","力増加",9,0,MasterSkillImage.blade_pro_icon_20,""],
		["rec","統率増加",9,0,MasterSkillImage.blade_pro_icon_20,"アイコンなしのため力増加と同じものを使用。"],
		
		["wing_defense","羽の防御力増加",9,0,MasterSkillImage.blade_pro_icon_21,""],
		
		["wing_attack","羽の攻撃力増加",9,0,MasterSkillImage.blade_pro_icon_22,""],
		// knight
		["god_blow_mastery","ゴッドブローマスタリ",1,0,MasterSkillImage.blade_bra_icon_15,"10秒間持続ダメージ"],
		["absolute_zero_mastery","アブソリュートゼロマスタリ",1,1,MasterSkillImage.blade_bra_icon_16,"x%の確率で3秒間移動不可にする"],
		["maximum_ag","最大AG増加",19,0,MasterSkillImage.blade_bra_icon_17,""],
		
		["god_blow_mastery2","ゴッドブローマスタリ2",1,1,MasterSkillImage.blade_bra_icon_18,"x%の確率で2秒間スタン状態にする"],
		["absolute_zero_mastery2","アブソリュートゼロマスタリ2",0,1,MasterSkillImage.blade_bra_icon_19,"攻撃速度減少効果確率"],
		
		["combo","コンボ強化",1,1,MasterSkillImage.blade_bra_icon_20,""],
		["blood_storm_learning","ブラッドストーム",-1,0,MasterSkillImage.blade_bra_icon_21,"ブラッドストームを習得。自身の周囲に2HITダメージ。(コンボスキル使用時は3番目で使用可能)"],
		
		["blood_storm","ブラッドストーム強化",2,0,MasterSkillImage.blade_bra_icon_22,""],
		// knight2
		["swell_life_mastery2","スウェルライフマスタリ2",1,1,MasterSkillImage.blade_ang_icon_17,"最大AG増加"],
		["maximum_attack","最大攻撃力増加",3,0,MasterSkillImage.blade_ang_icon_18,""],
		["critical_probability","クリティカル確率増加",1,1,MasterSkillImage.blade_ang_icon_19,""],
		
		["mana_completion","マナ完全回復",0,1,MasterSkillImage.blade_ang_icon_20,""],
		["life_completion","生命力完全回復",0,1,MasterSkillImage.blade_ang_icon_21,""],
		["exdamage_probability","エクセレントダメージ確率増加",0,1,MasterSkillImage.blade_ang_icon_22,""],
		
		["double_damage","ダブルダメージ確率増加",0,1,MasterSkillImage.blade_ang_icon_23,""],
		["sd_completion","SD完全回復",0,1,MasterSkillImage.blade_ang_icon_24,""],
		
		["ignore_defense","防御力無視確率増加",0,1,MasterSkillImage.blade_ang_icon_25,""],
		// wizard
		["meteor_strike","メテオストライク強化",2,0,MasterSkillImage.grand_wis_icon_16,""],
		["sudden_ice","サドゥンアイス強化",2,0,MasterSkillImage.grand_wis_icon_18,""],
		
		["hell_burst","ヘルバースト強化",14,0,MasterSkillImage.grand_wis_icon_19,""],
		["sudden_ice_mastery","サドゥンアイスマスタリ",0,1,MasterSkillImage.grand_wis_icon_20,"x%の確率で3秒間移動不可にする"],
		
		["meteor_strike_mastery","メテオストライクマスタリ",0,1,MasterSkillImage.grand_wis_icon_21,"x%の確率で2秒間スタン状態にする"],
		["earth_prison_learning","アースプリズン",-1,0,MasterSkillImage.grand_wis_icon_22,"アースプリズンを習得。自身の周囲に2HITダメージ。一定確率で対象を移動不可にする。"],
		
		["earth_prison","アースプリズン強化",2,0,MasterSkillImage.grand_wis_icon_23,""],
		// wizard2
		["soul_barrier_mastery2","ソウルバリアマスタリ2",1,1,MasterSkillImage.grand_gra_icon_15,"最大マナ増加効果"],
		["maximum_magic","最大魔力増加",2,0,MasterSkillImage.grand_gra_icon_16,""],
		//elf
		["cure_learning","キュア",-1,0,MasterSkillImage.elf_wis_icon_16,"キュアを習得。先に掛かっている状態異常を一つ回復。クールタイム20秒。"],
		["multi_shot","マルチショット強化",2,0,MasterSkillImage.elf_wis_icon_17,""],
		
		["party_healing_learning","パーティーヒーリング",-1,0,MasterSkillImage.elf_wis_icon_19,"パーティーヒーリングを習得。パーティーメンバー全員のHPを回復。クールタイム10秒。"],
		["multi_shot_mastery","マルチショットマスタリ",0,1,MasterSkillImage.elf_wis_icon_20,"x%の確率で2秒間スタン状態にする"],
		["summon_monster3","召喚モンスター強化3",18,0,MasterSkillImage.elf_wis_icon_21,"召喚モンスターの攻撃力増加"],
		
		["party_healing","パーティーヒーリング強化",2,1,MasterSkillImage.elf_wis_icon_22,""],
		["bless_learning","ブレス",-1,0,MasterSkillImage.elf_wis_icon_23,"ブレスを習得。対象の全てのステータス値を一定時間増加させる。"],
		["poison_arrow_learning","ポイズンアロー",-1,0,MasterSkillImage.elf_wis_icon_24,"ポイズンアロー習得。一定時間持続的なダメージを与える。"],
		["satyr_learning","サテュロス召喚",-1,0,MasterSkillImage.elf_wis_icon_25,"サテュロス召喚を習得。サテュロスを召喚します。"],
		
		["bless","ブレス強化",5,0,MasterSkillImage.elf_wis_icon_26,""],
		["poison_arrow","ポイズンアロー強化",2,0,MasterSkillImage.elf_wis_icon_27,""],
		// summoner
		["innovation","イノベーション強化",3,0,MasterSkillImage.dim_cha_icon_15,""],
		
		["weakness","ウィークネス強化",3,0,MasterSkillImage.dim_cha_icon_17,""],
		["life_drain_mastery","ライフドレインマスタリ",9,0,MasterSkillImage.dim_cha_icon_18,"一定確率で、一定時間の間、敵の生命を吸収し続ける。"],
		
		["blind_learning","ブラインド",-1,0,MasterSkillImage.dim_cha_icon_19,"ブラインドを習得。一定確率で敵の攻撃成功率を減少させる。"],
		
		["blind","ブラインド強化",1,1,MasterSkillImage.dim_cha_icon_20,"x%の確率で2秒間スタン状態にする"],
		// summoner2
		["berserker_mind_mastery2","バーサーカーマスタリ",5,0,MasterSkillImage.dim_hon_icon_13,"バーサーカー使用時に追加で攻撃/魔力/呪いが上昇する。"],
		["maximum_magic_curse","最大魔力/呪い増加",3,0,MasterSkillImage.dim_hon_icon_14,""],
		// duel
		["flame_strike","フレイムストライク強化",2,0,MasterSkillImage.dual_sol_icon_16,""],
		["blizzard_bind_mastery","ブリザードバインドマスタリ",0,1,MasterSkillImage.dual_sol_icon_17,"x%の確率で3秒間移動不可にする"],
		
		["flame_strike_mastery","フレイムストライクマスタリ",0,1,MasterSkillImage.dual_sol_icon_19,"x%の確率で2マス外へ押し出す"],
		["blood_attack_mastery","ブラッドアタックマスタリ",0,0,MasterSkillImage.dual_sol_icon_20,"防御力減少効果がx%増加"],
		["gigantic_storm","ギガンティックストーム強化",2,0,MasterSkillImage.dual_sol_icon_21,""],
		// darkload
		["electric_spark","エレクトリックスパーク強化",3,0,MasterSkillImage.rod_def_icon_15,""],
		["fire_scream_mastery","ファイアスクリームマスタリ",8,0,MasterSkillImage.rod_def_icon_16,"爆発ダメージが上昇。"],
		
		["critical_plus_mastery","クリティカルプラスマスタリ",0,1,MasterSkillImage.rod_def_icon_18,"エクセレントダメージ確率増加"],
		["chaotic_desire","カオティックディセイアー強化",2,0,MasterSkillImage.rod_def_icon_19,""],
		
		["iron_defense_learning","アイアンディフェンス",-1,0,MasterSkillImage.rod_def_icon_20,"アイアンディフェンスを習得。短時間キャラクターの防御力と生命力を大幅に増加させる。"],
		
		["iron_defense","アイアンディフェンス強化",3,0,MasterSkillImage.rod_def_icon_21,""],
		// darkload2
		["darkspirit4","ダークスピリット強化4",1,0,MasterSkillImage.rod_con_icon_17,"ダークスピリットの攻撃速度増加"],
		
		["darkspirit5","ダークスピリット強化5",0,1,MasterSkillImage.rod_con_icon_20,"ダークスピリットのダブルダメージ確率増加"],
		
		["spirit_load","スピリットロード",0,1,MasterSkillImage.rod_con_icon_24,"ダークスピリットの防御力無視確率確率"],
		// rage specific skills
		["pvp_avoidance_rage","対人防御成功率増加",20,0,MasterSkillImage.img1_3,"レイジのみ数値が低めに設定されている。他職の約41%。"],
		["pvp_hit_rage","対人攻撃成功率増加",23,0,MasterSkillImage.img1_40,"レイジのみ数値が低めに設定されている。他職の約40%。"],
		["maximum_sd_rage","最大SD増加",21,0,MasterSkillImage.img1_5,"レイジのみ数値が低めに設定されている。他職の約60%。"],
		["defense_rage","防御力増加",22,0,MasterSkillImage.img1_13,"レイジのみ数値が低めに設定されている。他職の約56%。"],
		["hit_rage","攻撃成功率増加",24,0,MasterSkillImage.img1_20,"レイジのみ数値が低めに設定されている。他職の約40%。"],
		["maximum_life_rage","最大生命増加",25,0,MasterSkillImage.img1_34,"レイジのみ数値が低めに設定されている。他職の約53%。"],
		["maximum_mana_rage","最大マナ増加",25,0,MasterSkillImage.img6_39,"レイジのみ数値が低めに設定されている。他職の約53%。"],
		
		];
	}
}