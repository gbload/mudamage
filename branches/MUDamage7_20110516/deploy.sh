#!/bin/sh

rm -rf ./target/distribute/mudamage*.zip
zip -r ./target/distribute/mudamage_src.zip ./src
zip -r ./target/distribute/mudamage_src_ver$1.zip ./src

# 通常版
sh build.sh

rm -rf ./target/distribute/mudamage
cp -r ./target/bin-debug ./target/distribute/mudamage

rm -rf ./target/distribute/mudamage/data
rm -rf ./target/distribute/mudamage/img
rm -rf ./target/distribute/mudamage/.svn
rm -rf ./target/distribute/mudamage/*/.svn

zip -r ./target/distribute/mudamage.zip ./target/distribute/mudamage
zip -r ./target/distribute/mudamage_ver$1.zip ./target/distribute/mudamage
