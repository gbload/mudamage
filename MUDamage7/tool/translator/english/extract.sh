#!/bin/sh
# ソースコードから日本語の抽出
mktemp result3.txt
cp ./translation_text/ja2en_all.txt result4.txt

find ../../../src -name "*.as" -exec perl ./pl/ja_extraction.pl {} \;

perl ./pl/merge.pl result3.txt result4.txt > result5.txt

cp result5.txt ./translation_text/ja2en.txt

# tmpファイルの削除
rm result3.txt
rm result4.txt
rm result5.txt