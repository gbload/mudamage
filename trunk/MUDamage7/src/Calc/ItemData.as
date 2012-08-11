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
		public var exops:Array=new Array();//防具候補
		public var is_shield:Boolean=false;//盾の有無
		/**
		 * 羽
		 */
		public var wing_life:int=0;//生命増加
		public var wing_mana:int=0;//マナ増加
		public var wing_rec:int=0;//統率増加
		public var wing_ignore:int=0;//防御無視
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
		 * セットOP
		 */
		public var setop_names:Object={};//セット名の配列でも・・・
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
		 * 
		 */
		private var f:Object;
		public function ItemData(f:Object){
			this.f = f;
			calcFlag();
			calcWing();
			calcSetop();
			calcShop();
			calcEtc();
		}
		private function calcFlag():void{
			// 二刀流の有無
			if(f.right.kind != "なし" && f.left.kind != "なし")
				if((getItemData(f.left,"item") as String)=="武器")
					is_dual_wield=true;
			// 防具のリスト
			protects=[f.helm,f.armor,f.garter,f.glove,f.boots];
			if(f.job == "魔剣士")
				protects=[f.armor,f.garter,f.glove,f.boots];
			else if(f.job == "レイジファイター")
				protects=[f.helm,f.armor,f.garter,f.boots];
			
			exops=[f.helm.exop,f.armor.exop,f.garter.exop,f.glove.exop,f.boots.exop,f.ring1.exop,f.ring2.exop];
			if(f.left.kind != "なし")
				if((getItemData(f.left,"item") as String)=="防具"){
					protects.unshift(f.left); // 盾の追加
					exops.unshift(f.left.exop);// 盾の追加
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
		 * セットOPを計算
		 */
		private function calcSetop():void{
			//セットOP
			var a:Array = [f.neck,f.right,f.left,f.helm,f.armor,f.glove,f.garter,f.boots,f.ring1,f.ring2];
			var names:Object = {};//セット名をスタックする
			for(var j:int=0;j<a.length;j++){
				if(a[j].kind == "セット" || a[j].kind == "ラッキー"){
					//セットOPのステータス部分
					setop_str += getValueMap(a[j].set_status,"力");
					setop_agi += getValueMap(a[j].set_status,"敏捷");
					setop_vit += getValueMap(a[j].set_status,"体力");
					setop_ene += getValueMap(a[j].set_status,"エナジー");
					setop_rec += getValueMap(a[j].set_status,"統率");
					//セット名の取得
					if(j==2 || j==9){//左手又はリング2のとき
						if((a[j-1].kind == "セット" || a[j-1].kind == "ラッキー")
						 && (getSetItemData(a[j-1],"name") == getSetItemData(a[j],"name")))
						 	continue;
					}
					if(names[getSetItemData(a[j],"series")]==null)
					     names[getSetItemData(a[j],"series")] = 1;
					else
				         names[getSetItemData(a[j],"series")]++;
				}
			}
			setop_names = names;//セット名を保存しておく
			var setops:Array = D.getData("set_option") as Array;
			for(var n:String in names)
				for(j=0;j<setops.length;j++)//セットOPの一覧
					if(n == setops[j][0])//名前の確認
						for(var k:int=2;k<=names[n];k++){
							if(k <= setops[j][1]+1){//k個つけたときのセットOPを取得
								var v:int = setops[j][k][2];//セットOPの数値
									//ステータス系
								if(setops[j][k][1] == "力")setop_str+=v;//力+
								else if(setops[j][k][1] == "敏捷")setop_agi+=v;//敏+
								else if(setops[j][k][1] == "体力")setop_vit+=v;//体力+
								else if(setops[j][k][1] == "エナジー")setop_ene+=v;//エナ+
								else if(setops[j][k][1] == "統率")setop_rec+=v;//統率+
								else if(setops[j][k][1] == "生命")setop_hp+=v;//HP+
								else if(setops[j][k][1] == "マナ")setop_mana+=v;//マナ+
								else if(setops[j][k][1] == "AG")setop_ag+=v;//AG+
								else if(setops[j][k][1] == "AG 増加量")setop_agah+=v;//AG自動回復量+
									//攻撃力（魔力）系
								else if(setops[j][k][1] == "最小攻撃力")setop_min+=v;//最小攻撃力増加
								else if(setops[j][k][1] == "最大攻撃力")setop_max+=v;//最大攻撃力増加
								//else if(setops[j][k][1] == "")setop_attack+=v;//攻撃力増加
								else if(setops[j][k][1] == "魔力")setop_magicper+=v;//魔力増加%
								else if(setops[j][k][1] == "スキル攻撃力")setop_skill+=v;//スキル攻撃力増加
								else if(setops[j][k][1] == "攻撃成功率")setop_hit+=v;//攻撃成功率増加
								else if(setops[j][k][1] == "両手剣装備時ダメージ増加")setop_hands+=v;//両手剣装備時ダメージ増加%
									//防御系
								else if(setops[j][k][1] == "防御力")setop_def+=v;//防御力増加
								else if(setops[j][k][1] == "盾装備時、防御力")setop_shield+=v;//盾装備時防御力増加%
									//特殊系
								else if(setops[j][k][1] == "クリティカルダメージ")setop_cri+=v;//クリティカルダメージ増加
								else if(setops[j][k][1] == "クリティカルダメージ確率")setop_criper+=v;//クリティカル確率増加
								else if(setops[j][k][1] == "エクセレントダメージ")setop_exd+=v;//エクセレントダメージ増加
								else if(setops[j][k][1] == "エクセレントダメージ確率")setop_exdper+=v;//エクセレント確率増加
								else if(setops[j][k][1] == "ダメージ増加")setop_damage+=v;//ダメージ増加
								else if(setops[j][k][1] == "敵の防御力無視")setop_ignore+=v;//防御無視%
								else if(setops[j][k][1] == "ダブルダメージ確率")setop_w+=v;//ダブルダメージ確率%
								else Alert.show("Error:セットOP"+setops[j][k][1]);
							}
							if(k == setops[j][1]+1)//フルOPを取得
								for(var l:int=0;l<setops[j][k+1].length;l++){
									v = setops[j][k+1][l][2];//セットOPの数値
										//ステータス系
									if(setops[j][k+1][l][1] == "力")setop_str+=v;//力+
									else if(setops[j][k+1][l][1] == "敏捷")setop_agi+=v;//敏+
									else if(setops[j][k+1][l][1] == "体力")setop_vit+=v;//体力+
									else if(setops[j][k+1][l][1] == "エナジー")setop_ene+=v;//エナ+
									else if(setops[j][k+1][l][1] == "統率")setop_rec+=v;//統率+
									else if(setops[j][k+1][l][1] == "生命")setop_hp+=v;//HP+
									else if(setops[j][k+1][l][1] == "マナ")setop_mana+=v;//マナ+
									else if(setops[j][k+1][l][1] == "AG")setop_ag+=v;//AG+
									else if(setops[j][k+1][l][1] == "AG 増加量")setop_agah+=v;//AG自動回復量+
										//攻撃力（魔力）系
									else if(setops[j][k+1][l][1] == "最小攻撃力")setop_min+=v;//最小攻撃力増加
									else if(setops[j][k+1][l][1] == "最大攻撃力")setop_max+=v;//最大攻撃力増加
									//else if(setops[j][k+1][l][1] == "")setop_attack+=v;//攻撃力増加
									else if(setops[j][k+1][l][1] == "魔力")setop_magicper+=v;//魔力増加%
									else if(setops[j][k+1][l][1] == "スキル攻撃力")setop_skill+=v;//スキル攻撃力増加
									else if(setops[j][k+1][l][1] == "攻撃成功率")setop_hit+=v;//攻撃成功率増加
									else if(setops[j][k+1][l][1] == "両手剣装備時ダメージ増加")setop_hands+=v;//両手剣装備時ダメージ増加%
										//防御系
									else if(setops[j][k+1][l][1] == "防御力")setop_def+=v;//防御力増加
									else if(setops[j][k+1][l][1] == "盾装備時、防御力")setop_shield+=v;//盾装備時防御力増加%
										//特殊系
									else if(setops[j][k+1][l][1] == "クリティカルダメージ")setop_cri+=v;//クリティカルダメージ増加
									else if(setops[j][k+1][l][1] == "クリティカルダメージ確率")setop_criper+=v;//クリティカル確率増加
									else if(setops[j][k+1][l][1] == "エクセレントダメージ")setop_exd+=v;//エクセレントダメージ増加
									else if(setops[j][k+1][l][1] == "エクセレントダメージ確率")setop_exdper+=v;//エクセレント確率増加
									else if(setops[j][k+1][l][1] == "ダメージ増加")setop_damage+=v;//ダメージ増加
									else if(setops[j][k+1][l][1] == "敵の防御力無視")setop_ignore+=v;//防御無視%
									else if(setops[j][k+1][l][1] == "ダブルダメージ確率")setop_w+=v;//ダブルダメージ確率%
									else Alert.show("Error:セットOP"+setops[j][k+1][l][1]);
								}
						}
		}
		/**
		 * ショップアクセサリを計算
		 */
		private function calcShop():void{
			//ショップアイテムの場合
			var a:Array = [f.neck,f.ring1,f.ring2];
			for (var n:String in a){
				if(a[n].kind == "ショップ"){
					var e:String = getItemData(a[n],"name") as String;
					if(e == "アメジストリング")a[n].exop["ダメ減"]=true;
					if(e == "トパーズリング")a[n].exop["ゼン増"]=true;
					if(e == "ルビーリング")a[n].exop["生命増"]=true;
					if(e == "サファイアリング")a[n].exop["マナ増"]=true;
					if(e == "サファイアネックレス")a[n].exop["獲得マナ"]=true;
					if(e == "エメラルドネックレス")a[n].exop["速度+7"]=true;
					if(e == "ルビーネックレス")a[n].exop["EXD"]=true;
				}
			}
		}
		/**
		 * 補助アイテム類計算
		 */
		private function calcEtc():void{
			for each(var name:String in [f.support.item.selectedLabel]){
				if(name == "攻撃力+25"){etc_attack+=25;etc_magic+=25;}//かぼちゃや課金アイテムでの攻撃力上昇分
				if(name == "攻撃力+30"){etc_attack+=30;etc_magic+=30;}//かぼちゃや課金アイテムでの攻撃力上昇分
				if(name == "攻撃力+40"){etc_attack+=40;etc_magic+=40;}//かぼちゃや課金アイテムでの攻撃力上昇分
				if(name == "速度+10")etc_speed+=10;//速度
				if(name == "速度+15")etc_speed+=15;//速度
				if(name == "防御力+60")etc_def+=60;//防御力上昇
				if(name == "防御力+100")etc_def+=100;//防御力上昇
				if(name == "生命+200")etc_hp+=200;//生命
				if(name == "生命+500")etc_hp+=500;//生命
				if(name == "生命+700")etc_hp+=700;//生命
				if(name == "マナ+300")etc_mana+=300;//マナ
				if(name == "マナ+500")etc_mana+=500;//マナ
				if(name == "マナ+700")etc_mana+=700;//マナ
				if(name == "AG回復+10")etc_agah+=10;//AG回復＋
			}
			for each(name in [f.support.scroll.selectedLabel,f.support.leap.selectedLabel]){
				if(name == "攻撃力+30"){etc_attack+=30;etc_attack2+=30;}//課金アイテムでの攻撃力上昇分
				if(name == "魔力+30"){etc_magic+=30;etc_magic2+=30;}//魔力
				if(name == "速度+15")etc_speed+=15;//速度
				if(name == "防御力+60")etc_def+=60;//防御力上昇
				if(name == "生命+200")etc_hp+=200;//生命
				if(name == "マナ+300")etc_mana+=300;//マナ
				if(name == "クリダメ+20%")etc_cri+=20;//クリダメ＋
				if(name == "EXDダメ+20%")etc_exd+=20;//ＥＸＤダメ＋
				if(name == "力+50")etc_str+=50;//力
				if(name == "敏捷+50")etc_agi+=50;//敏
				if(name == "体力+50")etc_vit+=50;//体力
				if(name == "エナ+50")etc_ene+=50;//エナジー
				if(name == "統率+50")etc_rec+=50;//統率
			}
		}
		/**
		 * 装備のスペックを取得
		 */
		public function getSpec(obj:Object,str:String):int{
			if(obj.item != null){
				// validate
				if(obj.key[str]==null)
					Alert.show("Error ItemData getSpec():"+str+"");
				obj.key[str].toString();
				// spec
				var spec:int = obj.key.spec;
				if(obj.kind == "EX")
					spec = obj.key.exspec;
				if(obj.set_item != null)
					spec = obj.key.setspec;
				return obj.item[spec][obj.plus][obj.key[str]];
			}
			return 0;
		}
		/**
		 * 装備の要求を取得
		 */
		public function getRequire(obj:Object,str:String):int{
			if(obj.item != null){
				// validate
				if(obj.item[obj.key.kind] == "ラッキー")
					return 0;
				if(obj.key[str]==null)
					Alert.show("Error ItemData getSpec():"+str+"");
				obj.key[str].toString();
				// spec
				var req:int = obj.key.require;
				if(obj.kind == "EX")
					req = obj.key.exrequire;
				if(obj.set_item != null)
					req = obj.key.exrequire;
				return obj.item[req][obj.plus][obj.key[str]];
			}
			return 0;
		}
		/**
		 * 装備の情報を取得
		 */
		public function getItemData(obj:Object,str:String):Object{
			if(obj.item != null){
				//[セットアイテム]
				if(obj.set_key != null && obj.set_key[str] != null && str != "series")
					return obj.set_item[obj.set_key[str]];
				//[通常]
				if(obj.key[str]==null)
					Alert.show("Error ItemData getItemData():"+str+"");
				obj.key[str].toString();
				return obj.item[obj.key[str]];
			}
			return null;
		}
		/**
		 * 装備の情報を取得
		 */
		public function getSetItemData(obj:Object,str:String):Object{
			if(obj.item[obj.key.kind] == "ラッキー"){
				if(str == "series")
					str = "setname";
				if(obj.item != null)
					return obj.item[obj.key[str]];
			}
			if(obj.set_item != null){
				if(obj.set_key[str]==null)
					Alert.show("Error ItemData getItemData():"+str+"");
				obj.set_key[str].toString();
				return obj.set_item[obj.set_key[str]];
			}
			return null;
		}
		/**
		 * 値のバリデート
		 */
		public function getValue(obj:Object):int{
			return validateValue(obj);
		}
		/**
		 * 値のバリデート
		 */
		public function getValueMap(obj:Object,str:String,ch:Boolean=true):int{
			if(ch && obj==null)
				return 0;
			if(obj[str] is Boolean && obj[str])return 1;
			return validateValue(obj[str]);
		}
		/**
		 * エンチャントOPを防具で丸ごと取得
		 */
		public function getEnchantProtects(str:String):int{
			var value:int = 0;
			for(var n:Object in protects)
				value += validateValue(protects[n].enchant[str]);
			return value;
		}
		/**
		 * ソケットOPを取得
		 */
		public function getSocket(obj:Object,str:String):int{
			return validateValue(obj.socket[str]);
		}
		/**
		 * ソケットOPを防具で丸ごと取得
		 */
		public function getSocketProtects(str:String):int{
			var value:int = 0;
			for(var n:Object in protects)
				value += validateValue(protects[n].socket[str]);
			return value;
		}
		/**
		 * ソケットボーナスを防具で丸ごと取得
		 */
		public function getSocketBonusProtects(str:String):int{
			var value:int = 0;
			for(var n:Object in protects)
				value += validateValue(protects[n].socket[str]);
			return value;
		}
		/**
		 * 特殊リングの着用有無
		 */
		public function hasSpecialRing(name:String):Boolean{
			return (getItemData(f.ring1,"name")==name
					|| getItemData(f.ring2,"name")==name);
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