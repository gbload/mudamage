/**
 * migrate_db.js
 * MUDamage7のデータをjavascriptで使える形式に変更する。
 */

var result = {};

// CSVファイルの読み込み
var fs = require('fs');
var filename = "";

fs.readFile( filename, 'utf8', function (err, data) {
	/**
	 * 装備データの変換処理
	 */
	var header = []; //ヘッダ格納用
	
	var flagHeader = false;
    for(var row in data.split(/\r\n|\r|\n/)){
    	for(var dat in row.split(",")){
    		// ヘッダの処理
    		if(!flagHeader){
    			header.push(dat);
    			flagHeader = true;
    		}
    		// 本体の処理
    		else{
    			
    		}
    	}
    }
});