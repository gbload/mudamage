/**
 * 古い装備データを圧縮し、Java言語として装備データを出力します。
 * @author SINLION
 */
/**
 * DataConversionクラスを初期化します。
 * @param {Object} item アイテムデータ
 * @param {Object} type 装備の種類(0:防具 1:武器)
 * @param {boolean} isEx EXの場合true
 */
var DataConversion = function(item,type,isEx){
	this.item = item;
	this.type = type;
	if (isEx)
		this.spec = item[13];
	else
		this.spec = item[12];
}
/**
 * prototype
 */
DataConversion.prototype = {
	item:null,
	spec:null,
	type:0		// type 0:guard 1:weapon
	
};


/**
 * 装備要求ステータスの初期値と上昇値を返します。
 * @param {String} str (str,agi,ene)
 * @return [default,inc]
 */
DataConversion.prototype.getItemRequire = function(str){
    // Nから+13の平均を取って、10倍し、小数点以下切り捨て
    var zero = this.getSpec(str,0);
    var full = this.getSpec(str,13);
    var e = (full - zero - 1) / 13;
	var e2 = (full - zero + 1) / 13;
    e = Math.floor(e * 100);
	e2 =  Math.floor(e2 * 100);
    // 検証
	var r1;
	var r2;
	var e3;
	var e4=[];
	for(e3=e;e3<e2;e3++){
		r1 = test_new(str,e3);
		if(r1)e4.push(e3);
	}
    return e4;
}


/**
 * スペックを返します。
 * @param {Object} str  スペック名
 * @param {Object} plus アイテムレベル
 * @return {int} spec
 */
DataConversion.prototype.getSpec = function(str,plus){
	/*
	 * 防具
	 */
	if (this.type == 0) {
		if (str == "str") // 要求力
			return this.spec[plus][0];
		if (str == "agi") // 要求敏捷
			return this.spec[plus][1];
		if (str == "ene") // 要求エナジー
			return this.spec[plus][2];
		if (str == "def") // 防御力
			return this.spec[plus][3];
		if (str == "avoid")//防御成功率
			return this.spec[plus][4];
	}
	/*
	 * 武器
	 */
	else if(this.type==1){
		if (str == "min") // 最小攻撃力
			return this.spec[plus][0];
		if (str == "max") // 最大攻撃力
			return this.spec[plus][1];
		if (str == "str") // 要求力
			return this.spec[plus][2];
		if (str == "agi") // 要求敏捷
			return this.spec[plus][3];
		if (str == "ene") // 要求エナジー
			return this.spec[plus][4];
		if (str == "magic")//魔力%
			return this.spec[plus][5];
		if (str == "pet") // ペット攻撃向上%
			return this.spec[plus][6];
		if (str == "noroi")//呪い%
			return this.spec[plus][7];
	}
	return 0;
}


/**
 * 要求値の上昇値が正しいかテストします。上昇値が正しければ初期値を返します。
 * @param {Object} str スペック名
 * @param {Object} e   上昇値
 * @return {Object} 0 or default
 */
DataConversion.prototype.testRequireInc = function(str,inc){
    var check = 1;
    for (j = 0; j < 100; j++) {
        for (i = 1; i < 13; i++) {
            if (Math.floor((getSpec(str,0)*100 + j + (inc * i))/100) == getSpec(str,i)) {
                check = 1;
            }
            else {
				check = 0;
                break;
            }
        }
        if (check == 1) {
            return (getSpec(str,0)*100 + j)/100;
        }
    }
    return 0;
}

function median_old(array){
	var r=0;
	var inf = 0;
	var sup = 99999;
	for(var i=0;i<SIZE;i++){
		if(inf < array[i][0])inf = array[i][0];
		if(sup > array[i][1])sup = array[i][1];
	}
	for(var i=inf;i<=sup;i++)
		if(i%10==0)r = i;
	if(r==0)r=inf;
	return r;
}
function median(array){
	var r=0;
	var j=0;
	var k=0;
	var c1=[];
	var c2=array[0];
	for(var i=1;i<array.length;i++){
		c1 = [];
		j=0;
		k=0;
		while(j<c2.length && k<array[i].length){
			if (c2[j] == array[i][k]) {
				c1.push(array[i][k]);
				j++;
				k++;
			}
			if (c2[j] < array[i][k]) j++;
			if (c2[j] > array[i][k]) k++;
		}
		c2 = c1;
	}
	for(var i=0;i<=c1.length;i++)
		if(c1[i]%10==0)r = c1[i];
	if (!c1.length) {
		return -1;
	}
	if(r==0)r=c1[0];
	return r;
}
function median_one(array){
	var r=0;
	for(var i=0;i<array.length;i++)
		if(array[i]%10==0)r = array[i];
	if(r==0)r=array[0];
	return r;
}
function median_two(array,array2){
	var r=0;
	var j=0;
	var k=0;
	var c1=[];
	while(j<array.length && k<array2.length){
		if (array[j] == array2[k]) {
			c1.push(array2[k]);
			j++;
			k++;
		}
		if (array[j] < array2[k]) j++;
		if (array[j] > array2[k]) k++;
	}
	for(var i=0;i<=c1.length;i++)
		if(c1[i]%10==0)r = c1[i];
	if(r==0)r=c1[0];
	return r;
}
function test_median(str,e){
    var check = 1;
	var c = [];
	var r = 0;
    for (j = 0; j < 100; j++) {
        for (i = 1; i < 13; i++) {
            if (Math.floor((getSpec(str,0)*100 + j + (e * i))/100) == getSpec(str,i)) {
                check = 1;
            }
            else {
				check = 0;
                break;
            }
        }
        if (check == 1) {
            c.push((getSpec(str,0)*100 + j)/100);
        }
    }
	for(var i=0;i<=c.length;i++)
		if(c[i]%10==0)r = c[i];
	if(!c.length)return -1;
	if(r==0)r=c[0];
    return r;
}
function init(){
	var result = "";
	var test_str = 0;
	var test_str2 = 0; 
	for (var loop = 0; loop < equip.length; loop+=SIZE) {
		SIZE = 5;
		// 兜のデータを抽出
		item_base = equip[loop];
		result += "{";
		
		// 基本情報
		result += "{";
		// 名前
		var name1 = -1;
		for (var i = series.length - 1; i >= 0 ; i--) {
			if (item_base[1].match(series[i])) {
				name1 = series[i];
				break;
			}
		}
		// 魔剣士防具の場合4箇所しかない
		for(var i= series4.length -1 ;i>=0;i--){
			if(name1 == series4[i])SIZE=4;
		}
		//result += name1.toString() + ",";
		// 兜の名前
		for (var j = 0; j < 1; j++) {
			var name2 = -1;
			for (var i = 0; i < part.length; i++) {
				if (equip[loop+j][1].match(part[i])) {
					name2 = i;
					break;
				}
			}
			result += name2.toString() + ",";
		}
		// 装備可能職
		var jobnum = 0;
		for (var i = 0; i < 6; i++) {
			jobnum += item_base[5][i] << i;
		}
		result += jobnum.toString() + ",";
		// 攻撃速度
		var speed = equip[loop+(SIZE-3)][7];
		result += speed.toString() + "}";
		
		// スペック
		/*
		for (var j = 12; j <= 13; j++) {
			item = item_base[j];
			result += ",{";
			// 要求力
			var str = equip_require("str");
			result += str.toString();
			result += ",";
			test_str = str[1];
			// 要求敏
			if (getSpec("agi", 0) > 0) {
				var agi = equip_require("agi");
				result += agi.toString();
				result += ",";
			}
			// 要求エナ
			if (getSpec("ene", 0) > 0) {
				var ene = equip_require("ene");
				result += ene.toString();
				result += ",";
			}
			// 防御力
			var def = getSpec("def", 0);
			result += def.toString();
			result += "}";
			// 防御成功率
		}
		*/
		var def = [];
		var str = [];
		var agi = [];
		var ene = [];
		var def_ex = [];
		var str_ex = [];
		var agi_ex = [];
		var ene_ex = [];
		var str_diff = [];
		var agi_diff = [];
		var ene_diff = [];
		for(var j=0;j<SIZE;j++){
			item = equip[loop+j][12];
			// TODO 防御力
			def.push(getSpec("def",0));
			// 要求力
			str.push(equip_require("str"));
			// 要求敏
			if (getSpec("agi", 0) > 0) {
				agi.push(equip_require("agi"));
			}
			// 要求エナ
			if (getSpec("ene", 0) > 0) {
				ene.push(equip_require("ene"));
			}
			// 通常スペック
			var str_n = getSpec("str",0);
			var agi_n = getSpec("agi",0);
			var ene_n = getSpec("ene",0);
			// EX //
			item = equip[loop+j][13];
			// TODO 防御力
			def_ex.push(getSpec("def",0));
			// 要求力
			str_ex.push(equip_require("str"));
			// 要求敏
			if (getSpec("agi", 0) > 0) {
				agi_ex.push(equip_require("agi"));
			}
			// 要求エナ
			if (getSpec("ene", 0) > 0) {
				ene_ex.push(equip_require("ene"));
			}
			// EXスペック
			item = equip[loop+j][13];
			str_diff.push(getSpec("str",0) - str_n);
			agi_diff.push(getSpec("agi",0) - agi_n);
			ene_diff.push(getSpec("ene",0) - ene_n);
			
		}
		// EXスペック調整
		var str_diff2 = 1;
		var agi_diff2 = 1;
		var ene_diff2 = 1;
		for (var j = 1; j < SIZE; j++) {
			if(str_diff[j-1] != str_diff[j])str_diff2=0;
			if(agi_diff[j-1] != agi_diff[j])agi_diff2=0;
			if(ene_diff[j-1] != ene_diff[j])ene_diff2=0;
		}
		if(str_diff2)str_diff = str_diff[0];
		else str_diff = -1;
		if(agi_diff2)agi_diff = agi_diff[0];
		else agi_diff = -1;
		if(ene_diff2)ene_diff = ene_diff[0];
		else ene_diff = -1;
		
		var e;
		var r;
		// DEF
		result += ",{";
		for (var i = 0; i < SIZE; i++) {
			// 通常
			if(i!=0)result += ",";
			result += def[i].toString();
			// EX
			result += ",";
			result += def_ex[i].toString();
		}
		result += "}";
		
		// 要求力
		result += ",{";
		// 上昇値
        e = median(str.concat(str_ex));
		if(e!=-1){// 共通項がある場合
			// 上昇値
			result += e.toString();
			// EXスペック
			//result += ",";
			//if(e%10==0)result += str_diff.toString();
			for (var i = 0; i < SIZE; i++) {
				// 通常
				result += ",";
				item = equip[loop+i][12];
				r = test_median("str", e);
				result += r.toString();
				// EX
				result += ",";
				item = equip[loop+i][13];
				r = test_median("str", e);
				result += r.toString();
			}
		}else{// 共通項がない場合
			for (var i = 0; i < SIZE; i++) {
				e = median_two(str[i],str_ex[i]);
				if (!e) {
					result += "AAA,";
					break;
				}
				// 上昇値
				result += e.toString() + ",";
				// 通常
				item = equip[loop+i][12];
				r = test_median("str", e);
				result += r.toString();
				result += ",";
				// EX
				item = equip[loop+i][13];
				r = test_median("str", e);
				result += r.toString();
				if(i!=4)result += ",";
			}
		}
		result += "}";
        // 要求敏
		item = equip[loop][12];
        if (getSpec("agi", 0) > 0) {
			result += ",{";
			// 上昇値
	        e = median(agi);
			if(e!=-1){// 共通項がある場合
				result += e.toString();
				// EXスペック
				//result += ",";
				//if(e%10==0)result += agi_diff.toString();
				for (var i = 0; i < SIZE; i++) {
					// 通常
					result += ",";
					item = equip[loop+i][12];
					r = test_median("agi", e);
					result += r.toString();
					// EX
					result += ",";
					item = equip[loop+i][13];
					r = test_median("agi", e);
					result += r.toString();
				}
			}else{// 共通項がない場合
				for (var i = 0; i < SIZE; i++) {
					e = median_two(agi[i],agi_ex[i]);
					if (!e) {
						result += "AAA,";
						break;
					}
					// 上昇値
					result += e.toString() + ",";
					// 通常
					item = equip[loop+i][12];
					r = test_median("agi", e);
					result += r.toString();
					result += ",";
					// EX
					item = equip[loop+i][13];
					r = test_median("agi", e);
					result += r.toString();
					if(i!=4)result += ",";
				}
			}
			result += "}";
			/*
			result += ",{";
	        e = median(agi);
			result += e.toString() + ",";
			for (var i = 0; i < SIZE; i++) {
				item = equip[loop+i][12];
				r = test_median("agi", e);
				result += r.toString() + ",";
			}
			result += "}";
			*/
        }
        // 要求エナ
		item = equip[loop][12];
        if (getSpec("ene", 0) > 0) {
			result += ",{";
			// EXスペック
			//result += ene_ex.toString()+",";
			// 上昇値
	        e = median(ene);
			if(e!=-1){// 共通項がある場合
				result += e.toString();
				// EXスペック
				//result += ",";
				//if(e%10==0)result += ene_diff.toString();
				for (var i = 0; i < SIZE; i++) {
					// 通常
					result += ",";
					item = equip[loop+i][12];
					r = test_median("ene", e);
					result += r.toString();
					// EX
					result += ",";
					item = equip[loop+i][13];
					r = test_median("agi", e);
					result += r.toString();
				}
			}else{// 共通項がない場合
				for (var i = 0; i < SIZE; i++) {
					e = median_two(ene[i],ene_ex[i]);
					if (!e) {
						result += "AAA,";
						break;
					}
					// 上昇値
					result += e.toString() + ",";
					// 通常
					item = equip[loop+i][12];
					r = test_median("ene", e);
					result += r.toString();
					result += ",";
					// EX
					item = equip[loop+i][13];
					r = test_median("ene", e);
					result += r.toString();
					if(i!=4)result += ",";
				}
			}
			result += "}";
			/*
			result += ",{";
	        e = median(ene);
			result += e.toString() + ",";
			for (var i = 0; i < SIZE; i++) {
				item = equip[loop+i][12];
				r = test_median("ene", e);
				result += r.toString() + ",";
			}
			result += "}";
			*/
        }
		
		result += "},<br>";
		
		// 検証用
		if(loop%SIZE){
			if(test_str != test_str2){
				result += "str"+ test_str +":"+ test_str2 + "<br>";
			}
		}
		test_str2 = test_str;
	$('#result').html(result);
	}
	$('#result').html(result);
}
