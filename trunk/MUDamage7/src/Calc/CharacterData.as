package Calc {
	import mx.controls.*;
	import mx.containers.*;
	import mx.core.*;
	import mx.collections.*;
	import mx.events.*;
	import flash.events.*;

	import Form.MUDamage.SubForm.*;
	import Data.Database.*;
	import Data.Database.MLV.*;
	/**
	 * オプションを計算
	 * @author sinlion
	 *
	 */
	public class CharacterData{
		//キャラクターステータス
		public var lv:int=0;//キャラクターのレベル
		public var str:int=0;//キャラクターの力
		public var agi:int=0;//キャラクターの敏捷
		public var vit:int=0;//キャラクターの体力
		public var ene:int=0;//キャラクターのエナジー
		public var rec:int=0;//キャラクターの統率
		public var add_str:int=0;//キャラクターの追加力
		public var add_agi:int=0;//キャラクターの追加敏捷
		public var add_vit:int=0;//キャラクターの追加体力
		public var add_ene:int=0;//キャラクターの追加エナジー
		public var add_rec:int=0;//キャラクターの追加統率
		//キャラクター能力
		public var life:int=0;//Life
		public var sd:int=0;//SD
		public var mana:int=0;//マナ
		public var ag:int=0;//AG
		public var minmax:Array=new Array();//攻撃力 魔力
		public var curse:Array=new Array();//呪い
		public var hit:int=0;//攻撃成功率
		public var pvp_hit:int=0;//対人攻撃成功率
		public var def:int=0;//防御力
		public var avoid:int=0;//防御成功率
		public var pvp_avoid:int=0;//対人防御成功率
		public var speed:int=0;//攻撃速度
		public var magic_speed:int=0;//魔法攻撃速度
		//キャラクター属性
		public var attribute:int=5;//属性　火、水、地、風、暗黒、無属性
		public var attribute_def:int=0;//属性防御力
		public var attribute_pvp_def:int=0;//属性対人防御力
		public var attribute_mon_def:int=0;//属性対モンス防御力
		public var attribute_affinity:int=0;//属性防御相性
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
		public var support_vit:int=0;//体力+
		public var support_avoid:int=0;//防御成功率+
		public var support_ignore:int=0;//敵の防御力無視
		//ダークスピリット
		public var darkspirit_min_single:int=0;//単体
		public var darkspirit_max_single:int=0;
		public var darkspirit_min_range:int=0;//範囲
		public var darkspirit_max_range:int=0;
		public var darkspirit_hit:int=0;//命中率
		public var darkspirit_cri_per:int=0;//クリティカル確率
		public var darkspirit_exd_per:int=0;//EXD確率
		public var darkspirit_normal:int=0;//ノーマル確率
	}
}