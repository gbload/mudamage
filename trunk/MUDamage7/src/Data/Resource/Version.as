package Data.Resource{
	public class Version{
		public static var version_number:String = "3.03";
		public static var version:String = "version "+version_number;
		public static var bugs:String = ( <![CDATA[不具合
・MAPドッペルゲンガー、カウンターリベリオンが未実装
・対人計算未実装
・計算結果画面のタブの部分に×ボタンがない
・マスタースキル、スキル強化未実装
・バフ入力の支援フォーム未実装
・モンスターへの命中率計算が正常に行われない
・メニューの充実
・レイジファイターの攻撃速度を未適用（現在はとりあえずで値を入れています。）
		                        				]]> ).toString();
		public static var release:String = ( <![CDATA[リリース
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