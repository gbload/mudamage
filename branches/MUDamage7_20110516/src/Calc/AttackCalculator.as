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
				if(req[a.key.lv] > f.lv)continue;
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
				// ダークスピリット　TODO
				// スキルを追加
				var skill:Skill = new Skill();
				skill.skill = s[n];
				// 速度を計算 TODO
				skill.speed = calcSpeed(s[n][a.key.speed],s[n][a.key.type]);
				a.skills.push(skill);
				// MasterSkillを追加 TODO
			}
		}
		/**
		 * スキルの攻撃速度を計算します。
		 * @param index of skill
		 * @return speed
		 */
		private function calcSpeed(i:Object,type:String):Array{
			var r:Array = new Array();
			r[0] = 0;
			r[1] = 0;
			
			var data:Object = D.getData("speed");
			var key:Object = D.getKey("speed");
			
			var index:int = 0;
			if(f.pet.item == "ユニリア" || f.pet.item == "ディノラント")
				index = a.key.uni;
			else if(f.pet.item == "フェンリル")
				index = a.key.fenrir;
			else if(f.pet.item == "ダークホース")
				index = a.key.darkhorse;
			
			if(i[index] == -1){
				return r;
			}
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
			var r_min:int=0;
			var r_max:int=0;
			var l_min:int=0;
			var l_max:int=0;
			// 魔法
			var x_min:int=0;
			var x_max:int=0;
			/*
			 * 攻撃力
			 */
			if((i.getItemData(f.right,"item") as String)=="武器"){
			    r_min = calcAttack("right",true);//右手
			    r_max = calcAttack("right",false);//右手
			}
		    if((i.getItemData(f.left,"item") as String)=="武器"){//左手
		    	l_min = calcAttack("left",true);
		    	l_max = calcAttack("left",false);
		    }
	    	// 追加攻撃力(A+など)
    		a.add = calcAddAttack();//A+とか
		    // キャラクターの攻撃力
		    a.attack.min = r_min + l_min;
		    a.attack.max = r_max + l_max;
			// キャラクターの魔力
			a.magic.min = calcMagic(true);//MIN
		    a.magic.max = calcMagic(false);//MAX
		    //呪い
		    a.curse.min = calcCurse(true);
		    a.curse.max = calcCurse(false);
		    //スキルごとに計算
		    for(var n:String in a.skills){
		    	var func:Function = calcAttackSkill;
		    	// 計算式の選択
		    	if(a.skills[n].skill[a.key.name] == "プラズマストーム")
		    		func = calcPlasmaStorm;
		    	else if(a.skills[n].skill[a.key.type] == "魔法")
		    		if(a.skills[n].skill[a.key.special] == "呪い")
		    			func = calcCurseSkill;
		    		else
		    			func = calcMagicSkill;
		    	// 計算
		    	a.skills[n].min = func(a.skills[n],false,false,true);// 最小
		    	a.skills[n].max = func(a.skills[n],false,false,false);// 最大
		    	a.skills[n].cri = func(a.skills[n],true,false,false);// クリ
		    	a.skills[n].exd = func(a.skills[n],false,true,false);// EXD
		    	// スキルの場合のみ特殊計算
		    	if(a.skills[n].skill[a.key.type]=="スキル"){
			    	a.skills[n].min += func(a.skills[n],false,false,true,"left");// 最小
			    	a.skills[n].max += func(a.skills[n],false,false,false,"left");// 最大
			    	a.skills[n].cri += func(a.skills[n],true,false,false,"left");// クリ
			    	a.skills[n].exd += func(a.skills[n],false,true,false,"left");// EXD
		    	}
		    }
		}
		private function calcAttack(hand:String,min:Boolean):int{
		    var d:int = 0;
		
			//job
			d += calcJob(min);
		    
		    var bowcheck:Boolean = true;//弓の場合、左手でfalse
//		    if(c.job == 2 && dat::d.f_right.f_kind.selectedLabel != "なし"
//		    	&& dat::d.f_right.f_item.selectedItem[3] == "弓"
//		    	&& dat::d.f_right.f_item.selectedItem[4] == "片手")
//		    		bowcheck = false;
			//武器の攻撃力
			if(min)d += i.getSpec(f[hand],"min");
			else d += i.getSpec(f[hand],"max");
			//追加OP
		    d += i.getValueMap(f[hand].option,"攻撃");//武器の追加攻撃力
		    d += i.getValueMap(f.wing.option,"攻撃");//Ｒ ＝ Ｒ ＋ 羽追加攻撃力 

//		    //マスタースキル最小最大
//		    if(min){//最小
//		    	d += weapon_min;
//		        //マスタースキル
//		        if(dat::mlvcount.min_attack)d += MLV.inf_min_attack[dat::mlvcount.min_attack];
//		        if(dat::mlvcount.min_attack_magic)d += MLV.inf_min_attack_magic[dat::mlvcount.min_attack_magic];
//		    }else{//最大
//		        //マスタースキル
//		        d += weapon_max;
//		        if(dat::mlvcount.max_attack)d += MLV.inf_max_attack[dat::mlvcount.max_attack];
//		        if(dat::mlvcount.max_attack_magic)d += MLV.inf_max_attack_magic[dat::mlvcount.max_attack_magic];
//		    }
//		    //サンタ、かぼちゃ、桜
//		    d += etc_attack;
//			
//		    //[魔法師の指輪装備時]　Ｘ ＝ int(Ｘ × 1.1)
//		    if(etc_mahouring){d = Math.floor(d * 1.1);}
//		    //[大魔法師の爪装備時] Y = int(Y * 1.15)
//		    if(etc_daimahouring){d = Math.floor(d * 1.15);}
//		    //[デーモン]
//		    if(c.deamon){d += Math.floor(d * 0.4);}
//		    
//		    //[スケルトンパージドラゴン装備時] Y = int(Y * 1.2)
//		    if(c.skelton){d = Math.floor(d * 1.2);}
		    
		    //[武器のEXOPに攻撃力増加+LV/20がある時]　Ｒ ＝ Ｒ ＋ int(レベル ÷ 20) 
		    if(bowcheck){//左手の弓のみ（ボウガンの時のみ）
		    	if(i.getValueMap(f[hand].exop,"攻撃lv20"))d += Math.floor(c.lv/20);
		    }else{
		    	if(i.getValueMap(f[hand].exop,"攻撃lv20"))d += Math.floor(f.status.lv/20);
		    }
		    //[武器のEXOPに攻撃力増加+2%がある時]　Ｒ ＝ Ｒ ＋ int((ステータス最大攻撃力 ＋ 武器最大攻撃力) × 0.02) 
		    if(i.getValueMap(f[hand].exop,"攻撃2%"))d += Math.floor(d*0.02);
		    //[アクセのEXOPに攻撃力増加+LV/20がある時]　Ｒ ＝ Ｒ ＋ int(レベル ÷ 20) 
		    if(bowcheck){
		    	if(i.getValueMap(f.neck.exop,"攻撃lv20"))d += Math.floor(c.lv/20);
		    }else{
		    	if(i.getValueMap(f.neck.exop,"攻撃lv20"))d += Math.floor(f.status.lv/20);
		    }
		    //[ソケットOP]攻撃力LV20
		    if(i.getSocket(f.right,"攻撃魔力lv"))
		    	d += Math.floor(c.lv/i.getSocket(f.right,"攻撃魔力lv"));
		    if(i.getSocket(f.left,"攻撃魔力lv"))
		    	d += Math.floor(c.lv/i.getSocket(f.left,"攻撃魔力lv"));
		    //[アクセのEXOPに攻撃力増加+2%がある時]　Ｒ ＝ Ｒ ＋ int(Ｒ × 0.02)数
		    if(i.getValueMap(f.neck.exop,"攻撃2%"))d += Math.floor(d*0.02);

		    if(min){//最小
//		        d += setop_min;//[セットOP]X = X + 最小攻撃力増加
		        d += i.getValueMap(f[hand].enchant,"最小攻撃力");//[エンチャントOP]X = X + 最小攻撃力増加
		        d += i.getSocket(f[hand],"最小攻撃魔力");//[ソケットOP]X = X + 最小攻撃力増加
		    }else{//最大
//		        d += setop_max;//[セットOP]X = X + 最大攻撃力増加
		        d += i.getValueMap(f[hand].enchant,"最大攻撃力");//[エンチャントOP]X = X + 最大攻撃力増加
		        d += i.getSocket(f[hand],"最大攻撃魔力");//[ソケットOP]X = X + 最大攻撃力増加
		    }
//		    d += setop_attack;//[セットOP]X = X + 攻撃力増加
		    d += i.getValueMap(f[hand].enchant,"攻撃力");//[エンチャントOP]X = X + 攻撃力増加
		    d += i.getSocket(f[hand],"攻撃魔力増加");//[ソケットOP]X = X + 攻撃力増加
		    d += i.getValueMap(f[hand].socket_bonus,"攻撃力");//[ソケットボーナス]X = X +攻撃力増加 
		    
		    //エルフの矢による攻撃力増加
//		    if(dat::d.f_right.f_kind.selectedIndex != 0
//		    	&& dat::d.f_right.f_item.selectedItem[3] == "弓"){
//		    		if(dat::d.f_right.f_arrow.selectedIndex == 1){d += Math.floor(d * 3/100);d++;}//矢+1 ダメージ増加3%と追加攻撃力+1
//		    		if(dat::d.f_right.f_arrow.selectedIndex == 2){d += Math.floor(d * 5/100);d++;}//矢+2 ダメージ増加5%と追加攻撃力+1
//		    		if(dat::d.f_right.f_arrow.selectedIndex == 3){d += Math.floor(d * 7/100);d++;}//矢+3 ダメージ増加7%と追加攻撃力+1
//		    	}
			
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
		private function calcAttackSkill(skill:Skill,cri:Boolean,exd:Boolean,min:Boolean,hand:String="right"):int{
			var d:int=a.attack.max;
			if(min)d=a.attack.min;
			//後半ダメージ計算=============================================
			var s:int=0;//スキル威力保持用
			var dual:int=1;
			
		    var bowcheck:Boolean = true;//弓の場合、左手でfalse
//		    if(c.job == 2 && dat::d.f_right.f_kind.selectedLabel != "なし"
//		    	&& dat::d.f_right.f_item.selectedItem[3] == "弓"
//		    	&& dat::d.f_right.f_item.selectedItem[4] == "片手")
//		    		bowcheck = false;
			
			if(i.is_dual_wield)dual=2;//二刀流計算時
			
			if(hand=="right"){
				//ダークロード特殊ダメージ
				if(f.job == "ダークロード" && skill.skill[a.key.name] != "アースシェイク"){
					d += Math.floor(c.str/25) + Math.floor(c.ene/50);
				}
				//スキル攻撃力
				//アースシェイク
				if(skill.skill[a.key.name] != "アースシェイク"){
	//				d += ((c.darkhorse * 10) + Math.floor(c.str/10) + Math.floor(c.rec/5));
				}else if(skill.skill[a.key.name] != "カオティックディセイアー"){//カオス
					//if(exd)d += 87;
					//else d += Math.floor(c.rec/20);
					d += Math.floor(c.rec/20);
				}
				//弓の場合、マルチショット特殊減少
				if(!bowcheck && skill.skill[a.key.name] == "マルチショット"){
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
		    //本当は左手に持っていくものだけど倍率係数で変化がないので、簡略化のためここで2倍
//			d += c.now_skill[4]*i;
			
			//スキル攻撃力増加
//			d += c.op_skill;
			
			// EXD
			if(exd)d += Math.floor(d*0.2);
		    
		    //ダメージ増加系統
//		    if(exd)d += c.op_exd;//EXD増加
		    if(cri||exd){
		    	//クリダメ増加
		    	d += i.getSocket(f.right,"クリ増加");//ソケットOP
		    	d += i.getSocket(f.left,"クリ増加");//ソケットOP
		    	d += i.getValueMap(f.right.enchant,"Cダメ");//エンチャントOP
		    	d += i.getValueMap(f.left.enchant,"Cダメ");//エンチャントOP
		    	d += c.support_c;//C+
//		    	if(hand == "right")
//		    		d += setop_cri;//クリダメ増加
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
		private function calcAddAttack():int{
			var d:int=0;
		    //妙薬・A＋・セラ
//		    d += c.op_miracle;
//		    //課金アイテム
//		    d += etc_attack2;
		    
			return d;
		}
		private function calcMagic(min:Boolean):int{
		    var d:int=0;
		    //最大魔力==================================================================
		    if(!min){d = Math.floor(c.ene/4);}
		    else{d =  Math.floor(c.ene/9);}
		    //OP
		    d += i.getValueMap(f.right.option,"魔力");
		    d += i.getValueMap(f.wing.option,"魔力");//Y = Y ＋　羽追加魔力
		    //[魔法師の指輪装備時] Y = int(Y * 1.1)
//		    if(etc_mahouring){d = Math.floor(d * 1.1);}
		    //[大魔法師の爪装備時] Y = int(Y * 1.15)
//		    if(etc_daimahouring){d = Math.floor(d * 1.15);}
		    //[スケルトンパージドラゴン装備時] Y = int(Y * 1.2)
//		    if(c.skelton){d = Math.floor(d * 1.2);}
		    //[エンチャントOP]魔力増加
		    d += i.getValueMap(f.right.enchant,"魔力上昇");
		    //[ソケットOP]魔力増加
		    d += i.getSocket(f.right,"攻撃魔力増加");
		    d += i.getSocket(f.left,"攻撃魔力増加");
		    //[ソケットボーナス]魔力増加
		    d += i.getValueMap(f.right.socket_bonus,"魔力");
		    d += i.getValueMap(f.left.socket_bonus,"魔力");
		    //黄金のフェンリル　魔力増加
//		    if(c.fenrir==4)d += c.lv/25;
		    //[武器のEXOPに魔力増加+LV/20がある時]　Ｒ ＝ Ｒ ＋ int(レベル ÷ 20) 
		    if(i.getValueMap(f.right.exop,"魔力lv20")){d = d + Math.floor(c.lv/20);}
		    //[ソケットOP]魔力LV20
		    if(i.getSocket(f.right,"攻撃魔力lv")!=0)
		    	d += Math.floor(c.lv/i.getSocket(f.right,"攻撃魔力lv"));
		    //[武器のEXOPに魔力増加+2%がある時]　Ｒ ＝ Ｒ ＋ int(Ｒ × 0.02) 
		    if(i.getValueMap(f.right.exop,"魔力2%")){d = d + Math.floor(d*0.02);}
		    //[左手エンチャントOP]魔力増加
		    d += i.getValueMap(f.left.enchant,"魔力上昇");
		    //[左手ソケットOP]魔力LV20
		    if(i.getSocket(f.left,"攻撃魔力lv")!=0)
		    	d += Math.floor(c.lv/i.getSocket(f.left,"攻撃魔力lv"));
		    //[左手武器のEXOPに魔力増加+LV/20がある時]　Ｒ ＝ Ｒ ＋ int(レベル ÷ 20) 
		    if(i.getValueMap(f.left.exop,"魔力lv20")){d = d + Math.floor(c.lv/20);}
		    //[左手武器のEXOPに魔力増加+2%がある時]　Ｒ ＝ Ｒ ＋ int(Ｒ × 0.02) 
		    if(i.getValueMap(f.left.exop,"魔力2%")){d = d + Math.floor(d*0.02);}
		    //[アクセのEXOPに魔力増加+LV/20がある時]　Ｒ ＝ Ｒ ＋ int(レベル ÷ 20) 
		    if(i.getValueMap(f.neck.exop,"魔力lv20")){d = d + Math.floor(c.lv/20);}
		    //[アクセのEXOPに魔力増加+2%がある時]　Ｒ ＝ Ｒ ＋ int(Ｒ × 0.02)
		    if(i.getValueMap(f.neck.exop,"魔力2%")){d = d + Math.floor(d*0.02);}
		    
		    
		    if(min){//最小
		        d += i.getSocket(f.right,"最小攻撃魔力");//[ソケットOP]最小魔力
		        d += i.getSocket(f.left,"最小攻撃魔力");//[ソケットOP]最小魔力
		        //マスタースキル
//		        if(dat::mlvcount.min_magic)d += MLV.inf_min_magic[dat::mlvcount.min_magic];
//		        if(dat::mlvcount.min_attack_magic)d += MLV.inf_min_attack_magic[dat::mlvcount.min_attack_magic];
		    }else{//最大
		        d += i.getSocket(f.right,"最大攻撃魔力");//[ソケットOP]最小魔力
		        d += i.getSocket(f.left,"最大攻撃魔力");//[ソケットOP]最小魔力
		        //マスタースキル
//		        if(dat::mlvcount.max_magic)d += MLV.inf_max_magic[dat::mlvcount.max_magic];
//		        if(dat::mlvcount.max_attack_magic)d += MLV.inf_max_attack_magic[dat::mlvcount.max_attack_magic];
		    }
		    
		    var tmp_d:int = d;//スペルエンハンス用
		    
//		    d += Math.floor(d * setop_magicper/100);//[セットOP]Y = Y + int(Y * 魔力%);
		    
		    //スペルエンハンス
		    if(min)d += Math.floor(tmp_d * c.support_se/100);//20%上昇
		    //バーサーカー エナ/30
		    if(!min){d += Math.floor(c.ene/4 * c.support_berserker/100);}
		    else{d += Math.floor(c.ene/9 * c.support_berserker/100);}
		    
//		    d += etc_magic;//[かぼちゃ、サンタ]魔力増加
		    
		    return d;
		}
		private function calcMagicSkill(skill:Skill,cri:Boolean,exd:Boolean,min:Boolean):int{
		    var d:int = a.magic.max;
			if(min)d=a.magic.min;
			//後半ダメージ計算====================================================
		    //スキル攻撃力追加
			if(skill.skill[a.key.name] == "ヘルバースト"){//ヘルバースト
				d += 1320 + Math.floor(c.str/2);
			}else{//通常のスキル
			    if(min){d += skill.skill[a.key.power];}
			    else{d += Math.floor(skill.skill[a.key.power]*1.5);}
			}
//			if(f.job!="召喚師")d += c.op_skill;
		    //杖魔力%
		    d += Math.floor(d * i.getSpec(f.right,"magic")/100);
		    //[セットOP]スキル攻撃力
//		    if(c.job==5)d += c.op_skill;
		    //EXD
		    if(exd)d += Math.floor(d*0.2);
		    //[課金]魔力増加(バグ？)
//		    d += calc::etc_magic2;
		    
//		    if(cri)d += c.op_cri;//クリダメ増加
//		    if(exd)d += c.op_exd;//EXD増加
		    
		    //妙薬・A+・セラ
//		    d += c.op_miracle; 
		    	
			return d;
		}

//		private function calcDarkSpirit(c:MuChar):MuChar{
//			if(dat::d.f_left.f_kind.selectedLabel == "鷹"){
//				var plus:int = dat::d.f_left.f_op.selectedIndex + 1;//鷹のLV
//				var per:int = calc::weapon_pet + 100;
//				//フレイムハンド単体の最小攻撃力
//				c.darkspirit[0] = Math.floor(((plus*15) + Math.floor(c.rec/8) + 180) * per / 100);
//				//フレイムハンド単体の最大攻撃力
//				c.darkspirit[1] = Math.floor(((plus*15) + Math.floor(c.rec/4) + 200) * per / 100); 	
//				//フレイムハンド範囲の最小攻撃力
//				c.darkspirit[2] = Math.floor(((plus*10) + Math.floor(c.rec/12) + 120) * per / 100); 	
//				//フレイムハンド範囲の最大攻撃力
//				c.darkspirit[3] = Math.floor(((plus*10) + Math.floor(c.rec/6) + 133) * per / 100); 	
//				//鷹の攻撃成功率
//				c.darkspirit[4] = (plus*16) + 1000; 	
//				//鷹のLv(クリティカル率)
//				c.darkspirit[5] = plus; 
//			}
//			return c;
//		}
		private function calcCurse(min:Boolean):int{
			var d:int=0;
			//エナジー
			if(min)d += Math.floor(c.ene/9);
			else d += Math.floor(c.ene/4);
			//バーサーカー
		    if(!min){d += Math.floor(c.ene/4 * c.support_berserker/100);}
		    else{d += Math.floor(c.ene/9 * c.support_berserker/100);}
			//スケルトン変身
//			d += etc_noroi;
		    //[スケルトンパージドラゴン装備時] Y = int(Y * 1.2)
//		    if(c.skelton){d += Math.floor(d * 1.2);}
			//武器OP　羽OP
			d += i.getValueMap(f.left.option,"呪い") + i.getValueMap(f.wing.option,"呪い");
			
			return d;
		}
		private function calcCurseSkill(skill:Skill,cri:Boolean,exd:Boolean,min:Boolean):int{
			var d:int=a.curse.max;
			if(min)d=a.curse.min;
			if(f.job=="召喚師"){
				//スキル威力
				if(min)d += skill.skill[a.key.power];
				else d += Math.floor(skill.skill[a.key.power]*1.5);
				//呪い上昇%
				d += Math.floor(d * i.getSpec(f.left,"呪い")/100);
			    //[セットOPなど]スキル攻撃力
//			    d += c.op_skill;
			    //EXD
			    if(exd)d += Math.floor(d*0.2);
			    
//			    if(cri)d += c.op_cri;//クリダメ増加
//			    if(exd)d += c.op_exd;//EXD増加
			    
			    //妙薬・A+・セラ
//			    d += c.op_miracle;
			}
			return d;
		}
		private function calcPlasmaStorm(d:int,skill:Skill,cri:Boolean,exd:Boolean,min:Boolean):int{
			use namespace calc;
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
//		    if(exd)d += c.op_exd;//EXD増加
		    if(cri||exd){
		    	//クリダメ増加
		    	d += i.getSocket(f.right,"クリ増加");//ソケットOP
		    	d += i.getSocket(f.left,"クリ増加");//ソケットOP
		    	d += i.getValueMap(f.right.enchant,"Cダメ");//エンチャントOP
		    	d += i.getValueMap(f.left.enchant,"Cダメ");//エンチャントOP
		    	d += c.support_c;//C+
//		    	d += setop_cri;//クリダメ増加
		    }
		    
		    return d;
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
}