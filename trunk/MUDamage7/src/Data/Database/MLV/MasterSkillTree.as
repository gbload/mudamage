package Data.Database.MLV
{
	/**
	 * マスタースキルツリー依存関係
	 * @author sinlion
	 *
	 */
	public class MasterSkillTree
	{
		/**
		 * ツリータイトル
		 */
		public static var title:Array = [
			["保護","勇名","憤怒"],// knight
			["平穏","知恵","超越"],// wizard   
			["加護","救援","疾風"],// elf   
			["堅固","闘志","究極"],// magic   
			["断固","正義","征服"],// darkload   
			["守護","混沌","名誉"],// summoner    
			["根性","意志","破壊"]// rage fighter   
		                                ];
		/**
		 * 左のツリー　4x5
		 */
		public static var left:Array = [
		    ["endurance1","","","pvp_avoidance"],
		    ["","maximum_sd","mana_recovery","poison_resistance"],
		    ["endurance2","sd_recovery","life_recovery","lightning_resistance"],
		    ["","defense","ag_recovery","ice_resistance"],
		    ["endurance3","avoidance","",""],
		    ["","","set_defense","reflection"],
		    ["energy","vitality","agility","strength"],
		    ["","wing_defense","",""],
		    ["","wing_attack","",""],
		                                ];
		/**
		 * 真ん中のツリー
		 */
		public static var middle:Array = [
		[// knight
		    ["hit","","",""],
		    ["cyclone","slash","falling_slash","lunge"],
		    ["twisting_slash","omega_impact","",""],
		    ["twisting_slash_mastery","omega_impact_mastery","maximum_life","weapon_master"],
		    ["god_blow","absolute_zero","maximum_mana",""],
		    ["god_blow_mastery","absolute_zero_mastery","maximum_ag",""],
		    ["god_blow_mastery2","absolute_zero_mastery2","",""],
		    ["combo","blood_storm_learning","",""],
		    ["","blood_storm","",""],
		],
		[// wizard
		    ["hit","","",""],
		    ["burning_hammer","thunder_wire","spell_enhance",""],
		    ["inferno","shining_blast","spell_enhance_mastery","death_plant"],
		    ["maximum_life","soul_the_end","magic_master","death_poison"],
		    ["maximum_mana","hell_fire","","blizzard_bind"],
		    ["meteor_strike","","maximum_ag","sudden_ice"],
		    ["","hell_burst","","sudden_ice_mastery"],
		    ["meteor_strike_mastery","earth_prison_learning","",""],
		    ["","earth_prison","",""],
		],
		[// elf
		    ["hit","","",""],
		    ["healing","","triple_shot","summon_monster1"],
		    ["stinger","guard_plus","triple_shot_mastery","summon_monster2"],
		    ["attack_plus","","weapon_master","maximum_life"],
		    ["attack_plus_mastery","guard_plus_mastery","ice_arrow","maximum_mana"],
		    ["","cure_learning","multi_shot","maximum_ag"],
		    ["party_healing_learning","","multi_shot_mastery","summon_monster3"],
		    ["party_healing","bless_learning","poison_arrow_learning","satyr_learning"],
		    ["","bless","poison_arrow",""],
		],
		[// magic
		    ["hit","","",""],
		    ["cyclone","thunder_wire","twisting_slash","power_slash"],
		    ["burning_hammer","shining_blast","","weapon_master"],
		    ["inferno","soul_the_end","magic_master","maximum_life"],
		    ["blizzard_bind","blood_attack","","maximum_mana"],
		    ["flame_strike","","blizzard_bind_mastery","maximum_ag"],
		    ["flame_strike_mastery","blood_attack_mastery","gigantic_storm",""],
		    ["","blood_storm_learning","earth_prison_learning",""],
		    ["","blood_storm","earth_prison",""],
		],
		[// darkload
		    ["hit","","",""],
		    ["fire_burst","force_wave","darkhorse",""],
		    ["","critical_plus1","earth_quake","weapon_master"],
		    ["fire_burst_mastery","critical_plus2","earth_quake_mastery","maximum_life"],
		    ["","critical_plus3","fire_scream","maximum_mana"],
		    ["electric_spark","","fire_scream2","maximum_ag"],
		    ["","critical_plus_mastery","chaotic_desire",""],
		    ["","iron_defense_learning","",""],
		    ["","iron_defense","",""],
		],
		[// summoner
		    ["hit","","",""],
		    ["fire_book","wind_book","lightning_book",""],
		    ["fire_book_mastery","wind_book_mastery","lightning_book_mastery","sleep"],
		    ["chain_lightning","lightning_shock","","maximum_life"],
		    ["magic_master","","life_drain","maximum_mana"],
		    ["","innovation","","maximum_ag"],
		    ["weakness","","life_drain_mastery",""],
		    ["","blind_learning","",""],
		    ["","blind","",""],
		],
		[// rage fighter
		    ["hit","","",""],
		    ["cling_blow","beast_upper","",""],
		    ["cling_blow_mastery","beast_upper_mastery","",""],
		    ["weapon_master","","maximum_life",""],
		    ["chain_drive","dark_side","maximum_mana","dragon_roar"],
		    ["","","maximum_ag",""],
		    ["","","",""],
		    ["","","",""],
		    ["","","",""],
		]
		                                 ];
		/**
		 * 右のツリー
		 */
		public static var right:Array = [
 		[// knight
 		 	["pvp_hit","","",""],
 		 	["two_hand_sword","one_hand_sword","hammer","spear"],
 		 	["two_hand_sword_mastery","one_hand_sword_mastery","hammer_mastery","spear_mastery"],
 		 	["swell_life","mana_consumption","monster_kill_sd","monster_kill_life"],
 		 	["swell_life_mastery","minimum_attack","","monster_kill_mana"],
		    ["swell_life_mastery2","maximum_attack","","critical_probability"],
		    ["","mana_completion","life_completion","exdamage_probability"],
		    ["","double_damage","sd_completion",""],
		    ["","ignore_defense","",""],
 		],
  		[// wizard
  		    ["pvp_hit","","",""],
  		    ["one_hand_staff","two_hand_staff","shield",""],
  		    ["one_hand_staff_mastery","two_hand_staff_mastery","shield_mastery",""],
  		    ["soul_barrier","mana_consumption","monster_kill_sd","monster_kill_life"],
  		    ["soul_barrier_mastery","minimum_magic","","monster_kill_mana"],
		    ["soul_barrier_mastery2","maximum_magic","","critical_probability"],
		    ["","mana_completion","life_completion","exdamage_probability"],
		    ["","double_damage","sd_completion",""],
		    ["","ignore_defense","",""],
  		],
  		[// elf
  		    ["pvp_hit","","",""],
  		    ["bow","crossbow","shield",""],
  		    ["bow_mastery","crossbow_mastery","shield_mastery",""],
  		    ["","mana_consumption","monster_kill_sd","monster_kill_life"],
  		    ["infinity_arrow","minimum_attack","","monster_kill_mana"],
		    ["","maximum_attack","","critical_probability"],
		    ["","mana_completion","life_completion","exdamage_probability"],
		    ["","double_damage","sd_completion",""],
		    ["","ignore_defense","",""],
  		],
  		[// magic
  		    ["pvp_hit","","",""],
  		    ["two_hand_sword","one_hand_sword","one_hand_staff","two_hand_staff"],
  		    ["two_hand_sword_mastery","one_hand_sword_mastery","one_hand_staff_mastery","two_hand_staff_mastery"],
  		    ["","mana_consumption","monster_kill_sd","monster_kill_life"],
  		    ["minimum_magic","minimum_attack","","monster_kill_mana"],
		    ["maximum_magic","maximum_attack","","critical_probability"],
		    ["","mana_completion","life_completion","exdamage_probability"],
		    ["","double_damage","sd_completion",""],
		    ["","ignore_defense","",""],
  		],
  		[// darkload
  		    ["pvp_hit","","",""],
  		    ["darkspirit1","scepter","shield","scepter_pet"],
  		    ["darkspirit2","scepter_mastery","shield_mastery","command_attack"],
  		    ["","mana_consumption","monster_kill_sd","monster_kill_life"],
  		    ["darkspirit3","pet_endurance","minimum_attack","monster_kill_mana"],
		    ["darkspirit4","critical_probability","maximum_attack",""],
		    ["darkspirit5","exdamage_probability","mana_completion","life_completion"],
		    ["spirit_load","","double_damage","sd_completion"],
		    ["","","ignore_defense",""],
  		],
  		[// summoner
  		    ["pvp_hit","","",""],
  		    ["rod","book","",""],
  		    ["rod_mastery","book_mastery","",""],
  		    ["berserker_mind","mana_consumption","monster_kill_sd","monster_kill_life"],
  		    ["berserker_mind_mastery","minimum_magic_curse","","monster_kill_mana"],
		    ["berserker_mind_mastery2","maximum_magic_curse","","critical_probability"],
		    ["","mana_completion","life_completion","exdamage_probability"],
		    ["","double_damage","sd_completion",""],
		    ["","ignore_defense","",""],
  		],
  		[// rage fighter
		    ["pvp_hit","","",""],
		    ["glove","concentration","",""],
		    ["glove_mastery","concentration_mastery","high_tension",""],
		    ["","mana_consumption","monster_kill_sd","monster_kill_life"],
		    ["","minimum_attack","","monster_kill_mana"],
		    ["","","",""],
		    ["","","",""],
		    ["","","",""],
		    ["","","",""],
		]
  		                                 ];
	}
}