#!/bin/sh
cp ./src_en/internal.as ./src_en/data.as
#~/lib/flex_sdk_3.4.1.10084/bin/mxmlc ./src_en/MUDamage7.mxml -output ./bin-debug/MUDamage7.swf

~/lib/flex_sdk_4.5.1.21328/bin/mxmlc -static-link-runtime-shared-libraries=true ./src_en/MUDamage7.mxml -output ./bin-debug/MUDamage7.swf