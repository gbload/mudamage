package MuCalc
{
	public class MuChar
	{
		public function MuChar()
		{
		}
		//キャラクター
		public var job:int=0;// K W E M D S
		public var lv:int=0;//キャラクターのレベル
		public var str:int=0;//キャラクターの力
		public var agi:int=0;//キャラクターの敏捷
		public var vit:int=0;//キャラクターの体力
		public var ene:int=0;//キャラクターのエナジー
		public var rec:int=0;//キャラクターの統率
		public var add_lv:int=0;//キャラクターの追加レベル
		public var add_str:int=0;//キャラクターの追加力
		public var add_agi:int=0;//キャラクターの追加敏捷
		public var add_vit:int=0;//キャラクターの追加体力
		public var add_ene:int=0;//キャラクターの追加エナジー
		public var add_rec:int=0;//キャラクターの追加統率
		public var lefthund:Boolean=false;//二刀流の有無
		public var magic:int=0;//武器の魔力%
		//キャラクター能力
		public var hp:int=0;//HP
		public var sd:int=0;//SD
		public var mana:int=0;//マナ
		public var ag:int=0;//AG
		public var minmax:Array=new Array();//攻撃力 魔力
		public var noroi:Array=new Array();//呪い
		public var hit:int=0;//攻撃成功率
		public var pvphit:int=0;//対人攻撃成功率
		public var def:int=0;//防御力
		public var avoid:int=0;//防御成功率
		public var pvpavoid:int=0;//対人防御成功率
		public var speed:int=0;//攻撃速度
		public var magicspeed:int=0;//魔法攻撃速度
		//キャラクター確率
		public var normal:int=0;//通常率
		public var cri:int=0;//クリ率
		public var exd:int=0;//EXD率
		public var criper:int=0;//クリ率
		//キャラクター特殊確率
		public var ignore:int=0;//防御無視確率
		public var wd:int=0;//WD確率
		//羽
		public var wing_inc:int=0;//羽のダメージ増加
		public var wing_dec:int=0;//羽のダメージ吸収
		//ペット
		public var satan:Boolean=false;//サタン
		public var angel:Boolean=false;//守護天使
		public var deamon:Boolean=false;//デーモン
		public var spirit:Boolean=false;//守護精霊
		public var uniria:Boolean=false;//ユニリア
		public var dinolunt:Array=[0,0,0];//[0 有無,1 op,2 op] opの種類:1 ag 2 speed 3 dec
		public var fenrir:int=0;//1 normal 2 attack 3 guard
		public var darkhorse:int=0;//LV1-50
		public var ponga:Boolean=false;//白と黒のポンガ
		public var arion:Boolean=false;//白銀のアリオン
		public var skelton:Boolean=false;//スケルトンパージドラゴン
		//サポート
		public var support_a:int=0;//A+
		public var support_g:int=0;//G+
		public var support_c:int=0;//C+
		public var support_sb:int=0;//SB
		public var support_sl:int=0;//SL
		public var support_se:int=0;//スペルエンハンス
		public var support_ba:int=0;//BA
		public var support_inner:int=0;//インナーベーション
		public var support_weak:int=0;//ウイークネス
		public var support_berserker:int=0;//バーサーカー
		public var support_sera_a:int=0;//セラフィーA
		public var support_sera_g:int=0;//セラフィーG
		//スキル
		public var skill:Array=new Array();//スキルスタック
		public var skill_minmax:Array=new Array();//[[0 min 1 max 2 cri 3 exd]]
		public var add_minmax:Array=new Array();//[[0 normal 1 cri 2 exd]]
		//特殊スキルデータ
		//ダークスピリットの能力
		//0 単体最小 1 単体最大 2 範囲最小 3 範囲最大 4 攻撃成功率 5 Lv(クリ率)
		public var darkspirit:Array=new Array();
		//オプション関連
		public var op_skill:int=0;//スキル攻撃力増加
		public var op_cri:int=0;//クリダメ増加
		public var op_exd:int=0;//EXD増加
		public var op_miracle:int=0;//妙薬などのダメージ増加
		public var op_damage:int=0;//セットOPダメージ増加
		public var op_hands:int=0;//両手武器装備時ダメージ増加
		public var etc_cri:int=0;//クリダメ増加%
		public var etc_exd:int=0;//EXDダメ増加%
		//対人オプション関連
		public var op_pvpdamage:int=0;//対人ダメージ
		//一時保存用
		public var monster_def:int=0;//モンスターの防御力
		public var now_skill:Array=new Array();//現在計算中のスキル
		

	}
}