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
	public class OptionCalculator{

		//特殊
		calc var etc_daimahouring:Boolean=false;//大魔法師の爪の有無
		calc var etc_mahouring:Boolean=false;//魔法師の指輪の有無
		calc var etc_miracle:Boolean=false;//妙薬
		calc var etc_sake:Boolean=false;//酒
		calc var etc_sera:Boolean=false;//セラフィー
		calc var etc_attack:int=0;//かぼちゃや課金アイテムでの攻撃力上昇分
		calc var etc_attack2:int=0;//課金攻撃力上昇分
		calc var etc_magic:int=0;//魔力
		calc var etc_magic2:int=0;//課金魔力
		calc var etc_noroi:int=0;//呪い
		calc var etc_speed:int=0;//速度
		calc var etc_def:int=0;//防御力上昇
		calc var etc_hp:int=0;//生命
		calc var etc_mana:int=0;//マナ
		calc var etc_agah:int=0;//AG回復＋
		calc var etc_cri:int=0;//クリダメ＋
		calc var etc_exd:int=0;//EXDダメ＋
		calc var etc_str:int=0;//力
		calc var etc_agi:int=0;//敏
		calc var etc_vit:int=0;//体力
		calc var etc_ene:int=0;//エナジー
		calc var etc_rec:int=0;//統率
		/**
		 * attack EXOP 
		 */
		private var attack_exops:Array = [
		    "exop_2per",
		    "exop_lv20",
		    "exop_magic_2per",
		    "exop_magic_lv20",
		    "exop_exd",
		    "exop_speed"
		];
		/**
		 * guard EXOP
		 */
		private var guard_exops:Array = [
 		    "exop_dec",
		    "exop_ref",
		    "exop_hp",
		    "exop_mana",
		    "exop_avoid",
		    "exop_zen"
		];
		/**
		 * attack EnchantOption
		 */
		private var attack_enops:Array = [
      		//武器類
    		"enop_min",//最小攻撃力上昇
    		"enop_max",//最大攻撃力上昇
    		"enop_attack",//攻撃力上昇
    		"enop_cri",//クリティカルダメージ上昇
    		"enop_skill",//スキル攻撃力上昇
    		"enop_pvphit",//対人攻撃成功率上昇
    		"enop_sddec",//SD減少率%
    		"enop_sdignore",//SD無視%
    		"enop_magic",//魔力上昇
    		"enop_left_magic"//魔力上昇（左手）
		];
		/**
		 * guard EnchantOption
		 */
		private var guard_enops:Array = [
     		//防具類
    		"enop_def",//防御力上昇
    		"enop_ag",//最大AG上昇
    		"enop_hp",//最大生命上昇
    		"enop_ah",//自動生命回復量上昇
    		"enop_mana",//マナ自動回復量上昇
    		"enop_pvpavoid",//対人防御成功率上昇
    		"enop_dec",//ダメージ減少%
    		"enop_sdrate"//SD比率上昇%
	    ];
		/**
		 * attack SetAncientOption
		 */
		private var attack_setop:Array = [
    		//攻撃力（魔力）系
    		"setop_min",//最小攻撃力増加
    		"setop_max",//最大攻撃力増加
    		"setop_attack",//攻撃力増加
    		"setop_magicper",//魔力増加%
    		"setop_skill",//スキル攻撃力増加
    		"setop_hit",//攻撃成功率増加
    		"setop_hands",//両手剣装備時ダメージ増加%
			//特殊系
			"setop_cri",//クリティカルダメージ増加
			"setop_criper",//クリティカル確率増加
			"setop_exd",//エクセレントダメージ増加
			"setop_exdper",//エクセレント確率増加
			"setop_damage",//ダメージ増加
			"setop_ignore",//防御無視%
			"setop_wd"//ダブルダメージ確率%
		];
		/**
		 * guard SetAncientOption
		 */
		private var guard_setop:Array = [
      		//ステータス系
    		"setop_str",//力+
    		"setop_agi",//敏+
    		"setop_vit",//体力+
    		"setop_ene",//エナ+
    		"setop_rec",//統率+
    		"setop_hp",//HP+
    		"setop_mana",//マナ+
    		"setop_ag",//AG+
    		"setop_agah",//AG自動回復量+
			//防御系
			"setop_def",//防御力増加
			"setop_shield"//盾装備時防御力増加%
	    ];
		/**
		 * attack SocketOption
		 */
		private var attack_soop:Array = [
	 		//炎のシード
			"soop_lv20",//攻撃力・魔力上昇LV/x
			"soop_lv20_left",//左手攻撃力・魔力上昇LV/x
			"soop_min",//最小攻撃力・魔力上昇
			"soop_max",//最大攻撃力・魔力上昇
			"soop_attack",//攻撃力・魔力上昇
			"soop_speed",//攻撃速度上昇
			"soop_agdec",//AG消耗量減少%
			//稲妻のシード
			"soop_exd",//EXD増加
			"soop_exdper",//EXD確率増加%
			"soop_cri",//クリダメ増加
			"soop_criper",//クリ確率増加%
			//氷のシード
			"soop_skill",//スキル攻撃力上昇
			"soop_hit",//攻撃成功率上昇
			//ボーナスソケット
			"sobonus_attack",//攻撃力上昇
			"sobonus_skill",//スキル攻撃力上昇
			"sobonus_magic"//魔力上昇
	    ];
		/**
		 * guard SocketOption
		 */
	    private var guard_soop:Array = [
    		//水のシード
    		"soop_def",//防御力増加
    		"soop_shield",//盾装備時防御力増加%
    		"soop_dec",//ダメージ減少%
    		"soop_ref",//ダメージ反射%
    		"soop_avoid",//防御成功率増加%
    		//風のシード
    		"soop_hp",//最大生命増加%
    		"soop_mana",//最大マナ増加%
    		"soop_ag",//最大AG増加
    		"soop_ah",//生命自動回復増加
    		"soop_manaah",//マナ自動回復量増加
    		"soop_agah",//AG自動回復量増加
    		//地のシード
    		"soop_vit",//体力増加
			//ボーナスソケット
			"sobonus_def",//防御力上昇
			"sobonus_hp"//最大生命増加
	    ];
		public function OptionCalculator(){
			
		}
		private function calcExellentOption():void{
			
		}

		//EXOP
		if(d.f_right.f_kind.selectedLabel == "EX" || d.f_right.f_kind.selectedLabel == "EXソケット"){
			for(var i:int = 0;i<d.f_right.f_exop.length;i++){
				var e:String = d.f_right.f_exop[i].selectedLabel;
				if(e == "攻撃2%")exop2per=true;//EXOP攻撃力2%
				if(e == "攻撃lv20")exoplv20=true;//EXOP攻撃力LV/20
				if(e == "魔力2%")exopmagic2per=true;//EXOP魔力2%
				if(e == "魔力lv20")exopmagiclv20=true;//EXOP魔力LV/20
				if(e == "EXD")exopexd=true;//EXOPEXD
				if(e == "速度+7")exopspeed=true;//EXOP速度
			}
		}
		//EXOP左手
		if(d.f_left.f_kind.selectedLabel == "EX" || d.f_left.f_kind.selectedLabel == "EXソケット"){
			if(d.f_left.f_item.selectedItem[0] == "武器"){
				for(i = 0;i<d.f_left.f_exop.length;i++){
					e = d.f_left.f_exop[i].selectedLabel;
					if(e == "攻撃2%")exopleft2per=true;//EXOP攻撃力2%
					if(e == "攻撃lv20")exopleftlv20=true;//EXOP攻撃力LV/20
					if(e == "魔力2%")exopleftmagic2per=true;//EXOP魔力2%
					if(e == "魔力lv20")exopleftmagiclv20=true;//EXOP魔力LV/20
					if(e == "EXD")exopleftexd=true;//EXOPEXD
					if(e == "速度+7")exopleftspeed=true;//EXOP速度
				}
			}
		}
		//EXOPアクセ
		if(d.f_neck.f_kind.selectedLabel == "EX" || d.f_neck.f_kind.selectedLabel == "EXソケット"){
			for(i = 0;i<d.f_neck.f_exop.length;i++){
				e = d.f_neck.f_exop[i].selectedLabel;
				if(e == "攻撃2%")exopac2per=true;//EXOP攻撃力2%
				if(e == "攻撃lv20")exopaclv20=true;//EXOP攻撃力LV/20
				if(e == "魔力2%")exopacmagic2per=true;//EXOP魔力2%
				if(e == "魔力lv20")exopacmagiclv20=true;//EXOP魔力LV/20
				if(e == "EXD")exopacexd=true;//EXOPEXD
				if(e == "速度+7")exopacspeed=true;//EXOP速度
			}
		}
	}
}