#!/bin/sh
# ja2en_all.txtとmergeする
perl -w ./pl/merge.pl ./translation_text/ja2en_all.txt ./translation_text/ja2en.txt > result6.txt
cp result6.txt ./translation_text/ja2en_all.txt
rm result6.txt