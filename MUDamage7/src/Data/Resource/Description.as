package Data.Resource{
	public class Description{
		public static var credit:String = (<![CDATA[
MUDamage7 created by mudamage administer in Japan.
mail:
	mudamage<at>live.jp
site:
	http://mudamage.web.fc2.com/
sourcecode:
	http://code.google.com/p/mudamage/

©2001-2010 WEBZEN, Inc. All Rights Reserved. Licensed to ©2010 GameOn Co., Ltd.
				]]> ).toString();
		public static var bugs:String = ( <![CDATA[
不具合

・計算結果画面のタブの部分に×ボタンがない
・メニューの充実
・レイジファイターの攻撃速度を未適用（現在はとりあえずで値を入れています。）
・エルフの弓計算で、スキル威力が20%低下する計算を未実装
・マスタースキルで習得できる新スキルの威力不明
・最大ダメージが0以上で、最小ダメージが0以下の場合、1ダメージまでゲーム内では表示されるが、計算結果画面では最小固定ダメージを表示している。

・属性アイテムのオプション”ダメージを属性ダメージに追加+5%”を未適用
・Season8 part1の内容が未確定

・対人計算における命中率計算。
現在)
var h1:Number = c2.pvp_avoid - c.pvp_hit;
var h2:Number = c2.pvp_avoid + c.pvp_hit;
hit = (1/(1+Math.exp(6 * h1/h2 + 1.5)))+0.05;
		                        				]]> ).toString();
		public static var release:String = ( <![CDATA[
リリース
2012/12/09 ver3.35
・新規追加グリモアの数値を修正。
・新規実装のグリモアオプションの発動条件を追加。
・征服者の羽を追加。
・ヴォルカノスのモンスター情報修正。
・メデューサのモンスター情報修正。

2012/11/10 ver3.34
・ネックレスのオプションを保存できるように修正。
・グリモアのオプションを保存できるように修正。
・対人相手名、城、決闘のフォームを保存できるように修正。
・公式のグリモア必中バグ修正に伴い、対人時の命中率を100%にしていた部分を正常に変更。
・マスターレベルの上限を330に変更。
・対人計算式を修正。

2012/11/10 ver3.33
・ベガのセットオプション「エクセレントダメージ確率」が「エクセレントダメージ」になっていた不具合を修正。
・Season8 part1の属性アイテムを追加。（不明箇所多数）

2012/09/01 ver3.32
・380OP用のフォームが表示されていなかった不具合を修正。

2012/08/11 ver3.31
・確率系マスタースキルの数値修正。
・EX装備の要求数値が通常装備の数値になっていた不具合を修正。
・呪いにバーサーカーマスタリ２が適用されていなかった不具合を修正。
・セットアイテムのステータス増加が装備結果画面に表示されていない不具合を修正。
・サポ系の防御力増加を基礎計算に入れてるのを修正。
・狂戦士のセットOP、AG増加量がエラーになっていた不具合を修正。
・対人時、グリモアを装備した際に、通常ダメージの命中率が100%になるように修正。

2012/07/26 ver3.30
・バーサーカーマインドマスタリ2の効果を修正。
・時の結晶等が魔力計算に適用されていなかった不具合を修正。

2012/07/21 ver3.29
・マグニのセットオプションが4箇所及び5箇所装備の時に計算できなかった不具合を修正。
・君臨のマントの吸収率が低く設定されていた不具合を修正。
・属性ボスモンスターの属性防御力を修正。
・通常モンスターには属性相性計算が行われないように修正。
・属性計算の端数調整。
・HP回復量を表示。
・AGHにソケットオプションを加えていなかった不具合を修正。

2012/07/15 ver3.28
・召喚師のセットアイテム「ハピ」と「エルルーン」のセットオプションが適用されていない不具合を修正。
・セットソケットオプションが適用されていなかった不具合を修正。

2012/06/24 ver3.27
・MLVの上限を302に変更。
・召喚師のマスタースキル「バーサーカマインド強化」を修正。
・純粋なHPにマスタースキル「最大生命増加」を含めないように修正。
・属性防御力の相性が＋ー逆だった不具合を修正。
・エレメンタルビーストの属性最大攻撃力、サラマンデルの属性防御力を修正。
・結果画面に純粋なHPをツールチップで表示。

2012/06/24 ver3.26
・ラッキーアイテムのエンチャントOPが武器系になっていた不具合を修正。
・ソウルバリアの計算式修正。
・eX702適用。（ただし、要求数値上昇値は適当。）
・属性計算修正。（命中計算は適当に実装。）

2012/06/23 ver3.25
・属性計算修正。

2012/05/27 ver3.24
・クリングブローの攻撃力低下が、モンスターの防御力低下として適用されていた不具合を修正。
・ビーストアッパーの防御力低下が、モンスターの攻撃力低下として適用されていた不具合を修正。
・装備にオプション数値が付いてる時に、オプション数値込みの要求力も表示するように変更。
・属性アイテム名を修正。
・アークエンジェルロッドの要求数値を修正。
・フェニックスソウルクローの要求数値を修正。（微妙に異なる。）
・属性攻撃力のステータス増加分を下方修正。
・属性攻撃力の対人時の増加率を1.3倍から2.3倍に修正。
・WIZのマスタースキルツリーの数値を一部修正。

2012/04/19 ver3.23
・BC門・石像時に属性ダメージが表示されないように修正。
・チェーンドライブの攻撃速度を900msに修正。（クールタイムが900msで、攻撃速度はまた別に存在している模様？）
・ソケットOPのダメ減が効いていなかった不具合を修正。
・スパイプログラムスタッフを片手から両手に変更。
・ベスの破壊の杖の魔力数値を修正。

2012/04/19 ver3.22
・マスタースキル「クリティカル確率増加」の数値を修正。
・2.5次羽の数値を修正。
・属性攻撃力のステータス依存を修正。（未検証）
・ベルセルクの攻撃成功率を修正。
・eX701新ソケット武器追加。

2012/03/28 ver3.21
・対人計算でDEF前計算（ダメ減など）が適用されていなかった不具合を修正。

2012/03/28 ver3.20
・バフアイテムに彫刻類を追加。
・バフアイテムにオーラ類を追加。
・バフアイテムに時の結晶を追加。
・リングにエリート骸骨の指輪、クリスマス変化の指輪を追加。
・リングのスケルトン変化の指輪、パンダ変化の指輪の効果が適用されていなかった不具合を修正。

2012/03/28 ver3.19
・対人計算を修正。

2012/03/26 ver3.18
・属性システムのクリティカル確率、EXD確率を適用。
・属性システムのステータス増加を適用。
・ファイルの保存で、新規追加分の属性フォームを保存できるように修正。
・武器を選択しなかった時に攻撃力が0になる不具合を修正。
・属性アイテムを選択しなかった時に計算出来なかった不具合を修正。
・マスタースキルツリーの入力フォームで、10ポイントしか振れないマスタースキルに上限を設定。
・ファイルを読み込んだ時に、マスタースキルツリーが空になる場合があった不具合を修正。

2012/03/25 ver3.17
・新規エーテル追加。
・属性システムのランク4、ランク5追加。
・エーテルのランクオプションの値を修正。
・計算結果画面で属性ダメージを別の行に表示するように変更。
・計算結果画面に属性被ダメージを表示。
・モンスターの羽追加（2.5次羽）。
・MAPアケロン追加。
■未実装部分
・属性システムのクリティカル確率、EXD確率未適用
・属性システムのステータス増加系未適用
・ファイルの保存で、新規追加分の属性フォームの保存ができない

2012/03/21 ver3.16
・マスタースキル強化後のバフスキルの一部を小数点以下を切り捨てないように修正。(スウェルライフのみ検証済み)
・インナーベーションとウィークネスを固定増加ではなく、％増加に変更。
・計算結果画面で属性ダメージを別表示に変更。（平均ダメージに属性ダメージは現在追加していない）
・計算結果画面にスキルHIT数と合計ダメージを追加。

2012/03/21 ver3.15
・マスタースキルの「防御成功率増加」の計算位置を修正。
・マスタースキルの値が小数点以下切り捨てで計算されていた不具合を修正。

2012/03/01 ver3.14
・セット装備を混ぜて防具を統一した時に統一ボーナスが適用されなかった不具合を修正。
・マスタースキルの防具統一時防御力増加が、%で適用されていた不具合を修正。
・「ファイルを開く」等でうまく読み込めなかった不具合を修正。
・マスターレベルのステータスポイントがマイナスになった後、プラスになっても色が赤色のままだった不具合を修正。

2012/03/01 ver3.13
・ウィザードのスペルエンハンスを適用させるとダメージが急激に増加していた不具合を修正。
・属性ダメージの最低ダメージが設定されておらず、値がマイナスになる場合があった不具合を修正。
・レイジ用の他職と値が違うマスタースキルが適用されていなかった不具合を修正。
・ダークロードのマスタースキル「統率増加」が適用されていなかった不具合を修正。

2012/02/24 ver3.12
・インナーベーション、ウィークネス、クリングブロー、ビーストアッパー、血戦のデバフ効果を修正。
・ブレスの効果修正。
・ダークロードのマスタースキルツリーに統率増加とファイアスクリームマスタリを追加。
・ダークロードで、馬装備時の被ダメが大きくなっていた不具合を修正。
・ダークホースを装備していないときでも、ダークホースの防御力が適用されていた不具合を修正。
・エーテルを選択していないと属性ダメージが計算できない不具合を修正。
・属性ダメージに仮計算式を適用。
・フェンリルのダメージ増加、減少の計算位置を最終ダメージ後に変更。

2012/01/28 ver3.11
・スペルエンハンスの最大魔力増加が適用されていなかった不具合を修正。
・スウェルライフの最大AG増加が適用されていなかった不具合を修正。
・ソケットボーナスが2つ付けられた不具合を修正。
・表示されていないソケットボーナスを適用させないように変更。
・武器に付く「クリティカルダメージ増加」オプションを剣系はスキルのみ、杖系は魔法のみに適用するように変更。
・ソケットOP「LV割攻撃/魔力増加」オプションを剣系はスキルのみ、杖系は魔法のみに適用するように変更。
・eX700マスタースキル適用。
・召喚師の呪い計算が正常に行われなかった不具合を修正。

2012/01/17 ver3.10
・DLのマスタースキル「ファイアスクリーム強化2」と「ファイアスクリーム強化」と同じものが表示されていた不具合を修正。
・マスタースキルツリーのフォームのデザインを修正。
・入力支援フォームをバフスキル入力フォームに変更。
・サポートスキル入力フォームを削除。
・サポートスキル入力フォームとバフスキル入力フォームの形式が異なるため、保存データは移行していない。

2011/12/23 ver3.09
・防御成功率計算を修正。
・モンスターのHPがモンスター名になっている不具合を修正。
・サポートスキルの入力支援フォームを作成。
・計算フォームのスクロールが出来ない場合がある不具合を修正。
・計算結果画面のスクロールが出来ない場合がある不具合を修正。
・デストロイグラブの攻撃速度が0になっていた不具合を修正。

2011/12/20 ver3.08
・マスタースキル「セット防御力増加」「羽の防御力増加」を計算に追加。
・敵の攻撃成功率が不明な時に、カスリダメージ計算になっていたのを修正。
・魔剣士、レイジファイターの防具統一時ボーナスが適用されていなかった不具合を修正。（現在専用装備以外でも適用されてます。）
・魔法攻撃に属性ダメージ計算が追加されていなかった部分を修正。
・G+が適用されなかった不具合を修正。
・サポート入力フォームが2桁までしか入力できなかった部分を修正。
・ドッペルゲンガーとカウンターリベリオンで防御無視計算が表示されなかった不具合を修正。
・ダメージ計算に防御無視が反映されていなかった不具合を修正。
・マスタースキルの槍とグローブのダブルダメージ確率増加を計算に反映。
・マスタースキルのダブルダメージ確率増加と防御無視確率増加、クリティカル確率、EXD確率を計算に反映。
・マスタースキルの最大攻撃力、最大魔力、最大魔力/呪い、羽攻撃力増加を計算に反映。
・マスタースキルの力増加、敏捷増加、体力増加、エナジー増加、最大AGを計算に反映。
・マスタースキルで習得する新スキルを追加。
・ソケットOPのクリティカル確率増加がEXD確率増加になっていた不具合を修正。
・AG回復量を計算結果画面に追加。

2011/12/14 ver3.07
・マスタースキルの画像アイコンで不要なものを削除。
・マスタースキルツリーが保存されるように修正。
・属性フォームが保存されるように修正。
・属性フォームのデフォルトを何も選択していない状態に変更。
・属性フォームの値を修正。
・属性システムを計算に反映。（とりあえずA+の位置に。）

2011/12/13 ver3.06
・マスタースキルツリーのランク6以降を追加。（計算には未反映）
・プロパティシステムのフォームを追加。（計算には未反映）

2011/12/04 ver3.05
・ドッペルゲンガーとカウンターリベリオンの計算を追加。
・MLVの上限を200から300に変更。
・対人計算追加。
・バフ・デバフスキルが被ダメ計算時に適用されていなかった不具合を修正。
・カスリダメージを追加。
・羽のダメージ吸収が計算に反映されていなかった不具合を修正。

2011/11/29 ver3.04
・マスタースキルの武器マスタリの攻撃速度を、物理攻撃系は攻撃速度に、魔法系は魔法速度に追加するように修正。
・EX装備が通常装備の数値になっていた不具合を修正。
・エルフの矢の効果を適用。
・エルフの左手武器（弓）装備時にスキル攻撃力が適用されなかった不具合を修正。
・マスタースキルのスキル強化の計算位置を修正。
・モンスターへの命中率計算が正常に行われない不具合を修正。

2011/11/23 ver3.03
・新セットアイテム追加。
・不具合＆リリースメニュー作成。
・計算結果画面にセットアイテム等を選択した時に、ソケットOPやエンチャントOPが表示されてしまう不具合を修正。

2011/11/23 ver3.02
・マスタースキルの武器マスタリによる攻撃速度増加を適用。
・ダークスピリットのダメージ計算追加。
・ダークホース、ダークスピリットの結果画面での装備説明追加。
・ペットの追加で選択する部分が正常に適用されていなかった不具合を修正。
・ダークスピリットのLVが保存されなかった不具合を修正。
・ダークホースの防御力計算を追加。
		                        				]]> ).toString();
	}
}