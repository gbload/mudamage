package Data.Database{
	internal class Ereutel{
		public static var data:Array = [
["軍神",1,"attack","属性攻撃力上昇",30,33,38,45,54,65,78,93,113,138,168],
["軍神",2,"fire_attack","火属性攻撃相性増加％",5,6,7,8,9,10,12,14,16,18,20],
["軍神",2,"water_attack","水属性攻撃相性増加％",5,6,7,8,9,10,12,14,16,18,20],
["軍神",2,"earth_attack","地属性攻撃相性増加％",5,6,7,8,9,10,12,14,16,18,20],
["軍神",2,"wind_attack","風属性攻撃相性増加％",5,6,7,8,9,10,12,14,16,18,20],
["軍神",2,"dark_attack","闇属性攻撃相性増加％",5,6,7,8,9,10,12,14,16,18,20],
["軍神",3,"pvp_attack","PVP時 属性攻撃力上昇",30,35,43,54,66,80,97,117,142,172,207],
["軍神",3,"monster_attack","モンスター狩り時 属性攻撃力上昇",30,35,43,54,66,80,97,117,142,172,207],
["軍神",4,"long_attack","PVP時 遠距離スキル属性攻撃力上昇",30,35,43,54,66,80,97,117,142,172,207],
["軍神",4,"short_attack","PVP時 近接スキル属性攻撃力上昇",30,35,43,54,66,80,97,117,142,172,207],
["軍神",5,"pvp_critical","PVP時 属性攻撃クリティカル確率増加％",5,6,7,8,9,10,12,14,16,18,20],
["軍神",5,"monster_critical","モンスター狩り時 属性攻撃クリティカル確率増加％",5,6,7,8,9,10,12,14,16,18,20],
["加護",1,"defense","属性防御力上昇",10,13,17,22,28,35,43,52,62,73,85],
["加護",2,"fire_defense","火属性防御相性増加％",5,6,7,8,9,10,12,14,16,18,20],
["加護",2,"water_defense","水属性防御相性増加％",5,6,7,8,9,10,12,14,16,18,20],
["加護",2,"earth_defense","地属性防御相性増加％",5,6,7,8,9,10,12,14,16,18,20],
["加護",2,"wind_defense","風属性防御相性増加％",5,6,7,8,9,10,12,14,16,18,20],
["加護",2,"dark_defense","闇属性防御相性増加％",5,6,7,8,9,10,12,14,16,18,20],
["加護",3,"pvp_defense","PVP時 属性防御力上昇",10,13,17,22,28,35,43,52,62,73,85],
["加護",3,"monster_defense","モンスター狩り時 属性防御力上昇",10,13,17,22,28,35,43,52,62,73,85],
["加護",4,"long_defense","PVP時 遠距離スキル属性防御力上昇",10,13,17,22,28,35,43,52,62,73,85],
["加護",4,"short_defense","PVP時 近接スキル属性防御力上昇",10,13,17,22,28,35,43,52,62,73,85],
["加護",5,"pvp_decrease","PVP時 属性ダメージ減少％",5,6,7,8,9,10,12,14,16,18,20],
["加護",5,"monster_decrease","モンスター狩り時 属性ダメージ減少％",5,6,7,8,9,10,12,14,16,18,20],
["高潔",1,"attack_success","属性攻撃成功率増加％",5,6,7,8,9,10,12,14,16,18,20],
["高潔",2,"fire_attack","火属性攻撃相性増加％",5,6,7,8,9,10,12,14,16,18,20],
["高潔",2,"water_attack","水属性攻撃相性増加％",5,6,7,8,9,10,12,14,16,18,20],
["高潔",2,"earth_attack","地属性攻撃相性増加％",5,6,7,8,9,10,12,14,16,18,20],
["高潔",2,"wind_attack","風属性攻撃相性増加％",5,6,7,8,9,10,12,14,16,18,20],
["高潔",2,"dark_attack","闇属性攻撃相性増加％",5,6,7,8,9,10,12,14,16,18,20],
["高潔",3,"pvp_attack","PVP時 属性攻撃力上昇",30,35,43,54,66,80,97,117,142,172,207],
["高潔",3,"monster_attack","モンスター狩り時 属性攻撃力上昇",30,35,43,54,66,80,97,117,142,172,207],
["高潔",4,"long_attack","PVP時 遠距離スキル属性攻撃力上昇",30,35,43,54,66,80,97,117,142,172,207],
["高潔",4,"short_attack","PVP時 近接スキル属性攻撃力上昇",30,35,43,54,66,80,97,117,142,172,207],
["高潔",5,"pvp_increase","PVP時 属性ダメージ増加％",5,7,9,11,13,15,18,21,24,27,30],
["高潔",5,"monster_increase","モンスター狩り時 属性ダメージ増加％",5,7,9,11,13,15,18,21,24,27,30],
["神聖",1,"defense_success","属性防御成功率増加％",5,6,7,8,9,10,12,14,16,18,20],
["神聖",2,"fire_defense","火属性防御相性増加％",5,6,7,8,9,10,12,14,16,18,20],
["神聖",2,"water_defense","水属性防御相性増加％",5,6,7,8,9,10,12,14,16,18,20],
["神聖",2,"earth_defense","地属性防御相性増加％",5,6,7,8,9,10,12,14,16,18,20],
["神聖",2,"wind_defense","風属性防御相性増加％",5,6,7,8,9,10,12,14,16,18,20],
["神聖",2,"dark_defense","闇属性防御相性増加％",5,6,7,8,9,10,12,14,16,18,20],
["神聖",3,"pvp_defense","PVP時 属性防御力上昇",10,13,17,22,28,35,43,52,62,73,85],
["神聖",3,"monster_defense","モンスター狩り時 属性防御力上昇",10,13,17,22,28,35,43,52,62,73,85],
["神聖",4,"long_defense","PVP時 遠距離スキル属性防御力上昇",10,13,17,22,28,35,43,52,62,73,85],
["神聖",4,"short_defense","PVP時 近接スキル属性防御力上昇",10,13,17,22,28,35,43,52,62,73,85],
["神聖",5,"pvp_drain","PVP時 属性ダメージ吸収％",5,7,9,11,13,15,18,21,24,27,30],
["神聖",5,"monster_drain","モンスター狩り時 属性ダメージ吸収％",5,7,9,11,13,15,18,21,24,27,30],
["狂喜",1,"debuff","属性別デバフ発生確率増加％",1,2,3,4,5,6,7,8,10,12,15],
["狂喜",2,"str","力増加",10,15,20,25,30,35,40,45,50,55,60],
["狂喜",2,"agi","敏捷増加",10,15,20,25,30,35,40,45,50,55,60],
["狂喜",2,"ene","エナジー増加",10,15,20,25,30,35,40,45,50,55,60],
["狂喜",2,"vit","体力増加",10,15,20,25,30,35,40,45,50,55,60],
["狂喜",3,"hp","最大HP増加",20,25,30,35,40,50,60,70,80,90,100],
["狂喜",3,"mana","最大マナ増加",20,25,30,35,40,50,60,70,80,90,100],
["狂喜",3,"ag","最大AG増加",20,25,30,35,40,50,60,70,80,90,100],
["狂喜",3,"sd","最大SD増加",500,550,600,650,700,750,800,850,900,950,1000],
["狂喜",4,"pvp_exd","PVP時 属性攻撃エクセレントダメージ確率増加％",5,6,7,8,9,10,12,14,16,18,20],
["狂喜",4,"monster_exd","モンスター狩り時 属性攻撃エクセレントダメージ確率増加％",5,6,7,8,9,10,12,14,16,18,20],
["狂喜",5,"debuff","属性別デバフ追加発生確率増加％",1,2,3,4,5,6,7,8,10,12,15]
];
	}
}