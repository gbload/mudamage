package org.mudamage.mud8.client.mud.static_data;

import org.apache.commons.digester.ObjectParamRule;

public class WingStaticData {
	// 羽定数
	public static final Integer NONE		 = 0;
	public static final Integer KNIGHT1	 = 1;
	public static final Integer WIZARD1	 = 2;
	public static final Integer ELF1		 = 3;
	public static final Integer SUMMONER1 = 4;
	public static final Integer KNIGHT2	 = 5;
	public static final Integer WIZARD2	 = 6;
	public static final Integer ELF2		 = 7;
	public static final Integer SUMMONER2 = 8;
	public static final Integer MAGIC2	 = 9;
	public static final Integer DARKLOAD2 = 10;
	public static final Integer KNIGHT3	 = 11;
	public static final Integer WIZARD3	 = 12;
	public static final Integer ELF3		 = 13;
	public static final Integer SUMMONER3 = 14;
	public static final Integer MAGIC3	 = 15;
	public static final Integer DARKLOAD3 = 16;
	
	// 羽名前
	public static final String NONE_NAME		 = "なし";
	public static final String KNIGHT1_NAME	 = "サタンの羽";
	public static final String WIZARD1_NAME	 = "守護天使の羽";
	public static final String ELF1_NAME		 = "妖精の羽";
	public static final String SUMMONER1_NAME = "ミザリーウイング";
	public static final String KNIGHT2_NAME	 = "デビルウイング";
	public static final String WIZARD2_NAME	 = "ソウルウイング";
	public static final String ELF2_NAME		 = "ホーリーウイング";
	public static final String SUMMONER2_NAME = "デスペアーウイング";
	public static final String MAGIC2_NAME	 = "ダークウイング";
	public static final String DARKLOAD2_NAME = "君主のマント";
	public static final String KNIGHT3_NAME	 = "テンペストウイング";
	public static final String WIZARD3_NAME	 = "ライジングウイング";
	public static final String ELF3_NAME		 = "ファントムウイング";
	public static final String SUMMONER3_NAME = "ディメンジョンウイング";
	public static final String MAGIC3_NAME	 = "スプリームウイング";
	public static final String DARKLOAD3_NAME = "帝王のマント";
	
	// 羽オプション定数
	public static final Integer COP_IGNORE3 = 1;
	public static final Integer COP_HP = 2;
	public static final Integer COP_MANA = 3;
	public static final Integer COP_REC = 4;
	public static final Integer COP_IGNORE5 = 5;
	public static final Integer COP_FULL_HP = 6;
	public static final Integer COP_FULL_MANA = 7;
	public static final Integer COP_FULL_REFLECTION = 8;
	
	public static final Integer COP_LAST = 9;
	
	// 羽データ
	public static final Integer[][] WING_DATA = {
		/*
		 * {OP,x次羽,防御力,ダメージ増加,ダメージ吸収}
		 */
		{0,0,0,0,0},
		// サタンの羽
		{
			OptionStaticData.ATTACK,
			1,20,12,12
		},
		// 守護天使の羽
		{
			OptionStaticData.MAGIC,
			1,10,12,12
		},
		// 妖精の羽
		{
			0,
			1,10,12,12
		},
		// ミザリーウイング
		{
			OptionStaticData.MAGIC,
			1,10,12,12
		},
		// デビルウイング
		{
			OptionStaticData.ATTACK,
			2,45,32,25
		},
		// ソウルウイング
		{
			OptionStaticData.MAGIC,
			2,30,32,25
		},
		// ホーリーウイング
		{
			OptionStaticData.ATTACK,
			2,30,32,25
		},
		// デスペアーウイング
		{
			OptionStaticData.MAGIC + OptionStaticData.NOROI,
			2,30,32,25
		},
		// ダークウイング
		{
			OptionStaticData.ATTACK + OptionStaticData.MAGIC,
			2,40,32,25
		},
		// 君主のマント
		{
			OptionStaticData.ATTACK,
			4,15,20,0
		},
		// テンペストウイング
		{
			OptionStaticData.ATTACK + OptionStaticData.GUARD,
			3,60,39,39
		},
		// ライジングウイング
		{
			OptionStaticData.MAGIC + OptionStaticData.GUARD,
			3,45,39,39
		},
		// ファントムウイング
		{
			OptionStaticData.ATTACK + OptionStaticData.GUARD,
			3,45,39,39
		},
		// ディメンジョンウイング
		{
			OptionStaticData.ATTACK + OptionStaticData.NOROI,
			3,45,39,39
		},
		// スプリームウイング
		{
			OptionStaticData.ATTACK + OptionStaticData.MAGIC,
			3,55,39,39
		},
		// 帝王のマント
		{
			OptionStaticData.ATTACK + OptionStaticData.GUARD,
			3,45,39,24
		}
	};
	
	
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

