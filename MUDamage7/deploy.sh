#!/bin/sh
rm -rf ./mudamage
cp -r ./bin-debug ./mudamage
rm -rf ./mudamage/data
rm -rf ./mudamage/img
rm -rf ./mudamage*.zip
zip -r ./mudamage.zip ./mudamage
zip -r ./mudamage_ver$1.zip ./mudamage
zip -r ./mudamage_src.zip ./src
zip -r ./mudamage_src_ver$1.zip ./src
# 外部データ
cp ./src/external.as ./src/data.as
~/lib/flex_sdk_3.4.1.10084/bin/mxmlc ./src/MUDamage7.mxml -output ./bin-debug/MUDamage7.swf
rm -rf ./mudamage_export
cp -r ./bin-debug ./mudamage_export
rm -rf ./mudamage_export/img
zip -r ./mudamage_export.zip ./mudamage
zip -r ./mudamage_export_ver$1.zip ./mudamage