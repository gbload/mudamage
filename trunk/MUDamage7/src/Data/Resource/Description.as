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
・「ファイルを開く」時に、正しく開けない場合がある
・エルフの弓計算で、スキル威力が20%低下する計算を未実装
・プロパティシステムの計算式が不明
・マスタースキルで習得できる新スキルの威力不明

・eX700適用後辺りの更新から対人計算を未更新。
・対人計算における命中率計算。（現在self=(pvphit * lv),you=(pvpavoid * lv),p=(self/(self+you))^2）
		                        				]]> ).toString();
		public static var release:String = ( <![CDATA[
リリース

2012/03/01 ver3.14
・セット装備を混ぜて防具を統一した時に統一ボーナスが適用されなかった不具合を修正。
・マスタースキルの防具統一時防御力増加が、%で適用されていた不具合を修正。

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