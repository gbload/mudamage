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
	public class ItemData{
		/**
		 * その他
		 */
		public var is_dual_wield:Boolean=false;//二刀流の有無
		public var protects:Array=new Array();//防具候補
		public var is_shield:Boolean=false;//盾の有無
		/*
		 * 武器
		 */
		public var weapon_min:int=0;//武器の最小攻撃力
		public var weapon_max:int=0;//武器の最大攻撃力
		public var weapon_op:int=0;//武器の追加攻撃力
		public var weapon_magic:int=0;//武器の魔力%
		public var weapon_magicop:int=0;//武器の追加魔力
		public var weapon_pet:int=0;//武器のペット攻撃力上昇
		public var left_weapon_min:int=0;//左手武器の最小攻撃力
		public var left_weapon_max:int=0;//左手武器の最大攻撃力
		public var left_weapon_op:int=0;//左手武器の追加攻撃力
		public var left_weapon_magicop:int=0;//左手の追加魔力
		public var left_weapon_noroi:int=0;//武器の呪い上昇
		public var left_weapon_noroiop:int=0;//武器の呪いOP
		/*
		 * 
		 */
		public var pet_inc:int=0;//ペットのダメージ増加%
		public var pet_dec:int=0;//ペットのダメージ吸収%
		public var pet_fen_inc:int=0;//フェンリルのダメージ増加%
		public var pet_fen_dec:int=0;//フェンリルのダメージ吸収%
		public var satan:Boolean=false;//サタン
		public var angel:Boolean=false;//守護天使
		/**
		 * 羽
		 */
		public var wing_inc:int=0;//羽のダメージ増加%
		public var wing_dec:int=0;//羽のダメージ吸収%
		public var wing_def:int=0;//羽の防御力
		public var wing_life:int=0;//羽のCOP生命増加
		public var wing_mana:int=0;//羽のCOPマナ増加
		public var wing_ignore:int=0;//羽のCOP防御無視
		public var wing_rec:int=0;//羽のCOP統率増加
		//スキル
		public var skill:int=0;//スキル威力
		public var magic_skill:int=0;//魔法スキル威力
		//サポート
		public var support_a:Number=0.0;//A+
		public var support_g:int=0;//G+
		public var support_c:int=0;//C+
		public var support_sb:int=0;//SB
		public var support_sl:int=0;//SL
		/**
		 * その他アイテム
		 */
		public var etc_daimahouring:Boolean=false;//大魔法師の爪の有無
		public var etc_mahouring:Boolean=false;//魔法師の指輪の有無
		public var etc_miracle:Boolean=false;//妙薬
		public var etc_sake:Boolean=false;//酒
		public var etc_sera:Boolean=false;//セラフィー
		public var etc_attack:int=0;//かぼちゃや課金アイテムでの攻撃力上昇分
		public var etc_attack2:int=0;//課金攻撃力上昇分
		public var etc_magic:int=0;//魔力
		public var etc_magic2:int=0;//課金魔力
		public var etc_noroi:int=0;//呪い
		public var etc_speed:int=0;//速度
		public var etc_def:int=0;//防御力上昇
		public var etc_hp:int=0;//生命
		public var etc_mana:int=0;//マナ
		public var etc_agah:int=0;//AG回復＋
		public var etc_cri:int=0;//クリダメ＋
		public var etc_exd:int=0;//EXDダメ＋
		public var etc_str:int=0;//力
		public var etc_agi:int=0;//敏
		public var etc_vit:int=0;//体力
		public var etc_ene:int=0;//エナジー
		public var etc_rec:int=0;//統率
		/**
		 * EXOP
		 */
		//EXOP右手
		public var exop2per:Boolean=false;//EXOP攻撃力2%
		public var exoplv20:Boolean=false;//EXOP攻撃力LV/20
		public var exopmagic2per:Boolean=false;//EXOP魔力2%
		public var exopmagiclv20:Boolean=false;//EXOP魔力LV/20
		public var exopexd:Boolean=false;//EXOPEXD
		public var exopspeed:Boolean=false;//EXOP速度
		//EXOP左手
		public var exopleft2per:Boolean=false;//EXOP攻撃力2%
		public var exopleftlv20:Boolean=false;//EXOP攻撃力LV/20
		public var exopleftmagic2per:Boolean=false;//EXOP魔力2%
		public var exopleftmagiclv20:Boolean=false;//EXOP魔力LV/20
		public var exopleftexd:Boolean=false;//EXOPEXD
		public var exopleftspeed:Boolean=false;//EXOP速度
		//EXOPアクセ
		public var exopac2per:Boolean=false;//EXOP攻撃力2%
		public var exopaclv20:Boolean=false;//EXOP攻撃力LV/20
		public var exopacmagic2per:Boolean=false;//EXOP魔力2%
		public var exopacmagiclv20:Boolean=false;//EXOP魔力LV/20
		public var exopacexd:Boolean=false;//EXOPEXD
		public var exopacspeed:Boolean=false;//EXOP速度
		//EXOP防具
		public var exop_dec:int=0;//EXOPダメ減4%
		public var exop_ref:int=0;//EXOPダメージ反射5%
		public var exop_avoid:int=0;//EXOP防御成功率増加10%
		public var exop_hp:int=0;//EXOP最大生命増加4%
		public var exop_mana:int=0;//EXOP最大マナ増加4%
		/**
		 * セットOP
		 */
		public var setop_array:Array=new Array();//セット名の配列でも・・・
		//ステータス系
		public var setop_str:int=0;//力+
		public var setop_agi:int=0;//敏+
		public var setop_vit:int=0;//体力+
		public var setop_ene:int=0;//エナ+
		public var setop_rec:int=0;//統率+
		public var setop_hp:int=0;//HP+
		public var setop_mana:int=0;//マナ+
		public var setop_ag:int=0;//AG+
		public var setop_agah:int=0;//AG自動回復量+
		//攻撃力（魔力）系
		public var setop_min:int=0;//最小攻撃力増加
		public var setop_max:int=0;//最大攻撃力増加
		public var setop_attack:int=0;//攻撃力増加
		public var setop_magicper:int=0;//魔力増加%
		public var setop_skill:int=0;//スキル攻撃力増加
		public var setop_hit:int=0;//攻撃成功率増加
		public var setop_hands:int=0;//両手剣装備時ダメージ増加%
		//防御系
		public var setop_def:int=0;//防御力増加
		public var setop_shield:int=0;//盾装備時防御力増加%
		//特殊系
		public var setop_cri:int=0;//クリティカルダメージ増加
		public var setop_criper:int=0;//クリティカル確率増加
		public var setop_exd:int=0;//エクセレントダメージ増加
		public var setop_exdper:int=0;//エクセレント確率増加
		public var setop_damage:int=0;//ダメージ増加
		public var setop_ignore:int=0;//防御無視%
		public var setop_w:int=0;//ダブルダメージ確率%
		/**
		 * エンチャントOP
		 */
		//武器類
		public var enop_min:int=0;//最小攻撃力上昇
		public var enop_max:int=0;//最大攻撃力上昇
		public var enop_attack:int=0;//攻撃力上昇
		public var enop_cri:int=0;//クリティカルダメージ上昇
		public var enop_skill:int=0;//スキル攻撃力上昇
		public var enop_pvphit:int=0;//対人攻撃成功率上昇
		public var enop_sddec:int=0;//SD減少率%
		public var enop_sdignore:int=0;//SD無視%
		public var enop_magic:int=0;//魔力上昇
		public var enop_left_magic:int=0;//魔力上昇（左手）
		//防具類
		public var enop_def:int=0;//防御力上昇
		public var enop_ag:int=0;//最大AG上昇
		public var enop_hp:int=0;//最大生命上昇
		public var enop_ah:int=0;//自動生命回復量上昇
		public var enop_mana:int=0;//マナ自動回復量上昇
		public var enop_pvpavoid:int=0;//対人防御成功率上昇
		public var enop_dec:int=0;//ダメージ減少%
		public var enop_sdrate:int=0;//SD比率上昇%
		/**
		 * ソケットOP
		 */
		//炎のシード
		public var soop_lv20:Array=new Array();//攻撃力・魔力上昇LV/x
		public var soop_lv20_left:Array=new Array();//左手攻撃力・魔力上昇LV/x
		public var soop_min:int=0;//最小攻撃力・魔力上昇
		public var soop_max:int=0;//最大攻撃力・魔力上昇
		public var soop_attack:int=0;//攻撃力・魔力上昇
		public var soop_speed:int=0;//攻撃速度上昇
		public var soop_agdec:Array=new Array();//AG消耗量減少%
		//稲妻のシード
		public var soop_exd:int=0;//EXD増加
		public var soop_exdper:int=0;//EXD確率増加%
		public var soop_cri:int=0;//クリダメ増加
		public var soop_criper:int=0;//クリ確率増加%
		//氷のシード
		public var soop_skill:int=0;//スキル攻撃力上昇
		public var soop_hit:int=0;//攻撃成功率上昇
		//水のシード
		public var soop_def:int=0;//防御力増加
		public var soop_shield:int=0;//盾装備時防御力増加%
		public var soop_dec:int=0;//ダメージ減少%
		public var soop_ref:int=0;//ダメージ反射%
		public var soop_avoid:Array=new Array();//防御成功率増加%
		//風のシード
		public var soop_hp:Array=new Array();//最大生命増加%
		public var soop_mana:Array=new Array();//最大マナ増加%
		public var soop_ag:int=0;//最大AG増加
		public var soop_ah:int=0;//生命自動回復増加
		public var soop_manaah:int=0;//マナ自動回復量増加
		public var soop_agah:int=0;//AG自動回復量増加
		//地のシード
		public var soop_vit:int=0;//体力増加
		//ボーナスソケット
		public var sobonus_attack:int=0;//攻撃力上昇
		public var sobonus_skill:int=0;//スキル攻撃力上昇
		public var sobonus_magic:int=0;//魔力上昇
		public var sobonus_def:int=0;//防御力上昇
		public var sobonus_hp:int=0;//最大生命増加
		/**
		 * 
		 */
		private var f:Object;
		public function ItemData(f:Object){
			this.f = f;
			calcFlag();
			calcWing();
		}
		private function calcFlag():void{
			// 二刀流の有無
			if(f.right.kind != "なし" && f.left.kind != "なし")
				if((getSpec(f.left,"item") as String)=="武器")
					is_dual_wield=true;
			// 防具のリスト
			protects=[f.helm,f.armor,f.garter,f.glove,f.boots];
			if(f.left.kind != "なし")
				if((getSpec(f.left,"item") as String)=="防具"){
					protects.unshift(f.left); // 盾の追加
					is_shield=true; // 盾の有無
				}
		}
		/**
		 * 羽の計算
		 */
		private function calcWing():void{
			if(f.wing.cop=="生命増加")
				wing_life = 50 + f.wing.plus*5;
			if(f.wing.cop=="マナ増加")
				wing_mana = 50 + f.wing.plus*5;
			if(f.wing.cop=="防御無視3%")
				wing_ignore = 3;
			if(f.wing.cop=="防御無視5%")
				wing_ignore = 5;
			if(f.wing.cop=="統率増加")
				wing_rec = 10 + f.wing.plus*5;
		}
		/**
		 * 補助関数
		 */
		public function getSpec(obj:Object,str:String):int{
			if(obj.item != null){
				// validate
				if(obj.key[str]==null)
					Alert.show("Error ItemCalculator getSpec():"+str+"");
				// spec
				var spec:int = obj.key.spec;
				if(obj.item[obj.key.kind] == "EX")
					spec = obj.key.exspec;
				if(obj.item[obj.key.kind] == "セット")
					spec = obj.key.setspec;
				return obj.item[spec][obj.plus][obj.key[str]];
			}
			return 0;
		}
		public function getRequire(obj:Object,str:String):int{
			if(obj.item != null){
				// validate
				if(obj.key[str]==null)
					Alert.show("Error ItemCalculator getSpec():"+str+"");
				// spec
				var req:int = obj.key.require;
				if(obj.item[obj.key.kind] == "EX")
					req = obj.key.exrequire;
				if(obj.item[obj.key.kind] == "セット")
					req = obj.key.exrequire;
				return obj.item[req][obj.plus][obj.key[str]];
			}
			return 0;
		}
		public function getItemData(obj:Object,str:String):Object{
			if(obj.item != null){
				if(obj.key[str]==null)
					Alert.show("Error ItemCalculator getItemData():"+str+"");
				return obj.item[obj.key[str]];
			}
			return null;
		}
		public function getValue(obj:Object):int{
			return validateValue(obj);
		}
		public function getValueMap(obj:Object,str:String):int{
			if(obj!=null)
				return validateValue(obj[str]);
			Alert.show("Error getValueMap():"+str+"!");
			return 0;
		}
		public function getEnchantProtects(str:String):int{
			var value:int = 0;
			for(var n:Object in protects)
				value += validateValue(protects[n].enchant[str]);
			return value;
		}
		public function getSocket(obj:Object,str:String):int{
			return validateValue(obj.socket[str]);
		}
		public function getSocketProtects(str:String):int{
			var value:int = 0;
			for(var n:Object in protects)
				value += validateValue(protects[n].socket[str]);
			return value;
		}
		public function getSocketBonusProtects(str:String):int{
			var value:int = 0;
			for(var n:Object in protects)
				value += validateValue(protects[n].socket[str]);
			return value;
		}
		/**
		 * validate
		 */
		private function validateValue(obj:Object):int{
			if(obj!=null)
				return obj as int;
			return 0;
		}
	}
}