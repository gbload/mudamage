#!/bin/sh
#srcを削除する
rm -rf ./src_etc2

#srcをコピーする
cp -r ../../src ./
mv ./src ./src_etc2

#.svnの削除
find ./src_etc2 -name ".svn" -exec rm -rf {} \;

#find etc_embed.plで埋め込む
find ./src_etc2 -name "*.as" -exec perl ./etc_embed.pl {} \;

#src_etcに適用
cd ./src_etc2
find ./ -name "*.as" -exec cp {} "../src_etc/{}" \;

#src_etc2を削除
rm -rf ./src_etc2
