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
	 * 攻撃力/魔力を計算
	 * @author sinlion
	 *
	 */
	public class AttackCalculator{
		private var f:Object;
		private var i:ItemData;
		private var c:CharacterData;
		private var a:AttackData;
		/**
		 * コンストラクタ
		 */
		public function AttackCalculator(f:Object,i:ItemData,c:CharacterData){
			this.f = f;
			this.i = i;
			this.c = c;
			this.a = new AttackData();
			
			calcSkill();
			calc();
		}
		public function getData():AttackData{
			return a;
		}
		/**
		 * スキルの選択
		 */
		private function calcSkill():void{
			// keyの登録
			a.key = D.getKey("skill");
			// スキルを選択
			var s:Array = D.getData("skill") as Array;
			for(var n:String in s){
				// 職を確認
				if(!s[n][a.key.job][f.job_index])continue;
				// 要求ステータス確認
				var req:Array = s[n][a.key.require];
				if(req[a.key.lv] > f.status.lv)continue;
				if(req[a.key.str] > c.str)continue;
				if(req[a.key.agi] > c.agi)continue;
				if(req[a.key.vit] > c.vit)continue;
				if(req[a.key.ene] > c.ene)continue;
				if(req[a.key.rec] > c.rec)continue;
				// ペット確認
				if(s[n][a.key.pet]!="" && s[n][a.key.pet]!=f.pet.item)
					continue;
				// 武器スキル確認
				if(s[n][a.key.weapon] && 
						(i.getItemData(f.right,"skill")!=s[n][a.key.name] &&
						i.getItemData(f.left,"skill")!=s[n][a.key.name]))
					continue;
				// マスタースキル確認
				if(s[n][a.key.master]!="" && 
						f.master_skill.getSkill(s[n][a.key.master]).getValue()<10)
					continue;
				// ダークスピリット
				if(s[n][a.key.special]==4 && f.left.kind!="鷹")
					continue;
				// スキルを追加
				var skill:Skill = new Skill();
				skill.skill = s[n];
				// 速度を計算
				skill.speed = calcSpeed(s[n][a.key.speed],s[n][a.key.type]);
				a.skills.push(skill);
				// MasterSkillを追加
				// スキル強化
				var array:Array = MasterSkillToSkill.getEnhancement(s[n][a.key.name]);
				for(var obj:Object in array){
					skill.m_attack += f.master_skill.getSkillValue(array[obj]);
				}
				// スキルマスタリ
//				var array:Array = MasterSkillToSkill.getMastery(s[n][a.key.name]);
//				for(var obj in array){
//					//特殊効果しかない
//				}
			}
		}
		/**
		 * スキルの攻撃速度を計算します。
		 * @param index of skill
		 * @return speed
		 */
		private function calcSpeed(i:Object,type:String):Array{
			var r:Array = new Array();
			r[0] = 0;//速度[ms]
			r[1] = 0;//検証フラグ 0:false 1:true
			//データの取得
			var data:Object = D.getData("speed");
			var key:Object = D.getKey("speed");
			//ペット
			var index:int = 0;
			if(f.pet.item == "ユニリア" || f.pet.item == "ディノラント")
				index = a.key.uni;
			else if(f.pet.item == "フェンリル")
				index = a.key.fenrir;
			else if(f.pet.item == "ダークホース")
				index = a.key.darkhorse;
			//不明
			if(i[index] == -1){
				return r;
			}
			//速度データ
			var speed_data:Array = data[i[index]] as Array;
			
			var speed:int = c.speed;
			if(type=="魔法")speed = c.magic_speed;
			
			if(speed_data[key.type] == 0){
				r[0] = speed_data[key.speed];
				r[1] = speed_data[key.check_flag];
			}else if(speed_data[key.type] == 1){
				r[0] = (Math.floor(speed_data[key.a]/(speed+speed_data[key.b]))+1)*40;
				for(var n:Object in speed_data[key.checks]){
					if(speed_data[key.checks][n][key.lower] <= speed
							&& speed_data[key.checks][n][key.upper] >= speed){
						r[1] = 1;
					}
				}
			}else if(speed_data[key.type] == 2){
				r[0] = (Math.floor(speed_data[key.a]/(speed+speed_data[key.b]))+1)*40 + 60;
				for(var n2:Object in speed_data[key.checks]){
					if(speed_data[key.checks][n2][key.lower] <= speed
							&& speed_data[key.checks][n2][key.upper] >= speed){
						r[1] = 1;
					}
				}	
			}else if(speed_data[key.type] == 3){
				for(var m:int = 0; m < speed_data[1].length ; m++){
					if(speed_data[1][m][0] > speed){
						if(m>=0){
							r[0] = speed_data[1][m-1][1];
							r[1] = speed_data[1][m-1][2];
						}
						break;
					}
				}
			}
			return r;
		}
		/**
		 * 攻撃魔力計算
		 */
		private function calc():void{
			/*
			 * 攻撃力
			 */
			if((i.getItemData(f.right,"item") as String)=="武器"){
			    a.right.min = calcAttack("right",true);//右手
			    a.right.max = calcAttack("right",false);//右手
			}
		    if((i.getItemData(f.left,"item") as String)=="武器"){//左手
		    	a.left.min = calcAttack("left",true);
		    	a.left.max = calcAttack("left",false);
		    }
	    	// 追加攻撃力(A+など)
    		a.add = calcAddAttack();//A+とか
		    // キャラクターの攻撃力
		    a.attack.min = a.right.min + a.left.min;
		    a.attack.max = a.right.max + a.left.max;
			// キャラクターの魔力
			a.magic.min = calcMagic(true);//MIN
		    a.magic.max = calcMagic(false);//MAX
		    //呪い
		    a.curse.min = calcCurse(true);
		    a.curse.max = calcCurse(false);
		    //ダークスピリット
		    calcDarkSpirit();
		    //属性攻撃力
		    calcAttribute();
		    //スキルごとに計算
		    for(var n:String in a.skills){
		    	var func:Function = calcAttackSkill;
		    	// 計算式の選択
		    	if(a.skills[n].skill[a.key.name] == "プラズマストーム")
		    		func = calcPlasmaStorm;
		    	else if(a.skills[n].skill[a.key.special] == "フレイムハンド")
		    		func = calcDarkSpiritSkill;
		    	else if(a.skills[n].skill[a.key.type] == "魔法")
		    		if(a.skills[n].skill[a.key.special] == "呪い")
		    			func = calcCurseSkill;
		    		else
		    			func = calcMagicSkill;
		    	// 計算
				if((i.getItemData(f.left,"item") as String)!="武器"
					|| (i.getItemData(f.right,"item") as String)=="武器"){
			    	a.skills[n].min = func(a.skills[n],false,false,true);// 最小
			    	a.skills[n].max = func(a.skills[n],false,false,false);// 最大
			    	a.skills[n].cri = func(a.skills[n],true,false,false);// クリ
			    	a.skills[n].exd = func(a.skills[n],false,true,false);// EXD
				}
		    	// スキルの場合のみ特殊計算
		    	if(a.skills[n].skill[a.key.type]=="スキル" && 
		    			(i.getItemData(f.left,"item") as String)=="武器"){
		    		// 左手計算
			    	a.skills[n].min += func(a.skills[n],false,false,true,"left");// 最小
			    	a.skills[n].max += func(a.skills[n],false,false,false,"left");// 最大
			    	a.skills[n].cri += func(a.skills[n],true,false,false,"left");// クリ
			    	a.skills[n].exd += func(a.skills[n],false,true,false,"left");// EXD
		    	}
		    }
		}
		/**
		 * 攻撃力計算
		 */
		private function calcAttack(hand:String,min:Boolean):int{
		    var d:int = 0;
		
			//job
			d += calcJob(min);
			
			//武器の攻撃力
			if(min)d += i.getSpec(f[hand],"min");
			else d += i.getSpec(f[hand],"max");
			//追加OP
		    d += i.getValueMap(f[hand].option,"攻撃");//武器の追加攻撃力
		    d += i.getValueMap(f.wing.option,"攻撃");//Ｒ ＝ Ｒ ＋ 羽追加攻撃力
			// 羽 master skill
			d += f.master_skill.getSkillValue("wing_attack");
		    
		    //マスタースキル武器強化
		    if(i.getItemData(f[hand],"type")=="片手剣"){
			    d += f.master_skill.getSkillValue("one_hand_sword");
		    }else if(i.getItemData(f[hand],"type")=="両手剣"){
			    d += f.master_skill.getSkillValue("two_hand_sword");
		    }else if(i.getItemData(f[hand],"type")=="ハンマー"){
			    d += f.master_skill.getSkillValue("hammer");
		    }else if(i.getItemData(f[hand],"type")=="槍"){
			    d += f.master_skill.getSkillValue("spear");
		    }else if(i.getItemData(f[hand],"type")=="弓"){
			    d += f.master_skill.getSkillValue("bow");
		    }else if(i.getItemData(f[hand],"type")=="ボウガン"){
			    d += f.master_skill.getSkillValue("crossbow");
		    }else if(i.getItemData(f[hand],"type")=="セプター"){
			    d += f.master_skill.getSkillValue("scepter");
		    }else if(i.getItemData(f[hand],"type")=="グローブ"){
			    d += f.master_skill.getSkillValue("glove");
		    }

		    //マスタースキル最小最大
		    if(min){//最小
		    	d += f.master_skill.getSkillValue("minimum_attack");
		    }else{
		    	d += f.master_skill.getSkillValue("maximum_attack");
		    }
		    d += f.master_skill.getSkillValue("weapon_master");
		    
		    //サンタ、かぼちゃ、桜
		    d += i.etc_attack;
		    
		    //[魔法師の指輪装備時]　Ｘ ＝ int(Ｘ × 1.1)
		    if(i.getItemData(f.ring1,"name") == "魔法師の指輪" || i.getItemData(f.ring2,"name") == "魔法師の指輪")
		    	d = Math.floor(d * 1.1);
		    //[大魔法師の爪装備時] Y = int(Y * 1.15)
		    if(i.getItemData(f.ring1,"name") == "大魔法師の爪" || i.getItemData(f.ring2,"name") == "大魔法師の爪")
		    	d = Math.floor(d * 1.15);
		    //[デーモン]
		    if(f.pet.item == "デーモン")d += Math.floor(d * 0.4);

		    //[スケルトンパージドラゴン装備時] Y = int(Y * 1.2)
		    if(f.pet.item == "スケルトンパージドラゴン")d = Math.floor(d * 1.2);
		    
		    //[武器のEXOPに攻撃力増加+LV/20がある時]　Ｒ ＝ Ｒ ＋ int(レベル ÷ 20) 
		    if(hand=="left"){//左手
		    	if(i.getValueMap(f[hand].exop,"攻撃lv20"))d += Math.floor(c.lv/20);
		    }else{
		    	if(i.getValueMap(f[hand].exop,"攻撃lv20"))d += Math.floor(f.status.lv/20);
		    }
		    //[武器のEXOPに攻撃力増加+2%がある時]　Ｒ ＝ Ｒ ＋ int((ステータス最大攻撃力 ＋ 武器最大攻撃力) × 0.02) 
		    if(i.getValueMap(f[hand].exop,"攻撃2%"))d += Math.floor(d*0.02);
		    //[アクセのEXOPに攻撃力増加+LV/20がある時]　Ｒ ＝ Ｒ ＋ int(レベル ÷ 20) 
		    if(hand=="left"){
		    	if(i.getValueMap(f.neck.exop,"攻撃lv20"))d += Math.floor(c.lv/20);
		    }else{
		    	if(i.getValueMap(f.neck.exop,"攻撃lv20"))d += Math.floor(f.status.lv/20);
		    }
		    //[ソケットOP]攻撃力LV20
		    if(i.getSocket(f.right,"攻撃魔力lv") && i.getItemData(f.right,"ex_en_type") == 0)
		    	d += Math.floor(c.lv/i.getSocket(f.right,"攻撃魔力lv"));
		    if(i.getSocket(f.left,"攻撃魔力lv") && i.getItemData(f.left,"ex_en_type") == 0)
		    	d += Math.floor(c.lv/i.getSocket(f.left,"攻撃魔力lv"));
		    //[アクセのEXOPに攻撃力増加+2%がある時]　Ｒ ＝ Ｒ ＋ int(Ｒ × 0.02)数
		    if(i.getValueMap(f.neck.exop,"攻撃2%"))d += Math.floor(d*0.02);

		    if(min){//最小
		        d += i.setop_min;//[セットOP]X = X + 最小攻撃力増加
		        d += i.getValueMap(f[hand].enchant,"最小攻撃力");//[エンチャントOP]X = X + 最小攻撃力増加
		        d += i.getSocket(f[hand],"最小攻撃魔力");//[ソケットOP]X = X + 最小攻撃力増加
		    }else{//最大
		        d += i.setop_max;//[セットOP]X = X + 最大攻撃力増加
		        d += i.getValueMap(f[hand].enchant,"最大攻撃力");//[エンチャントOP]X = X + 最大攻撃力増加
		        d += i.getSocket(f[hand],"最大攻撃魔力");//[ソケットOP]X = X + 最大攻撃力増加
		    }
		    d += i.setop_attack;//[セットOP]X = X + 攻撃力増加
		    d += i.getValueMap(f[hand].enchant,"攻撃力");//[エンチャントOP]X = X + 攻撃力増加
		    d += i.getSocket(f[hand],"攻撃魔力増加");//[ソケットOP]X = X + 攻撃力増加
		    d += i.getValueMap(f[hand].socket_bonus,"攻撃力");//[ソケットボーナス]X = X +攻撃力増加 
		    
		    //エルフの矢による攻撃力増加
    		if(f.right.arrow == "矢+1" || f.left.arrow == "矢+1"){
    			//矢+1 ダメージ増加3%と追加攻撃力+1
    			d += Math.floor(d * 3/100);
    			d++;
    		}
    		if(f.right.arrow == "矢+2" || f.left.arrow == "矢+2"){
    			//矢+2 ダメージ増加5%と追加攻撃力+1
    			d += Math.floor(d * 5/100);
    			d++;
    		}
    		if(f.right.arrow == "矢+3" || f.left.arrow == "矢+3"){
    			//矢+3 ダメージ増加7%と追加攻撃力+1
    			d += Math.floor(d * 7/100);
    			d++;
    		}
			
		    //二刀流攻撃力1.1倍
		    if(i.is_dual_wield){
		    	if(f.job == "レイジファイター"){
		    		if(min){//レイジファイターの場合最小1.2倍
		    			d = Math.floor(d * 0.6);
		    		}else{//レイジファイターの場合最大1.3倍
		    			d = Math.floor(d * 0.65);
		    		}
				}else{
					d = Math.floor(d * 0.55);
				}
			}
		    return d;
		}
		/**
		 * スキル攻撃力計算
		 */
		private function calcAttackSkill(skill:Skill,cri:Boolean,exd:Boolean,min:Boolean,hand:String="right"):int{
			// 攻撃力
			var d:int = 0;
			if(hand=="right"){
				d=a.right.max;
				if(min)d=a.right.min;
			}else{
				d=a.left.max;
				if(min)d=a.left.min;
			}
			
			if(hand=="right"){
				//ダークロード特殊ダメージ
				if(f.job == "ダークロード" && skill.skill[a.key.name] != "アースシェイク"){
					d += Math.floor(c.str/25) + Math.floor(c.ene/50);
				}
				//スキル攻撃力
				//アースシェイク
				if(skill.skill[a.key.name] == "アースシェイク"){
					d += (((f.pet.sub1_index+1) * 10) + Math.floor(c.str/10) + Math.floor(c.rec/5));
				}else if(skill.skill[a.key.name] == "カオティックディセイアー"){//カオス
					//if(exd)d += 87;
					//else d += Math.floor(c.rec/20);
//					d += Math.floor(c.rec/20);
				}
				//レイジファイター
//				if(skill.skill[a.key.name] == "ドラゴンロアー")
//					d += (c.ene - 30)/10;
//				if(skill.skill[a.key.name] == "チェーンドライブ")
//					d += (c.vit - 20)/10;
				//マスタースキル
				d += skill.m_attack;//[マスタースキルのスキル強化]
				//通常のスキル
			    if(min){//最小
			        d += skill.skill[a.key.power];//スキル威力
			    }else{
			        d += Math.floor(skill.skill[a.key.power]*1.5);//スキル威力
			    }
			}
			if(hand == "left" && f.job == "エルフ"){
				//弓の場合、マルチショット特殊減少
				if(skill.skill[a.key.name] == "マルチショット"){
	//				c.now_skill[1] = 32;//スキル威力40→32調整用
	//				d -= c.op_skill - Math.floor(c.op_skill*0.8);//スキル威力２０％減少
				}
				//通常のスキル
			    if(min){//最小
			        d += skill.skill[a.key.power];//スキル威力
			    }else{
			        d += Math.floor(skill.skill[a.key.power]*1.5);//スキル威力
			    }
			}
		    //属性ダメージ
			var tmp_acc:Array = [f.neck,f.ring1,f.ring2];
			for(var n:String in tmp_acc)
				if(tmp_acc[n].set_item != null && 
						skill.skill[a.key.attr] == i.getItemData(tmp_acc[n],"attr"))
					d += 5;
			
			//スキル攻撃力増加
			d += i.setop_skill;//[セットOP]
		    d += i.getValueMap(f.right.enchant,"スキル攻撃力");//[エンチャントOP]
		    d += i.getSocket(f.right,"スキル増加");//[ソケットOP]
		    d += i.getValueMap(f.right.socket_bonus,"スキル");//[ソケットボーナス]
		    d += i.getValueMap(f.left.enchant,"スキル攻撃力");//[エンチャントOP]
		    d += i.getSocket(f.left,"スキル増加");//[ソケットOP]
		    d += i.getValueMap(f.left.socket_bonus,"スキル");//[ソケットボーナス]
			
			// EXD
			if(exd)d += Math.floor(d*0.2);
		    
		    //ダメージ増加系統
			if(exd){
				// EXD増加
		    	d += i.getSocket(f.right,"EXD増加");//ソケットOP
		    	d += i.getSocket(f.left,"EXD増加");//ソケットOP
		    	d += i.setop_exd;//セットOP
			}
		    if(cri||exd){
		    	//クリダメ増加
		    	if(i.getItemData(f.right,"ex_en_type") == 0){
		    		d += i.getSocket(f.right,"クリ増加");//ソケットOP
		    		d += i.getValueMap(f.right.enchant,"Cダメ");//エンチャントOP
		    	}
		    	if(i.getItemData(f.left,"ex_en_type") == 0){
		    		d += i.getValueMap(f.left.enchant,"Cダメ");//エンチャントOP
		    		d += i.getSocket(f.left,"クリ増加");//ソケットOP
		    	}
		    	d += c.support_c;//C+
		    	if(hand == "right")
		    		d += i.setop_cri;//セットOP
		    }

		    return d;
		}
		private function calcJob(min:Boolean):int{
			var d:int=0;
		    //最小最大攻撃力=================================================================
			if(f.job == "ナイト"){
			    if(min)d = Math.floor(c.str/6);//Ｒ ＝ ステータス最小攻撃力
			    else d = Math.floor(c.str/4);//Ｒ ＝ ステータス最大攻撃力
			}else if(f.job == "ウィザード"){
			    if(min)d = Math.floor(c.str/8);//Ｒ ＝ ステータス最小攻撃力
			    else d = Math.floor(c.str/4);//Ｒ ＝ ステータス最大攻撃力
			}else if(f.job == "エルフ"){
			    if(min) d = Math.floor(c.str/14) + Math.floor(c.agi/7);//Ｒ ＝ ステータス最小攻撃力
			    else d = Math.floor(c.str/8) + Math.floor(c.agi/4);//Ｒ ＝ ステータス最大攻撃力
			}else if(f.job == "魔剣士"){
			    if(min)d = Math.floor(c.str/6) + Math.floor(c.ene/12);//Ｒ ＝ ステータス最小攻撃力
			    else d = Math.floor(c.str/4) + Math.floor(c.ene/8);//Ｒ ＝ ステータス最大攻撃力
			}else if(f.job == "ダークロード"){
			    if(min)d = Math.floor(c.str/7) + Math.floor(c.ene/14);//Ｒ ＝ ステータス最小攻撃力
			    else d = Math.floor(c.str/5) + Math.floor(c.ene/10);//Ｒ ＝ ステータス最大攻撃力
			}else if(f.job == "召喚師"){
			    if(min)d = Math.floor((c.str-1)/9);//Ｒ ＝ ステータス最小攻撃力
			    else d = Math.floor((c.str-1)/4);//Ｒ ＝ ステータス最大攻撃力
			}else if(f.job == "レイジファイター"){
			    if(min)d = Math.floor(c.str/7) + Math.floor(c.vit/15);//Ｒ ＝ ステータス最小攻撃力
			    else d = Math.floor(c.str/5) + Math.floor(c.vit/12);//Ｒ ＝ ステータス最大攻撃力
			}
			return d;
		}
		/**
		 * 追加攻撃力計算
		 */
		private function calcAddAttack():int{
			var d:int=0;
		    //妙薬・A＋・セラ
		    d += c.support_a;
		    if(f.support.miracle_check.selected)d += 15;
		    d += c.support_sera_a;
		    //課金アイテム
		    d += i.etc_attack2;
		    
			return d;
		}
		/**
		 * 魔力計算
		 */
		private function calcMagic(min:Boolean):int{
		    var d:int=0;
		    //最大魔力==================================================================
		    if(!min){d = Math.floor(c.ene/4);}
		    else{d =  Math.floor(c.ene/9);}
		    //マスタースキル武器強化
		    if(i.getItemData(f.right,"type")=="片手杖"){
			    d += f.master_skill.getSkillValue("one_hand_staff");
		    }else if(i.getItemData(f.right,"type")=="両手杖"){
			    d += f.master_skill.getSkillValue("two_hand_staff");
		    }else if(i.getItemData(f.right,"type")=="ロッド"){
			    d += f.master_skill.getSkillValue("rod");
		    }
		    //OP
		    d += i.getValueMap(f.right.option,"魔力");
		    d += i.getValueMap(f.wing.option,"魔力");//Y = Y ＋　羽追加魔力
			// 羽 master skill
			d += f.master_skill.getSkillValue("wing_attack");
		    //[魔法師の指輪装備時]　Ｘ ＝ int(Ｘ × 1.1)
		    if(i.getItemData(f.ring1,"name") == "魔法師の指輪" || i.getItemData(f.ring2,"name") == "魔法師の指輪")
		    	d = Math.floor(d * 1.1);
		    //[大魔法師の爪装備時] Y = int(Y * 1.15)
		    if(i.getItemData(f.ring1,"name") == "大魔法師の爪" || i.getItemData(f.ring2,"name") == "大魔法師の爪")
		    	d = Math.floor(d * 1.15);
		    //[スケルトンパージドラゴン装備時] Y = int(Y * 1.2)
		    if(f.pet.item=="スケルトンパージドラゴン")
		    	d = Math.floor(d * 1.2);
		    //[エンチャントOP]魔力増加
		    d += i.getValueMap(f.right.enchant,"魔力上昇");
		    //[ソケットOP]魔力増加
		    d += i.getSocket(f.right,"攻撃魔力増加");
		    d += i.getSocket(f.left,"攻撃魔力増加");
		    //[ソケットボーナス]魔力増加
		    d += i.getValueMap(f.right.socket_bonus,"魔力");
		    d += i.getValueMap(f.left.socket_bonus,"魔力");
		    //[黄金のフェンリル]　魔力増加
		    if(f.pet.item=="フェンリル" && f.pet.sub1=="黄金")d += c.lv/25;
		    //[武器のEXOPに魔力増加+LV/20がある時]　Ｒ ＝ Ｒ ＋ int(レベル ÷ 20) 
		    if(i.getValueMap(f.right.exop,"魔力lv20")){d = d + Math.floor(c.lv/20);}
		    //[ソケットOP]魔力LV20
		    if(i.getSocket(f.right,"攻撃魔力lv")!=0 && i.getItemData(f.right,"ex_en_type") == 1)
		    	d += Math.floor(c.lv/i.getSocket(f.right,"攻撃魔力lv"));
		    //[武器のEXOPに魔力増加+2%がある時]　Ｒ ＝ Ｒ ＋ int(Ｒ × 0.02) 
		    if(i.getValueMap(f.right.exop,"魔力2%")){d = d + Math.floor(d*0.02);}
		    //[左手エンチャントOP]魔力増加
		    d += i.getValueMap(f.left.enchant,"魔力上昇");
		    //[左手ソケットOP]魔力LV20
		    if(i.getSocket(f.left,"攻撃魔力lv")!=0 && i.getItemData(f.left,"ex_en_type") == 1)
		    	d += Math.floor(c.lv/i.getSocket(f.left,"攻撃魔力lv"));
		    //[左手武器のEXOPに魔力増加+LV/20がある時]　Ｒ ＝ Ｒ ＋ int(レベル ÷ 20) 
		    if(i.getValueMap(f.left.exop,"魔力lv20")){d = d + Math.floor(c.lv/20);}
		    //[左手武器のEXOPに魔力増加+2%がある時]　Ｒ ＝ Ｒ ＋ int(Ｒ × 0.02) 
		    if(i.getValueMap(f.left.exop,"魔力2%")){d = d + Math.floor(d*0.02);}
		    //[アクセのEXOPに魔力増加+LV/20がある時]　Ｒ ＝ Ｒ ＋ int(レベル ÷ 20) 
		    if(i.getValueMap(f.neck.exop,"魔力lv20")){d = d + Math.floor(c.lv/20);}
		    //[アクセのEXOPに魔力増加+2%がある時]　Ｒ ＝ Ｒ ＋ int(Ｒ × 0.02)
		    if(i.getValueMap(f.neck.exop,"魔力2%")){d = d + Math.floor(d*0.02);}
		    
		    if(min){//[最小]
		        d += i.getSocket(f.right,"最小攻撃魔力");//[ソケットOP]最小魔力
		        d += i.getSocket(f.left,"最小攻撃魔力");//[ソケットOP]最小魔力
		        //マスタースキル
		    	d += f.master_skill.getSkillValue("minimum_magic");
		    	d += f.master_skill.getSkillValue("minimum_magic_curse");
		    }else{//[最大]
		        d += i.getSocket(f.right,"最大攻撃魔力");//[ソケットOP]最小魔力
		        d += i.getSocket(f.left,"最大攻撃魔力");//[ソケットOP]最小魔力
		        //マスタースキル
		    	d += f.master_skill.getSkillValue("maximum_magic");
		    	d += f.master_skill.getSkillValue("maximum_magic_curse");
		    }
		    //[マスタースキル]
	    	d += f.master_skill.getSkillValue("magic_master");
		    
		    var tmp_d:int = d;//スペルエンハンス用
	    	//[セットOP]Y = Y + int(Y * 魔力%)
		    d += Math.floor(d * i.setop_magicper/100);

		    //[スペルエンハンス]
		    if(min)d += Math.floor((c.ene/9) * c.support_se/100);//20%上昇
		    if(!min && f.support.se_check.selected)d += Math.floor(
		    		(c.ene/4) * SupportSkillCalculator.calcSpellEnhance_Max(
		    				f.master_skill.getSkillValue("spell_enhance"))/100);//9.02%上昇
		    //[バーサーカー] エナ/30
		    if(!min){d += Math.floor((c.ene/4) * c.support_berserker/100);}
		    else{d += Math.floor((c.ene/9) * c.support_berserker/100);}
		    //[バーサーカー] マスタースキル
		    if(f.support.ber_check.selected)
		    	d += Math.floor(SupportSkillCalculator.calcBerserkerMind_MagicFixed(
		    			f.master_skill.getSkillValue("berserker_mind_mastery2")));
		    
		    d += i.etc_magic;//[かぼちゃ、サンタ]魔力増加

		    return d;
		}
		/**
		 * 魔法スキル計算
		 */
		private function calcMagicSkill(skill:Skill,cri:Boolean,exd:Boolean,min:Boolean):int{
		    var d:int = a.magic.max;
			if(min)d=a.magic.min;
			//後半ダメージ計算====================================================		    //スキル攻撃力追加
			if(skill.skill[a.key.name] == "ヘルバースト"){//ヘルバースト
				d += 1320 + Math.floor(c.str/2);
			}else{//通常のスキル
			    if(min){d += skill.skill[a.key.power];}
			    else{d += Math.floor(skill.skill[a.key.power]*1.5);}
			}
		    //杖魔力%
		    if(f.job=="召喚師")
		    	d += Math.floor(d * i.getSpec(f.right,"magic")/100);
			//スキル攻撃力増加
			d += i.setop_skill;//[セットOP]
		    d += i.getValueMap(f.right.enchant,"スキル攻撃力");//[エンチャントOP]
		    d += i.getSocket(f.right,"スキル増加");//[ソケットOP]
		    d += i.getValueMap(f.right.socket_bonus,"スキル");//[ソケットボーナス]
		    d += i.getValueMap(f.left.enchant,"スキル攻撃力");//[エンチャントOP]
		    d += i.getSocket(f.left,"スキル増加");//[ソケットOP]
		    d += i.getValueMap(f.left.socket_bonus,"スキル");//[ソケットボーナス]
			d += skill.m_attack;//[マスタースキルのスキル強化]
		    //杖魔力%
		    if(f.job!="召喚師")
		    	d += Math.floor(d * i.getSpec(f.right,"magic")/100);
		    //EXD
		    if(exd)d += Math.floor(d*0.2);

		    //ダメージ増加系統
			if(exd){
				// EXD増加
		    	d += i.getSocket(f.right,"EXD増加");//ソケットOP
		    	d += i.getSocket(f.left,"EXD増加");//ソケットOP
		    	d += i.setop_exd;//セットOP
			}
		    if(cri||exd){
		    	//クリダメ増加
		    	if(i.getItemData(f.right,"ex_en_type") == 1){
		    		d += i.getSocket(f.right,"クリ増加");//ソケットOP
		    		d += i.getValueMap(f.right.enchant,"Cダメ");//エンチャントOP
		    	}
		    	if(i.getItemData(f.left,"ex_en_type") == 1){
			    	d += i.getSocket(f.left,"クリ増加");//ソケットOP
		    		d += i.getValueMap(f.left.enchant,"Cダメ");//エンチャントOP
		    	}
		    	d += c.support_c;//C+
		    	d += i.setop_cri;//セットOP
		    }

		    //妙薬・A＋・セラ
		    d += c.support_a;
		    if(f.support.miracle_check.selected)d += 15;
		    d += c.support_sera_a;
		    //[課金]魔力増加(バグ？)
		    d += i.etc_magic2;

			return d;
		}
		private function calcDarkSpirit():void{
			var plus:int = f.left.darkspirit;//鷹のLV
			var per:int = i.getSpec(f.right,"pet") + 100;
			//フレイムハンド単体の最小攻撃力
			c.darkspirit_min_single = Math.floor(((plus*15) + Math.floor(c.rec/8) + 180) * per / 100);
			//フレイムハンド単体の最大攻撃力
			c.darkspirit_max_single = Math.floor(((plus*15) + Math.floor(c.rec/4) + 200) * per / 100);
			//フレイムハンド範囲の最小攻撃力
			c.darkspirit_min_range = Math.floor(((plus*10) + Math.floor(c.rec/12) + 120) * per / 100); 	
			//フレイムハンド範囲の最大攻撃力
			c.darkspirit_max_range = Math.floor(((plus*10) + Math.floor(c.rec/6) + 133) * per / 100); 	
			//鷹の攻撃成功率
			c.darkspirit_hit = (plus*16) + 1000;
			//鷹のEXD率
			c.darkspirit_exd_per = Math.floor(plus/30)*10;
			//鷹のクリティカル率
			c.darkspirit_cri_per = (100 - c.darkspirit_exd_per) * plus;
			//鷹のノーマル率
			c.darkspirit_normal = (10000 - (c.darkspirit_exd_per*100) - c.darkspirit_cri_per);
		}
		/**
		 * ダークスピリットスキル計算
		 */
		private function calcDarkSpiritSkill(skill:Skill,cri:Boolean,exd:Boolean,min:Boolean):int{
			var d:int = 0;
		
			if(skill.skill[a.key.name] == "フレイムハンド(単体)")
				//フレイムハンド単体の最小攻撃力
				if(min) d = c.darkspirit_min_single;
				//フレイムハンド単体の最大攻撃力
				else d = c.darkspirit_max_single;
			else // フレイムハンド(範囲)	
				//フレイムハンド範囲の最小攻撃力
				if(min) d = c.darkspirit_min_range; 	
				//フレイムハンド範囲の最大攻撃力
				else d = c.darkspirit_max_range;
			
			return d;
		}
		/**
		 * 呪い計算
		 */
		private function calcCurse(min:Boolean):int{
			var d:int=0;
			//エナジー
			if(min)d += Math.floor(c.ene/9);
			else d += Math.floor(c.ene/4);
		    //マスタースキル武器強化
		    if(i.getItemData(f.left,"type")=="書"){
			    d += f.master_skill.getSkillValue("book");
		    }
			//武器OP　羽OP
			d += i.getValueMap(f.left.option,"呪い") + i.getValueMap(f.wing.option,"呪い");
			// 羽 master skill
			d += f.master_skill.getSkillValue("wing_attack");
		    //[スケルトンパージドラゴン装備時] Y = int(Y * 1.2)
		    if(f.pet.item=="スケルトンパージドラゴン")
		    	d = Math.floor(d * 1.2);
		    if(min){//[最小]
		    	d += f.master_skill.getSkillValue("minimum_magic_curse");
		    }else{
		    	d += f.master_skill.getSkillValue("maximum_magic_curse");
		    }
			//バーサーカー
		    if(!min){d += Math.floor(c.ene/4 * c.support_berserker/100);}
		    else{d += Math.floor(c.ene/9 * c.support_berserker/100);}
			
			return d;
		}
		/**
		 * 呪いスキル計算
		 */
		private function calcCurseSkill(skill:Skill,cri:Boolean,exd:Boolean,min:Boolean):int{
			var d:int=a.curse.max;
			if(min)d=a.curse.min;
			if(f.job=="召喚師"){
				//スキル威力
				if(min)d += skill.skill[a.key.power];
				else d += Math.floor(skill.skill[a.key.power]*1.5);
				//呪い上昇%
				d += Math.floor(d * i.getSpec(f.left,"curse")/100);
				//スキル攻撃力増加
				d += i.setop_skill;//[セットOP]
			    d += i.getValueMap(f.right.enchant,"スキル攻撃力");//[エンチャントOP]
			    d += i.getSocket(f.right,"スキル増加");//[ソケットOP]
			    d += i.getValueMap(f.right.socket_bonus,"スキル");//[ソケットボーナス]
			    d += i.getValueMap(f.left.enchant,"スキル攻撃力");//[エンチャントOP]
			    d += i.getSocket(f.left,"スキル増加");//[ソケットOP]
			    d += i.getValueMap(f.left.socket_bonus,"スキル");//[ソケットボーナス]
				d += skill.m_attack;//[マスタースキルのスキル強化]
			    //EXD
			    if(exd)d += Math.floor(d*0.2);

			    //ダメージ増加系統
				if(exd){
					// EXD増加
			    	d += i.getSocket(f.right,"EXD増加");//ソケットOP
			    	d += i.getSocket(f.left,"EXD増加");//ソケットOP
			    	d += i.setop_exd;//セットOP
				}
			    if(cri||exd){
			    	//クリダメ増加
			    	d += i.getSocket(f.right,"クリ増加");//ソケットOP
			    	d += i.getSocket(f.left,"クリ増加");//ソケットOP
			    	d += i.getValueMap(f.right.enchant,"Cダメ");//エンチャントOP
			    	d += i.getValueMap(f.left.enchant,"Cダメ");//エンチャントOP
			    	d += c.support_c;//C+
			    	d += i.setop_cri;//セットOP
			    }
			    
			    //妙薬・A＋・セラ
			    d += c.support_a;
			    if(f.support.miracle_check.selected)d += 15;
			    d += c.support_sera_a;
			}
			return d;
		}
		/**
		 * プラズマストーム計算
		 */
		private function calcPlasmaStorm(skill:Skill,cri:Boolean,exd:Boolean,min:Boolean,hand:String="right"):int{
			if(hand=="left")return 0;
			var d:int=0;
		    //攻撃力=================================================================
			if(f.job == "ナイト"){
			    d = Math.floor(c.str/3 + c.agi/5 + c.vit/5 + c.ene/7);
			}else if(f.job == "ウィザード"){
			    d = Math.floor(c.str/5 + c.agi/5 + c.vit/7 + c.ene/3);
			}else if(f.job == "エルフ"){
			    d = Math.floor(c.str/5 + c.agi/3 + c.vit/7 + c.ene/5);
			}else if(f.job == "魔剣士"){
			    d = Math.floor(c.str/3 + c.agi/5 + c.vit/5 + c.ene/7);
			}else if(f.job == "ダークロード"){
			    d = Math.floor(c.str/5 + c.agi/5 + c.vit/7 + c.ene/3 + c.rec/3);
			}else if(f.job == "召喚師"){
			    d = Math.floor(c.str/5 + c.agi/5 + c.vit/7 + c.ene/3);
			}else if(f.job == "レイジファイター"){
			    d = Math.floor(c.str/5 + c.agi/5 + c.vit/3 + c.ene/7);
			}
			//スキル威力
		    if(min){//最小
		        d += skill.skill[a.key.power];//スキル威力
		    }else{
		        d += Math.floor(skill.skill[a.key.power]*1.5);//スキル威力
		    }
		    //EXD
			if(exd)d += Math.floor(d*0.2);
		    //ダメージ増加系統
			if(exd){
				// EXD増加
		    	d += i.getSocket(f.right,"EXD増加");//ソケットOP
		    	d += i.getSocket(f.left,"EXD増加");//ソケットOP
		    	d += i.setop_exd;//セットOP
			}
		    if(cri||exd){
		    	//クリダメ増加
		    	d += i.getSocket(f.right,"クリ増加");//ソケットOP
		    	d += i.getSocket(f.left,"クリ増加");//ソケットOP
		    	d += i.getValueMap(f.right.enchant,"Cダメ");//エンチャントOP
		    	d += i.getValueMap(f.left.enchant,"Cダメ");//エンチャントOP
		    	d += c.support_c;//C+
		    	d += i.setop_cri;//クリダメ増加
		    }
		    
		    return d;
		}
		/**
		 * 属性攻撃力計算
		 */
		private function calcAttribute():void{
			if(f.property.name!=""){
				var add:int = 0;
				// pentagram
				a.attribute.min = f.property.item[1];
				a.attribute.max = f.property.item[2]; 
				add += 3*f.property.plus;
				if(f.property.plus >= 10){
					add += ((f.property.plus-9)+1)*(f.property.plus-9)/2;
				}
				// job
				calcAttributeJob();
				a.attribute.min += add;
				a.attribute.max += add; 
			}
		}
		/**
		 * 
		 */
		private function calcAttributeJob():void{
			// job
			var job_min:Array = D.getData("job_attr_min")[f.job_index];
			var job_max:Array = D.getData("job_attr_max")[f.job_index];
			// min
			if(job_min[0]!=0)
				a.attribute.min += Math.floor(c.str/job_min[0]);
			if(job_min[1]!=0)
				a.attribute.min += Math.floor(c.agi/job_min[1]);
			if(job_min[2]!=0)
				a.attribute.min += Math.floor(c.vit/job_min[2]);
			if(job_min[3]!=0)
				a.attribute.min += Math.floor(c.ene/job_min[3]);
			if(f.job=="ダークロード" && job_min[4]!=0)
				a.attribute.min += Math.floor(c.rec/job_min[4]);
			// max
			if(job_max[0]!=0)
				a.attribute.max += Math.floor(c.str/job_max[0]);
			if(job_max[1]!=0)
				a.attribute.max += Math.floor(c.agi/job_max[1]);
			if(job_max[2]!=0)
				a.attribute.max += Math.floor(c.vit/job_max[2]);
			if(job_max[3]!=0)
				a.attribute.max += Math.floor(c.ene/job_max[3]);
			if(f.job=="ダークロード" && job_max[4]!=0)
				a.attribute.max += Math.floor(c.rec/job_max[4]);
		}
	}
}
/**
 * スキルの計算
 */
class Skill{
	public var skill:Array;
	public var min:int=0;
	public var max:int=0;
	public var cri:int=0;
	public var exd:int=0;
	public var speed:Array=[0,0];
	// master skill
	public var m_attack:int=0;
	public var m_wd:int=0;
}