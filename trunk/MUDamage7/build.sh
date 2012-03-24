#!/bin/sh
~/lib/flex_sdk_4.6.0.23201B/bin/mxmlc -static-link-runtime-shared-libraries=true ./src/MUDamage7.mxml -output ./target/bin-debug/MUDamage7.swf

#~/lib/flex_sdk_4.5.0.20967/bin/mxmlc -runtime-shared-library-path=/home/sinlion/lib/flex_sdk_4.5.0.20967/frameworks/libs/framework.swc,framework_4.5.0.20967.swz,,framework_4.5.0.20967.swf ./src/MUDamage7.mxml -output ./target/bin-debug/MUDamage7.swf

#~/lib/flex_sdk_4.5.0.20967/bin/mxmlc ./src/MUDamage7.mxml -output ./target/bin-debug/MUDamage7.swf
