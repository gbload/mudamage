package Data.Resource{
	public class Description{
		public static var credit:String = (<![CDATA[
MUDamage7 created by mudamage administer in Japan.
mail:
	mudamage<at>live.jp
site:
	http://mudamage.web.fc2.com/
sourcecode:
	http://code.google.com/p/mudamage/

©2001-2010 WEBZEN, Inc. All Rights Reserved. Licensed to ©2010 GameOn Co., Ltd.
				]]> ).toString();
		public static var bugs:String = ( <![CDATA[
Bugs

- Unimplemented x button in tab of result screen.
- Enhancing menus.
- Rage Fighter's skill speed isn't correct.
- Unimplemented a calculation reducing skill damage by 20% in case of elf's bow calculation.
- Unknown new skills.

- Unknown the calculation of Property system.

- No check PVP calculation in MUDamage after eX700.
- PVP hit and avoidance probability is not validate.(Now: self=(pvphit * lv),you=(pvpavoid * lv),p=(self/(self+you))^2）
		                        				]]> ).toString();
		public static var release:String = ( <![CDATA[
Release notes

2012/03/26 ver3.18
- Apply critical probability and excellent damage probability of attribute system.
- Apply status increase options of attribute system.
- Enable to save the adding attribute form.
- Modify the bug that attack power became 0 when weapon wasn't selected.
- Modify the bug that cannot calculate when attribute item wasn't selected.
- Add limit of 10 points master skill.
- Modify the bug that masuter skill tree form became empty in opening file.

2012/03/25 ver3.17
- Add new ereutel.
- Add rank 4 and 5 in attribute system.
- Modify ereutel option value.
- Show attribute damage at other row in result screen.
- Show the attribute suffer damage in result screen.
- Add monster wing.
- Add map "Akeron".

2012/03/21 ver3.16
- Modify the bug that master skill's buff skill was calculated as integer.(I checked only "Swell Life".)
- Modify "Innovation" and "Weakness" calculation. 
- Attribute damage show at other column in result screen.(Attribute damage isn't added to average damage.)
- Add "Total Damage" and "Skill Hit count" in result screen.

2012/03/21 ver3.15
- Modify the calculation of master skill "Defense Success Rate increase".
- Modify the bug that master skill value wasn't float.

2012/03/01 ver3.14
- Modify the bug that the defense bonus of unification of armors wasn't applied when ancient item was selected.
- Modify the bug that master skill "Set Defense" was applied as %.
- Modify "open file".
- Modify the bug that master skill point's color was red when it is plus after minus.

2012/03/01 ver3.13
- Modify the bug that damage is incorrect when using spell enhance.
- Modify the bug that attribute damage may be minus.
- Modify the bug that rage fighter's specialized master skill wasn't applied.
- Modify the bug that darkload's master skill "Command status increase" wasn't applied.

2012/02/24 ver3.12
- Modify the skill "Innovation/Weakness/Cling Blow/Beast Upper/Fire Slash".
- Modify the calculation of the skill "Bless".
- Add master skill "Command status increase" and "Fire Scream mastery".
- Modify the bug that damage is incorrect when dark horse is selected.
- Modify the bug that dark horse's defense applied when dark horse isn't selected.
- Modify the bug that cannot calculate attribute damage when ether isn't selected.
- Applied provisional formula of attribute damage.
- Modify the bug that fenrir's damage increase/decrease wasn't the last of calcuation.

2012/01/28 ver3.11
- Modify the bug that spell enhance's "maximum magic increase" wasn't applied.
- Modify the bug that swell life's "maximum AG increase" wasn't applied.
- Modify the bug that there are two socket bonus form.
- Modify the bug that socket bonuses was applied when socket input form hide.
- Modify the bug that sword's enchant option "Critical Dmg increase" was applied to magic and staff's it was applied to attack.
- Modify the bug that sword's socket option "Attack or Magic increase /Level" was applied to magic and staff's it was applied to attack. 
- Apply eX700's master skill.
- Modify the bug that cannot calculate summoner's curse calculation.

2012/01/17 ver3.10
- Modify the bug that darkload's master skill Fire Scream Increase 1 and 2 were same.
- Modify the design of master skill tree form.
- Add new buff skill's form.
- Delete old buff skill's form.
- I don't migrate the save data from old buff skill's form to new buff skill's form.

2011/12/23 ver3.09
- Modify the calculation of defense success rate.
- Modify the bug that monster HP was monster name.
- Add input support form of buff skills.
- Modify the bug that cannot scroll in input form screen.
- Modify the bug that cannot scroll in result screen.
- Modify the bug that the speed of Destroy Gloves was 0.

2011/12/20 ver3.08
- Modify the bug that damage calculation was avoidance damage when monster's attack success rate is unknown.
- Modify the bug that the defense bonus of unification of armors in Magic Gladiator and Rage Fighter wasn't applied.(Now applies even non-personal equipment.)
- Modify the bug that Attribute Dmg wasn't applied in magic calculation.
- Modify the bug that Elf's buff skill "Greater Defense" wasn't applied.
- Modify the bug that support form was accepted only one or two digits.
- Modify the bug that "ignore defense" calculation result didn't show in "Double Goer" and "Imperial Guardian".
- Modify the bug that "ignore defense" wasn't applied to calculation.
- Apply master skill "Set Defense increase" and "Wing Defense increase".
- Apply master skill "Spear mastery", "Glove mastery".
- Apply master skill "Double Damage/Ignore Defense/Critical/Exellent Damage Probability increase".
- Apply master skill "Maximum/Minimum Attack/Magic/Curse increase","Wing Attack Increase".
- Apply master skill "strength/agility/vitality/energy status increase","Maximum AG increase".
- Add New Skills.
- Modify the bug that Socket option "Critical Dmg Probability Incease" was calculated as "Exellent Dmg Probability Increase".
- Add AG auto healing parameter in result screen.

2011/12/16 ver3.07 en
- Modify the bug that Socket option "Dmg Level" isn't correctly applied.
- Modify the bug that Socket Bonus isn't applied.

2011/12/14 ver3.07
- Delete unnecessary icons of Master Skill.
- Modify the bug that Master Skill Tree isn't saved.
- Modify the bug that Property form isn't saved.
- Change the default of property form to none selection.
- Modify Property form.
- Apply Property system to the calculation.(But I don't know its correct calculation.)

2011/12/13 ver3.06
- Add Master Skill after rank 6.(Not apply for calculation.)
- Add input form of Property system.(Not apply for calculation.)

2011/12/04 ver3.05
- Add MAP "Double Goer" and "Imperial Guardian".
- Change Master Level's limit from 200 to 300.
- Add PVP calculation.
- Modify the bug that buffs and debuffs are not applied in the damage calculation from a monster.
- Add damage calculation of avoidance.
- Modify the bug that the wing's reduction is not applied.

2011/11/29 ver3.04
- Modify increase speed of master skill weapon's "xxx Mastery", physical type add it into attack speed, magic type add it into magic speed.
- Modify the bug that EXE item's value becomes normal item's value.
- Add arrow's calculation.
- Modify the bug that skill damage isn't applied in elf's bow calculation.
- Modify a calculating position of master skill "Increase Skill".
- Modify the bug that attack probability to monsters don't calculate.

2011/11/23 ver3.03
- Add new set ancient items.
- Make Bugs & Release menu.
- Modify the bug that socket option, enchant option and etc are displayed in result screen when we choose set ancient items.

2011/11/23 ver3.02
- Apply the speed of Master Skill: "Weapon Mastery".
- Add dark raven's damage calculation.
- Add description of dark horse and dark raven in result screen.
- Modify the bug that contents of pet's sub form aren't applied to calculation.
- Modify the bug that dark raven level isn't saved.
- Add dark horse defense to calculation.
		                        				]]> ).toString();
	}
}