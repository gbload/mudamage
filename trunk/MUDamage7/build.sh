#!/bin/sh
cp ./src/internal.as ./src/data.as
~/lib/flex_sdk_3.4.1.10084/bin/mxmlc ./src/MUDamage7.mxml -output ./bin-debug/MUDamage7.swf
