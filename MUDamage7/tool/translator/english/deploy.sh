#!/bin/sh
# 通常版
rm -rf ./mudamage*.zip
cp -r ./bin-debug ./mudamage

rm -rf ./mudamage/data
rm -rf ./mudamage/img
rm -rf ./mudamage/.svn
rm -rf ./mudamage/*/.svn

zip -r ./mudamage_ver$1_en.zip ./mudamage

rm -rf ./mudamage
