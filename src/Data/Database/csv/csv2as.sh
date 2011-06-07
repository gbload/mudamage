#!/bin/sh
perl -w csv2as.pl new_equip.csv Protect > ../Protect.as
perl -w csv2as.pl new_weapon.csv Weapon > ../Weapon.as
perl -w csv2as.pl new_shield.csv Shield > ../Shield.as
perl -w csv2as.pl socket_equip.csv SocketProtect > ../SocketProtect.as
perl -w csv2as.pl socket_weapon.csv SocketWeapon > ../SocketWeapon.as
perl -w csv2as.pl socket_shield.csv SocketShield > ../SocketShield.as
