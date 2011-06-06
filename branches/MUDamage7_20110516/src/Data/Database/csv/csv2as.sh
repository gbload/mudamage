#!/bin/sh
perl -w csv2as.pl new_equip.csv > Protect.as
perl -w csv2as.pl new_weapon.csv > Weapon.as
perl -w csv2as.pl new_shield.csv > Shield.as
perl -w csv2as.pl socket_equip.csv > SocketProtect.as
perl -w csv2as.pl socket_weapon.csv > SocketWeapon.as
perl -w csv2as.pl socket_shield.csv > SocketShield.as
