#!/bin/sh
perl -w set2as.pl new_equip.csv set_equip.csv SetProtect > ../SetProtect.as
perl -w set2as.pl new_weapon.csv set_weapon.csv SetWeapon > ../SetWeapon.as
perl -w set2as.pl new_shield.csv set_shield.csv SetShield > ../SetShield.as
