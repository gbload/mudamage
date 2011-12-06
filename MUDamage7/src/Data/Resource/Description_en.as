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

- Unimplemented maps: "Double Goer" and "Fortress of Imperial Guardian".
- Unimplemented PvP calculation.
- Unimplemented x button in tab of result screen.
- Unimplemented input support form for buff skill.
- Enhancing menus.
- Rage Fighter's skill speed isn't correct.
- Sometimes cannot correctly open a file when "File > Open".
- Unimplemented a calculation reducing skill damage by 20% in case of elf's bow calculation.
- In case of opening a file, a master skill tree is not saved.
- PVP hit and avoidance probability is not validate.(Now: self=(pvphit * lv),you=(pvpavoid * lv),p=(self/(self+you))^2）
		                        				]]> ).toString();
		public static var release:String = ( <![CDATA[
Release notes

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