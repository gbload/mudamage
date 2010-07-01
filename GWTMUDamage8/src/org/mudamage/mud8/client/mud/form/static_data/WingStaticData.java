package org.mudamage.mud8.client.mud.form.static_data;

public class WingStaticData {
	private static WingStaticDataStructure w(String name,String jobs,String ops,Integer type,Integer def,Integer inc,Integer dec){
		return new WingStaticDataStructure(name, jobs, ops, type, def, inc, dec);
	}
	public static final WingStaticDataStructure[] wings = {
		w("なし","ナイト,ウィザード,エルフ,魔剣士,ダークロード,召喚師","",0,0,0,0),
		w("サタンの羽","ナイト,魔剣士","攻撃",1,20,12,12),
		w("守護天使の羽","ウィザード,魔剣士","魔力",1,10,12,12),
		w("妖精の羽","エルフ","",1,10,12,12),
		w("ミザリーウイング","召喚師","魔力",1,10,12,12),
		w("デビルウイング","ナイト","攻撃",2,45,32,25),
		w("ソウルウイング","ウィザード","魔力",2,30,32,25),
		w("ホーリーウイング","エルフ","攻撃",2,30,32,25),
		w("デスペアーウイング","召喚師","魔力,呪い",2,30,32,25),
		w("ダークウイング","魔剣士","攻撃,魔力",2,40,32,25),
		w("君主のマント","ダークロード","攻撃",4,15,20,0),
		w("テンペストウイング","ナイト","攻撃,防御",3,60,39,39),
		w("ライジングウイング","ウィザード","魔力,防御",3,45,39,39),
		w("ファントムウイング","エルフ","攻撃,防御",3,45,39,39),
		w("ディメンションウイング","召喚師","魔力,呪い,防御",3,45,39,39),
		w("スプリームウイング","魔剣士","攻撃,魔力",3,55,39,39),
		w("帝王のマント","ダークロード","攻撃,防御",3,45,39,24)
	};
	private static String[] cop2 = {"","防御無視3%","生命増加","マナ増加"};
	private static String[] cop3 = {"","防御無視5%","生命完全回復","マナ完全回復","ダメ反"};
	private static String cop2dl = "統率増加";
	public static String[] getNames(){
		String[] names = new String[wings.length];
		for(int i=0;i<wings.length;i++){
			names[i] = wings[i].name;
		}
		return names;
	}
	public static String[] getNames(String job){
		String[] str = new String[wings.length];
		int j=0;
		for(int i=0;i<wings.length;i++){
			if(wings[i].equalJobs(job))str[j++] = wings[i].name;
		}
		String[] names = new String[j];
		for(int i=0;i<j;i++){
			names[i] = str[i];
		}
		return names;
	}
	private static WingStaticDataStructure getValue(String name){
		for(int i=0;i<wings.length;i++){
			if(wings[i].name.equals(name))
				return wings[i];
		}
		return null;
	}
	public static String[] getOps(String name){
		return getValue(name).ops;
	}
	public static Integer getType(String name){
		return getValue(name).type;
	}
	public static String[] getCops(String name){
		Integer type = getType(name);
		if(type.equals(2))//2次羽のCOP
			return cop2;
		else if(type.equals(3))//3次羽のCOP
			return cop3;
		else if(type.equals(4)){//君主のマントのCOP
			String str[] = new String[cop2.length+1];
			int i=0;
			for(i=0;i<cop2.length;i++)
				str[i] = cop2[i];
			str[i] = cop2dl;
			return str;
		}else{
			return null;
		}
	}
}

