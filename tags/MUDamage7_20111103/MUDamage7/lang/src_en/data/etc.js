﻿//エンチャントOP
//name type 0:武器 1:杖 2:防具 lv
var enchaunt = [
	["",0,0,[""]],
	["最小攻撃力",0,0,["2","3","4","5","6","7","9","11","12","14","15","16","17","20"]],
	["最大攻撃力",0,0,["3","4","5","6","7","8","10","12","14","17","20","23","26","29"]],
	["要求力減",0,0,["6","8","10","12","14","16","20","23","26","29","32","35","37","40"]],
	["要求敏減",0,0,["6","8","10","12","14","16","20","23","26","29","32","35","37","40"]],
	["攻撃力",0,6,["7","8","9","11","12","14","16","19"]],
	["Cダメ",0,6,["12","14","16","18","20","22","24","30"]],
	["スキル攻撃力",0,9,["12","14","16","18","22"]],
	["対人攻撃率",0,9,["5","7","9","11","14"]],
	["SD比率減",0,9,["3%","5%","7%","9%","10%"]],
	["SD無視",0,13,["10%"]],
	//杖エンチャ
	["",1,0,[""]],
	["魔力上昇",1,0,["6","8","10","12","14","16","17","18","19","21","23","25","27","31"]],
	["要求力減",1,0,["6","8","10","12","14","16","20","23","26","29","32","35","37","40"]],
	["要求敏減",1,0,["6","8","10","12","14","16","20","23","26","29","32","35","37","40"]],
	["スキル攻撃力",1,6,["7","10","13","16","19","22","25","30"]],
	["Cダメ",1,6,["10","12","14","16","18","20","22","28"]],
	["対人攻撃率",1,9,["5","7","9","11","14"]],
	["SD比率減",1,9,["4%","6%","8%","10%","13%"]],
	["SD無視",1,13,["15%"]],
	//防具エンチャ
	["",2,0,[""]],
	["防御力上昇",2,0,["3","4","5","6","7","8","10","12","14","16","18","20","22","25"]],
	["最大AG上昇",2,3,["4","6","8","10","12","14","16","18","20","22","25"]],
	["最大生命上昇",2,3,["7","9","11","13","15","17","19","21","23","25","30"]],
	["自動生命回復",2,6,["1","2","3","4","5","6","7","8"]],
	["自動マナ回復",2,9,["1","2","3","4","5"]],
	["対人防御成功",2,9,["3","4","5","6","8"]],
	["ダメ減",2,9,["3%","4%","5%","6%","7%"]],
	["SD比率上昇",2,13,["5%"]]
];
//ソケットOP
var socket = [
	//名前 属性 v1.LV1の値 v2 v3 v4 v5
	["",""	,["","","","",""]],
	//炎
	["攻撃魔力lv","炎"	,["20分の1","14分の1","10分の1","8分の1","6分の1"]],
	["最大攻撃魔力","炎"	,["30","45","60","75","90"]],
	["最小攻撃魔力","炎"	,["20","30","40","50","60"]],
	["攻撃魔力増加","炎"	,["20","30","40","50","60"]],
	["速度増加","炎"		,["7","9","11","13","15"]],
	["AG消費減少","炎"	,["40%","50%","60%","70%","80%"]],
	//稲妻
	["EXD増加","稲妻"	,["15","22","30","37","45"]],
	["EXD確率","稲妻"	,["10%","11%","12%","13%","14%"]],
	["クリ増加","稲妻"	,["30","45","60","75","90"]],
	["クリ確率","稲妻"	,["8%","9%","10%","11%","12%"]],
	//氷
	["スキル増加","氷"	,["37","55","74","92","111"]],
	["獲得生命","氷"	,["8分の1","7分の1","6分の1","5分の1","4分の1"]],
	["獲得マナ","氷"	,["8分の1","7分の1","6分の1","5分の1","4分の1"]],
	["攻撃成功率","氷"	,["25","37","50","62","75"]],
	["アイテム耐久","氷",["30%","40%","50%","60%","70%"]]
];
var socket2 = [
	//水
	["",""		,["","","","",""]],
	["防御力増加","水"		,["30","45","60","75","90"]],
	["盾装備時増加","水"	,["7%","9%","11%","13%","15%"]],
	["ダメ減","水"			,["4%","5%","6%","7%","8%"]],
	["ダメ反","水"			,["5%","7%","9%","11%","13%"]],
	["防御成功","水"		,["10%","11%","12%","13%","14%"]],
	//風
	["最大生命増加","風"		,["4%","5%","6%","7%","8%"]],
	["最大マナ増加","風"		,["4%","5%","6%","7%","8%"]],
	["最大AG増加","風"			,["25","37","50","62","75"]],
	["自動生命回復","風"	,["8","9","10","11","12"]],
	["自動マナ回復","風"	,["7","8","9","10","11"]],
	["自動AG回復","風"	,["3","4","5","6","7"]],
	//地
	["体力増加","地"		,["30","45","60","75","90"]]
];
function etc(){
	document.getElementById("test").innerHTML = getEnchaunt(0,0).toString();
}