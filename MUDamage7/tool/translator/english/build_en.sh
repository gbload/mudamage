#!/bin/sh
cp ./src_en/Data/Resource/Description_en.as ./src_en/Data/Resource/Description.as

~/lib/flex_sdk_4.5.1.21328/bin/mxmlc -static-link-runtime-shared-libraries=true ./src_en/MUDamage7.mxml -output ./bin-debug/MUDamage7.swf