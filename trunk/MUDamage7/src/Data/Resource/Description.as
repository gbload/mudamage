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
・バフ入力の支援フォーム未実装
・メニューの充実
・レイジファイターの攻撃速度を未適用（現在はとりあえずで値を入れています。）
・「ファイルを開く」時に、正しく開けない場合がある
・エルフの弓計算で、スキル威力が20%低下する計算を未実装
・ファイルの保存関連で、マスタースキルツリーが保存されない
・対人計算における命中率計算。（現在self=(pvphit * lv),you=(pvpavoid * lv),p=(self/(self+you))^2）
		                        				]]> ).toString();
		public static var release:String = ( <![CDATA[
リリース

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