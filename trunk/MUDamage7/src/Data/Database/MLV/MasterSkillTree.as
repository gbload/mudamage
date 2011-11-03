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
		],
		[// wizard
		    ["hit","","",""],
		    ["burning_hammer","thunder_wire","spell_enhance",""],
		    ["inferno","shining_blast","spell_enhance_mastery","death_plant"],
		    ["maximum_life","soul_the_end","magic_master","death_poison"],
		    ["maximum_mana","hell_fire","","blizzard_bind"],
		],
		[// elf
		    ["hit","","",""],
		    ["healing","","triple_shot","summon_monster1"],
		    ["stinger","guard_plus","triple_shot_mastery","summon_monster2"],
		    ["attack_plus","","weapon_master","maximum_life"],
		    ["attack_plus_mastery","guard_plus_mastery","ice_arrow","maximum_mana"],
		],
		[// magic
		    ["hit","","",""],
		    ["cyclone","thunder_wire","twisting_slash","power_slash"],
		    ["burning_hammer","shining_blast","","weapon_master"],
		    ["inferno","soul_the_end","magic_master","maximum_life"],
		    ["blizzard_bind","blood_attack","","maximum_mana"],
		],
		[// darkload
		    ["hit","","",""],
		    ["fire_burst","force_wave","darkhorse",""],
		    ["","critical_plus1","earth_quake","weapon_master"],
		    ["fire_burst_mastery","critical_plus2","earth_quake_mastery","maximum_life"],
		    ["","critical_plus3","fire_scream","maximum_mana"],
		],
		[// summoner
		    ["hit","","",""],
		    ["fire_book","wind_book","lightning_book",""],
		    ["fire_book_mastery","wind_book_mastery","lightning_book_mastery","sleep"],
		    ["chain_lightning","lightning_shock","","maximum_life"],
		    ["magic_master","","life_drain","maximum_mana"],
		],
		[// rage fighter
		    ["hit","","",""],
		    ["killing_blow","beast_upper","",""],
		    ["killing_blow_mastery","beast_upper_mastery","",""],
		    ["weapon_master","","maximum_life",""],
		    ["chain_drive","dark_side","maximum_mana","dragon_roar"],
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
 		],
  		[// wizard
  		    ["pvp_hit","","",""],
  		    ["one_hand_staff","two_hand_staff","shield",""],
  		    ["one_hand_staff_mastery","two_hand_staff_mastery","shield_mastery",""],
  		    ["soul_barrier","mana_consumption","monster_kill_sd","monster_kill_life"],
  		    ["soul_barrier_mastery","minimum_magic","","monster_kill_mana"],
  		],
  		[// elf
  		    ["pvp_hit","","",""],
  		    ["bow","crossbow","shield",""],
  		    ["bow_mastery","crossbow_mastery","shield_mastery",""],
  		    ["","mana_consumption","monster_kill_sd","monster_kill_life"],
  		    ["infinity_arrow","minimum_attack","","monster_kill_mana"],
  		],
  		[// magic
  		    ["pvp_hit","","",""],
  		    ["two_hand_sword","one_hand_sword","one_hand_staff","two_hand_staff"],
  		    ["two_hand_sword_mastery","one_hand_sword_mastery","one_hand_staff_mastery","two_hand_staff_mastery"],
  		    ["","mana_consumption","monster_kill_sd","monster_kill_life"],
  		    ["minimum_magic","minimum_attack","","monster_kill_mana"],
  		],
  		[// darkload
  		    ["pvp_hit","","",""],
  		    ["darkspirit1","scepter","shield","scepter_pet"],
  		    ["darkspirit2","scepter_mastery","shield_mastery","command_attack"],
  		    ["","mana_consumption","monster_kill_sd","monster_kill_life"],
  		    ["darkspirit3","pet_endurance","minimum_attack","monster_kill_mana"],
  		],
  		[// summoner
  		    ["pvp_hit","","",""],
  		    ["rod","book","",""],
  		    ["rod_mastery","book_mastery","",""],
  		    ["berserker_mind","mana_consumption","monster_kill_sd","monster_kill_life"],
  		    ["berserker_mind_mastery","minimum_magic_curse","","monster_kill_mana"],
  		],
  		[// rage fighter
		    ["pvp_hit","","",""],
		    ["glove","concentration","",""],
		    ["glove_mastery","concentration_mastery","high_tension",""],
		    ["","mana_consumption","monster_kill_sd","monster_kill_life"],
		    ["","minimum_attack","","monster_kill_mana"],
		]
  		                                 ];
	}
}