/**
 * @author SINLION
 */

function init_equip_sort(){
	var new_equip=[];
	for (var loop = 0; loop < equip.length; loop+=SIZE) {
		SIZE = 5;
		for(var i= series4.length -1 ;i>=0;i--){
			if(equip[loop][1].match(series4[i]))SIZE=4;
		}
		if(SIZE==5){
			//兜　鎧　手　腰　足の順番に並び替える
			new_equip[loop] = equip[loop+4];
			new_equip[loop+1] = equip[loop];
			new_equip[loop+2] = equip[loop+3];
			new_equip[loop+3] = equip[loop+2];
			new_equip[loop+4] = equip[loop+1];
		}else{//魔剣士の場合
			//鎧　手　腰　足の順番に並び替える
			new_equip[loop] = equip[loop];
			new_equip[loop+1] = equip[loop+3];
			new_equip[loop+2] = equip[loop+2];
			new_equip[loop+3] = equip[loop+1];
		}
	}
	
	var str = "var equip = [";
	for(var i=0;i<new_equip.length;i++){
		str += "[<br>";
		for(var j=0;j<14;j++){
			if(j==5){// job
				str += "<br>[";
				str += new_equip[i][j].toString();
				str += "],";
			}else if(j==12){// spec
				str += "[";
				for(var k=0;k<=15;k++){
					str += "<br>[";
					str += new_equip[i][j][k].toString();
					str += "]";
					if(k!=15)str+=",";
				}
				str += "<br>],";
			}else if(j==13){// exspec
				str += "[";
				for(var k=0;k<=15;k++){
					str += "<br>[";
					str += new_equip[i][j][k].toString();
					str += "]";
					if(k!=15)str+=",";
				}
				str += "<br>]";
			}else if(j==6 || j==7){// 数値
				if(new_equip[i][j] || new_equip[i][j]==0)str += new_equip[i][j];
				else str += "0";
				str += ",";
			}else{// 文字列
				if(new_equip[i][j] || new_equip[i][j]==0)str += '"'+new_equip[i][j]+'"';
				else str += '""';
				str += ",";
			}
		}
		str += "]";
		if(i!=new_equip.length-1)str+=",";
	}
	str += "];";
	$('#result').html(str);
}
