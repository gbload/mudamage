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
	 * キャラクターステータスを計算
	 * @author sinlion
	 *
	 */
	public class CharacterCalculator{
		private var f:Object;
		private var i:ItemData;
		private var c:CharacterData;
		/**
		 * コンストラクタ
		 */
		public function CharacterCalculator(f:Object,i:ItemData){
			this.f = f;
			this.i = i;
			this.c = new CharacterData();
			
			calcSupport();
			calcStatus();
			calcDef();
			calcAttributeDef();
			calcAvoid();
			calcPVPAvoid();
			calcHit();
			calcPVPHit();
			calcLife();
			calcMana();
			calcSD();
			calcAG();
			calcSpeed();
			calcNormal();
			calcSpecial();
		}
		public function getData():CharacterData{
			return c;
		}
		/**
		 * サポートスキルの計算
		 */
		private function calcSupport():void{
			if(f.support.aplus_check.selected)c.support_a = SupportSkillCalculator.calcAttackPlus(f.job,f.support);//A+
			if(f.support.gplus_check.selected)c.support_g = SupportSkillCalculator.calcGuardPlus(f.job,f.support);//G+
			if(f.support.cplus_check.selected)c.support_c = SupportSkillCalculator.calcCriticalPlus(f.support);//C+
			if(f.support.sl_check.selected)c.support_sl = SupportSkillCalculator.calcSwellLife(f.support);//SL
			if(f.support.sb_check.selected)c.support_sb = SupportSkillCalculator.calcSoulBarrier(f.support);//SB
			if(f.support.sera_check.selected)c.support_sera_a = SupportSkillCalculator.calcSeraphy_Attack(f.status.lv);//セラ　攻撃力
			if(f.support.sera_check.selected)c.support_sera_g = SupportSkillCalculator.calcSeraphy_Defense(f.status.lv);//セラ　防御力
			if(f.support.se_check.selected)c.support_se = SupportSkillCalculator.calcSpellEnhance();//スペルエンハンス
			if(f.support.ba_check.selected)c.support_ba = SupportSkillCalculator.calcBloodAttack(f.support);//BA
			if(f.support.iv_check.selected)c.support_inner = SupportSkillCalculator.calcInnovation(f.support);//インナーベーション
			if(f.support.wn_check.selected)c.support_weak = SupportSkillCalculator.calcWeakness(f.support);//ウイークネス
			if(f.support.ber_check.selected)
				c.support_berserker = SupportSkillCalculator.calcBerserkerMind_Magic(
						f.master_skill.getSkillValue("berserker_mind")
						+ f.master_skill.getSkillValue("berserker_mind_mastery"),
						f.status.ene);//バーサーカー
			if(f.support.ht_check.selected)
				c.support_vit = SupportSkillCalculator.calcHighTension(
						f.support,
						f.status.ene);//体力上昇
			if(f.support.con_check.selected)
				c.support_avoid = SupportSkillCalculator.calcConcentration(
						f.support,f.status.ene);//防御成功率上昇
			if(f.support.demo_check.selected)
				c.support_ignore = SupportSkillCalculator.calcDemolition(
						f.status.ene);//敵の防御力無視
		}
		/**
		 * ステータスの計算
		 */
		private function calcStatus():void{
			c.add_str = i.setop_str + i.etc_str + f.master_skill.getSkillValue("strength");
			c.add_agi = i.setop_agi + i.etc_agi + f.master_skill.getSkillValue("agility");
			c.add_vit = i.setop_vit + i.etc_vit 
							+ i.getSocketProtects("体力増加") + c.support_vit
							+ f.master_skill.getSkillValue("vitality");
			c.add_ene = i.setop_ene + i.etc_ene + f.master_skill.getSkillValue("energy");
			c.add_rec = i.setop_rec + i.etc_rec + i.wing_rec + f.master_skill.getSkillValue("rec");
			if(f.support.bless_check.selected){
				var tmp:int = SupportSkillCalculator.calcBless(f.support);
				c.add_str+=tmp;c.add_agi+=tmp;c.add_vit+=tmp;c.add_ene+=tmp;c.add_rec+=tmp;
			}
			c.lv = f.status.lv + f.status.mlv;
			c.str = f.status.str + c.add_str;
			c.agi = f.status.agi + c.add_agi;
			c.vit = f.status.vit + c.add_vit;
			c.ene = f.status.ene + c.add_ene;
			c.rec = f.status.rec + c.add_rec;
		}
		/**
		 * 防御力計算
		 */
		private var check:String = "none";
		private function calcDef():void{
			var inc:int = D.getData("job_def")[f.job_index];
			// 敏捷によるDEF
			c.def = c.agi/inc;
			var tmp:int = c.def;
			// 防具のDEF
			var min_lv:int = 0;
			var first_flag:Boolean = true;
			for(var n:Object in i.protects){
				// 防具のDEF
				c.def += i.getSpec(i.protects[n],"def");
				c.def += i.getValue(i.protects[n].option["防御"]);
				// シリーズのチェック
				if((i.getItemData(i.protects[n],"type")) as String != "盾"){
					if(first_flag){
						first_flag = false;
						check = (i.getItemData(i.protects[n],"series")) as String;
						min_lv = i.protects[n].plus;
					}else{
						if(check != i.getItemData(i.protects[n],"series"))
							check = "none";
						if(min_lv > i.protects[n].plus)
							min_lv = i.protects[n].plus;
					}
				}
			}
			/*
			 * 固定増加分
			 */
			//MLVDEF
			c.def += f.master_skill.getSkillValue("defense");
			if(check!="none")
				c.def += f.master_skill.getSkillValue("set_defense");
			// 羽のDEF
			c.def += i.getSpec(f.wing,"def");
			c.def += i.getValue(f.wing.option["防御"]);
			// ダークホースのDEF
			if(f.pet.item == "ダークホース")
				c.def += 5 + (c.agi/20) + ((f.pet.sub1_index+1) * 2);
			//エンチャントのDEF増加
			c.def += i.getEnchantProtects("防御力上昇");
			//セットのDEF増加
			c.def += i.setop_def;
			/*
			 * %増加分
			 */
			// 統一ボーナス
			if(check!="none")
				if(min_lv>9)
					c.def += Math.floor(c.def*((min_lv-9)*0.05));
			//セットの盾装備時
			if(i.is_shield)c.def += Math.floor(c.def*i.setop_shield/100);
			//ソケットの盾装備時
			if(i.is_shield)c.def += Math.floor(c.def*(i.getSocketProtects("盾装備時増加"))/100);
			/*
			 * 固定増加分
			 */
			//MLV盾強化
			c.def += f.master_skill.getSkillValue("shield") * 2;
			//MLV羽強化
			c.def += f.master_skill.getSkillValue("wing_defense") * 2;
			//ソケットのDEF増加
			c.def += i.getSocketProtects("防御力増加") * 2;
			//ボーナスソケットのDEF増加
			c.def += i.getSocketBonusProtects("防御力") * 2;
			//かぼちゃ、課金などのでDEF増加
			c.def += i.etc_def * 2;
			//ペットによるDEF増加
			if(f.pet == "白と黒のポンガ")c.def += 100;//防御力+50 → DEF+100
			//ペットによるDEF増加
			if(f.pet == "白銀のアリオン")c.def += 100;//防御力+50 → DEF+100
			//バーサーカーによるDEF減少
			if(f.support.ber_check.selected)
				c.def -= Math.floor(tmp * SupportSkillCalculator.calcBerserkerMind_Defense(
						f.master_skill.getSkillValue("berserker_mind"),
						f.status.ene)/100);
			// G+
			c.def += c.support_g*2;
			// Concentration
			if(f.support.con_check.selected)c.def += SupportSkillCalculator.calcConcentration_Defense(f.support)*2;
			// Seraphy
			c.def += c.support_sera_g*2;
			// Iron
			if(f.support.iron_check.selected)
				c.def += Math.floor(SupportSkillCalculator.calcIronDefense_Defense(
					f.master_skill.getSkillValue("iron_defense")))*2;
		}
		/**
		 * attribute defense
		 */
		private function calcAttributeDef():void{
			if(f.property.name!=""){
				// pentagram
				c.attribute = f.property.attribute_num;
				c.attribute_def += f.property.item[3] + 3*f.property.plus;
				if(f.property.plus >= 10)
					c.attribute_def += ((f.property.plus-9)+1)*(f.property.plus-9)/2;
				// ereutel
				for(var i:int=0;i<f.property.ereutels.length;i++){
					var e:Object = f.property.ereutels[i];
					if(e.name!="")
						if(e.rank1 == "防御力")
							c.attribute_def += 40+3*e.plus;
						if(e.rank2 == "防御")
							c.attribute_affinity += 10 + e.plus;
						if(e.item != null && e.item[3] == "防御")
							if(e.rank3 == "pvp")
								c.attribute_pvp_def += 50 + e.plus*3;
							else if(e.rank3 == "mon")
								c.attribute_mon_def += 50 + e.plus*3;
				}
			}
		}
		/**
		 * 防御成功率の計算
		 */
		private function calcAvoid():void{
			var avoid:Number = 0.0;
			var inc:int = D.getData("job_avoid")[f.job_index];
			// 敏捷
			avoid = Math.floor(c.agi/inc);
			// 盾の防御成功率
			if(i.is_shield){
				avoid += i.getSpec(f.left,"avoid");
				avoid += i.getValue(f.left.option["防御率"]);
			}
			// MasterSkill
			avoid += avoid * f.master_skill.getSkillValue("avoidance")/100.0;
			// EXOP,ソケットOP
			for(var n:Object in i.protects){
				// EXOP
				if(i.protects[n].exop["防御成功"])
					avoid = Math.floor(avoid * 1.1);
				// ソケットOP
				avoid = Math.floor(avoid * (100 + i.getSocket(i.protects[n],"防御成功"))/100);
			}
			// リング EXOP
			for each(var exop:Object in [f.ring1.exop,f.ring2.exop])
				if(exop["防御成功"])
					avoid = Math.floor(avoid * 1.1);
			
			var avoid_ori:int = avoid;
			// サポートスキル、コンセントレーション
			avoid += c.support_avoid;
			// 統一ボーナス
			if(check!="none")avoid += Math.floor(avoid_ori * 0.1);//統一ボーナス
			/*
			 * 固定増加分
			 */
			// MasterSkill 盾マスタリ
			avoid += f.master_skill.getSkillValue("shield_mastery");
			
			c.avoid = avoid;
		}
		/**
		 * 対人防御成功率の計算
		 */
		private function calcPVPAvoid():void{
			var inc:Array = D.getData("job_pvp_avoid")[f.job_index];
			// LV、敏捷
			c.pvp_avoid = Math.floor(c.lv*inc[0]) + Math.floor(c.agi/inc[1]);
			// エンチャント
			c.pvp_avoid += i.getEnchantProtects("対人防御成功");
			// MasterSkill
			c.pvp_avoid += f.master_skill.getSkillValue("pvp_avoidance");
			// 380op
			for(var n:Object in i.protects)
				if(i.protects[n]["op380"])
					c.pvp_avoid += 10;
		}
		/**
		 * 攻撃成功率の計算
		 */
		private function calcHit():void{
			var inc:Array = D.getData("job_hit")[f.job_index];
			// ステータス
			c.hit = f.status.lv*inc[0] + Math.floor(c.agi*inc[1]) + Math.floor(c.str/inc[2]);
			if(f.job=="ダークロード")
				c.hit += c.rec/inc[3];
			// セットOP
			c.hit += i.setop_hit;
			// ソケットOP
			c.hit += i.getSocketProtects("攻撃成功率");
			// MasterSkill
			c.hit += f.master_skill.getSkillValue("hit");
		}
		/**
		 * 対人攻撃成功率の計算
		 */
		private function calcPVPHit():void{
			var inc:Array = D.getData("job_pvp_hit")[f.job_index];
			// ステータス
			c.pvp_hit = Math.floor(f.status.lv*inc[0]) + Math.floor(c.agi*inc[1]);
			// エンチャントOP
			c.pvp_hit += i.getValue(f.right.enchant["対人攻撃率"]);
			c.pvp_hit += i.getValue(f.left.enchant["対人攻撃率"]);
			// MasterSkill
			c.pvp_hit += f.master_skill.getSkillValue("pvp_hit");
			// 380OP
			if(f.right.op380)
				c.pvp_hit += 10;
			if(!i.is_shield && f.left.op380)
				c.pvp_hit += 10;
			
		}
		/**
		 * 生命の計算
		 */
		private function calcLife():void{
			var inc:Array = D.getData("job_life")[f.job_index];
			var job_vit:int = D.getData("job_status")[f.job_index][2];
			// ステータス
			var tmp:int = inc[0] + (f.status.vit - job_vit)*inc[1] + (c.lv-1)*inc[2];
			// MasterSkill
			tmp += f.master_skill.getSkillValue("maximum_life");
			// 追加体力
			c.life = c.add_vit * inc[1];//セットとソケットの体力＋
			//HP
			c.life += tmp;
			/*
			 * %の部分
			 */
			// SL
			if(f.support.sl_check.selected)c.life += Math.floor(tmp * c.support_sl/100);
			// EXOPの生命増加
			for each(var exop:Object in i.exops)
				if(exop["生命増"])
					c.life += Math.floor(tmp * 4/100);
			// ソケットOPの生命増加
			c.life += Math.floor(tmp * i.getSocketProtects("最大生命増加")/100);
			/*
			 * 引き算の部分
			 */
			//バーサーカーのHP減少 基本HP * [40 - 純ene/60]%
			if(f.support.ber_check.selected)
				c.life -= Math.floor(tmp * SupportSkillCalculator.calcBerserkerMind_Life(
						f.master_skill.getSkillValue("berserker_mind"),
						f.status.ene)/100);
			/*
			 * 足し算の部分
			 */
			c.life += i.setop_hp;//セットOPの生命
			c.life += i.getEnchantProtects("最大生命上昇");//エンチャントOPの生命
			c.life += i.getSocketBonusProtects("最大生命");//ボーナスソケットの生命増加
			c.life += i.wing_life;//羽の生命増加
			if(f.pet.item=="守護天使")c.life += 50;//天使の生命増加
			if(f.pet.item=="守護精霊")c.life += 50;//守護精霊の生命増加
			c.life += i.etc_hp;//かぼちゃ、課金などでのHP増加
			if(f.glove.op380)
				c.life += 200;//380OP
			if(f.pet.item=="フェンリル" && f.pet.sub1=="黄金")
				c.life += c.lv/2;//黄金のフェンリルの生命増加
			// Iron
			if(f.support.iron_check.selected)
				c.life += Math.floor(SupportSkillCalculator.calcIronDefense_Life(
					f.master_skill.getSkillValue("iron_defense")));
		}
		/**
		 * マナの計算
		 */
		private function calcMana():void{
			var inc:Array = D.getData("job_mana")[f.job_index];
			var job_ene:int = D.getData("job_status")[f.job_index][3];
			// ステータス
			var tmp:int = inc[0] + (c.ene-job_ene)*inc[1] + (c.lv-1)*inc[2];
			//MasterSkill
			tmp += f.master_skill.getSkillValue("maximum_mana");
			// 追加エナジー
			c.mana += c.add_ene*inc[1];//セットのエナ＋
			//マナ
			c.mana += tmp;
			/*
			 * %増加部分
			 */
			// スウェルマナ
			
			// スウェルライフ
			if(f.support.sl_check.selected)c.mana += Math.floor(tmp * SupportSkillCalculator.calcSwellLife_Mana(
					f.support)/100);
			// ソウルバリア
			if(f.support.sb_check.selected)c.mana += Math.floor(tmp * SupportSkillCalculator.calcSoulBarrier_Mana(
					f.support)/100);
			// EXOPのマナ増加
			for each(var exop:Object in i.exops)
				if(exop["マナ増"])
					c.mana += Math.floor(tmp * 4/100);//EXOPのマナ増加
			// ソケットOPのマナ増加
			c.mana += Math.floor(tmp * i.getSocketProtects("最大生命増加")/100);
			//バーサーカー [純ene/30]%
			if(f.support.ber_check.selected)
				c.mana += tmp - Math.floor(tmp * SupportSkillCalculator.calcBerserkerMind_Mana(
						f.master_skill.getSkillValue("berserker_mind")
						+ f.master_skill.getSkillValue("berserker_mind_mastery"),
						f.status.ene)/100);
			/*
			 * 足し算部分
			 */
			c.mana += i.setop_mana;//セットOPのマナ＋
			c.mana += i.wing_mana;//羽
			c.mana += i.etc_mana;//かぼちゃ、課金などでのマナ増加
			if(f.pet.item=="フェンリル" && f.pet.sub1=="黄金")
				c.mana += c.lv/2;//黄金のフェンリルのマナ増加
		}
		/**
		 * SDの計算
		 */
		private function calcSD():void{
			//SD
			c.sd = (c.lv * c.lv / 30) + 
							((c.str+c.agi+c.vit+c.ene+c.rec)*1.2) +
							c.def/2;
			
			c.sd += f.master_skill.getSkillValue("maximum_sd");
			
			if(f.boots.op380)
				c.sd += 700;//380OP
		}
		/**
		 * AGの計算
		 */
		private function calcAG():void{
			var inc:Array = D.getData("job_ag")[f.job_index];
			// ステータス
			c.ag = Math.floor((c.str*inc[0])+(c.agi*inc[1])+(c.vit*inc[2])+(c.ene*inc[3])+(c.rec*inc[4]));
			c.ag += f.master_skill.getSkillValue("maximum_ag");//master skill
			c.ag += Math.floor(c.ag * SupportSkillCalculator.calcSwellLife_AG(f.support)/100);
			c.ag += i.setop_ag;//セットOP
			c.ag += i.getEnchantProtects("最大AG上昇");//エンチャントOP
			c.ag += i.getSocketProtects("最大AG増加");//ソケットOP
			if(f.pet.item=="ディノラント")
				if(f.pet.sub1=="AG+50"||f.pet.sub2=="AG+50")
					c.ag += 50;
			// AGH
			var tmp:Number = f.master_skill.getSkillValue("ag_recovery");//master skill
			if(f.job=="ナイト")tmp += 5.00;
			else tmp += 3.00;
			c.agh = 2 + Math.floor(c.ag*tmp/100);
			c.agh += i.setop_agah;//セットOP
		}
		/**
		 * 攻撃速度の計算
		 */
		private function calcSpeed():void{
			var inc:Array = D.getData("job_speed")[f.job_index];
			var speed:int = 0;
			// ステータス
			c.speed = c.agi/inc[0];
			c.magic_speed = c.agi/inc[1];
			// 武器の攻撃速度
			if(i.is_dual_wield){//二刀流
				speed += (i.getItemData(f.right,"speed")+i.getItemData(f.left,"speed"))/2;
			}else{
				speed += i.getItemData(f.right,"speed")+i.getItemData(f.left,"speed");
			}
			// EXOPの攻撃速度
			if(f.right.exop["速度+7"]){speed+=7;}
			if(f.left.exop["速度+7"]){speed+=7;}
			if(f.neck.exop["速度+7"]){speed+=7;}
			//グラブの攻撃速度
			speed += i.getItemData(f.glove,"speed");
			//ソケットOPの攻撃速度
			speed += i.getSocket(f.right,"速度増加");
			speed += i.getSocket(f.left,"速度増加");
			//その他
			if((i.getItemData(f.ring1,"name")=="魔法師の指輪" || i.getItemData(f.ring2,"name")=="魔法師の指輪")
			 	|| (i.getItemData(f.ring1,"name")=="大魔法師の爪" || i.getItemData(f.ring2,"name")=="大魔法師の爪"))
				{speed += 10;}//魔法師
			if(f.support.ale_check.selected){speed += 20;}//酒
			speed += i.etc_speed;//かぼちゃ、課金など
			if(f.pet.item=="デーモン"){speed += 10;}//デーモン
			if(f.pet.item=="スケルトンパージドラゴン"){speed += 10;}//スケルトンパージドラゴン
			
			// 適用
			c.speed += speed;
			c.magic_speed += speed;
			
			// マスタースキル
			if(i.getItemData(f.right,"type")=="片手剣"
				|| i.getItemData(f.left,"type")=="片手剣")
				c.speed += f.master_skill.getSkillValue("one_hand_sword_mastery");
			if(i.getItemData(f.right,"type")=="片手杖"
				|| i.getItemData(f.left,"type")=="片手杖")
				c.magic_speed += f.master_skill.getSkillValue("one_hand_staff_mastery");
			if(i.getItemData(f.right,"type")=="弓"
				|| i.getItemData(f.left,"type")=="弓")
				c.speed += f.master_skill.getSkillValue("bow_mastery");
			if(i.getItemData(f.right,"type")=="書"
				|| i.getItemData(f.left,"type")=="書")
				c.magic_speed += f.master_skill.getSkillValue("book_mastery");	
		}
		/**
		 * 確率の計算
		 */
		private function calcNormal():void{
			//通常　クリ　EXD
			//EXD
			var exd:int = 0;
			// EXOP
			if(f.right.exop["EXD"])exd += 10;
			if(f.left.exop["EXD"])exd += 10;
			if(f.neck.exop["EXD"])exd += 10;
			exd += i.setop_exdper;//セットOPEXD
			// ソケットOP
			exd += i.getSocket(f.right,"EXD確率");
			exd += i.getSocket(f.left,"EXD確率");
			// master skill
			exd += f.master_skill.getSkillValue("exdamage_probability");
			// C+
			if(f.support.cplus_check.selected)exd += SupportSkillCalculator.calcCriticalPlus_Exd(f.support);
			
			//クリ
			var cri:int = 0;
			var equips:Array = [f.wing,f.right,f.left,f.helm,f.armor,f.garter,f.glove,f.boots];
			// 装備の幸運
			for(var n:Object in equips)
				if(equips[n].luck)
					cri += 4;
			cri += i.setop_criper;//セットOPクリ
			// ソケットOP
			cri += i.getSocket(f.right,"クリ確率");
			cri += i.getSocket(f.left,"クリ確率");
			// master skill
			cri += f.master_skill.getSkillValue("critical_probability");
			// C+
			if(f.support.cplus_check.selected)cri += SupportSkillCalculator.calcCriticalPlus_Cri(f.support);
			// spell enhance
			if(f.support.se_check.selected)cri += SupportSkillCalculator.calcSpellEnhance_Cri(f.master_skill.getSkillValue("spell_enhance_mastery"));
			
			/*
			 * 割合計算
			 */
			c.criper = cri;//クリティカル確率合計
			cri = (100 - exd) * cri;
			var crif:int = cri % 100;//小数点部分
			cri = cri / 100;//整数部分
			//通常
			var nor:int = 0;
			nor = 100 - exd - cri;
			var norf:int = 0;
			if(crif){
				nor--;
				norf = 100 - crif;
			}
			
			
			//代入
			c.normal = nor * 100 + norf;
			c.cri = cri * 100 + crif;
			c.exd = exd;
		}
		/**
		 * 特殊ダメージ確率の計算(WD,防御無視)
		 */
		private function calcSpecial():void{
			//セットソケットオプション
			var equips:Array = [f.right,f.left,f.helm,f.armor,f.garter,f.glove,f.boots];
			var attr:Object={};
			attr["炎"]=0;
			attr["稲妻"]=0;
			attr["氷"]=0;
			attr["水"]=0;
			attr["風"]=0;
			attr["地"]=0;
			for(var n:Object in equips)
				attr[equips[n].socket_attr]++;
			// WD3%
			if(attr["炎"] && attr["稲妻"] && attr["氷"] &&
					attr["水"] && attr["風"] && attr["地"])
				c.wd += 3;
			// 防御無視1%
			if(attr["炎"] && attr["稲妻"] && attr["氷"] &&
					attr["水"]>=3 && attr["風"]>=3 && attr["地"]>=2)
				c.ignore += 1;
			
			//防御無視
			c.ignore += i.wing_ignore;//羽
			c.ignore += i.setop_ignore;//セットOP
			c.ignore += c.support_ignore;//レイジファイターバフ
			c.ignore += f.master_skill.getSkillValue("ignore_defense");
			
			//ダブルダメージ
			c.wd += i.setop_w;//セットOP
			c.wd += f.master_skill.getSkillValue("double_damage");
			if(i.getItemData(f.right,"type")=="槍"
				|| i.getItemData(f.left,"type")=="槍")
			    c.wd += f.master_skill.getSkillValue("spear_mastery");
			if(i.getItemData(f.right,"type")=="グローブ"
				|| i.getItemData(f.left,"type")=="グローブ")
			    c.wd += f.master_skill.getSkillValue("glove_mastery");
		}
	}
}