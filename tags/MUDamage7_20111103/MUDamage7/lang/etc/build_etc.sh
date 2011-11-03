#!/bin/sh
cp ./src_etc/internal.as ./src_etc/data.as
~/lib/flex_sdk_3.4.1.10084/bin/mxmlc ./src_etc/MUDamage7.mxml -output ./bin-debug/MUDamage7.swf
