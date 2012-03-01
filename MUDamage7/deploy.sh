#!/bin/sh

rm -rf ./target/distribute/mudamage*.zip
cp -r ./src ./src_tmp
#.svnの削除
find ./src_tmp -name ".svn" -exec rm -rf {} \;
zip -r ./target/distribute/mudamage_src.zip ./src_tmp
zip -r ./target/distribute/mudamage_src_ver$1.zip ./src_tmp

rm -rf ./src_tmp

# 通常版
#sh build.sh

rm -rf ./target/distribute/mudamage
cp -r ./target/bin-debug ./target/distribute/mudamage

rm -rf ./target/distribute/mudamage/data
rm -rf ./target/distribute/mudamage/img
rm -rf ./target/distribute/mudamage/.svn
rm -rf ./target/distribute/mudamage/*/.svn

zip -r ./target/distribute/mudamage.zip ./target/distribute/mudamage
zip -r ./target/distribute/mudamage_ver$1.zip ./target/distribute/mudamage
