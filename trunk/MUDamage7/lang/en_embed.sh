#!/bin/sh
#srcを削除する
rm -rf ./src_en

#srcをコピーする
cp -r ../src ./
mv ./src ./src_en

#find en_embed.plで埋め込む
find ./src_en -name "*.as" -exec perl ./en_embed.pl {} \;
