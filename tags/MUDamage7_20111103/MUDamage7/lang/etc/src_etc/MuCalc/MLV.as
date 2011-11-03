package MuCalc
{
	import flash.display.Bitmap;
	
	import mx.controls.Image;
	
	public class MLV
	{
		//情報*****************************************
		//共通=========================================
		//防御向上
		static public var inf_pvpavoid:Array = ["PvP Defence Rate",600,1300,2100,3000,4000];
		static public var inf_poison_resist:Array = ["Resist Poison",1,2,3,4,5];//%
		static public var inf_lightning_resist:Array = ["Resist Lightning",1,2,3,4,5];//%
		static public var inf_ice_resist:Array = ["Resist Ice",1,2,3,4,5];//%
		static public var inf_def:Array = ["Defence Increase",50,100,150,200,250];
		static public var inf_sd:Array = ["Max SD Increase",300,450,600,750,900];
		static public var inf_sd_heal:Array = ["Increase Recovery Speed SD(%)",10,20,30,40,50];//%
		//スキル強化
		static public var inf_hit:Array = ["Dmg Success Rate Increase",400,900,1600,2700,4400];
		static public var inf_hp:Array = ["Max HP Increase",50,100,150,200,300];
		static public var inf_ag:Array = ["Max AG Increase",60,120,180,240,300];
		//攻撃力向上
		static public var inf_pvphit:Array = ["PvP Dmg Rate",1000,2300,4000,6500,10000];
		static public var inf_monster_hp:Array = ["Monster Attack Life Increment(HP/)",40,20,14,10,8];
		static public var inf_monster_mana:Array = ["Monster Attack Mana Increment(Mana/)",40,20,14,10,8];
		static public var inf_monster_sd:Array = ["Monster Attack SD Increment(SD/)",7,6,5,4,3];
		static public var inf_max_attack:Array = ["Max Dmg Increase",10,20,30,40,50];
		static public var inf_min_attack:Array = ["Min Attack Increase",8,16,24,32,40];
		static public var inf_max_magic:Array = ["Max Magic Increase",10,20,30,40,50];
		static public var inf_min_magic:Array = ["Min Magic Increase",8,16,24,32,40];
		static public var inf_max_attack_magic:Array = ["Max Damage Increase",10,20,30,40,50];
		static public var inf_min_attack_magic:Array = ["Min Damage Increase",8,16,24,32,40];
		//成長・凡庸
		static public var inf_endurance1:Array = ["Duration Reduction 1 (%)",20,40,60,80,100];//%
		static public var inf_endurance2:Array = ["Duration Reduction 2 (%)",20,40,60,80,100];//%
		static public var inf_ah:Array = ["AH(%)",1,2,3,4,5];//%
		static public var inf_zen:Array = ["Zen Increase (%)",40,80,120,160,200];//%
		static public var inf_exp:Array = ["Exp Increase (%)",8,16,24,32,40];//%
		static public var inf_mana_dec:Array = ["Consumption Mana Decrease (%)",5,10,15,20,25];//%
		static public var inf_pet_endurance:Array = ["Increase Pet Available Duration ",100,200,300,400,500];
		//ナイト
		static public var inf_sl:Array = ["Swell Life Increase(%)",
											{skill:2,mana:22,ag:26,range:0},//%
											{skill:4,mana:22,ag:28,range:0},
											{skill:6,mana:22,ag:31,range:0},
											{skill:8,mana:22,ag:33,range:0},
											{skill:10,mana:22,ag:36,range:0}];
		static public var inf_tc:Array = ["Twisting Slash Increase",
											{skill:2,mana:10,ag:10,range:2},
											{skill:4,mana:10,ag:10,range:2},
											{skill:6,mana:10,ag:10,range:2},
											{skill:8,mana:10,ag:10,range:2},
											{skill:10,mana:10,ag:10,range:3}];
		static public var inf_gb:Array = ["Death Stab Increase",
											{skill:5,mana:15,ag:13,range:2},
											{skill:10,mana:15,ag:14,range:2},
											{skill:15,mana:15,ag:15,range:2},
											{skill:20,mana:15,ag:16,range:2},
											{skill:25,mana:15,ag:18,range:3}];
		static public var inf_oi:Array = ["Earth Break Increase",
											{skill:5,mana:25,ag:22,range:3},
											{skill:10,mana:25,ag:24,range:3},
											{skill:15,mana:25,ag:26,range:3},
											{skill:20,mana:25,ag:28,range:3},
											{skill:25,mana:25,ag:30,range:4}];
		//ウィザード
		static public var inf_sb:Array = ["Soul Barrier Increase (%)",
											{skill:3,mana:77,ag:24,range:0},//%
											{skill:6,mana:84,ag:26,range:0},
											{skill:9,mana:91,ag:28,range:0},
											{skill:12,mana:98,ag:30,range:0},
											{skill:15,mana:105,ag:33,range:0}];
		static public var inf_hell_fire:Array = [	"Hellfire Increase",
													{skill:15,mana:176,ag:0,range:0},
													{skill:30,mana:192,ag:0,range:0},
													{skill:45,mana:208,ag:0,range:0},
													{skill:60,mana:224,ag:0,range:0},
													{skill:75,mana:240,ag:0,range:1}];
		static public var inf_soul_the_end:Array = [	"Evil Spirits Increase",
														{skill:5,mana:99,ag:0,range:0},
														{skill:10,mana:108,ag:0,range:0},
														{skill:15,mana:117,ag:0,range:0},
														{skill:20,mana:126,ag:0,range:0},
														{skill:25,mana:135,ag:0,range:0}];
		static public var inf_sudden_ice:Array = ["Ice Storm Increase",
													{skill:5,mana:110,ag:5,range:0,damage:85},
													{skill:10,mana:120,ag:6,range:0,damage:90},
													{skill:15,mana:130,ag:6,range:0,damage:95},
													{skill:20,mana:140,ag:7,range:0,damage:100},
													{skill:25,mana:150,ag:7,range:0,damage:105}];
		//エルフ
		static public var inf_h:Array = [	"Heal Increase(%)",
											{skill:10,mana:22,ag:0,range:0},
											{skill:20,mana:24,ag:0,range:0},
											{skill:30,mana:26,ag:0,range:0},
											{skill:40,mana:28,ag:0,range:0},
											{skill:50,mana:30,ag:0,range:0}];
		static public var inf_midareuti:Array = [	"Triple Shot Increase",
													{skill:2,mana:5,ag:0,range:0},
													{skill:4,mana:5,ag:0,range:0},
													{skill:6,mana:5,ag:0,range:0},
													{skill:8,mana:5,ag:0,range:0},
													{skill:10,mana:5,ag:0,range:0}];
		static public var inf_g:Array = [	"Great Defense Increase (ene/)",
											{skill:7.6,mana:33,ag:0,range:0,damage:2},
											{skill:7.2,mana:36,ag:0,range:0,damage:4},
											{skill:6.8,mana:39,ag:0,range:0,damage:6},
											{skill:6.4,mana:42,ag:0,range:0,damage:8},
											{skill:6.0,mana:45,ag:0,range:0,damage:10}];
		static public var inf_a:Array = [	"Greater Damage Increse(ene/)",
											{skill:6.7,mana:44,ag:0,range:0,damage:3},
											{skill:6.2,mana:48,ag:0,range:0,damage:6},
											{skill:5.9,mana:52,ag:0,range:0,damage:9},
											{skill:5.6,mana:56,ag:0,range:0,damage:12},
											{skill:5.3,mana:60,ag:0,range:0,damage:15}];
		//魔剣士
		static public var inf_tc_ma:Array = [	"Twisting Slash Increase",
												{skill:2,mana:10,ag:11,range:2},
												{skill:4,mana:10,ag:12,range:2},
												{skill:6,mana:10,ag:13,range:2},
												{skill:8,mana:10,ag:14,range:2},
												{skill:10,mana:10,ag:15,range:3}];
		static public var inf_shining_blast:Array = [	"Cometfall Increase",
														{skill:10,mana:165,ag:0,range:0},
														{skill:20,mana:180,ag:0,range:0},
														{skill:30,mana:195,ag:0,range:0},
														{skill:40,mana:210,ag:0,range:0},
														{skill:50,mana:225,ag:0,range:0}];
		static public var inf_soul_the_end_ma:Array = [	"Evil Spirits Increase",
														{skill:5,mana:99,ag:0,range:0},
														{skill:10,mana:108,ag:0,range:0},
														{skill:15,mana:117,ag:0,range:0},
														{skill:20,mana:126,ag:0,range:0},
														{skill:25,mana:135,ag:0,range:0}];
		static public var inf_ba:Array = ["Fire Slash Increase",
											{skill:5,mana:15,ag:22,range:0},
											{skill:10,mana:15,ag:24,range:0},
											{skill:15,mana:15,ag:26,range:0},
											{skill:20,mana:15,ag:28,range:0},
											{skill:25,mana:15,ag:30,range:0}];
		static public var inf_ps:Array = ["Power Slash Increase",
											{skill:5,mana:15,ag:0,range:0},
											{skill:10,mana:15,ag:0,range:0},
											{skill:15,mana:15,ag:0,range:0},
											{skill:20,mana:15,ag:0,range:0},
											{skill:25,mana:15,ag:0,range:0}];
		//ダークロード
		static public var inf_earth_shake:Array = [	"Earthquake Increase",
														{skill:5,mana:0,ag:55,range:0},
														{skill:10,mana:0,ag:60,range:0},
														{skill:15,mana:0,ag:65,range:0},
														{skill:20,mana:0,ag:70,range:0},
														{skill:25,mana:0,ag:75,range:0}];
		static public var inf_fb:Array = ["Fire Burst Increase",
											{skill:5,mana:25,ag:0,range:0},
											{skill:10,mana:25,ag:0,range:0},
											{skill:15,mana:25,ag:0,range:0},
											{skill:20,mana:25,ag:0,range:0},
											{skill:25,mana:25,ag:0,range:0}];
		static public var inf_fs:Array = ["Fire Scream Increase",
											{skill:5,mana:45,ag:11,range:0},
											{skill:10,mana:45,ag:12,range:0},
											{skill:15,mana:45,ag:13,range:0},
											{skill:20,mana:45,ag:14,range:0},
											{skill:25,mana:45,ag:15,range:0}];
		//召喚師
		static public var inf_life:Array = [	"Drain Life Increase",
											{skill:2,mana:55,ag:0,range:0},
											{skill:4,mana:60,ag:0,range:0},
											{skill:6,mana:65,ag:0,range:0},
											{skill:8,mana:70,ag:0,range:0},
											{skill:10,mana:75,ag:0,range:0}];
		static public var inf_sleep:Array = [	"Sleep Increase",
													{skill:0,mana:0,ag:0,range:0},
													{skill:0,mana:0,ag:0,range:0},
													{skill:0,mana:0,ag:0,range:0},
													{skill:0,mana:0,ag:0,range:0},
													{skill:0,mana:0,ag:0,range:0}];
		static public var inf_chain:Array = [	"Chain Lightning Increase",
											{skill:5,mana:93,ag:0,range:0},
											{skill:10,mana:102,ag:0,range:0},
											{skill:15,mana:110,ag:0,range:0},
											{skill:20,mana:119,ag:0,range:0},
											{skill:25,mana:127,ag:0,range:0}];
		static public var inf_light:Array = [	"Lightning Shock Increase",
											{skill:2,mana:126,ag:8,range:0},
											{skill:4,mana:138,ag:9,range:0},
											{skill:6,mana:149,ag:10,range:0},
											{skill:8,mana:161,ag:11,range:0},
											{skill:10,mana:173,ag:12,range:0}];
		static public var num:int=50;
		//コンストラクタ*****************************************
		public function MLV()
		{
			createImage();
		}
		//MLVツリーの画像****************************************
		[Bindable]
		[Embed(source="../img/system20-33.jpg")]//魔剣士の最大攻撃魔力
		private var imgMLV0:Class;
		[Bindable]
		[Embed(source="../img/system20-34.jpg")]//魔剣士の最小攻撃魔力
		private var imgMLV1:Class;
		[Bindable]
		[Embed(source="../img/system20-21.jpg")]//魔剣士のTC
		private var imgMLV2:Class;
		[Bindable]
		[Embed(source="../img/system20-3.jpg")]
		private var imgMLV3:Class;
		[Bindable]
		[Embed(source="../img/system20-4.jpg")]
		private var imgMLV4:Class;
		[Bindable]
		[Embed(source="../img/system20-5.jpg")]
		private var imgMLV5:Class;
		[Bindable]
		[Embed(source="../img/system20-6.jpg")]
		private var imgMLV6:Class;
		[Bindable]
		[Embed(source="../img/system20-7.jpg")]
		private var imgMLV7:Class;
		[Bindable]
		[Embed(source="../img/system20-8.jpg")]
		private var imgMLV8:Class;
		[Bindable]
		[Embed(source="../img/system20-9.jpg")]
		private var imgMLV9:Class;
		[Bindable]
		[Embed(source="../img/system20-10.jpg")]
		private var imgMLV10:Class;
		[Bindable]
		[Embed(source="../img/system20-11.jpg")]
		private var imgMLV11:Class;
		[Bindable]
		[Embed(source="../img/system20-12.jpg")]
		private var imgMLV12:Class;
		[Bindable]
		[Embed(source="../img/system20-13.jpg")]
		private var imgMLV13:Class;
		[Bindable]
		[Embed(source="../img/system20-14.jpg")]
		private var imgMLV14:Class;
		[Bindable]
		[Embed(source="../img/system20-15.jpg")]
		private var imgMLV15:Class;
		[Bindable]
		[Embed(source="../img/system20-16.jpg")]
		private var imgMLV16:Class;
		[Bindable]
		[Embed(source="../img/system20-17.jpg")]
		private var imgMLV17:Class;
		[Bindable]
		[Embed(source="../img/system20-18.jpg")]
		private var imgMLV18:Class;
		[Bindable]
		[Embed(source="../img/system20-19.jpg")]
		private var imgMLV19:Class;
		[Bindable]
		[Embed(source="../img/system20-20.jpg")]
		private var imgMLV20:Class;
		[Bindable]
		[Embed(source="../img/system20-21.jpg")]
		private var imgMLV21:Class;
		[Bindable]
		[Embed(source="../img/system20-22.jpg")]
		private var imgMLV22:Class;
		[Bindable]
		[Embed(source="../img/system20-23.jpg")]
		private var imgMLV23:Class;
		[Bindable]
		[Embed(source="../img/system20-24.jpg")]
		private var imgMLV24:Class;
		[Bindable]
		[Embed(source="../img/system20-25.jpg")]
		private var imgMLV25:Class;
		[Bindable]
		[Embed(source="../img/system20-26.jpg")]
		private var imgMLV26:Class;
		[Bindable]
		[Embed(source="../img/system20-27.jpg")]
		private var imgMLV27:Class;
		[Bindable]
		[Embed(source="../img/system20-28.jpg")]
		private var imgMLV28:Class;
		[Bindable]
		[Embed(source="../img/system20-29.jpg")]
		private var imgMLV29:Class;
		[Bindable]
		[Embed(source="../img/system20-30.jpg")]
		private var imgMLV30:Class;
		[Bindable]
		[Embed(source="../img/system20-31.jpg")]
		private var imgMLV31:Class;
		[Bindable]
		[Embed(source="../img/system20-32.jpg")]
		private var imgMLV32:Class;
		[Bindable]
		[Embed(source="../img/system20-33.jpg")]
		private var imgMLV33:Class;
		[Bindable]
		[Embed(source="../img/system20-34.jpg")]
		private var imgMLV34:Class;
		[Bindable]
		[Embed(source="../img/system20-35.jpg")]
		private var imgMLV35:Class;
		[Bindable]
		[Embed(source="../img/system20-36.jpg")]
		private var imgMLV36:Class;
		[Bindable]
		[Embed(source="../img/system20-37.jpg")]
		private var imgMLV37:Class;
		[Bindable]
		[Embed(source="../img/system20-38.jpg")]
		private var imgMLV38:Class;
		[Bindable]
		[Embed(source="../img/system20-39.jpg")]
		private var imgMLV39:Class;
		[Bindable]
		[Embed(source="../img/system20-40.jpg")]
		private var imgMLV40:Class;
		[Bindable]
		[Embed(source="../img/system20-41.jpg")]
		private var imgMLV41:Class;
		[Bindable]
		[Embed(source="../img/system20-42.jpg")]
		private var imgMLV42:Class;
		[Bindable]
		[Embed(source="../img/system20-43.jpg")]
		private var imgMLV43:Class;
		[Bindable]
		[Embed(source="../img/system20-44.jpg")]
		private var imgMLV44:Class;
		[Bindable]
		[Embed(source="../img/system20-45.jpg")]
		private var imgMLV45:Class;
		[Bindable]
		[Embed(source="../img/system20-39.jpg")]//魔剣士の悪霊
		private var imgMLV46:Class;
		[Bindable]
		[Embed(source="../img/system20-47.jpg")]
		private var imgMLV47:Class;
		[Bindable]
		[Embed(source="../img/system20-48.jpg")]
		private var imgMLV48:Class;
		[Bindable]
		[Embed(source="../img/system20-49.jpg")]
		private var imgMLV49:Class;
		[Bindable]
		[Embed(source="../img/system20-50.jpg")]
		private var imgMLV50:Class;
		//Imageオブジェクトの作成
		public var img:Array = new Array();
		//画像イメージの作成
		private function createImage():void{
			//イメージオブジェクトの作成
			img[0] = new Image();
			img[1] = new Image();
			img[2] = new Image();
			img[3] = new Image();
			img[4] = new Image();
			img[5] = new Image();
			img[6] = new Image();
			img[7] = new Image();
			img[8] = new Image();
			img[9] = new Image();
			img[10] = new Image();
			img[11] = new Image();
			img[12] = new Image();
			img[13] = new Image();
			img[14] = new Image();
			img[15] = new Image();
			img[16] = new Image();
			img[17] = new Image();
			img[18] = new Image();
			img[19] = new Image();
			img[20] = new Image();
			img[21] = new Image();
			img[22] = new Image();
			img[23] = new Image();
			img[24] = new Image();
			img[25] = new Image();
			img[26] = new Image();
			img[27] = new Image();
			img[28] = new Image();
			img[29] = new Image();
			img[30] = new Image();
			img[31] = new Image();
			img[32] = new Image();
			img[33] = new Image();
			img[34] = new Image();
			img[35] = new Image();
			img[36] = new Image();
			img[37] = new Image();
			img[38] = new Image();
			img[39] = new Image();
			img[40] = new Image();
			img[41] = new Image();
			img[42] = new Image();
			img[43] = new Image();
			img[44] = new Image();
			img[45] = new Image();
			img[46] = new Image();
			img[47] = new Image();
			img[48] = new Image();
			img[49] = new Image();
			img[50] = new Image();
			//名前付け
			img[0].name = "0";
			img[1].name = "1";
			img[2].name = "2";
			img[3].name = "3";
			img[4].name = "4";
			img[5].name = "5";
			img[6].name = "6";
			img[7].name = "7";
			img[8].name = "8";
			img[9].name = "9";
			img[10].name = "10";
			img[11].name = "11";
			img[12].name = "12";
			img[13].name = "13";
			img[14].name = "14";
			img[15].name = "15";
			img[16].name = "16";
			img[17].name = "17";
			img[18].name = "18";
			img[19].name = "19";
			img[20].name = "20";
			img[21].name = "21";
			img[22].name = "22";
			img[23].name = "23";
			img[24].name = "24";
			img[25].name = "25";
			img[26].name = "26";
			img[27].name = "27";
			img[28].name = "28";
			img[29].name = "29";
			img[30].name = "30";
			img[31].name = "31";
			img[32].name = "32";
			img[33].name = "33";
			img[34].name = "34";
			img[35].name = "35";
			img[36].name = "36";
			img[37].name = "37";
			img[38].name = "38";
			img[39].name = "39";
			img[40].name = "40";
			img[41].name = "41";
			img[42].name = "42";
			img[43].name = "43";
			img[44].name = "44";
			img[45].name = "45";
			img[46].name = "46";
			img[43].name = "47";
			img[44].name = "48";
			img[45].name = "49";
			img[46].name = "50";
			//初期化
			img[0].source = new Bitmap();
			img[1].source = new Bitmap();
			img[2].source = new Bitmap();
			img[3].source = new Bitmap();
			img[4].source = new Bitmap();
			img[5].source = new Bitmap();
			img[6].source = new Bitmap();
			img[7].source = new Bitmap();
			img[8].source = new Bitmap();
			img[9].source = new Bitmap();
			img[10].source = new Bitmap();
			img[11].source = new Bitmap();
			img[12].source = new Bitmap();
			img[13].source = new Bitmap();
			img[14].source = new Bitmap();
			img[15].source = new Bitmap();
			img[16].source = new Bitmap();
			img[17].source = new Bitmap();
			img[18].source = new Bitmap();
			img[19].source = new Bitmap();
			img[20].source = new Bitmap();
			img[21].source = new Bitmap();
			img[22].source = new Bitmap();
			img[23].source = new Bitmap();
			img[24].source = new Bitmap();
			img[25].source = new Bitmap();
			img[26].source = new Bitmap();
			img[27].source = new Bitmap();
			img[28].source = new Bitmap();
			img[29].source = new Bitmap();
			img[30].source = new Bitmap();
			img[31].source = new Bitmap();
			img[32].source = new Bitmap();
			img[33].source = new Bitmap();
			img[34].source = new Bitmap();
			img[35].source = new Bitmap();
			img[36].source = new Bitmap();
			img[37].source = new Bitmap();
			img[38].source = new Bitmap();
			img[39].source = new Bitmap();
			img[40].source = new Bitmap();
			img[41].source = new Bitmap();
			img[42].source = new Bitmap();
			img[43].source = new Bitmap();
			img[44].source = new Bitmap();
			img[45].source = new Bitmap();
			img[46].source = new Bitmap();
			img[47].source = new Bitmap();
			img[48].source = new Bitmap();
			img[49].source = new Bitmap();
			img[50].source = new Bitmap();
			//イメージのコピー
			img[0].source = imgMLV0;
			img[1].source = imgMLV1;
			img[2].source = imgMLV2;
			img[3].source = imgMLV3;
			img[4].source = imgMLV4;
			img[5].source = imgMLV5;
			img[6].source = imgMLV6;
			img[7].source = imgMLV7;
			img[8].source = imgMLV8;
			img[9].source = imgMLV9;
			img[10].source = imgMLV10;
			img[11].source = imgMLV11;
			img[12].source = imgMLV12;
			img[13].source = imgMLV13;
			img[14].source = imgMLV14;
			img[15].source = imgMLV15;
			img[16].source = imgMLV16;
			img[17].source = imgMLV17;
			img[18].source = imgMLV18;
			img[19].source = imgMLV19;
			img[20].source = imgMLV20;
			img[21].source = imgMLV21;
			img[22].source = imgMLV22;
			img[23].source = imgMLV23;
			img[24].source = imgMLV24;
			img[25].source = imgMLV25;
			img[26].source = imgMLV26;
			img[27].source = imgMLV27;
			img[28].source = imgMLV28;
			img[29].source = imgMLV29;
			img[30].source = imgMLV30;
			img[31].source = imgMLV31;
			img[32].source = imgMLV32;
			img[33].source = imgMLV33;
			img[34].source = imgMLV34;
			img[35].source = imgMLV35;
			img[36].source = imgMLV36;
			img[37].source = imgMLV37;
			img[38].source = imgMLV38;
			img[39].source = imgMLV39;
			img[40].source = imgMLV40;
			img[41].source = imgMLV41;
			img[42].source = imgMLV42;
			img[43].source = imgMLV43;
			img[44].source = imgMLV44;
			img[45].source = imgMLV45;
			img[46].source = imgMLV46;
			img[47].source = imgMLV47;
			img[48].source = imgMLV48;
			img[49].source = imgMLV49;
			img[50].source = imgMLV50;
			//ツールチップ
			img[0].toolTip = inf_max_attack_magic.toString();
			img[1].toolTip = inf_min_attack_magic.toString();
			img[2].toolTip = tool(inf_tc_ma);
			img[3].toolTip = inf_pvpavoid.toString();
			img[4].toolTip = inf_poison_resist.toString();
			img[5].toolTip = inf_lightning_resist.toString();
			img[6].toolTip = inf_ice_resist.toString();
			img[7].toolTip = inf_def.toString();
			img[8].toolTip = inf_hit.toString();
			img[9].toolTip = inf_hp.toString();
			img[10].toolTip = inf_ag.toString();
			img[11].toolTip = inf_pvphit.toString();
			img[12].toolTip = inf_monster_hp.toString();
			img[13].toolTip = inf_monster_mana.toString();
			img[14].toolTip = inf_monster_sd.toString();
			img[15].toolTip = inf_endurance1.toString();
			img[16].toolTip = inf_endurance2.toString();
			img[17].toolTip = inf_ah.toString();
			img[18].toolTip = inf_zen.toString();
			img[19].toolTip = inf_exp.toString();
			img[20].toolTip = tool(inf_sl);
			img[21].toolTip = tool(inf_tc);
			img[22].toolTip = tool(inf_sb);
			img[23].toolTip = tool(inf_hell_fire);
			img[24].toolTip = tool(inf_h);
			img[25].toolTip = tool(inf_midareuti);
			img[26].toolTip = tool(inf_shining_blast);
			img[27].toolTip = tool(inf_earth_shake);
			img[28].toolTip = tool(inf_fb);
			img[29].toolTip = inf_sd.toString();
			img[30].toolTip = inf_sd_heal.toString();
			img[31].toolTip = inf_max_attack.toString();
			img[32].toolTip = inf_min_attack.toString();
			img[33].toolTip = inf_max_magic.toString();
			img[34].toolTip = inf_min_magic.toString();
			img[35].toolTip = inf_mana_dec.toString();
			img[36].toolTip = inf_pet_endurance.toString();
			img[37].toolTip = tool(inf_gb);
			img[38].toolTip = tool(inf_oi);
			img[39].toolTip = tool(inf_soul_the_end);
			img[40].toolTip = tool(inf_sudden_ice);
			img[41].toolTip = tool(inf_g);
			img[42].toolTip = tool(inf_a);
			img[43].toolTip = tool(inf_ba);
			img[44].toolTip = tool(inf_ps);
			img[45].toolTip = tool(inf_fs);
			img[46].toolTip = tool(inf_soul_the_end_ma);
			img[47].toolTip = tool(inf_life);
			img[48].toolTip = tool(inf_sleep);
			img[49].toolTip = tool(inf_chain);
			img[50].toolTip = tool(inf_light);
		}
		public function tool(a:Array):String{
			var str:String = a[0] + "\n";
			for(var i:int=1;i<=5;i++){
				if(a[i].skill)str += " Power:+" + a[i].skill;
				if(a[i].mana)str += " Mana Consumption:" + a[i].mana;
				if(a[i].ag)str += " AG Consumption:" + a[i].ag;
				if(a[i].range)str += " Range:" +  a[i].range;
				if(a[i].damage)str += " Dmg Increase:" + a[i].damage;
				str += "\n";
			}
			return str;
		}
		public function getInf(i:int):Array{
			//データを返す
			if(i==0)return inf_max_attack_magic;
			if(i==1)return inf_min_attack_magic;
			if(i==2)return inf_tc_ma;
			if(i==3)return inf_pvpavoid;
			if(i==4)return inf_poison_resist;
			if(i==5)return inf_lightning_resist;
			if(i==6)return inf_ice_resist;
			if(i==7)return inf_def;
			if(i==8)return inf_hit;
			if(i==9)return inf_hp;
			if(i==10)return inf_ag;
			if(i==11)return inf_pvphit;
			if(i==12)return inf_monster_hp;
			if(i==13)return inf_monster_mana;
			if(i==14)return inf_monster_sd;
			if(i==15)return inf_endurance1;
			if(i==16)return inf_endurance2;
			if(i==17)return inf_ah;
			if(i==18)return inf_zen;
			if(i==19)return inf_exp;
			if(i==20)return inf_sl;
			if(i==21)return inf_tc;
			if(i==22)return inf_sb;
			if(i==23)return inf_hell_fire;
			if(i==24)return inf_h;
			if(i==25)return inf_midareuti;
			if(i==26)return inf_shining_blast;
			if(i==27)return inf_earth_shake;
			if(i==28)return inf_fb;
			if(i==29)return inf_sd;
			if(i==30)return inf_sd_heal;
			if(i==31)return inf_max_attack;
			if(i==32)return inf_min_attack;
			if(i==33)return inf_max_magic;
			if(i==34)return inf_min_magic;
			if(i==35)return inf_mana_dec;
			if(i==36)return inf_pet_endurance;
			if(i==37)return inf_gb;
			if(i==38)return inf_oi;
			if(i==39)return inf_soul_the_end;
			if(i==40)return inf_sudden_ice;
			if(i==41)return inf_g;
			if(i==42)return inf_a;
			if(i==43)return inf_ba;
			if(i==44)return inf_ps;
			if(i==45)return inf_fs;
			if(i==46)return inf_soul_the_end_ma;
			if(i==47)return inf_ba;
			if(i==48)return inf_ps;
			if(i==49)return inf_fs;
			if(i==50)return inf_soul_the_end_ma;
			return null;
		}
	}
}
