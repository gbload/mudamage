package MuData
{
	internal class Etc
	{
		public function Etc()
		{
		}
static public var wing:Array = [
["なし",[1,1,1,1,1,1,1],[0,0,0,0],0,0,0,0,0],
["サタンの羽",[1,0,0,1,0,0,0],[1,0,0,0],1,180,20,12,12],
["守護天使の羽",[0,1,0,1,0,0,0],[0,1,0,0],1,180,10,12,12],
["妖精の羽",[0,0,1,0,0,0,0],[0,0,0,0],1,180,10,12,12],
["ミザリーウイング",[0,0,0,0,0,1,0],[0,1,0,0],1,180,10,12,12],
["デビルウイング",[1,0,0,0,0,0,0],[1,0,0,0],2,215,45,32,25],
["ソウルウイング",[0,1,0,0,0,0,0],[0,1,0,0],2,215,30,32,25],
["ホーリーウイング",[0,0,1,0,0,0,0],[1,0,0,0],2,215,30,32,25],
["デスペアーウイング",[0,0,0,0,0,1,0],[0,1,0,1],2,215,30,32,25],
["ダークウイング",[0,0,0,1,0,0,0],[1,1,0,0],2,215,40,32,25],
["君主のマント",[0,0,0,0,1,0,0],[1,0,0,0],4,180,15,20,0],
["超人のマント",[0,0,0,0,0,0,1],[1,0,0,0],4,180,15,20,0],
["テンペストウイング",[1,0,0,0,0,0,0],[1,0,1,0],3,400,60,39,39],
["ライジングウイング",[0,1,0,0,0,0,0],[0,1,1,0],3,400,45,39,39],
["ファントムウイング",[0,0,1,0,0,0,0],[1,0,1,0],3,400,45,39,39],
["ディメンションウイング",[0,0,0,0,0,1,0],[0,1,1,1],3,400,45,39,39],
["スプリームウイング",[0,0,0,1,0,0,0],[1,1,0,0],3,400,55,39,39],
["帝王のマント",[0,0,0,0,1,0,0],[1,0,1,0],3,400,45,39,24],
["君臨のマント",[0,0,0,0,0,0,1],[1,0,1,0],3,400,45,39,24]
];
static public var skill:Array = [
["真空斬り",0,[2,-1,-1,-1],"スキル",[0,0,0,0,0],[1,0,0,1,1,0,0],"",1,"",0],
["烈斬",0,[6,-1,-1,-1],"スキル",[0,0,0,0,0],[1,0,0,1,1,0,0],"",1,"",0],
["牙突",0,[2,-1,-1,-1],"スキル",[0,0,0,0,0],[1,0,0,1,1,0,0],"",1,"",0],
["飛燕斬り",0,[5,-1,-1,-1],"スキル",[0,0,0,0,0],[1,0,0,1,1,0,0],"",1,"",0],
["ファイナルスラッシュ",0,[3,-1,-1,-1],"スキル",[0,0,0,0,0],[1,0,0,1,0,0,0],"",1,"",0],
["レイドショット",30,[-1,2,-1,-1],"スキル",[0,0,0,0,0],[1,0,0,0,0,0,0],"ディノラント",0,"",0],
["トルネードクラッシュ",0,[4,4,4,4],"スキル",[80,0,0,0,0],[1,0,0,0,0,0,0],"",0,"風",0],
["ゴッドブロー",70,[1,1,1,1],"スキル",[160,0,0,0,0],[1,0,0,0,0,0,0],"",0,"風",0],
["オメガインパクト",60,[23,23,23,23],"スキル",[170,0,0,0,0],[1,0,0,0,0,0,0],"",0,"地",0],
["アブソリュートゼロ",90,[24,24,24,24],"スキル",[220,0,0,0,0],[1,0,0,0,0,0,0],"",0,"氷",0],
//["プラズマストーム",60,[-1,-1,0,-1],"スキル",[0,0,0,0,0],[1,1,1,1,1,1,0],"フェンリル",0,"",0],
["デスプラント",12,[7,8,9,-1],"魔法",[0,0,0,140,0],[0,1,0,1,0,0,0],"",0,"毒",0],
["バーニングハンマー",25,[7,8,9,-1],"魔法",[0,0,0,160,0],[0,1,0,1,0,0,0],"",0,"炎",0],
["ストームクラッカー",40,[7,8,9,-1],"魔法",[0,0,0,180,0],[0,1,0,1,0,0,0],"",0,"風",0],
["ソウルジエンド",45,[7,8,9,-1],"魔法",[0,0,0,220,0],[0,1,0,1,0,0,0],"",0,"",0],
["ヘルファイア",120,[11,11,11,11],"魔法",[0,0,0,260,0],[0,1,0,1,0,0,0],"",0,"炎",0],
["シャイニングブラスト",70,[7,8,9,-1],"魔法",[0,0,0,500,0],[0,1,0,1,0,0,0],"",0,"稲妻",0],
["インフェルノ",100,[10,10,10,10],"魔法",[0,0,0,724,0],[0,1,0,1,0,0,0],"",0,"炎",0],
["サドゥンアイス",80,[7,8,9,-1],"魔法",[150,0,0,849,0],[0,1,0,0,0,0,0],"",0,"氷",6],
["デスポイズン",95,[7,8,9,-1],"魔法",[150,0,0,953,0],[0,1,0,0,0,0,0],"",0,"毒",0],
["ヘルバースト",1320,[0,0,0,0],"魔法",[150,0,0,1052,0],[0,1,0,0,0,0,0],"",0,"炎",1],
["乱れ撃ち",0,[12,12,12,12],"スキル",[0,0,0,0,0],[0,0,1,0,0,0,0],"",1,"",0],
["スティンガー",70,[0,0,0,0],"スキル",[130,0,0,0,0],[0,0,1,0,0,0,0],"",0,"風",0],
["アイスアロー",105,[12,0,0,-1],"スキル",[0,0,646,0,0],[0,0,1,0,0,0,0],"",0,"氷",0],
["マルチショット",40,[12,12,12,12],"スキル",[220,0,0,0,0],[0,0,1,0,0,0,0],"",0,"",0],
["パワースラッシュ",0,[1,-1,-1,-1],"スキル",[0,0,0,0,0],[0,0,0,1,0,0,0],"",1,"",0],
["ブラッドアタック",80,[13,13,13,13],"スキル",[0,596,0,0,0],[0,0,0,1,0,0,0],"",0,"毒",0],
["フレイムストライク",140,[26,26,26,26],"スキル",[220,0,0,0,0],[0,0,0,1,0,0,0],"",0,"炎",0],
["ギガンティックストーム",110,[22,22,22,22],"魔法",[220,0,0,1058,0],[0,0,0,1,0,0,0],"",0,"風",0],
["フォース",10,[14,15,0,15],"スキル",[0,0,0,0,0],[0,0,0,0,1,0,0],"",0,"",0],
["フォースウェーブ",50,[14,15,0,15],"スキル",[0,0,0,0,0],[0,0,0,0,1,0,0],"",1,"",0],
["ファイアバースト",100,[14,15,0,15],"スキル",[0,0,0,79,0],[0,0,0,0,1,0,0],"",0,"",0],
["エレクトリックスパーク",250,[0,0,0,0],"スキル",[0,0,0,126,340],[0,0,0,0,1,0,0],"",0,"",0],
["ファイアスクリーム",130,[1,16,0,17],"スキル",[0,0,0,150,70],[0,0,0,0,1,0,0],"",0,"",0],
["カオティックディセイアー",140,[1,16,0,17],"スキル",[220,0,0,84,0],[0,0,0,0,1,0,0],"",0,"",5],
["アースシェイク",150,[29,29,29,29],"スキル",[0,0,0,0,0],[0,0,0,0,1,0,0],"ダークホース",0,"稲妻",2],
["ライフドレイン",35,[20,21,0,-1],"魔法",[0,0,0,150,0],[0,0,0,0,0,1,0],"",0,"",0],
["チェーンライトニング",70,[18,19,0,-1],"魔法",[0,0,0,245,0],[0,0,0,0,0,1,0],"",0,"稲妻",0],
["ライトニングショック",95,[25,25,25,25],"魔法",[0,0,0,823,0],[0,0,0,0,0,1,0],"",0,"稲妻",0],
["エクスプロージョン",40,[28,28,28,28],"魔法",[0,0,0,0,0],[0,0,0,0,0,1,0],"",1,"炎",3],
["レクイエム",65,[28,28,28,28],"魔法",[0,0,0,0,0],[0,0,0,0,0,1,0],"",1,"風",3],
["ポリューション",80,[28,28,28,28],"魔法",[0,0,0,0,0],[0,0,0,0,0,1,0],"",1,"",3],
["フレイムハンド(単体)",0,[27,27,27,27],"魔法",[0,0,0,0,0],[0,0,0,0,1,0,0],"",0,"",4],
["フレイムハンド(範囲)",0,[27,27,27,27],"魔法",[0,0,0,0,0],[0,0,0,0,1,0,0],"",0,"",4],
["プラズマストーム",60,[24,24,24,24],"スキル",[0,0,0,0,0],[1,1,1,1,1,1,0],"フェンリル",0,"",0],
["クルリンブロー",0,[1,1,1,1],"スキル",[0,0,0,0,0],[0,0,0,0,0,0,1],"",1,"",0],
["ビーストアッパー",0,[1,1,1,1],"スキル",[0,0,0,0,0],[0,0,0,0,0,0,1],"",1,"",0],
["チェーンドライブ",70,[1,1,1,1],"スキル",[0,0,0,0,0],[0,0,0,0,0,0,1],"",0,"",0],
["ダークサイド",0,[1,1,1,1],"スキル",[0,0,0,0,0],[0,0,0,0,0,0,1],"",0,"",0],
["ドラゴンスペル",0,[1,1,1,1],"スキル",[0,0,0,0,0],[0,0,0,0,0,0,1],"",0,"",0]
];
static public var map:Array = [
"BC門・石造",
"ロレンシア",
"ノリア",
"エルベランド",
"デビアス",
"ダンジョン",
"ロストタワー",
"アトランス",
"タルカン",
"イカロス",
"アイダ",
"クライウルフ",
"クライウルフ(攻防戦)",
"カントル",
"ラクリオン",
"ヴォルカノス",
"試練の地",
"バルガスの兵営・安息所",
"平穏の沼地",
"カルリマ1",
"カルリマ2",
"カルリマ3",
"カルリマ4",
"カルリマ5",
"カルリマ6",
"カルリマ7",
"デビルスクエア1",
"デビルスクエア2",
"デビルスクエア3",
"デビルスクエア4",
"デビルスクエア5",
"デビルスクエア6",
"デビルスクエア7",
"ブラッドキャッスル1",
"ブラッドキャッスル2",
"ブラッドキャッスル3",
"ブラッドキャッスル4",
"ブラッドキャッスル5",
"ブラッドキャッスル6",
"ブラッドキャッスル7",
"ブラッドキャッスル8",
"ドッペルゲンガー",
"カウンターリベリオン"
];
static public  var monster:Array = [
["BC門・石造","BC門・石造",0,0,0,0,0,0,0],
["ロレンシア","スパイダー",2,40,6,8,1,1,8],
["ロレンシア","パージドラゴン",4,80,12,17,3,3,18],
["ロレンシア","パージミノタウロス",6,120,19,26,6,6,28],
["ロレンシア","ハウンド",9,160,25,35,9,9,39],
["ロレンシア","ミノタウロス",12,220,35,44,12,12,50],
["ロレンシア","ソーサリアン",14,260,45,52,14,14,62],
["ロレンシア","ギガンテス",17,500,60,70,18,18,80],
["ロレンシア","骸骨の騎士",19,600,70,78,22,22,93],
["ノリア","パージゴブリン",3,60,9,11,2,2,13],
["ノリア","虹色の蠍",5,100,14,20,4,4,23],
["ノリア","ゴブリン",8,140,22,32,8,8,33],
["ノリア","モスマン",10,180,30,40,10,10,44],
["ノリア","魔界ハンター",13,240,40,48,13,13,56],
["ノリア","マンドレイク",15,320,50,58,15,15,68],
["ノリア","アゴン",16,400,55,62,16,16,74],
["ノリア","ゴーレム",18,550,65,74,20,20,86],
["エルベランド","一角うさぎ",4,60,10,13,3,3,NaN],
["エルベランド","大毒蛾",13,230,37,42,13,13,NaN],
["エルベランド","クレイジーラビット",19,520,68,72,22,22,NaN],
["エルベランド","リカント",24,720,85,90,30,30,NaN],
["エルベランド","カースドリッチ",30,900,105,110,33,36,NaN],
["エルベランド","トーテムゴーレム",36,1200,120,125,50,43,NaN],
["エルベランド","グリズリー",43,2400,130,140,65,52,NaN],
["エルベランド","キャプテングリズリー",48,3000,150,155,80,70,240],
["デビアス","ワーム",20,600,75,80,25,25,80],
["デビアス","アイスバーン",22,650,80,85,27,27,110],
["デビアス","青銅の魔人",24,700,85,90,29,29,120],
["デビアス","アサシン",26,800,95,100,33,33,130],
["デビアス","ビックフット",30,900,105,110,37,37,150],
["デビアス","キングフット",36,1200,120,125,50,43,180],
["デビアス","アイスクイーン",52,4000,155,165,90,76,260],
["ダンジョン","骸骨の騎士",19,600,70,78,22,22,93],
["ダンジョン","槌の子",25,750,90,95,31,31,125],
["ダンジョン","サイクロプス",28,850,100,105,35,35,140],
["ダンジョン","ゴースト",32,1000,110,115,40,39,160],
["ダンジョン","スカルアーチャー",34,1100,115,120,45,41,170],
["ダンジョン","ヘルハウンド",38,1400,125,130,55,45,190],
["ダンジョン","タランチュラ",40,1600,130,135,60,47,200],
["ダンジョン","骸骨の戦士",42,1800,135,140,65,49,210],
["ダンジョン","メイジ",44,2000,140,145,70,55,220],
["ダンジョン","猛毒のミノタウロス",46,2500,145,150,75,61,230],
["ダンジョン","ダークナイト",48,3000,150,155,80,70,240],
["ダンジョン","魔将軍ゴルゴン",55,6000,165,175,100,82,275],
["ロストタワー","シャドー",47,2800,148,153,78,67,235],
["ロストタワー","ポイズンシャドー",50,3500,155,160,85,73,250],
["ロストタワー","呪いの魔法師",54,4000,160,170,95,79,270],
["ロストタワー","ダークホーン",57,4500,170,180,110,85,285],
["ロストタワー","ディアボロス",60,5000,180,195,115,88,300],
["ロストタワー","死霊の騎士",62,5500,190,200,120,91,310],
["ロストタワー","灼熱のゴルゴン",64,6000,200,210,130,94,320],
["ロストタワー","バルロック",67,10000,220,250,160,105,330],
["アトランス","パージバハムート",43,2400,130,140,65,52,215],
["アトランス","ファルネウス",45,2800,135,145,70,58,225],
["アトランス","バルキリー",46,3200,140,150,75,64,230],
["アトランス","バハムート",66,7000,210,230,150,98,330],
["アトランス","シルバーバルキリー",68,8000,230,260,170,110,340],
["アトランス","リザードキング",70,9000,240,270,180,115,350],
["アトランス","ヒドラ",74,19000,250,310,200,125,430],
["タルカン","異形のミュータント",72,10000,250,280,190,120,365],
["タルカン","ガルム",76,13500,260,300,200,130,410],
["タルカン","アイアンホイール",80,17500,280,330,220,150,446],
["タルカン","タルタロス",82,23500,335,385,250,175,500],
["タルカン","ビームナイト",84,26500,375,425,275,190,530],
["タルカン","ザイカン",90,34000,510,590,400,185,550],
["タルカン","デスビームナイト",93,40000,590,650,420,220,575],
["イカロス","アルカモス",75,11500,225,290,195,125,385],
["イカロス","メガクラスト",78,15000,270,320,210,140,430],
["イカロス","クィーンレイナー",83,20000,305,350,235,160,475],
["イカロス","ワイバーン",86,30000,425,480,310,210,570],
["イカロス","メタルクラスト",92,35500,490,540,365,240,620],
["イカロス","機神兵",96,43500,560,610,430,270,690],
["イカロス","ワイアーム",100,53000,650,700,500,305,800],
["イカロス","天空の不死鳥",108,135000,950,1000,600,350,900],
["アイダ","デスツリー",72,11000,250,270,190,90,360],
["アイダ","フォレストオーク",74,11500,260,280,200,95,390],
["アイダ","デスライダー",78,14600,270,290,225,100,400],
["アイダ","ブルーゴーレム",84,26000,280,310,280,125,505],
["アイダ","ウィッチクイーン",94,40500,380,410,360,185,650],
["アイダ","ヘルマイネ",98,50000,550,600,520,300,850],
["アイダ","ブラッティオーク",114,117000,675,710,420,0,NaN],
["アイダ","ブラッティデスライダー",115,88000,795,830,460,0,NaN],
["アイダ","ブラッティゴーレム",117,129700,715,750,470,0,NaN],
["アイダ","ブラッティウィッチクイーン",118,85700,835,870,480,0,NaN],
["クライウルフ","ハンマースカウト",97,45000,530,560,420,250,670],
["クライウルフ","ランススカウト",97,45000,530,560,420,250,670],
["クライウルフ","スカウトアーチャー",97,45000,530,560,420,250,670],
["クライウルフ","ウェアウルフ",118,110000,830,850,680,355,950],
["クライウルフ","スカウトヒーロー",123,120000,890,910,740,340,980],
["クライウルフ","ウェアウルフヒーロー",127,123000,964,1015,800,397,1027],
["クライウルフ","バルラム",132,140000,1075,1140,885,440,1100],
["クライウルフ","ソラム",134,164000,1200,1300,982,500,1173],
["クライウルフ(攻防戦)","ソラム",134,100000,600,700,500,397,NaN],
["クライウルフ(攻防戦)","バルラム",134,90000,600,650,500,397,NaN],
["クライウルフ(攻防戦)","デススピリット",134,95000,600,650,500,397,NaN],
["クライウルフ(攻防戦)","バリスタ",133,500000,900,1000,840,370,NaN],
["クライウルフ(攻防戦)","ダークエルフ",135,1000000,800,900,900,370,NaN],
["クライウルフ(攻防戦)","バルガス",135,400000,1000,1500,800,370,NaN],
["カントル","スプリンターウルフ",80,16000,310,340,230,163,460],
["カントル","アイアンライダー",82,18000,335,365,250,168,490],
["カントル","サテュロス",85,22000,365,395,280,177,540],
["カントル","ブレードハンター",88,32000,408,443,315,195,587],
["カントル","ケンタウロス",93,38500,470,505,370,220,645],
["カントル","ギガンティス",98,43000,546,581,430,250,715],
["カントル","ベルセルク",100,43000,556,588,445,360,750],
["カントル","ジェノサイダー",105,48500,640,675,515,290,810],
["カントル","ベルセルクウォーリア",123,184370,915,990,543,0,NaN],
["カントル","ケンタウロスウォーリア",126,198500,970,1005,570,0,NaN],
["カントル","ギガンティスウォーリア",128,203000,1046,1181,630,0,NaN],
["カントル","ジェノサイダーウォーリア",129,218500,1240,1375,715,0,NaN],
["カントル","ツインテール",117,87500,830,1085,865,440,1080],
["カントル","ペルソナ",118,68000,1168,1213,615,485,1190],
["カントル","ドレッドフィアー",119,94000,946,996,783,905,1015],
["カントル","マヤの手（左）",135,400000,732,932,315,1445,NaN],
["カントル","マヤの手（右）",135,350000,732,932,800,550,NaN],
["カントル","ナイトメア",135,1500000,1225,1468,1000,420,2000],
["ラクリオン","アイスウォーカー",102,68000,1310,1965,615,800,1190],
["ラクリオン","ジャイアントマンモス",112,77000,1441,2017,585,840,1350],
["ラクリオン","アイスジャイアント",122,84000,1585,2060,620,770,1570],
["ラクリオン","クールティン",132,88000,1743,2092,650,840,1960],
["ラクリオン","アイアンナイト",142,95000,1917,2301,660,800,2000],
["ラクリオン","ダークマンモス",140,237000,1741,2317,785,0,NaN],
["ラクリオン","ダークジャイアント",143,254000,1885,2360,820,0,NaN],
["ラクリオン","ダーククールティン",145,248000,2043,2392,850,0,NaN],
["ラクリオン","ダークアイアンナイト",148,265000,2217,2601,860,0,NaN],
["ラクリオン","セルパン",145,4800000,6000,8000,1300,1800,NaN],
["ヴォルカノス","ゾンビ闘士",90,20000,300,345,200,170,NaN],
["ヴォルカノス","ゾンビ剣士",93,23000,320,360,220,200,NaN],
["ヴォルカノス","乱暴な処刑人",100,27000,335,370,270,230,NaN],
["ヴォルカノス","吸血の暗殺者",107,37000,550,600,475,300,NaN],
["ヴォルカノス","吸魂の暗殺者",109,40000,570,620,490,325,NaN],
["ヴォルカノス","溶岩巨人",111,50000,600,650,520,330,NaN],
["ヴォルカノス","狂暴な溶岩巨人",113,55000,630,680,535,340,NaN],
["試練の地","アックスウォーリアー",75,11500,255,290,195,125,385],
["試練の地","リザードマン",78,15000,270,320,210,140,430],
["試練の地","ポイズンゴーレム",84,25000,375,425,275,190,530],
["試練の地","クイーンビー",92,34500,489,540,360,240,620],
["試練の地","ファイアゴーレム",102,55000,560,600,550,310,870],
["試練の地","エロヒム",128,3000000,1500,2000,1000,800,1500],
["バルガスの兵営・安息所","バルラム（訓練兵）",NaN,90000,600,700,500,370,NaN],
["バルガスの兵営・安息所","デススピリット（訓練兵）",NaN,95000,600,700,500,397,NaN],
["バルガスの兵営・安息所","ソラム（訓練兵）",NaN,100000,600,700,500,397,NaN],
["バルガスの兵営・安息所","ダークエルフ（訓練兵）",NaN,1500000,800,900,900,370,NaN],
["平穏の沼地","サピウンス",95,37000,475,510,370,220,698],
["平穏の沼地","サピデュオ",96,39500,470,505,375,225,NaN],
["平穏の沼地","サンダーナピン",97,42000,520,555,395,235,NaN],
["平穏の沼地","シャドウポーン",98,43000,540,575,430,240,NaN],
["平穏の沼地","シャドウナイト",100,44000,570,600,455,255,NaN],
["平穏の沼地","サピトレス",102,45500,590,625,470,275,NaN],
["平穏の沼地","シャドウロック",104,47000,650,680,500,290,NaN],
["平穏の沼地","ゴーストナピン",106,48000,635,665,535,295,NaN],
["平穏の沼地","ブレイズナピン",107,52000,670,725,530,303,NaN],
["平穏の沼地","サピクイーン",131,218000,1441,2017,670,0,NaN],
["平穏の沼地","アイスナピン",135,230000,1585,2060,730,0,NaN],
["平穏の沼地","シャドウアスター",137,242000,1743,2092,700,0,NaN],
["平穏の沼地","メデューサ",175,7800000,7000,8000,1450,0,NaN],
["カルリマ1","アエギス",17,440,55,62,17,17,75],
["カルリマ1","ロードセンチュリオン",19,500,60,67,20,18,80],
["カルリマ1","ブラッドソルジャー",21,600,70,77,25,20,88],
["カルリマ1","デスエンジェル",24,740,80,87,30,24,100],
["カルリマ1","ネクロン",28,900,95,102,38,30,118],
["カルリマ1","デスセンチュリオン",33,1250,110,117,50,39,145],
["カルリマ1","シュリカー",40,1800,130,137,66,50,180],
["カルリマ1","クンドンの幻影",52,3000,165,172,90,70,255],
["カルリマ2","アエギス",32,1000,105,112,42,33,135],
["カルリマ2","ロードセンチュリオン",34,1200,112,119,45,36,147],
["カルリマ2","ブラッドソルジャー",37,1400,120,127,50,40,163],
["カルリマ2","デスエンジェル",40,1800,130,137,57,45,182],
["カルリマ2","ネクロン",44,2300,140,147,68,50,205],
["カルリマ2","デスセンチュリオン",48,3000,155,162,81,58,235],
["カルリマ2","シュリカー",53,3900,180,187,100,67,275],
["カルリマ2","クンドンの幻影",65,6000,220,227,140,100,355],
["カルリマ3","アエギス",46,2700,145,155,73,54,220],
["カルリマ3","ロードセンチュリオン",48,3100,152,162,80,56,232],
["カルリマ3","ブラッドソルジャー",50,3650,160,170,90,60,250],
["カルリマ3","デスエンジェル",53,4400,175,185,105,67,273],
["カルリマ3","ネクロン",58,5300,195,205,126,77,296],
["カルリマ3","デスセンチュリオン",63,6600,225,235,150,92,325],
["カルリマ3","シュリカー",69,8400,260,270,180,110,365],
["カルリマ3","クンドンの幻影",81,14000,350,360,255,160,460],
["カルリマ4","アエギス",62,6000,215,232,140,87,310],
["カルリマ4","ロードセンチュリオン",66,6900,230,250,150,95,330],
["カルリマ4","ブラッドソルジャー",70,8800,245,264,165,105,360],
["カルリマ4","デスエンジェル",74,12000,270,295,185,120,397],
["カルリマ4","ネクロン",78,16000,305,330,215,145,440],
["カルリマ4","デスセンチュリオン",83,22500,350,375,225,175,500],
["カルリマ4","シュリカー",88,30000,410,435,300,215,575],
["カルリマ4","クンドンの幻影",100,50000,600,625,500,295,780],
["カルリマ5","アエギス",79,18000,310,340,230,163,460],
["カルリマ5","ロードセンチュリオン",82,21000,335,365,250,168,490],
["カルリマ5","ブラッドソルジャー",85,26000,365,395,280,177,540],
["カルリマ5","デスエンジェル",88,31000,408,443,315,195,587],
["カルリマ5","ネクロン",93,38500,470,505,370,220,645],
["カルリマ5","デスセンチュリオン",98,48000,546,581,430,250,715],
["カルリマ5","シュリカー",105,60000,640,675,515,290,810],
["カルリマ5","クンドンの幻影",117,100000,835,870,680,360,1000],
["カルリマ6","アエギス",95,42000,520,550,410,230,655],
["カルリマ6","ロードセンチュリオン",98,48500,540,570,432,240,680],
["カルリマ6","ブラッドソルジャー",101,56000,570,600,460,255,713],
["カルリマ6","デスエンジェル",105,65000,610,645,500,275,760],
["カルリマ6","ネクロン",109,75500,672,707,550,303,820],
["カルリマ6","デスセンチュリオン",114,87500,753,788,620,335,900],
["カルリマ6","シュリカー",119,105000,850,885,710,370,1000],
["カルリマ6","クンドンの幻影",140,140000,1070,1105,892,450,1200],
["カルリマ7","アエギス",111,82000,712,752,584,315,850],
["カルリマ7","ロードセンチュリオン",114,88000,751,791,615,330,880],
["カルリマ7","ブラッドソルジャー",117,97300,805,845,660,345,920],
["カルリマ7","デスエンジェル",121,110000,870,915,720,370,960],
["カルリマ7","ネクロン",125,125000,951,996,783,405,1015],
["カルリマ7","デスセンチュリオン",130,145000,1040,1085,865,440,1080],
["カルリマ7","シュリカー",135,170000,1168,1213,992,485,1190],
["カルリマ7","クンドン",NaN,5000000,2000,2500,1000,600,2000],
["デビルスクエア1","サイクロプス",28,850,100,105,35,35,140],
["デビルスクエア1","スカルアーチャー",34,1000,115,120,45,41,170],
["デビルスクエア1","ヘルハウンド",38,1400,125,130,55,45,190],
["デビルスクエア1","タランチュラ",40,1600,130,135,60,47,200],
["デビルスクエア1","猛毒のミノタウロス",46,2500,145,150,75,61,230],
["デビルスクエア1","シャドー",47,2800,148,153,78,67,235],
["デビルスクエア1","魔将軍ゴルゴン",55,6000,165,175,100,82,275],
["デビルスクエア2","ダークナイト",48,3000,150,155,80,70,240],
["デビルスクエア2","ポイズンシャドー",50,3500,155,160,85,73,250],
["デビルスクエア2","呪いの魔法師",54,4000,160,170,95,79,270],
["デビルスクエア2","ダークホーン",57,4500,170,180,110,85,285],
["デビルスクエア2","死霊の騎士",62,5500,190,200,120,91,310],
["デビルスクエア2","灼熱のゴルゴン",64,6000,200,210,130,94,320],
["デビルスクエア2","ヒドラ",74,19000,250,310,200,125,430],
["デビルスクエア3","シュリカー2",53,3900,180,187,100,67,275],
["デビルスクエア3","ダークホーン",57,4500,170,180,110,85,285],
["デビルスクエア3","ディアボロス",60,5000,180,195,115,88,300],
["デビルスクエア3","灼熱のゴルゴン",64,6000,200,210,130,94,320],
["デビルスクエア3","オークアーチャー",70,10000,220,250,170,110,350],
["デビルスクエア3","キングオーク",74,14000,260,290,190,125,400],
["デビルスクエア3","メタルバルロック",77,26000,300,360,220,150,385],
["デビルスクエア4","オークアーチャー",70,10000,220,250,170,110,350],
["デビルスクエア4","キングオーク",74,14000,260,290,190,125,400],
["デビルスクエア4","アックスウォーリアー",75,11500,255,290,195,125,385],
["デビルスクエア4","ガルム",76,13500,260,300,200,130,410],
["デビルスクエア4","アイアンホイール",80,17000,280,330,215,150,446],
["デビルスクエア4","クイーンレイナー",83,19000,305,350,230,160,475],
["デビルスクエア4","呪いの王",86,38000,500,570,380,180,525],
["デビルスクエア5","デスエンジェル4",74,12000,270,295,185,120,397],
["デビルスクエア5","アックスウォーリアー",75,11500,255,290,195,125,385],
["デビルスクエア5","ガルム",76,13500,260,300,200,130,410],
["デビルスクエア5","メガクラスト",78,15000,270,320,210,140,430],
["デビルスクエア5","ビームナイト",84,25000,375,425,275,190,530],
["デビルスクエア5","ワイバーン",86,29000,425,480,305,210,570],
["デビルスクエア5","ファイアゴーレム",102,55000,560,600,550,310,870],
["デビルスクエア6","リザードマン",78,15000,270,320,210,140,430],
["デビルスクエア6","アイアンホイール",80,17000,280,330,215,150,446],
["デビルスクエア6","クイーンレイナー",83,19000,305,350,230,160,475],
["デビルスクエア6","ポイズンゴーレム",84,25000,375,425,275,190,530],
["デビルスクエア6","クイーンビー",92,34500,490,540,360,240,620],
["デビルスクエア6","メタルクラスト",92,34500,490,540,360,240,620],
["デビルスクエア6","クンドンの幻影4",100,50000,600,625,500,295,778],
["デビルスクエア7","ギガンティスDS7",105,30000,480,510,360,270,715],
["デビルスクエア7","ベルセルクDS7",106,33000,0,0,410,280,750],
["デビルスクエア7","バルラムDS7",117,37000,570,600,460,320,800],
["デビルスクエア7","ソラムDS7",119,40000,625,660,510,330,835],
["デビルスクエア7","ペルソナDS7",121,50000,655,685,570,370,935],
["デビルスクエア7","ドレッドフィアーDS7",123,55000,730,760,610,380,1015],
["デビルスクエア7","ダークエルフDS7",135,75000,850,950,690,430,1300],
["ブラッドキャッスル1","骸骨の戦士1（0～5分経過)",33,1100,100,120,55,45,190],
["ブラッドキャッスル1","骸骨の戦士1（5～10分経過)",33,1100,110,140,35,45,190],
["ブラッドキャッスル1","骸骨の戦士1（10～15分経過)",33,1100,120,160,5,45,190],
["ブラッドキャッスル1","キングスカルアーチャー1（0～5分経過)",37,1400,110,130,65,49,210],
["ブラッドキャッスル1","キングスカルアーチャー1（5～10分経過)",37,1400,120,150,45,49,210],
["ブラッドキャッスル1","キングスカルアーチャー1（10～15分経過)",37,1400,130,170,15,49,210],
["ブラッドキャッスル1","ダークスカルアーマー1（0～5分経過)",41,1700,120,140,75,61,230],
["ブラッドキャッスル1","ダークスカルアーマー1（5～10分経過)",41,1700,130,160,55,61,230],
["ブラッドキャッスル1","ダークスカルアーマー1（10～15分経過)",41,1700,140,180,25,61,230],
["ブラッドキャッスル1","暗黒のオウガ1（0～5分経過)",44,2100,130,150,85,73,250],
["ブラッドキャッスル1","暗黒のオウガ1（5～10分経過)",44,2100,140,170,65,73,250],
["ブラッドキャッスル1","暗黒のオウガ1（10～15分経過)",44,2100,150,190,35,73,250],
["ブラッドキャッスル1","レッドスカルアーマー1（0～5分経過)",47,2800,140,160,95,77,270],
["ブラッドキャッスル1","レッドスカルアーマー1（5～10分経過)",47,2800,150,180,75,77,270],
["ブラッドキャッスル1","レッドスカルアーマー1（10～15分経過)",47,2800,160,200,45,77,270],
["ブラッドキャッスル1","髑髏メイジ1（0～5分経過)",51,3700,150,180,115,88,300],
["ブラッドキャッスル1","髑髏メイジ1（5～10分経過)",51,3700,160,200,95,88,300],
["ブラッドキャッスル1","髑髏メイジ1（10～15分経過)",51,3700,170,220,65,88,300],
["ブラッドキャッスル2","骸骨の戦士2（0～5分経過)",49,3500,140,170,90,76,250],
["ブラッドキャッスル2","骸骨の戦士2（5～10分経過)",49,3500,150,190,70,76,250],
["ブラッドキャッスル2","骸骨の戦士2（10～15分経過)",49,3500,160,210,40,76,250],
["ブラッドキャッスル2","キングスカルアーチャー2（0～5分経過)",53,4100,150,180,100,80,275],
["ブラッドキャッスル2","キングスカルアーチャー2（5～10分経過)",53,4100,160,200,80,80,275],
["ブラッドキャッスル2","キングスカルアーチャー2（10～15分経過)",53,4100,170,220,50,80,275],
["ブラッドキャッスル2","ダークスカルアーマー2（0～5分経過)",56,5000,160,190,115,88,300],
["ブラッドキャッスル2","ダークスカルアーマー2（5～10分経過)",56,5000,170,210,95,88,300],
["ブラッドキャッスル2","ダークスカルアーマー2（10～15分経過)",56,5000,180,230,65,88,300],
["ブラッドキャッスル2","暗黒のオウガ2（0～5分経過)",60,6000,175,210,130,95,320],
["ブラッドキャッスル2","暗黒のオウガ2（5～10分経過)",60,6000,185,230,110,95,320],
["ブラッドキャッスル2","暗黒のオウガ2（10～15分経過)",60,6000,195,250,80,95,320],
["ブラッドキャッスル2","レッドスカルアーマー2（0～5分経過)",64,7000,185,220,170,110,360],
["ブラッドキャッスル2","レッドスカルアーマー2（5～10分経過)",64,7000,195,240,150,110,360],
["ブラッドキャッスル2","レッドスカルアーマー2（10～15分経過)",64,7000,205,260,120,110,360],
["ブラッドキャッスル2","髑髏メイジ2（0～5分経過)",69,8000,200,240,190,130,400],
["ブラッドキャッスル2","髑髏メイジ2（5～10分経過)",69,8000,210,260,170,130,400],
["ブラッドキャッスル2","髑髏メイジ2（10～15分経過)",69,8000,220,280,140,130,400],
["ブラッドキャッスル3","骸骨の戦士3（0～5分経過)",56,5000,160,180,110,85,300],
["ブラッドキャッスル3","骸骨の戦士3（5～10分経過)",56,5000,170,200,90,85,300],
["ブラッドキャッスル3","骸骨の戦士3（10～15分経過)",56,5000,180,220,60,85,300],
["ブラッドキャッスル3","キングスカルアーチャー3（0～5分経過)",61,6500,180,200,120,93,330],
["ブラッドキャッスル3","キングスカルアーチャー3（5～10分経過)",61,6500,190,220,100,93,330],
["ブラッドキャッスル3","キングスカルアーチャー3（10～15分経過)",61,6500,200,240,70,93,330],
["ブラッドキャッスル3","ダークスカルアーマー3（0～5分経過)",66,8000,190,220,150,98,360],
["ブラッドキャッスル3","ダークスカルアーマー3（5～10分経過)",66,8000,200,240,130,98,360],
["ブラッドキャッスル3","ダークスカルアーマー3（10～15分経過)",66,8000,210,260,100,98,360],
["ブラッドキャッスル3","暗黒のオウガ3（0～5分経過)",70,9500,210,240,180,115,400],
["ブラッドキャッスル3","暗黒のオウガ3（5～10分経過)",70,9500,220,260,160,115,400],
["ブラッドキャッスル3","暗黒のオウガ3（10～15分経過)",70,9500,230,280,130,115,400],
["ブラッドキャッスル3","レッドスカルアーマー3（0～5分経過)",74,12000,220,260,190,130,440],
["ブラッドキャッスル3","レッドスカルアーマー3（5～10分経過)",74,12000,230,280,170,130,440],
["ブラッドキャッスル3","レッドスカルアーマー3（10～15分経過)",74,12000,240,300,140,130,440],
["ブラッドキャッスル3","髑髏メイジ3（0～5分経過)",79,15000,230,280,240,180,500],
["ブラッドキャッスル3","髑髏メイジ3（5～10分経過)",79,15000,240,300,220,180,500],
["ブラッドキャッスル3","髑髏メイジ3（10～15分経過)",79,15000,250,320,190,180,500],
["ブラッドキャッスル4","骸骨の戦士4（0～5分経過)",64,7500,180,220,150,98,340],
["ブラッドキャッスル4","骸骨の戦士4（5～10分経過)",64,7500,190,240,130,98,340],
["ブラッドキャッスル4","骸骨の戦士4（10～15分経過)",64,7500,200,260,100,98,340],
["ブラッドキャッスル4","キングスカルアーチャー4（0～5分経過)",69,9500,200,240,170,110,380],
["ブラッドキャッスル4","キングスカルアーチャー4（5～10分経過)",69,9500,210,260,150,110,380],
["ブラッドキャッスル4","キングスカルアーチャー4（10～15分経過)",69,9500,220,280,120,110,380],
["ブラッドキャッスル4","ダークスカルアーマー4（0～5分経過)",75,12000,220,260,190,130,440],
["ブラッドキャッスル4","ダークスカルアーマー4（5～10分経過)",75,12000,230,280,170,130,440],
["ブラッドキャッスル4","ダークスカルアーマー4（10～15分経過)",75,12000,240,300,140,130,440],
["ブラッドキャッスル4","暗黒のオウガ4（0～5分経過)",79,15000,250,290,210,150,500],
["ブラッドキャッスル4","暗黒のオウガ4（5～10分経過)",79,15000,260,310,190,150,500],
["ブラッドキャッスル4","暗黒のオウガ4（10～15分経過)",79,15000,270,330,160,150,500],
["ブラッドキャッスル4","レッドスカルアーマー4（0～5分経過)",82,18000,270,320,290,170,560],
["ブラッドキャッスル4","レッドスカルアーマー4（5～10分経過)",82,18000,280,340,270,170,560],
["ブラッドキャッスル4","レッドスカルアーマー4（10～15分経過)",82,18000,290,360,240,170,560],
["ブラッドキャッスル4","髑髏メイジ4（0～5分経過)",84,24000,300,350,360,200,640],
["ブラッドキャッスル4","髑髏メイジ4（5～10分経過)",84,24000,310,370,340,200,640],
["ブラッドキャッスル4","髑髏メイジ4（10～15分経過)",84,24000,320,390,310,200,640],
["ブラッドキャッスル5","骸骨の戦士5（0～5分経過)",70,12000,210,270,185,125,380],
["ブラッドキャッスル5","骸骨の戦士5（5～10分経過)",70,12000,220,290,165,125,380],
["ブラッドキャッスル5","骸骨の戦士5（10～15分経過)",70,12000,230,310,135,125,380],
["ブラッドキャッスル5","キングスカルアーチャー5（0～5分経過)",75,15000,240,300,190,130,420],
["ブラッドキャッスル5","キングスカルアーチャー5（5～10分経過)",75,15000,250,320,170,130,420],
["ブラッドキャッスル5","キングスカルアーチャー5（10～15分経過)",75,15000,260,340,140,130,420],
["ブラッドキャッスル5","ダークスカルアーマー5（0～5分経過)",80,19000,280,340,220,175,470],
["ブラッドキャッスル5","ダークスカルアーマー5（5～10分経過)",80,19000,290,360,200,175,470],
["ブラッドキャッスル5","ダークスカルアーマー5（10～15分経過)",80,19000,300,380,170,175,470],
["ブラッドキャッスル5","暗黒のオウガ5（0～5分経過)",85,23000,340,390,300,190,520],
["ブラッドキャッスル5","暗黒のオウガ5（5～10分経過)",85,23000,350,410,280,190,520],
["ブラッドキャッスル5","暗黒のオウガ5（10～15分経過)",85,23000,360,430,250,190,520],
["ブラッドキャッスル5","レッドスカルアーマー5（0～5分経過)",87,26000,370,410,400,200,650],
["ブラッドキャッスル5","レッドスカルアーマー5（5～10分経過)",87,26000,380,430,380,200,650],
["ブラッドキャッスル5","レッドスカルアーマー5（10～15分経過)",87,26000,390,450,350,200,650],
["ブラッドキャッスル5","髑髏メイジ5（0～5分経過)",90,32000,400,460,450,260,720],
["ブラッドキャッスル5","髑髏メイジ5（5～10分経過)",90,32000,410,480,430,260,720],
["ブラッドキャッスル5","髑髏メイジ5（10～15分経過)",90,32000,420,500,400,260,720],
["ブラッドキャッスル6","骸骨の戦士6（0～5分経過)",76,17000,260,290,210,150,460],
["ブラッドキャッスル6","骸骨の戦士6（5～10分経過)",76,17000,270,310,190,150,460],
["ブラッドキャッスル6","骸骨の戦士6（10～15分経過)",76,17000,280,330,160,150,460],
["ブラッドキャッスル6","キングスカルアーチャー6（0～5分経過)",81,20000,320,350,270,160,520],
["ブラッドキャッスル6","キングスカルアーチャー6（5～10分経過)",81,20000,330,370,250,160,520],
["ブラッドキャッスル6","キングスカルアーチャー6（10～15分経過)",81,20000,340,390,220,160,520],
["ブラッドキャッスル6","ダークスカルアーマー6（0～5分経過)",86,25000,390,420,360,195,580],
["ブラッドキャッスル6","ダークスカルアーマー6（5～10分経過)",86,25000,400,440,340,195,580],
["ブラッドキャッスル6","ダークスカルアーマー6（10～15分経過)",86,25000,410,460,310,195,580],
["ブラッドキャッスル6","暗黒のオウガ6（0～5分経過)",90,32000,440,500,400,200,660],
["ブラッドキャッスル6","暗黒のオウガ6（5～10分経過)",90,32000,450,520,380,200,660],
["ブラッドキャッスル6","暗黒のオウガ6（10～15分経過)",90,32000,460,540,350,200,660],
["ブラッドキャッスル6","レッドスカルアーマー6（0～5分経過)",94,38000,480,540,450,260,720],
["ブラッドキャッスル6","レッドスカルアーマー6（5～10分経過)",94,38000,490,560,430,260,720],
["ブラッドキャッスル6","レッドスカルアーマー6（10～15分経過)",94,38000,500,580,400,260,720],
["ブラッドキャッスル6","髑髏メイジ6（0～5分経過)",99,47000,530,580,500,280,840],
["ブラッドキャッスル6","髑髏メイジ6（5～10分経過)",99,47000,540,600,480,280,840],
["ブラッドキャッスル6","髑髏メイジ6（10～15分経過)",99,47000,550,620,450,280,840],
["ブラッドキャッスル7","骸骨の戦士7（0～5分経過）",85,23000,340,390,310,190,520],
["ブラッドキャッスル7","骸骨の戦士7（5～10分経過）",85,23000,350,410,290,190,520],
["ブラッドキャッスル7","骸骨の戦士7（10～15分経過）",85,23000,360,430,260,190,520],
["ブラッドキャッスル7","キングスカルアーチャー7（0～5分経過）",87,26000,390,430,380,200,590],
["ブラッドキャッスル7","キングスカルアーチャー7（5～10分経過）",87,26000,400,450,360,200,590],
["ブラッドキャッスル7","キングスカルアーチャー7（10～15分経過）",87,26000,410,470,330,200,590],
["ブラッドキャッスル7","ダークスカルアーマー7（0～5分経過）",90,32000,430,480,400,230,660],
["ブラッドキャッスル7","ダークスカルアーマー7（5～10分経過）",90,32000,440,500,380,230,660],
["ブラッドキャッスル7","ダークスカルアーマー7（10～15分経過）",90,32000,450,520,350,230,660],
["ブラッドキャッスル7","暗黒のオウガ7（0～5分経過）",93,37000,470,520,440,250,730],
["ブラッドキャッスル7","暗黒のオウガ7（5～10分経過）",93,37000,480,540,420,250,730],
["ブラッドキャッスル7","暗黒のオウガ7（10～15分経過）",93,37000,490,560,390,250,730],
["ブラッドキャッスル7","レッドスカルアーマー7（0～5分経過）",98,45000,510,560,490,270,800],
["ブラッドキャッスル7","レッドスカルアーマー7（5～10分経過）",98,45000,520,580,470,270,800],
["ブラッドキャッスル7","レッドスカルアーマー7（10～15分経過）",98,45000,530,600,440,270,800],
["ブラッドキャッスル7","髑髏メイジ7（0～5分経過）",102,55000,560,600,550,310,870],
["ブラッドキャッスル7","髑髏メイジ7（5～10分経過）",102,55000,570,620,530,310,870],
["ブラッドキャッスル7","髑髏メイジ7（10～15分経過）",102,55000,580,640,500,310,870],
["ブラッドキャッスル8","オーク戦士8（0～5分経過)",100,29000,475,510,440,400,NaN],
["ブラッドキャッスル8","オーク戦士8（5～10分経過)",100,29000,485,530,420,400,NaN],
["ブラッドキャッスル8","オーク戦士8（10～15分経過)",100,29000,495,550,390,400,NaN],
["ブラッドキャッスル8","オークアーチャー8（0～5分経過)",100,32000,510,555,480,220,NaN],
["ブラッドキャッスル8","オークアーチャー8（5～10分経過)",100,32000,520,575,460,220,NaN],
["ブラッドキャッスル8","オークアーチャー8（10～15分経過)",100,32000,530,595,430,220,NaN],
["ブラッドキャッスル8","ダークスカルアーマー8（0～5分経過)",100,37000,625,650,500,400,NaN],
["ブラッドキャッスル8","ダークスカルアーマー8（5～10分経過)",100,37000,635,670,480,400,NaN],
["ブラッドキャッスル8","ダークスカルアーマー8（10～15分経過)",100,37000,645,690,450,400,NaN],
["ブラッドキャッスル8","暗黒のオウガ8（0～5分経過)",100,45000,670,685,540,400,NaN],
["ブラッドキャッスル8","暗黒のオウガ8（5～10分経過)",100,45000,680,705,520,400,NaN],
["ブラッドキャッスル8","暗黒のオウガ8（10～15分経過)",100,45000,690,725,490,400,NaN],
["ブラッドキャッスル8","レッドスカルアーマー8（0～5分経過)",100,55000,780,815,600,400,NaN],
["ブラッドキャッスル8","レッドスカルアーマー8（5～10分経過)",100,55000,790,835,580,400,NaN],
["ブラッドキャッスル8","レッドスカルアーマー8（10～15分経過)",100,55000,800,855,550,400,NaN],
["ブラッドキャッスル8","髑髏メイジ8（0～5分経過)",125,0,840,860,680,400,NaN],
["ブラッドキャッスル8","髑髏メイジ8（5～10分経過)",125,0,850,880,660,400,NaN],
["ブラッドキャッスル8","髑髏メイジ8（10～15分経過)",125,0,860,900,630,400,NaN],
//["シーズン5PVに映ってたBOSS","BOSS",NaN,NaN,3000,4000,1300,2000,NaN]
];
static public var speed:Array = [
	// 0 不明速度 (乗り物)アイスアロー
	[[0,0,0]],
	// 1 GB,PS,(乗り物なし)ファイアスクリーム
	[[0,1120,0]
	,[3,1080,0],[5,1040,0],[8,1000,0],[10,1000,1],[11,960,1]
	,[14,920,1],[18,880,1],[21,840,1],[26,800,1],[30,760,1],[35,720,1]
	,[41,680,1],[47,640,1],[55,600,1],[63,560,1],[73,520,1],[84,480,1]
	,[97,440,1],[113,400,1],[132,360,1],[157,320,1],[158,320,0],[188,280,0]
	,[230,240,0],[288,200,0],[376,160,0],[522,120,0],[813,80,0],[1690,40,0]],
	// 2 真空斬り、牙突、レイドショット
	[[1,920,0],[5,880,0],[9,840,0],[11,840,1],[13,800,1],[18,760,1]
	,[23,720,1],[28,680,1],[35,640,1],[42,600,1],[50,560,1],[60,520,1]
	,[71,480,1],[84,440,1],[100,400,1],[120,360,1],[144,320,1],[175,280,1]
	,[217,240,1],[218,240,0],[275,200,0],[363,160,0],[509,120,0],[800,80,0]
	,[1676,40,0]],
	// 3 ファイナルスラッシュ
	[[20,880,0],[24,840,0],[28,800,0],[31,800,1],[33,760,1],[38,720,1]
	,[43,680,1],[50,640,1],[57,600,1],[65,560,1],[75,520,1],[86,480,1]
	,[100,440,1],[101,440,0],[116,400,0],[134,400,1],[135,360,1],[159,320,1],[190,280,1]
	,[191,280,0],[232,240,0],[291,200,0],[378,160,0],[524,120,0],[816,80,0],[1691,40,0]],
	// 4 TC
	[[16,1720,0],[18,1680,1],[20,1640,1]
	,[22,1600,1],[24,1560,1],[26,1520,1],[28,1480,1],[31,1440,1],[33,1400,1]
	,[36,1360,1],[39,1320,1],[42,1280,1],[45,1240,1],[49,1200,1],[53,1160,1],[57,1120,1]
	,[61,1080,1],[65,1040,1],[70,1000,1],[76,960,1],[82,920,1]
	,[88,880,1],[95,840,1],[103,800,1],[112,760,1],[121,720,1],[132,680,1]
	,[144,640,1],[157,600,1],[173,560,1],[190,520,1],[211,480,1],[212,480,0],[237,440,0],[266,400,0]
	,[302,360,0],[348,320,0],[406,280,0],[484,240,0],[592,200,0],[756,160,0],[1027,120,0]
	,[1571,80,0],[3202,40,0]],
	// 5 飛燕斬り
	[[0,1040,0],[3,1000,0],[6,960,0],[9,920,0]
	,[12,880,0],[16,840,0],[20,800,0],[21,800,1],[25,760,1],[30,720,1]
	,[36,680,1],[42,640,1],[50,600,1],[58,560,1],[68,520,1],[79,480,1]
	,[92,440,1],[108,400,1],[113,400,0],[127,360,1],[152,320,1]
	,[183,280,1],[225,240,1],[226,240,0],[283,200,0],[370,160,0],[516,120,0]
	,[808,80,0],[1683,40,0]],
	// 6 烈斬
	[[0,1080,0],[2,1040,0],[5,1000,0],[9,960,0],[12,920,0]
	,[16,880,1],[21,840,1],[25,800,1],[31,760,1],[37,720,1]
	,[43,680,1],[50,640,1],[59,600,1],[68,560,1],[79,520,1],[92,480,1]
	,[107,440,1],[116,440,0],[125,400,0],[147,400,0],[148,360,1],[175,320,1]
	,[211,280,1],[212,280,0],[259,240,0],[325,200,0],[425,160,0],[592,120,0]
	,[925,80,0],[1926,40,0]],
	// 7 (乗り物なし)悪霊、火柱、竜巻、閃光、氷雪、魍毒、サンダーワイヤー
	[[1,840,1],[5,800,1],[13,760,1],[22,720,1]
	,[32,680,1],[43,640,1],[55,600,1],[70,560,1],[86,520,1],[105,480,1]
	,[128,440,1],[156,400,1],[189,360,1],[205,360,0],[231,320,0]
	,[285,280,0],[356,240,0],[457,200,0],[607,160,0],[858,120,0]
	,[1359,80,0],[2864,40,0]],
	// 8 (ユニ、ディノ)悪霊、火柱、竜巻、閃光、氷雪、魍毒、サンダーワイヤー
	[[1,960,1],[3,920,1],[10,880,1],[17,840,1],[26,800,1],[35,760,1],[45,720,1]
	,[56,680,1],[69,640,1],[84,600,1],[100,560,1],[120,520,1],[142,480,1]
	,[169,440,1],[200,400,1],[205,400,0],[239,360,0],[288,320,0]
	,[350,280,0],[434,240,0],[550,200,0],[725,160,0],[1017,120,0]
	,[1600,80,0],[3352,40,0]],
	// 9 (フェンリル)悪霊、火柱、竜巻、閃光、氷雪、魍毒、サンダーワイヤー
	[[1,760,1],[10,720,1]
	,[21,680,1],[34,640,1],[49,600,1],[66,560,1],[85,520,1],[107,480,1]
	,[134,440,1],[165,400,1],[204,360,1],[205,360,0],[253,320,0]
	,[315,280,0],[399,240,0],[515,200,0],[690,160,0],[982,120,0]
	,[1565,80,0],[3315,40,0]],
	// 10 インフェルノ
	[[1,880,1],[10,840,1],[26,800,1],[43,760,1]
	,[62,720,1],[83,680,1],[107,640,1],[134,600,1],[165,560,1],[201,520,1]
	,[205,520,0],[242,480,0],[291,440,0],[351,400,0],[423,360,0]
	,[513,320,0],[629,280,0],[784,240,0],[1001,200,0],[1326,160,0]
	,[1867,120,0],[2951,80,0],[6201,40,0]],
	// 11 ヘルファイア
	[[1,1440,1],[8,1400,1],[15,1360,1],[23,1320,1]
	,[32,1280,1],[41,1240,1],[50,1200,1],[61,1160,1]
	,[72,1120,1],[84,1080,1],[97,1040,1],[110,1000,1],[125,960,1],[142,920,1]
	,[160,880,1],[179,840,1],[201,800,1],[205,800,0],[224,760,0]
	,[250,720,0],[280,680,0],[313,640,0],[350,600,0],[393,560,0],[443,520,0]
	,[500,480,0],[569,440,0],[650,400,0],[751,360,0]
	,[876,320,0],[1036,280,0],[1251,240,0],[1551,200,0],[2001,160,0]
	,[2751,120,0],[4253,80,0],[8759,40,0]],
	// 12 乱れ撃ち、アイスアロー
	[[28,680,0],[30,680,1],[35,640,1],[42,600,1],[50,560,1],[60,520,1]
	,[71,480,1],[85,440,1],[100,400,1],[101,400,0],[120,360,0]
	,[144,320,0],[175,280,0],[217,240,0],[275,200,0],[363,160,0]
	,[509,120,0],[801,80,0],[1677,40,0]],
	// 13 ブラッドアタック
	[[0,0,0],[40,920,1],[41,880,1],[48,860,1],[49,840,1],[54,800,1],[64,780,1]
	,[68,760,1],[71,740,1],[79,720,1],[88,700,1],[92,680,1],[101,660,1]
	,[106,640,1],[116,620,1],[117,600,1],[130,587.6,1],[135,572.5,1]
	,[140,560.2,1],[144,547.9,1],[150,536.6,1],[156,526.7,1],[162,518.1,1]
	,[174,502.9,1],[180,490.9,1],[185,479.2,1],[202,466.6,1],[209,439.9,1],[210,0,0]],
	// 14 (乗り物なし)フォース、フォースウェーブ、ファイアバースト
	[[0,1180,0]
	,[3,1140,0],[5,1100,0],[8,1060,0],[10,1060,1],[11,1020,1],[14,980,1],[18,940,1]
	,[21,900,1],[26,860,1],[30,820,1],[35,780,1],[41,740,1]
	,[47,700,1],[55,660,1],[63,620,1],[73,580,1],[84,540,1],[97,500,1]
	,[113,460,1],[115,460,0],[132,420,0],[156,420,1],[157,380,1],[188,340,1]
	,[230,300,1],[231,300,0],[288,260,0]],
	// 15 (ユニ、ディノ、ダークホース)フォース、フォースウェーブ、ファイアバースト
	[[0,1260,0],[2,1220,1],[4,1180,1]
	,[6,1140,0],[8,1100,0],[10,1060,1],[13,1020,1],[16,980,1],[19,940,1]
	,[22,900,1],[25,860,1],[29,820,1],[34,780,1],[39,740,1]
	,[44,700,1],[50,660,1],[58,620,1],[66,580,1],[75,540,1],[87,500,1]
	,[101,460,1],[116,460,0],[117,420,0],[138,380,0],[156,380,1],[165,340,1]
	,[201,300,1],[231,300,0],[251,260,0]],
	// 16 （ユニ・ディノ）ファイアスクリーム
	[[33,1320,1],[34,1240,1],[39,1200,1],[42,1160,1]
	,[44,1120,1],[50,1080,1],[52,1040,1],[58,1000,1],[63,960,1],[66,920,1]
	,[75,880,1],[77,840,1],[87,800,1],[94,760,1]
	,[101,720,1],[117,640,1],[138,600,1],[146,560,1],[165,520,1]
	,[188,480,1],[201,440,1],[251,360,1]
	,[326,320,0],[355,280,0],[451,240,0],[563,200,0],[701,160,0]
	,[1189,120,0],[1452,80,0]],
	// 17 （ダークホース）ファイアスクリーム
	[[2,1160,0]
	,[4,1120,0],[6,1080,0],[8,1040,0],[11,1000,1],[13,960,1],[16,920,1]
	,[19,880,1],[22,840,1],[25,800,1],[29,760,1]
	,[34,720,1],[39,680,1],[44,640,1],[50,600,1],[58,560,1],[66,520,1]
	,[75,480,1],[87,440,1],[101,400,1],[117,360,1]
	,[138,320,1],[164,280,1],[200,240,1],[250,200,0],[325,160,0]
	,[449,120,0],[699,80,0],[1448,40,0]],
	// 18 （乗り物なし）チェーンライトニング
	[[0,820,0],[7,780,0],[14,740,0]
	,[22,700,0],[24,700,1],[32,660,1],[42,620,1],[54,580,1],[68,540,1],[84,500,1]
	,[92,500,0],[103,460,0],[125,420,0],[153,380,0],[188,340,0]
	,[233,300,0],[292,260,0]],
	// 19 （ユニ・ディノ）チェーンライトニング
	[[0,1100,0]
	,[2,1060,0],[5,1020,0],[9,9800,0],[12,940,0],[16,900,0],[21,860,0],[24,860,1]
	,[25,820,1],[31,780,1],[37,740,1]
	,[43,700,1],[50,660,1],[59,620,1],[68,580,1],[79,540,1],[92,500,1]
	,[93,500,0],[107,460,0],[125,420,0],[148,380,0],[175,340,0]
	,[211,300,0],[259,260,0]],
	// 20 （乗り物なし）ライフドレイン
	[[0,960,0],[6,920,0]
	,[12,880,0],[18,840,0],[25,800,1],[33,760,1]
	,[42,720,1],[52,680,1],[63,640,1],[75,600,1],[90,560,1],[93,560,0],[106,520,0]
	,[125,480,0],[148,440,0],[175,400,0],[209,360,0]
	,[250,320,0],[304,280,0],[375,240,0],[476,200,0],[626,160,0]
	,[876,120,0],[1376,80,0],[2878,40,0]],
	// 21 （ユニ・ディノ）ライフドレイン
	[[0,1160,0]
	,[1,1120,0],[5,1080,0],[10,1040,0],[16,1000,0],[21,960,0],[28,920,1]
	,[35,880,1],[42,840,1],[51,800,1],[60,760,1]
	,[70,720,1],[81,680,1],[93,680,0],[94,640,0],[109,600,0],[126,560,0],[145,520,0]
	,[167,480,0],[194,440,0],[226,400,0],[264,360,0]
	,[313,320,0],[376,280,0],[459,240,0],[576,200,0],[751,160,0]
	,[1043,120,0],[1626,80,0],[3379,40,0]],
	// 22 ギガンティックストーム
	[[1,960,0],[5,920,1]
	,[11,880,1],[18,840,1],[26,800,1],[34,760,1]
	,[44,720,1],[54,680,1],[66,640,0],[79,600,0],[95,560,0],[113,520,0]
	,[133,480,0],[158,440,0],[187,400,0],[223,360,0]
	,[268,320,0],[325,280,0],[402,240,0],[509,200,0],[671,160,0]
	,[939,120,0],[1477,80,0],[3089,40,0]],
	// 23 オメガインパクト
	[[0,1150,1]],
	// 24 アブソリュートゼロ　プラズマストーム
	[[0,1500,1]],
	// 25 ライトニングショック
	[[1,1280,0],[3,1240,0]
	,[9,1200,0],[15,1160,0],[22,1120,0],[29,1080,0],[37,1040,0],[46,1000,0]
	,[55,960,0],[65,920,0],[75,880,0],[87,840,0],[100,800,0],[115,760,0]
	,[131,720,0],[149,680,0],[169,640,0],[192,600,0],[218,560,0],[248,520,0]
	,[283,480,0],[324,440,0],[374,400,0],[435,360,0]
	,[511,320,0],[609,280,0],[739,240,0],[922,200,0],[1196,160,0]
	,[1652,120,0],[2565,80,0],[5304,40,0]],
	// 26 フレイムストライク
	[[1,880,0],[10,800,0],[29,760,0],[49,720,1],[72,680,1],[98,640,1],[127,600,0]
	,[160,560,0],[199,520,0],[244,480,0],[297,440,0],[360,400,0],[438,360,0],[535,320,0]
	,[660,280,0],[827,240,0],[1060,200,0],[1410,160,0],[1994,120,0],[3160,80,0],[6660,40,0]],
	// 27 フレイムハンド(ダークスピリット)
	[[0,1000,0]],
	// 28 書
	[[0,4000,1]],
	// 29 アースシェイク
	[[0,10000,1]]
];
	}
}