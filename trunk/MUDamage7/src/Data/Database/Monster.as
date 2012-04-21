package Data.Database{
	internal class Monster{
		public static var data:Array = [
["","防御無視",0,0,0,0,0,0,0,0,0,0,5],
["BC門・石造","BC門・石造",0,0,0,0,0,0,0,0,0,0,5],
["ロレンシア","スパイダー",2,40,6,8,1,1,8,0,0,1,5],
["ロレンシア","パージドラゴン",4,80,12,17,3,3,18,0,0,3,5],
["ロレンシア","パージミノタウロス",6,120,19,26,6,6,28,0,0,6,5],
["ロレンシア","ハウンド",9,160,25,35,9,9,39,0,0,9,5],
["ロレンシア","ミノタウロス",12,220,35,44,12,12,50,0,0,12,5],
["ロレンシア","ソーサリアン",14,260,45,52,14,14,62,0,0,14,5],
["ロレンシア","ギガンテス",17,500,60,70,18,18,80,0,0,18,5],
["ロレンシア","骸骨の騎士",19,600,70,78,22,22,93,0,0,22,5],
["ノリア","パージゴブリン",3,60,9,11,2,2,13,0,0,2,5],
["ノリア","虹色の蠍",5,100,14,20,4,4,23,0,0,4,5],
["ノリア","ゴブリン",8,140,22,32,8,8,33,0,0,8,5],
["ノリア","モスマン",10,180,30,40,10,10,44,0,0,10,5],
["ノリア","魔界ハンター",13,240,40,48,13,13,56,0,0,13,5],
["ノリア","マンドレイク",15,320,50,58,15,15,68,0,0,15,5],
["ノリア","アゴン",16,400,55,62,16,16,74,0,0,16,5],
["ノリア","ゴーレム",18,550,65,74,20,20,86,0,0,20,5],
["エルベランド","一角うさぎ",4,60,10,13,3,3,0,0,0,3,5],
["エルベランド","大毒蛾",13,230,37,42,13,13,0,0,0,13,5],
["エルベランド","クレイジーラビット",19,520,68,72,22,22,0,0,0,22,5],
["エルベランド","リカント",24,720,85,90,30,30,0,0,0,30,5],
["エルベランド","カースドリッチ",30,900,105,110,33,36,0,0,0,33,5],
["エルベランド","トーテムゴーレム",36,1200,120,125,50,43,0,0,0,50,5],
["エルベランド","グリズリー",43,2400,130,140,65,52,0,0,0,65,5],
["エルベランド","キャプテングリズリー",48,3000,150,155,80,70,240,0,0,80,5],
["デビアス","ワーム",20,600,75,80,25,25,80,0,0,25,5],
["デビアス","アイスバーン",22,650,80,85,27,27,110,0,0,27,5],
["デビアス","青銅の魔人",24,700,85,90,29,29,120,0,0,29,5],
["デビアス","アサシン",26,800,95,100,33,33,130,0,0,33,5],
["デビアス","ビックフット",30,900,105,110,37,37,150,0,0,37,5],
["デビアス","キングフット",36,1200,120,125,50,43,180,0,0,50,5],
["デビアス","アイスクイーン",52,4000,155,165,90,76,260,0,0,90,5],
["ダンジョン","骸骨の騎士",19,600,70,78,22,22,93,0,0,22,5],
["ダンジョン","槌の子",25,750,90,95,31,31,125,0,0,31,5],
["ダンジョン","サイクロプス",28,850,100,105,35,35,140,0,0,35,5],
["ダンジョン","ゴースト",32,1000,110,115,40,39,160,0,0,40,5],
["ダンジョン","スカルアーチャー",34,1100,115,120,45,41,170,0,0,45,5],
["ダンジョン","ヘルハウンド",38,1400,125,130,55,45,190,0,0,55,5],
["ダンジョン","タランチュラ",40,1600,130,135,60,47,200,0,0,60,5],
["ダンジョン","骸骨の戦士",42,1800,135,140,65,49,210,0,0,65,5],
["ダンジョン","メイジ",44,2000,140,145,70,55,220,0,0,70,5],
["ダンジョン","猛毒のミノタウロス",46,2500,145,150,75,61,230,0,0,75,5],
["ダンジョン","ダークナイト",48,3000,150,155,80,70,240,0,0,80,5],
["ダンジョン","魔将軍ゴルゴン",55,6000,165,175,100,82,275,0,0,100,5],
["ロストタワー","シャドー",47,2800,148,153,78,67,235,0,0,78,5],
["ロストタワー","ポイズンシャドー",50,3500,155,160,85,73,250,0,0,85,5],
["ロストタワー","呪いの魔法師",54,4000,160,170,95,79,270,0,0,95,5],
["ロストタワー","ダークホーン",57,4500,170,180,110,85,285,0,0,110,5],
["ロストタワー","ディアボロス",60,5000,180,195,115,88,300,0,0,115,5],
["ロストタワー","死霊の騎士",62,5500,190,200,120,91,310,0,0,120,5],
["ロストタワー","灼熱のゴルゴン",64,6000,200,210,130,94,320,0,0,130,5],
["ロストタワー","バルロック",67,10000,220,250,160,105,330,0,0,160,5],
["アトランス","パージバハムート",43,2400,130,140,65,52,215,0,0,65,5],
["アトランス","ファルネウス",45,2800,135,145,70,58,225,0,0,70,5],
["アトランス","バルキリー",46,3200,140,150,75,64,230,0,0,75,5],
["アトランス","バハムート",66,7000,210,230,150,98,330,0,0,150,5],
["アトランス","シルバーバルキリー",68,8000,230,260,170,110,340,0,0,170,5],
["アトランス","リザードキング",70,9000,240,270,180,115,350,0,0,180,5],
["アトランス","ヒドラ",74,19000,250,310,200,125,430,0,0,200,5],
["タルカン","異形のミュータント",72,10000,250,280,190,120,365,0,0,190,5],
["タルカン","ガルム",76,13500,260,300,200,130,410,0,0,200,5],
["タルカン","アイアンホイール",80,17500,280,330,220,150,446,0,0,220,5],
["タルカン","タルタロス",82,23500,335,385,250,175,500,0,0,250,5],
["タルカン","ビームナイト",84,26500,375,425,275,190,530,0,0,275,5],
["タルカン","ザイカン",90,34000,510,590,400,185,550,0,0,400,5],
["タルカン","デスビームナイト",93,40000,590,650,420,220,575,0,0,420,5],
["イカロス","アルカモス",75,11500,225,290,195,125,385,0,0,195,5],
["イカロス","メガクラスト",78,15000,270,320,210,140,430,0,0,210,5],
["イカロス","クィーンレイナー",83,20000,305,350,235,160,475,0,0,235,5],
["イカロス","ワイバーン",86,30000,425,480,310,210,570,0,0,310,5],
["イカロス","メタルクラスト",92,35500,490,540,365,240,620,0,0,365,5],
["イカロス","機神兵",96,43500,560,610,430,270,690,0,0,430,5],
["イカロス","ワイアーム",100,53000,650,700,500,305,800,0,0,500,5],
["イカロス","天空の不死鳥",108,135000,950,1000,600,350,900,0,0,600,5],
["アイダ","デスツリー",72,11000,250,270,187,90,360,0,0,187,5],
["アイダ","フォレストオーク",74,11500,260,280,197,95,390,0,0,197,5],
["アイダ","デスライダー",78,14600,270,290,222,100,400,0,0,222,5],
["アイダ","ブルーゴーレム",84,26000,280,310,277,125,505,0,0,277,5],
["アイダ","ウィッチクイーン",94,40500,380,410,357,185,650,0,0,357,5],
["アイダ","ヘルマイネ",98,50000,550,600,520,300,850,0,0,520,5],
["アイダ","ブラッティオーク",114,117000,675,710,420,0,0,0,0,420,5],
["アイダ","ブラッティデスライダー",115,88000,795,830,460,0,0,0,0,460,5],
["アイダ","ブラッティゴーレム",117,129700,715,750,470,0,0,0,0,470,5],
["アイダ","ブラッティウィッチクイーン",118,85700,835,870,480,0,0,0,0,480,5],
["カルタン","猛毒鉤サソリ",99,50000,555,590,450,248,0,0,0,450,5],
["カルタン","ボーンスコーピオン",103,60000,595,635,485,283,0,0,0,485,5],
["カルタン","オルカス",105,65000,618,655,518,293,0,0,0,518,5],
["カルタン","ゴルロック",108,72000,685,735,545,315,0,0,0,545,5],
["カルタン","クリブッター",111,78000,705,755,560,340,0,0,0,560,5],
["カルタン","クリフォース",114,83000,720,770,575,375,0,0,0,575,5],
["カルタン","コンドラ",117,90000,735,790,610,405,0,0,0,610,5],
["カルタン","ナルコンドラ",120,86000,750,815,640,425,0,0,0,640,5],
["クライウルフ","ハンマースカウト",97,45000,530,560,420,250,670,0,0,420,5],
["クライウルフ","ランススカウト",97,45000,530,560,420,250,670,0,0,420,5],
["クライウルフ","スカウトアーチャー",97,45000,530,560,420,250,670,0,0,420,5],
["クライウルフ","ウェアウルフ",118,110000,830,850,680,355,950,0,0,680,5],
["クライウルフ","スカウトヒーロー",123,120000,890,910,740,340,980,0,0,740,5],
["クライウルフ","ウェアウルフヒーロー",127,123000,964,1015,800,397,1027,0,0,800,5],
["クライウルフ","バルラム",132,140000,1075,1140,885,440,1100,0,0,885,5],
["クライウルフ","ソラム",134,164000,1200,1300,982,500,1173,0,0,982,5],
["クライウルフ(攻防戦)","ソラム",134,100000,600,700,500,397,0,0,0,500,5],
["クライウルフ(攻防戦)","バルラム",134,90000,600,650,500,397,0,0,0,500,5],
["クライウルフ(攻防戦)","デススピリット",134,95000,600,650,500,397,0,0,0,500,5],
["クライウルフ(攻防戦)","バリスタ",133,500000,900,1000,840,370,0,0,0,840,5],
["クライウルフ(攻防戦)","ダークエルフ",135,1000000,800,900,900,370,0,0,0,900,5],
["クライウルフ(攻防戦)","バルガス",135,400000,1000,1500,800,370,0,0,0,800,5],
["カントル","スプリンターウルフ",80,16000,310,340,230,163,460,0,0,230,5],
["カントル","アイアンライダー",82,18000,335,365,250,168,490,0,0,250,5],
["カントル","サテュロス",85,22000,365,395,280,177,540,0,0,280,5],
["カントル","ブレードハンター",88,32000,408,443,315,195,587,0,0,315,5],
["カントル","ケンタウロス",93,38500,470,505,370,220,645,0,0,370,5],
["カントル","ギガンティス",98,43000,546,581,430,250,715,0,0,430,5],
["カントル","ベルセルク",100,43000,556,588,445,360,730,0,0,445,5],
["カントル","ジェノサイダー",105,48500,640,675,515,290,810,0,0,515,5],
["カントル","ベルセルクウォーリア",123,184370,915,990,543,0,0,0,0,543,5],
["カントル","ケンタウロスウォーリア",126,198500,970,1005,570,0,0,0,0,570,5],
["カントル","ギガンティスウォーリア",128,203000,1046,1181,630,0,0,0,0,630,5],
["カントル","ジェノサイダーウォーリア",129,218500,1240,1375,715,0,0,0,0,715,5],
["カントル","ツインテール",117,87500,830,1085,865,440,1080,0,0,865,5],
["カントル","ペルソナ",118,68000,1168,1213,615,485,1190,0,0,615,5],
["カントル","ドレッドフィアー",119,94000,946,996,783,905,1015,0,0,783,5],
["カントル","マヤの手（左）",135,400000,732,932,315,1445,0,0,0,315,5],
["カントル","マヤの手（右）",135,350000,732,932,800,550,0,0,0,800,5],
["カントル","ナイトメア",135,1500000,1225,1468,1000,420,2000,0,0,1000,5],
["ラクリオン","アイスウォーカー",102,68000,1310,1965,615,800,1190,0,0,615,5],
["ラクリオン","ジャイアントマンモス",112,77000,1441,2017,585,840,1350,0,0,585,5],
["ラクリオン","アイスジャイアント",122,84000,1585,2060,620,770,1570,0,0,620,5],
["ラクリオン","クールティン",132,88000,1743,2092,650,840,1960,0,0,650,5],
["ラクリオン","アイアンナイト",142,95000,1917,2301,660,800,2000,0,0,660,5],
["ラクリオン","ダークマンモス",140,237000,1741,2317,785,0,0,0,0,785,5],
["ラクリオン","ダークジャイアント",143,254000,1885,2360,820,0,0,0,0,820,5],
["ラクリオン","ダーククールティン",145,248000,2043,2392,850,0,0,0,0,850,5],
["ラクリオン","ダークアイアンナイト",148,265000,2217,2601,860,0,0,0,0,860,5],
["ラクリオン","セルパン",145,4800000,6000,8000,1300,1800,2200,0,0,1300,5],
["ヴォルカノス","ゾンビ闘士",90,20000,300,345,200,170,0,0,0,200,5],
["ヴォルカノス","ゾンビ剣士",93,23000,320,360,220,200,0,0,0,220,5],
["ヴォルカノス","乱暴な処刑人",100,27000,335,370,270,230,0,0,0,270,5],
["ヴォルカノス","吸血の暗殺者",107,37000,550,600,475,300,0,0,0,475,5],
["ヴォルカノス","吸魂の暗殺者",109,40000,570,620,490,325,0,0,0,490,5],
["ヴォルカノス","溶岩巨人",111,50000,600,650,520,330,0,0,0,520,5],
["ヴォルカノス","狂暴な溶岩巨人",113,55000,630,680,535,340,0,0,0,535,5],
["試練の地","アックスウォーリアー",75,11500,255,290,195,125,385,0,0,195,5],
["試練の地","リザードマン",78,15000,270,320,210,140,430,0,0,210,5],
["試練の地","ポイズンゴーレム",84,25000,375,425,275,190,530,0,0,275,5],
["試練の地","クイーンビー",92,34500,489,540,360,240,620,0,0,360,5],
["試練の地","ファイアゴーレム",102,55000,560,600,550,310,870,0,0,550,5],
["試練の地","エロヒム",128,3000000,1500,2000,1000,800,1500,0,0,1000,5],
["バルガスの兵営・安息所","バルラム（訓練兵）",134,90000,600,700,500,370,0,0,0,500,5],
["バルガスの兵営・安息所","デススピリット（訓練兵）",134,95000,600,700,500,397,0,0,0,500,5],
["バルガスの兵営・安息所","ソラム（訓練兵）",134,100000,600,700,500,397,0,0,0,500,5],
["バルガスの兵営・安息所","ダークエルフ（訓練兵）",135,1500000,800,900,900,370,0,0,0,900,5],
["平穏の沼地","サピウンス",95,37000,475,510,370,220,698,0,0,370,5],
["平穏の沼地","サピデュオ",96,39500,470,505,375,225,0,0,0,375,5],
["平穏の沼地","サンダーナピン",97,42000,520,555,395,235,0,0,0,395,5],
["平穏の沼地","シャドウポーン",98,43000,540,575,430,240,0,0,0,430,5],
["平穏の沼地","シャドウナイト",100,44000,570,600,455,255,0,0,0,455,5],
["平穏の沼地","サピトレス",102,45500,590,625,470,275,0,0,0,470,5],
["平穏の沼地","シャドウロック",104,47000,650,680,500,290,0,0,0,500,5],
["平穏の沼地","ゴーストナピン",106,48000,635,665,535,295,0,0,0,535,5],
["平穏の沼地","ブレイズナピン",107,52000,670,725,530,303,0,0,0,530,5],
["平穏の沼地","サピクイーン",131,218000,1441,2017,670,0,0,0,0,670,5],
["平穏の沼地","アイスナピン",135,230000,1585,2060,730,0,0,0,0,730,5],
["平穏の沼地","シャドウアスター",137,242000,1743,2092,700,0,0,0,0,700,5],
["平穏の沼地","メデューサ",175,7800000,7000,8000,1450,0,0,0,0,1450,5],
["カルリマ1","アエギス",17,440,55,62,17,17,75,0,0,17,5],
["カルリマ1","ロードセンチュリオン",19,500,60,67,20,18,80,0,0,20,5],
["カルリマ1","ブラッドソルジャー",21,600,70,77,25,20,88,0,0,25,5],
["カルリマ1","デスエンジェル",24,740,80,87,30,24,100,0,0,30,5],
["カルリマ1","ネクロン",28,900,95,102,38,30,118,0,0,38,5],
["カルリマ1","デスセンチュリオン",33,1250,110,117,50,39,145,0,0,50,5],
["カルリマ1","シュリカー",40,1800,130,137,66,50,180,0,0,66,5],
["カルリマ1","クンドンの幻影",52,3000,165,172,90,70,255,0,0,90,5],
["カルリマ2","アエギス",32,1000,105,112,42,33,135,0,0,42,5],
["カルリマ2","ロードセンチュリオン",34,1200,112,119,45,36,147,0,0,45,5],
["カルリマ2","ブラッドソルジャー",37,1400,120,127,50,40,163,0,0,50,5],
["カルリマ2","デスエンジェル",40,1800,130,137,57,45,182,0,0,57,5],
["カルリマ2","ネクロン",44,2300,140,147,68,50,205,0,0,68,5],
["カルリマ2","デスセンチュリオン",48,3000,155,162,81,58,235,0,0,81,5],
["カルリマ2","シュリカー",53,3900,180,187,100,67,275,0,0,100,5],
["カルリマ2","クンドンの幻影",65,6000,220,227,140,100,355,0,0,140,5],
["カルリマ3","アエギス",46,2700,145,155,73,54,220,0,0,73,5],
["カルリマ3","ロードセンチュリオン",48,3100,152,162,80,56,232,0,0,80,5],
["カルリマ3","ブラッドソルジャー",50,3650,160,170,90,60,250,0,0,90,5],
["カルリマ3","デスエンジェル",53,4400,175,185,105,67,273,0,0,105,5],
["カルリマ3","ネクロン",58,5300,195,205,126,77,296,0,0,126,5],
["カルリマ3","デスセンチュリオン",63,6600,225,235,150,92,325,0,0,150,5],
["カルリマ3","シュリカー",69,8400,260,270,180,110,365,0,0,180,5],
["カルリマ3","クンドンの幻影",81,14000,350,360,255,160,460,0,0,255,5],
["カルリマ4","アエギス",62,6000,215,232,140,87,310,0,0,140,5],
["カルリマ4","ロードセンチュリオン",66,6900,230,250,150,95,330,0,0,150,5],
["カルリマ4","ブラッドソルジャー",70,8800,245,264,165,105,360,0,0,165,5],
["カルリマ4","デスエンジェル",74,12000,270,295,185,120,397,0,0,185,5],
["カルリマ4","ネクロン",78,16000,305,330,215,145,440,0,0,215,5],
["カルリマ4","デスセンチュリオン",83,22500,350,375,225,175,500,0,0,225,5],
["カルリマ4","シュリカー",88,30000,410,435,300,215,575,0,0,300,5],
["カルリマ4","クンドンの幻影",100,50000,600,625,500,295,780,0,0,500,5],
["カルリマ5","アエギス",79,18000,310,340,230,163,460,0,0,230,5],
["カルリマ5","ロードセンチュリオン",82,21000,335,365,250,168,490,0,0,250,5],
["カルリマ5","ブラッドソルジャー",85,26000,365,395,280,177,540,0,0,280,5],
["カルリマ5","デスエンジェル",88,31000,408,443,315,195,587,0,0,315,5],
["カルリマ5","ネクロン",93,38500,470,505,370,220,645,0,0,370,5],
["カルリマ5","デスセンチュリオン",98,48000,546,581,430,250,715,0,0,430,5],
["カルリマ5","シュリカー",105,60000,640,675,515,290,810,0,0,515,5],
["カルリマ5","クンドンの幻影",117,100000,835,870,680,360,1000,0,0,680,5],
["カルリマ6","アエギス",95,42000,520,550,410,230,655,0,0,410,5],
["カルリマ6","ロードセンチュリオン",98,48500,540,570,432,240,680,0,0,432,5],
["カルリマ6","ブラッドソルジャー",101,56000,570,600,460,255,713,0,0,460,5],
["カルリマ6","デスエンジェル",105,65000,610,645,500,275,760,0,0,500,5],
["カルリマ6","ネクロン",109,75500,672,707,550,303,820,0,0,550,5],
["カルリマ6","デスセンチュリオン",114,87500,753,788,620,335,900,0,0,620,5],
["カルリマ6","シュリカー",119,105000,850,885,710,370,1000,0,0,710,5],
["カルリマ6","クンドンの幻影",140,140000,1070,1105,892,450,1200,0,0,892,5],
["カルリマ7","アエギス",111,82000,712,752,584,315,850,0,0,584,5],
["カルリマ7","ロードセンチュリオン",114,88000,751,791,615,330,880,0,0,615,5],
["カルリマ7","ブラッドソルジャー",117,97300,805,845,660,345,920,0,0,660,5],
["カルリマ7","デスエンジェル",121,110000,870,915,720,370,960,0,0,720,5],
["カルリマ7","ネクロン",125,125000,951,996,783,405,1015,0,0,783,5],
["カルリマ7","デスセンチュリオン",130,145000,1040,1085,865,440,1080,0,0,865,5],
["カルリマ7","シュリカー",135,170000,1168,1213,992,485,1190,0,0,992,5],
["カルリマ7","クンドン",147,5000000,2000,2500,1000,600,2000,0,0,1000,5],
["デビルスクエア1","サイクロプス",28,850,100,105,35,35,140,0,0,35,5],
["デビルスクエア1","スカルアーチャー",34,1000,115,120,45,41,170,0,0,45,5],
["デビルスクエア1","ヘルハウンド",38,1400,125,130,55,45,190,0,0,55,5],
["デビルスクエア1","タランチュラ",40,1600,130,135,60,47,200,0,0,60,5],
["デビルスクエア1","猛毒のミノタウロス",46,2500,145,150,75,61,230,0,0,75,5],
["デビルスクエア1","シャドー",47,2800,148,153,78,67,235,0,0,78,5],
["デビルスクエア1","魔将軍ゴルゴン",55,6000,165,175,100,82,275,0,0,100,5],
["デビルスクエア2","ダークナイト",48,3000,150,155,80,70,240,0,0,80,5],
["デビルスクエア2","ポイズンシャドー",50,3500,155,160,85,73,250,0,0,85,5],
["デビルスクエア2","呪いの魔法師",54,4000,160,170,95,79,270,0,0,95,5],
["デビルスクエア2","ダークホーン",57,4500,170,180,110,85,285,0,0,110,5],
["デビルスクエア2","死霊の騎士",62,5500,190,200,120,91,310,0,0,120,5],
["デビルスクエア2","灼熱のゴルゴン",64,6000,200,210,130,94,320,0,0,130,5],
["デビルスクエア2","ヒドラ",74,19000,250,310,200,125,430,0,0,200,5],
["デビルスクエア3","シュリカー2",53,3900,180,187,100,67,275,0,0,100,5],
["デビルスクエア3","ダークホーン",57,4500,170,180,110,85,285,0,0,110,5],
["デビルスクエア3","ディアボロス",60,5000,180,195,115,88,300,0,0,115,5],
["デビルスクエア3","灼熱のゴルゴン",64,6000,200,210,130,94,320,0,0,130,5],
["デビルスクエア3","オークアーチャー",70,10000,220,250,170,110,350,0,0,170,5],
["デビルスクエア3","キングオーク",74,14000,260,290,190,125,400,0,0,190,5],
["デビルスクエア3","メタルバルロック",77,26000,300,360,220,150,385,0,0,220,5],
["デビルスクエア4","オークアーチャー",70,10000,220,250,170,110,350,0,0,170,5],
["デビルスクエア4","キングオーク",74,14000,260,290,190,125,400,0,0,190,5],
["デビルスクエア4","アックスウォーリアー",75,11500,255,290,195,125,385,0,0,195,5],
["デビルスクエア4","ガルム",76,13500,260,300,200,130,410,0,0,200,5],
["デビルスクエア4","アイアンホイール",80,17000,280,330,215,150,446,0,0,215,5],
["デビルスクエア4","クイーンレイナー",83,19000,305,350,230,160,475,0,0,230,5],
["デビルスクエア4","呪いの王",86,38000,500,570,380,180,525,0,0,380,5],
["デビルスクエア5","デスエンジェル4",74,12000,270,295,185,120,397,0,0,185,5],
["デビルスクエア5","アックスウォーリアー",75,11500,255,290,195,125,385,0,0,195,5],
["デビルスクエア5","ガルム",76,13500,260,300,200,130,410,0,0,200,5],
["デビルスクエア5","メガクラスト",78,15000,270,320,210,140,430,0,0,210,5],
["デビルスクエア5","ビームナイト",84,25000,375,425,275,190,530,0,0,275,5],
["デビルスクエア5","ワイバーン",86,29000,425,480,305,210,570,0,0,305,5],
["デビルスクエア5","ファイアゴーレム",102,55000,560,600,550,310,870,0,0,550,5],
["デビルスクエア6","リザードマン",78,15000,270,320,210,140,430,0,0,210,5],
["デビルスクエア6","アイアンホイール",80,17000,280,330,215,150,446,0,0,215,5],
["デビルスクエア6","クイーンレイナー",83,19000,305,350,230,160,475,0,0,230,5],
["デビルスクエア6","ポイズンゴーレム",84,25000,375,425,275,190,530,0,0,275,5],
["デビルスクエア6","クイーンビー",92,34500,490,540,360,240,620,0,0,360,5],
["デビルスクエア6","メタルクラスト",92,34500,490,540,360,240,620,0,0,360,5],
["デビルスクエア6","クンドンの幻影4",100,50000,600,625,500,295,778,0,0,500,5],
["デビルスクエア7","ギガンティスDS7",105,30000,480,510,360,270,715,0,0,360,5],
["デビルスクエア7","ベルセルクDS7",106,33000,0,0,410,280,750,0,0,410,5],
["デビルスクエア7","バルラムDS7",117,37000,570,600,460,320,800,0,0,460,5],
["デビルスクエア7","ソラムDS7",119,40000,625,660,510,330,835,0,0,510,5],
["デビルスクエア7","ペルソナDS7",121,50000,655,685,570,370,935,0,0,570,5],
["デビルスクエア7","ドレッドフィアーDS7",123,55000,730,760,610,380,1015,0,0,610,5],
["デビルスクエア7","ダークエルフDS7",135,75000,850,950,690,430,1300,0,0,690,5],
["ブラッドキャッスル1","骸骨の戦士1（0～5分経過)",33,1100,100,120,55,45,190,0,0,55,5],
["ブラッドキャッスル1","骸骨の戦士1（5～10分経過)",33,1100,110,140,35,45,190,0,0,35,5],
["ブラッドキャッスル1","骸骨の戦士1（10～15分経過)",33,1100,120,160,5,45,190,0,0,5,5],
["ブラッドキャッスル1","キングスカルアーチャー1（0～5分経過)",37,1400,110,130,65,49,210,0,0,65,5],
["ブラッドキャッスル1","キングスカルアーチャー1（5～10分経過)",37,1400,120,150,45,49,210,0,0,45,5],
["ブラッドキャッスル1","キングスカルアーチャー1（10～15分経過)",37,1400,130,170,15,49,210,0,0,15,5],
["ブラッドキャッスル1","ダークスカルアーマー1（0～5分経過)",41,1700,120,140,75,61,230,0,0,75,5],
["ブラッドキャッスル1","ダークスカルアーマー1（5～10分経過)",41,1700,130,160,55,61,230,0,0,55,5],
["ブラッドキャッスル1","ダークスカルアーマー1（10～15分経過)",41,1700,140,180,25,61,230,0,0,25,5],
["ブラッドキャッスル1","暗黒のオウガ1（0～5分経過)",44,2100,130,150,85,73,250,0,0,85,5],
["ブラッドキャッスル1","暗黒のオウガ1（5～10分経過)",44,2100,140,170,65,73,250,0,0,65,5],
["ブラッドキャッスル1","暗黒のオウガ1（10～15分経過)",44,2100,150,190,35,73,250,0,0,35,5],
["ブラッドキャッスル1","レッドスカルアーマー1（0～5分経過)",47,2800,140,160,95,77,270,0,0,95,5],
["ブラッドキャッスル1","レッドスカルアーマー1（5～10分経過)",47,2800,150,180,75,77,270,0,0,75,5],
["ブラッドキャッスル1","レッドスカルアーマー1（10～15分経過)",47,2800,160,200,45,77,270,0,0,45,5],
["ブラッドキャッスル1","髑髏メイジ1（0～5分経過)",51,3700,150,180,115,88,300,0,0,115,5],
["ブラッドキャッスル1","髑髏メイジ1（5～10分経過)",51,3700,160,200,95,88,300,0,0,95,5],
["ブラッドキャッスル1","髑髏メイジ1（10～15分経過)",51,3700,170,220,65,88,300,0,0,65,5],
["ブラッドキャッスル2","骸骨の戦士2（0～5分経過)",49,3500,140,170,90,76,250,0,0,90,5],
["ブラッドキャッスル2","骸骨の戦士2（5～10分経過)",49,3500,150,190,70,76,250,0,0,70,5],
["ブラッドキャッスル2","骸骨の戦士2（10～15分経過)",49,3500,160,210,40,76,250,0,0,40,5],
["ブラッドキャッスル2","キングスカルアーチャー2（0～5分経過)",53,4100,150,180,100,80,275,0,0,100,5],
["ブラッドキャッスル2","キングスカルアーチャー2（5～10分経過)",53,4100,160,200,80,80,275,0,0,80,5],
["ブラッドキャッスル2","キングスカルアーチャー2（10～15分経過)",53,4100,170,220,50,80,275,0,0,50,5],
["ブラッドキャッスル2","ダークスカルアーマー2（0～5分経過)",56,5000,160,190,115,88,300,0,0,115,5],
["ブラッドキャッスル2","ダークスカルアーマー2（5～10分経過)",56,5000,170,210,95,88,300,0,0,95,5],
["ブラッドキャッスル2","ダークスカルアーマー2（10～15分経過)",56,5000,180,230,65,88,300,0,0,65,5],
["ブラッドキャッスル2","暗黒のオウガ2（0～5分経過)",60,6000,175,210,130,95,320,0,0,130,5],
["ブラッドキャッスル2","暗黒のオウガ2（5～10分経過)",60,6000,185,230,110,95,320,0,0,110,5],
["ブラッドキャッスル2","暗黒のオウガ2（10～15分経過)",60,6000,195,250,80,95,320,0,0,80,5],
["ブラッドキャッスル2","レッドスカルアーマー2（0～5分経過)",64,7000,185,220,170,110,360,0,0,170,5],
["ブラッドキャッスル2","レッドスカルアーマー2（5～10分経過)",64,7000,195,240,150,110,360,0,0,150,5],
["ブラッドキャッスル2","レッドスカルアーマー2（10～15分経過)",64,7000,205,260,120,110,360,0,0,120,5],
["ブラッドキャッスル2","髑髏メイジ2（0～5分経過)",69,8000,200,240,190,130,400,0,0,190,5],
["ブラッドキャッスル2","髑髏メイジ2（5～10分経過)",69,8000,210,260,170,130,400,0,0,170,5],
["ブラッドキャッスル2","髑髏メイジ2（10～15分経過)",69,8000,220,280,140,130,400,0,0,140,5],
["ブラッドキャッスル3","骸骨の戦士3（0～5分経過)",56,5000,160,180,110,85,300,0,0,110,5],
["ブラッドキャッスル3","骸骨の戦士3（5～10分経過)",56,5000,170,200,90,85,300,0,0,90,5],
["ブラッドキャッスル3","骸骨の戦士3（10～15分経過)",56,5000,180,220,60,85,300,0,0,60,5],
["ブラッドキャッスル3","キングスカルアーチャー3（0～5分経過)",61,6500,180,200,120,93,330,0,0,120,5],
["ブラッドキャッスル3","キングスカルアーチャー3（5～10分経過)",61,6500,190,220,100,93,330,0,0,100,5],
["ブラッドキャッスル3","キングスカルアーチャー3（10～15分経過)",61,6500,200,240,70,93,330,0,0,70,5],
["ブラッドキャッスル3","ダークスカルアーマー3（0～5分経過)",66,8000,190,220,150,98,360,0,0,150,5],
["ブラッドキャッスル3","ダークスカルアーマー3（5～10分経過)",66,8000,200,240,130,98,360,0,0,130,5],
["ブラッドキャッスル3","ダークスカルアーマー3（10～15分経過)",66,8000,210,260,100,98,360,0,0,100,5],
["ブラッドキャッスル3","暗黒のオウガ3（0～5分経過)",70,9500,210,240,180,115,400,0,0,180,5],
["ブラッドキャッスル3","暗黒のオウガ3（5～10分経過)",70,9500,220,260,160,115,400,0,0,160,5],
["ブラッドキャッスル3","暗黒のオウガ3（10～15分経過)",70,9500,230,280,130,115,400,0,0,130,5],
["ブラッドキャッスル3","レッドスカルアーマー3（0～5分経過)",74,12000,220,260,190,130,440,0,0,190,5],
["ブラッドキャッスル3","レッドスカルアーマー3（5～10分経過)",74,12000,230,280,170,130,440,0,0,170,5],
["ブラッドキャッスル3","レッドスカルアーマー3（10～15分経過)",74,12000,240,300,140,130,440,0,0,140,5],
["ブラッドキャッスル3","髑髏メイジ3（0～5分経過)",79,15000,230,280,240,180,500,0,0,240,5],
["ブラッドキャッスル3","髑髏メイジ3（5～10分経過)",79,15000,240,300,220,180,500,0,0,220,5],
["ブラッドキャッスル3","髑髏メイジ3（10～15分経過)",79,15000,250,320,190,180,500,0,0,190,5],
["ブラッドキャッスル4","骸骨の戦士4（0～5分経過)",64,7500,180,220,150,98,340,0,0,150,5],
["ブラッドキャッスル4","骸骨の戦士4（5～10分経過)",64,7500,190,240,130,98,340,0,0,130,5],
["ブラッドキャッスル4","骸骨の戦士4（10～15分経過)",64,7500,200,260,100,98,340,0,0,100,5],
["ブラッドキャッスル4","キングスカルアーチャー4（0～5分経過)",69,9500,200,240,170,110,380,0,0,170,5],
["ブラッドキャッスル4","キングスカルアーチャー4（5～10分経過)",69,9500,210,260,150,110,380,0,0,150,5],
["ブラッドキャッスル4","キングスカルアーチャー4（10～15分経過)",69,9500,220,280,120,110,380,0,0,120,5],
["ブラッドキャッスル4","ダークスカルアーマー4（0～5分経過)",75,12000,220,260,190,130,440,0,0,190,5],
["ブラッドキャッスル4","ダークスカルアーマー4（5～10分経過)",75,12000,230,280,170,130,440,0,0,170,5],
["ブラッドキャッスル4","ダークスカルアーマー4（10～15分経過)",75,12000,240,300,140,130,440,0,0,140,5],
["ブラッドキャッスル4","暗黒のオウガ4（0～5分経過)",79,15000,250,290,210,150,500,0,0,210,5],
["ブラッドキャッスル4","暗黒のオウガ4（5～10分経過)",79,15000,260,310,190,150,500,0,0,190,5],
["ブラッドキャッスル4","暗黒のオウガ4（10～15分経過)",79,15000,270,330,160,150,500,0,0,160,5],
["ブラッドキャッスル4","レッドスカルアーマー4（0～5分経過)",82,18000,270,320,290,170,560,0,0,290,5],
["ブラッドキャッスル4","レッドスカルアーマー4（5～10分経過)",82,18000,280,340,270,170,560,0,0,270,5],
["ブラッドキャッスル4","レッドスカルアーマー4（10～15分経過)",82,18000,290,360,240,170,560,0,0,240,5],
["ブラッドキャッスル4","髑髏メイジ4（0～5分経過)",84,24000,300,350,360,200,640,0,0,360,5],
["ブラッドキャッスル4","髑髏メイジ4（5～10分経過)",84,24000,310,370,340,200,640,0,0,340,5],
["ブラッドキャッスル4","髑髏メイジ4（10～15分経過)",84,24000,320,390,310,200,640,0,0,310,5],
["ブラッドキャッスル5","骸骨の戦士5（0～5分経過)",70,12000,210,270,185,125,380,0,0,185,5],
["ブラッドキャッスル5","骸骨の戦士5（5～10分経過)",70,12000,220,290,165,125,380,0,0,165,5],
["ブラッドキャッスル5","骸骨の戦士5（10～15分経過)",70,12000,230,310,135,125,380,0,0,135,5],
["ブラッドキャッスル5","キングスカルアーチャー5（0～5分経過)",75,15000,240,300,190,130,420,0,0,190,5],
["ブラッドキャッスル5","キングスカルアーチャー5（5～10分経過)",75,15000,250,320,170,130,420,0,0,170,5],
["ブラッドキャッスル5","キングスカルアーチャー5（10～15分経過)",75,15000,260,340,140,130,420,0,0,140,5],
["ブラッドキャッスル5","ダークスカルアーマー5（0～5分経過)",80,19000,280,340,220,175,470,0,0,220,5],
["ブラッドキャッスル5","ダークスカルアーマー5（5～10分経過)",80,19000,290,360,200,175,470,0,0,200,5],
["ブラッドキャッスル5","ダークスカルアーマー5（10～15分経過)",80,19000,300,380,170,175,470,0,0,170,5],
["ブラッドキャッスル5","暗黒のオウガ5（0～5分経過)",85,23000,340,390,300,190,520,0,0,300,5],
["ブラッドキャッスル5","暗黒のオウガ5（5～10分経過)",85,23000,350,410,280,190,520,0,0,280,5],
["ブラッドキャッスル5","暗黒のオウガ5（10～15分経過)",85,23000,360,430,250,190,520,0,0,250,5],
["ブラッドキャッスル5","レッドスカルアーマー5（0～5分経過)",87,26000,370,410,400,200,650,0,0,400,5],
["ブラッドキャッスル5","レッドスカルアーマー5（5～10分経過)",87,26000,380,430,380,200,650,0,0,380,5],
["ブラッドキャッスル5","レッドスカルアーマー5（10～15分経過)",87,26000,390,450,350,200,650,0,0,350,5],
["ブラッドキャッスル5","髑髏メイジ5（0～5分経過)",90,32000,400,460,450,260,720,0,0,450,5],
["ブラッドキャッスル5","髑髏メイジ5（5～10分経過)",90,32000,410,480,430,260,720,0,0,430,5],
["ブラッドキャッスル5","髑髏メイジ5（10～15分経過)",90,32000,420,500,400,260,720,0,0,400,5],
["ブラッドキャッスル6","骸骨の戦士6（0～5分経過)",76,17000,260,290,210,150,460,0,0,210,5],
["ブラッドキャッスル6","骸骨の戦士6（5～10分経過)",76,17000,270,310,190,150,460,0,0,190,5],
["ブラッドキャッスル6","骸骨の戦士6（10～15分経過)",76,17000,280,330,160,150,460,0,0,160,5],
["ブラッドキャッスル6","キングスカルアーチャー6（0～5分経過)",81,20000,320,350,270,160,520,0,0,270,5],
["ブラッドキャッスル6","キングスカルアーチャー6（5～10分経過)",81,20000,330,370,250,160,520,0,0,250,5],
["ブラッドキャッスル6","キングスカルアーチャー6（10～15分経過)",81,20000,340,390,220,160,520,0,0,220,5],
["ブラッドキャッスル6","ダークスカルアーマー6（0～5分経過)",86,25000,390,420,360,195,580,0,0,360,5],
["ブラッドキャッスル6","ダークスカルアーマー6（5～10分経過)",86,25000,400,440,340,195,580,0,0,340,5],
["ブラッドキャッスル6","ダークスカルアーマー6（10～15分経過)",86,25000,410,460,310,195,580,0,0,310,5],
["ブラッドキャッスル6","暗黒のオウガ6（0～5分経過)",90,32000,440,500,400,200,660,0,0,400,5],
["ブラッドキャッスル6","暗黒のオウガ6（5～10分経過)",90,32000,450,520,380,200,660,0,0,380,5],
["ブラッドキャッスル6","暗黒のオウガ6（10～15分経過)",90,32000,460,540,350,200,660,0,0,350,5],
["ブラッドキャッスル6","レッドスカルアーマー6（0～5分経過)",94,38000,480,540,450,260,720,0,0,450,5],
["ブラッドキャッスル6","レッドスカルアーマー6（5～10分経過)",94,38000,490,560,430,260,720,0,0,430,5],
["ブラッドキャッスル6","レッドスカルアーマー6（10～15分経過)",94,38000,500,580,400,260,720,0,0,400,5],
["ブラッドキャッスル6","髑髏メイジ6（0～5分経過)",99,47000,530,580,500,280,840,0,0,500,5],
["ブラッドキャッスル6","髑髏メイジ6（5～10分経過)",99,47000,540,600,480,280,840,0,0,480,5],
["ブラッドキャッスル6","髑髏メイジ6（10～15分経過)",99,47000,550,620,450,280,840,0,0,450,5],
["ブラッドキャッスル7","骸骨の戦士7（0～5分経過）",85,23000,340,390,310,190,520,0,0,310,5],
["ブラッドキャッスル7","骸骨の戦士7（5～10分経過）",85,23000,350,410,290,190,520,0,0,290,5],
["ブラッドキャッスル7","骸骨の戦士7（10～15分経過）",85,23000,360,430,260,190,520,0,0,260,5],
["ブラッドキャッスル7","キングスカルアーチャー7（0～5分経過）",87,26000,390,430,380,200,590,0,0,380,5],
["ブラッドキャッスル7","キングスカルアーチャー7（5～10分経過）",87,26000,400,450,360,200,590,0,0,360,5],
["ブラッドキャッスル7","キングスカルアーチャー7（10～15分経過）",87,26000,410,470,330,200,590,0,0,330,5],
["ブラッドキャッスル7","ダークスカルアーマー7（0～5分経過）",90,32000,430,480,400,230,660,0,0,400,5],
["ブラッドキャッスル7","ダークスカルアーマー7（5～10分経過）",90,32000,440,500,380,230,660,0,0,380,5],
["ブラッドキャッスル7","ダークスカルアーマー7（10～15分経過）",90,32000,450,520,350,230,660,0,0,350,5],
["ブラッドキャッスル7","暗黒のオウガ7（0～5分経過）",93,37000,470,520,440,250,730,0,0,440,5],
["ブラッドキャッスル7","暗黒のオウガ7（5～10分経過）",93,37000,480,540,420,250,730,0,0,420,5],
["ブラッドキャッスル7","暗黒のオウガ7（10～15分経過）",93,37000,490,560,390,250,730,0,0,390,5],
["ブラッドキャッスル7","レッドスカルアーマー7（0～5分経過）",98,45000,510,560,490,270,800,0,0,490,5],
["ブラッドキャッスル7","レッドスカルアーマー7（5～10分経過）",98,45000,520,580,470,270,800,0,0,470,5],
["ブラッドキャッスル7","レッドスカルアーマー7（10～15分経過）",98,45000,530,600,440,270,800,0,0,440,5],
["ブラッドキャッスル7","髑髏メイジ7（0～5分経過）",102,55000,560,600,550,310,870,0,0,550,5],
["ブラッドキャッスル7","髑髏メイジ7（5～10分経過）",102,55000,570,620,530,310,870,0,0,530,5],
["ブラッドキャッスル7","髑髏メイジ7（10～15分経過）",102,55000,580,640,500,310,870,0,0,500,5],
["ブラッドキャッスル8","オーク戦士8（0～5分経過)",100,29000,475,510,440,400,0,0,0,440,5],
["ブラッドキャッスル8","オーク戦士8（5～10分経過)",100,29000,485,530,420,400,0,0,0,420,5],
["ブラッドキャッスル8","オーク戦士8（10～15分経過)",100,29000,495,550,390,400,0,0,0,390,5],
["ブラッドキャッスル8","オークアーチャー8（0～5分経過)",100,32000,510,555,480,220,0,0,0,480,5],
["ブラッドキャッスル8","オークアーチャー8（5～10分経過)",100,32000,520,575,460,220,0,0,0,460,5],
["ブラッドキャッスル8","オークアーチャー8（10～15分経過)",100,32000,530,595,430,220,0,0,0,430,5],
["ブラッドキャッスル8","ダークスカルアーマー8（0～5分経過)",100,37000,625,650,500,400,0,0,0,500,5],
["ブラッドキャッスル8","ダークスカルアーマー8（5～10分経過)",100,37000,635,670,480,400,0,0,0,480,5],
["ブラッドキャッスル8","ダークスカルアーマー8（10～15分経過)",100,37000,645,690,450,400,0,0,0,450,5],
["ブラッドキャッスル8","暗黒のオウガ8（0～5分経過)",100,45000,670,685,540,400,0,0,0,540,5],
["ブラッドキャッスル8","暗黒のオウガ8（5～10分経過)",100,45000,680,705,520,400,0,0,0,520,5],
["ブラッドキャッスル8","暗黒のオウガ8（10～15分経過)",100,45000,690,725,490,400,0,0,0,490,5],
["ブラッドキャッスル8","レッドスカルアーマー8（0～5分経過)",100,55000,780,815,600,400,0,0,0,600,5],
["ブラッドキャッスル8","レッドスカルアーマー8（5～10分経過)",100,55000,790,835,580,400,0,0,0,580,5],
["ブラッドキャッスル8","レッドスカルアーマー8（10～15分経過)",100,55000,800,855,550,400,0,0,0,550,5],
["ブラッドキャッスル8","髑髏メイジ8（0～5分経過)",125,0,840,860,680,400,0,0,0,680,5],
["ブラッドキャッスル8","髑髏メイジ8（5～10分経過)",125,0,850,880,660,400,0,0,0,660,5],
["ブラッドキャッスル8","髑髏メイジ8（10～15分経過)",125,0,860,900,630,400,0,0,0,630,5],
["カオスキャッスル1","カオスキャッスル1（近接）",30,700,70,90,30,20,160,0,0,30,5],
["カオスキャッスル1","カオスキャッスル1（遠距離）",32,800,80,100,40,30,180,0,0,40,5],
["カオスキャッスル2","カオスキャッスル2（近接）",40,1600,132,135,75,60,225,0,0,75,5],
["カオスキャッスル2","カオスキャッスル2（遠距離）",45,2700,150,150,90,70,250,0,0,90,5],
["カオスキャッスル3","カオスキャッスル3（近接）",54,4000,168,165,105,80,270,0,0,105,5],
["カオスキャッスル3","カオスキャッスル3（遠距離）",60,5000,180,180,120,90,290,0,0,120,5],
["カオスキャッスル4","カオスキャッスル4（近接）",65,6500,185,210,145,110,320,0,0,145,5],
["カオスキャッスル4","カオスキャッスル4（遠距離）",68,8000,205,230,160,120,350,0,0,160,5],
["カオスキャッスル5","カオスキャッスル5（近接）",70,10000,215,240,170,120,370,0,0,170,5],
["カオスキャッスル5","カオスキャッスル5（遠距離）",75,12500,235,260,190,130,400,0,0,190,5],
["カオスキャッスル6","カオスキャッスル6（近接）",76,15000,255,280,215,140,430,0,0,215,5],
["カオスキャッスル6","カオスキャッスル6（遠距離）",80,18000,280,300,240,150,470,0,0,240,5],
["カオスキャッスル7","カオスキャッスル7（近接）",111,20000,300,345,245,190,480,0,0,245,5],
["カオスキャッスル7","カオスキャッスル7（遠距離）",114,23000,330,380,280,200,520,0,0,280,5],
["黄金軍団","ゴールドパージドラゴン",15,2200,120,125,45,30,75,0,0,45,5],
["黄金軍団","ゴールドゴブリン",20,3100,125,130,50,30,100,0,0,50,5],
["黄金軍団","ゴールドタイタン",53,8000,170,180,105,77,265,0,0,105,5],
["黄金軍団","ゴールドソルジャー",46,3500,140,150,75,64,230,0,0,75,5],
["黄金軍団","ゴールドドラゴン",80,23000,300,350,230,90,400,0,0,230,5],
["黄金軍団","ゴールドリザードキング",83,25000,310,360,240,150,415,0,0,240,5],
["黄金軍団","ゴールドファルネウス",61,6300,190,200,110,90,310,0,0,110,5],
["黄金軍団","ゴールドタルタロス",90,30000,450,560,300,185,450,0,0,300,5],
["黄金軍団","ゴールドホイール",77,15000,320,360,230,160,385,0,0,230,5],
["黄金軍団","ゴールドラビット",40,3000,130,135,60,47,200,0,0,60,5],
["黄金軍団","ゴールドダークナイト",60,5000,180,195,115,88,300,0,0,115,5],
["黄金軍団","ゴールドディアボロス",72,10000,250,280,190,120,365,0,0,190,5],
["黄金軍団","ゴールドブルーゴーレム",84,25000,375,425,275,190,530,0,0,275,5],
["黄金軍団","ゴールドクラスト",92,34500,489,540,360,240,620,0,0,360,5],
["黄金軍団","ゴールドサテュロス",108,95000,950,1000,600,350,900,0,0,600,5],
["黄金軍団","ゴールドツインテール",130,145000,1040,1085,865,440,1080,0,0,865,5],
["黄金軍団","ゴールドナピン",112,77000,1441,2017,585,840,1350,0,0,585,5],
["黄金軍団","ゴールドアイアンナイト",145,200000,1743,2092,650,840,1940,0,0,650,5],
["黄金軍団","ゴールドグレートドラゴン",142,95000,1917,2301,660,800,2000,0,0,660,5],
["アケロン","デビルフェアリー",88,29000,408,443,315,195,0,318,342,216,5],
["アケロン","エレメンタルビースト",91,32000,435,465,340,185,0,345,358,245,5],
["アケロン","エレメンタルナイト",93,33000,455,510,370,220,0,365,389,277,5],
["アケロン","ウバイドデビルフェアリー",99,35000,520,555,395,235,0,385,417,306,5],
["アケロン","ウバイドエレメンタルビースト",101,37500,540,575,430,240,0,422,446,336,5],
["アケロン","ウバイドエレメンタルナイト",103,38500,570,600,455,255,0,456,481,351,5],
["アケロン","サラマンデル",113,12000,620,655,515,315,0,463,486,305,0],
["アケロン","ウンディーネ",113,13100,600,635,495,315,0,472,499,290,1],
["アケロン","シルフィード",113,11500,635,675,475,315,0,495,512,325,3],
["アケロン","ノーム",113,14000,590,635,545,295,0,458,485,275,2],
["アケロン","ダークエレメンタル",113,11000,600,630,475,305,0,467,483,285,4]
];
	}
}