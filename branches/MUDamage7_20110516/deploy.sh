#!/bin/sh

rm -rf ./distribute/mudamage*.zip
zip -r ./distribute/mudamage_src.zip ./src
zip -r ./distribute/mudamage_src_ver$1.zip ./src

# 外部データ
#cp ./src/external.as ./src/data.as
#~/lib/flex_sdk_3.4.1.10084/bin/mxmlc ./src/MUDamage7.mxml -output ./bin-debug/MUDamage7.swf

#rm -rf ./distribute/mudamage_export
#cp -r ./bin-debug ./distribute/mudamage_export

#rm -rf ./distribute/mudamage_export/img
#rm -rf ./distribute/mudamage_export/.svn
#rm -rf ./distribute/mudamage_export/*/.svn
#zip -r ./distribute/mudamage_export.zip ./distribute/mudamage_export
#zip -r ./distribute/mudamage_export_ver$1.zip ./distribute/mudamage_export

# 通常版
sh build.sh

rm -rf ./distribute/mudamage
cp -r ./bin-debug ./distribute/mudamage

rm -rf ./distribute/mudamage/data
rm -rf ./distribute/mudamage/img
rm -rf ./distribute/mudamage/.svn
rm -rf ./distribute/mudamage/*/.svn

zip -r ./distribute/mudamage.zip ./distribute/mudamage
zip -r ./distribute/mudamage_ver$1.zip ./distribute/mudamage
