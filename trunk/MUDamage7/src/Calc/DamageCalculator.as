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
	 * 対人ダメージ計算
	 */
	public class DamageCalculator {
		private var f:Object;
		private var i:ItemData;
		private var c:CharacterData;
		private var a:AttackData;
		private var m:Object;

		private static var mk:Object = D.getKey("monster");
		/**
		 * コンストラクタ
		 */
		public function DamageCalculator(muc:Object){
			this.f = muc.f;
			this.i = muc.i;
			this.c = muc.c;
			this.a = muc.a;
		}
		/**
		 * モンスター登録
		 */
		public function setMonster(m:Object):void{
			this.m = m;
		}
		/**
		 * 攻撃ダメージを計算します。
		 */
		public function calcDamage(
				skill:Object,
				d:int,
				cri:Boolean=false,
				exd:Boolean=false):int{
			
			var d2:int = 0;
		    //[セットOP]両手武器装備時ダメージ増加%用
		    if(i.setop_hands){
				d2 = calcGuard1(d);
			    d2 = Math.max(d2,Math.floor(f.status.lv/10));//モンスDEF
			    d2 = calcGuard2(d2);
			    // 両手武器装備時ダメージ増加%用
			    d2 = Math.floor(d2 * i.setop_hands / 100);
		    }
			
		    //追加攻撃力(A+等)
		    d += a.add;
		    
		    /* 
		     * 固定ダメージ前計算
		     */
			d = calcGuard1(d);
			/*
			 * 固定ダメージ判断
			 */
		    d = Math.max(d,Math.floor(f.status.lv/10));//モンスDEF
		    
		    //[セットOP]両手武器装備時ダメージ増加%
		    if(i.setop_hands)d += d2;
		    //[課金アイテム]クリダメ増加%
		    if(cri)d += Math.floor(d * i.etc_cri / 100);
		    //[課金アイテム]EXDダメ増加%
		    if(exd)d += Math.floor(d * i.etc_exd / 100);
	
		    if(f.pet.item=="ディノラント")d += Math.floor(d*15/100);//ディノラント
		    if(f.pet.item=="サタン")d += Math.floor(d*30/100);//サタン
		    
		    d += Math.floor(d * i.getSpec(f.wing,"inc")/100);//羽
		    if(f.pet.item=="フェンリル" && f.pet.sub1=="破壊")d += Math.floor(d*10/100);//フェンリル
		    
		    //スキル%
		    if(skill.skill[a.key.name] == "プラズマストーム"){
		    	d += Math.floor(d * 1.2);
			}else if(f.job == "ナイト"){//ナイトのとき
		    	d += Math.floor(d * Math.floor((100 + c.ene/10))/100);//スキル%
		    }else if(f.job == "ダークロード"){//ダークロードのとき
		    	if(skill.skill[a.key.name] == "カオティックディセイアー") d += Math.floor(d * Math.floor((100 + c.ene/25))/100);//スキル%
		    	else d += Math.floor(d * Math.floor((100 + c.ene/20))/100);//スキル%
		    }else if(f.job == "エルフ"){//エルフのとき TODO 乱れ打ちなどを特殊スキルに
		    	d += 0;//乱れ打ちとか　スキル%なし
		    }else if(f.job == "レイジファイター"){//レイジファイターのとき
		    	if(skill.skill[a.key.special] == "近接")//武器スキル、チェーンドライブ
		    		d = Math.floor(d * Math.floor((50 + c.vit/10))/100);//スキル%
		    	else if(skill.skill[a.key.special] == "広域")//ダークサイド
		    		d = Math.floor(d * Math.floor((100 + c.agi/8 + c.ene/10))/100);//スキル%
		    	else if(skill.skill[a.key.special] == "連続")//ドラゴンロアー
		    		d = Math.floor(d * Math.floor((50 + c.ene/10))/100);//スキル%
		    }else{
		    	d += d;//スキル200%
		    }
		    
		    /*
		     * 固定ダメージ後計算
		     */
		    d = calcGuard2(d);
		    
		    //[セットOP]ダメージ増加
		    d += i.setop_damage;
		    //コンボスキル
		    if(skill.skill[a.key.special] == "コンボ"){
		    	d += Math.floor((c.str + c.agi + c.ene)/2);
		    }
		    
		    return d;
		}
		/**
		 * 魔法ダメージを計算します。
		 */
		public function calcMagicDamage(
				skill:Object,
				d:int,
				cri:Boolean=false,
				exd:Boolean=false):int{
		    //ダメージ計算===========================
			d = calcGuard1(d);
		    d = Math.max(d,Math.floor(f.status.lv/10));//max[攻撃力-モンス,lv/10]
		    
		    if(f.pet.item=="ディノラント")d += Math.floor(d*15/100);//ディノラント
		    if(f.pet.item=="サタン")d += Math.floor(d*30/100);//サタン

		    d += Math.floor(d*i.getSpec(f.wing,"inc")/100);//羽
		    if(f.pet.item=="フェンリル" && f.pet.sub1=="破壊")d += Math.floor(d*10/100);//フェンリル
		    
		    //[課金アイテム]クリダメ増加%
		    if(cri)d += Math.floor(d * i.etc_cri / 100);
		    //[課金アイテム]EXDダメ増加%
		    if(exd)d += Math.floor(d * i.etc_exd / 100);

		    //[固定ダメージ]
		    d = calcGuard2(d);
		    
		    //[セットOP]ダメージ増加
		    d += i.setop_damage;

		    return d;
			
		}
		public function calcDarkSpiritDamage(
				skill:Object,
				d:int,
				cri:Boolean=false,
				exd:Boolean=false):int{
			d = calcGuard1(d);
			d = Math.max(d,Math.floor(f.left.darkspirit/10));
			d = calcGuard2(d);
			return d;
		}
		/**
		 * 最低ダメ判定前の防御計算を行ないます。
		 */
		private function calcGuard1(s:int):int{
			//引き算
			s = s - m[mk.def];//(モンス攻撃 - DEF)
			return s;
		}
		/**
		 * 最低ダメ判定後の防御計算を行ないます。
		 */
		private function calcGuard2(s:int):int{
//			//天使の吸収
//			if(muc2.angel)s = (s * 80 / 100);//20%吸収
//			//守護精霊の吸収
//			if(muc2.spirit)s = (s * 70 / 100);//30%吸収
//			//ディノラントの吸収
//			if(muc2.dinolunt[0]){
//				if(muc2.dinolunt[1]==3 || muc2.dinolunt[2]==3)s = (s * 85 / 100);//15%吸収
//				else s = (s * 90 / 100);//10%吸収
//			}
//			//フェンリルの吸収
//			if(muc2.fenrir==3)s = (s * 90/100);//10%吸収
//			//ダークホースの吸収
//			if(muc2.darkhorse)s = (s * (100 - Math.floor((15 + muc2.darkhorse/2))) /100);// 15+Lv/2
//			//羽の吸収
//			s = (s * (100 - muc2.wing_dec) / 100);
//			//SBの減少
//			s = s - Math.floor(s * muc2.support_sb/100);
//			
			return s;
		}
		/**
		 * 被ダメージを計算します。
		 */
		public function calcSuffer(s:int):int{
			s = s - c.def/2;//(モンス攻撃 - DEF)
			
			// ダメ減
			var dec:int = 0;
			for each(var exop:Object in i.exops)
				if(exop["ダメ減"])
					dec += 4;
			dec += i.getEnchantProtects("ダメ減");
			s -= Math.floor(s*dec/100);
			
			// 固定ダメ計算
		    s = Math.max(s,Math.floor(m[mk.lv]/10));
			
		    //天使の吸収
			if(f.pet.item == "守護天使")s = (s * 80 / 100);//20%吸収
			//守護精霊の吸収
			if(f.pet.item == "守護精霊")s = (s * 70 / 100);//30%吸収
			//ディノラントの吸収
			if(f.pet.item == "ディノラント"){
				if(f.pet.sub1 == "ダメージ吸収+5%" || f.pet.sub2 == "ダメージ吸収+5%")
					s = (s * 85 / 100);//15%吸収
				else s = (s * 90 / 100);//10%吸収
			}
			//フェンリルの吸収
			if(f.pet.item == "フェンリル" && f.pet.sub1 == "守護")s = (s * 90/100);//10%吸収
			//ダークホースの吸収
			if(f.pet.item == "ダークホース")s = (s * (100 - Math.floor(15 + (f.pet.sub1_index+1)) /100);// 15+Lv/2
			//羽の吸収
			s = (s * (100 - c.wing_dec) / 100);
			//SBの減少
			s = s - Math.floor(s * c.support_sb/100);
			
			return s;
		}
		/**
		 * ダメージを計算します。
		 */
		public function calcSkills():Array{
			var r:Array = new Array();
			//命中率計算
			var hit:int = calcHit(c.hit);
			
			//ダメージ計算
			for(var n:String in a.skills){
//				var data:ResultData = new ResultData();
//				data.skillname = a.skills[n].skill[a.key.name];
//				data.hit_num = hit;
//				data.hit_check = isHit(c,m);
//				// damage calculation
//				var func:Function = calcDamage;
//				if(a.skills[n].skill[a.key.special]=="フレイムハンド"){
//					func = calcDarkSpiritDamage;
//				}else if(a.skills[n].skill[a.key.type]=="魔法"){
//					func = calcMagicDamage;
//				}
//				data.min = func(a.skills[n],a.skills[n].min,false,false);
//				data.max = func(a.skills[n],a.skills[n].max,false,false);
//				data.cri = func(a.skills[n],a.skills[n].cri,true,false);
//				data.exd = func(a.skills[n],a.skills[n].exd,false,true);
//				//1HIT当たりのダメージを計算
//				data.average = calcAverage(data,a,c);//1hit当たりのダメージ
//				//1HITダメージ/秒
//				data.averageper = calcAveragePerSecond(n,data,a);
//				//1分当たりの攻撃回数を計算
//				data.speed = calcSpeedPerMinute(n,a);
//				//データの整形
//				data.minmax = data.min + "〜" + data.max;
//				data.hit = (hit*100) + "%";
//				
//				//計算結果をスタック
//				r.push(data);
				if(a.skills[n].skill[a.key.special]=="フレイムハンド"){
					r.push(calcDarkSpiritSkill(n));
				}else{
					r.push(calcSkill(n,hit));
				}
			}
			// 被ダメージをスタック
			r.push({minmax:calcSuffer(m[mk.min]) + "～" + calcSuffer(m[mk.max])});
			return r;
		}
		/**
		 * 各スキルのダメージ計算
		 */
		private function calcSkill(n:String,hit:int):ResultData{
			var data:ResultData = new ResultData();
			data.skillname = a.skills[n].skill[a.key.name];
			data.hit_num = hit;
			data.hit_check = isHit(c.hit);
			// damage calculation
			var func:Function = calcDamage;
			if(a.skills[n].skill[a.key.type]=="魔法"){
				func = calcMagicDamage;
			}
			data.min = func(a.skills[n],a.skills[n].min,false,false);
			data.max = func(a.skills[n],a.skills[n].max,false,false);
			data.cri = func(a.skills[n],a.skills[n].cri,true,false);
			data.exd = func(a.skills[n],a.skills[n].exd,false,true);
			//1HIT当たりのダメージを計算
			data.average = calcAverage(data,a,c);//1hit当たりのダメージ
			//1HITダメージ/秒
			data.averageper = calcAveragePerSecond(n,data,a);
			//1分当たりの攻撃回数を計算
			data.speed = calcSpeedPerMinute(n,a);
			//データの整形
			data.minmax = data.min + "〜" + data.max;
			data.hit = (hit*100) + "%";
			
			return data;
		}
		/**
		 * ダークスピリットのスキルダメージ計算
		 */
		private function calcDarkSpiritSkill(n:String):ResultData{
			var data:ResultData = new ResultData();
			data.skillname = a.skills[n].skill[a.key.name];
			data.hit_num = calcHit(c.darkspirit_hit);
			data.hit_check = isHit(c.darkspirit_hit);
			// damage calculation
			var func:Function = calcDarkSpiritDamage;
			
			data.min = func(a.skills[n],a.skills[n].min,false,false);
			data.max = func(a.skills[n],a.skills[n].max,false,false);
			data.cri = func(a.skills[n],a.skills[n].cri,true,false);
			data.exd = func(a.skills[n],a.skills[n].exd,false,true);
			//1HIT当たりのダメージを計算
			data.average = calcAverage(data,a,c);//1hit当たりのダメージ
			//1HITダメージ/秒
			data.averageper = calcAveragePerSecond(n,data,a);
			//1分当たりの攻撃回数を計算
			data.speed = calcSpeedPerMinute(n,a);
			//データの整形
			data.minmax = data.min + "〜" + data.max;
			data.hit = (data.hit_num*100) + "%";
			
			return data;
		}
		/**
		 * 命中率計算
		 * @param character data
		 * @param monster data
		 * @return hit
		 */
		private function calcHit(c:int):int{
			var hit:int = 0;
			if(c < m[mk.avoid])
				hit = 0.05;
			else
				hit = 1 - (m[mk.avoid] / c);
			return hit;
		}
		/**
		 * カスリダメージの有無
		 * @param character data
		 * @param monster data
		 * @return カスリダメージの場合、true
		 */
		private function isHit(c:int):Boolean {
			return (c < m[mk.avoid]);
		}
		/**
		 * 1hit当たりの平均ダメージ
		 * @param result data
		 * @param attack data
		 * @param character data
		 * @return average damage
		 */
		private function calcAverage(data:ResultData,a:AttackData,c:CharacterData):int{
			var hit1:int=0;//1hit当たりのダメージ
			if(data.skillname == "フレイムハンド(単体)"){//ダークスピリット
				hit1 += data.exd * c.darkspirit_exd_per/100;//EXD
				hit1 += data.cri * c.darkspirit_cri_per/10000;//クリティカル率
				hit1 += ((data.min + data.max)/2) * c.darkspirit_normal / 10000;//通常
			}else if(data.skillname == "フレイムハンド(範囲)"){//フレイムハンド範囲
				//クリティカル確率0%
				hit1 += ((data.min + data.max)/2);//通常
			}else{//通常
				hit1 += data.exd * c.exd / 100;//EXD
				hit1 += data.cri * c.cri / 10000;//クリ
				hit1 += ((data.min + data.max)/2) * c.normal / 10000;//通常
				hit1 += hit1 * c.wd/100;//WD
			}
			// 命中率計算
			if(data.hit_check)
				hit1 *= 0.3;
			hit1 *= data.hit_num;
			return hit1;
		}
		/**
		 * １秒当たりの1hit平均ダメージ
		 * @param result data
		 * @param attack data
		 * @return damage
		 */
		private function calcAveragePerSecond(n:String,data:ResultData,a:AttackData):int{
			var second:int=0;
			if(a.skills[n].speed[0])second = data.average * 1000/a.skills[n].speed[0];
			else second = 0;
			return second;
		}
		/**
		 * １分当たりの攻撃回数
		 * @param attack data
		 * @return attack count
		 */
		private function calcSpeedPerMinute(n:String,a:AttackData):String{
			var minute:String;
			if(!a.skills[n].speed[0])minute="0";//0だった場合
			else minute = (Math.floor(600000/a.skills[n].speed[0])/10).toString();//攻撃回数計算
			if(!a.skills[n].speed[0] || a.skills[n].speed[1]==0)minute += "?";//不明又は未検証の場合
			return minute;
		}
	}
}
class ResultData{
	/**
	 * 表示用
	 */
	public var skillname:String = ""; //スキル名
	public var averageper:int = 0; //1秒当たりの1hitダメージ
	public var speed:String = ""; //１分当たりの攻撃回数
	public var average:int = 0; //1hit当たりの平均ダメージ
	public var minmax:String = ""; //最小最大ダメージ
	public var hit:String = ""; //命中率
	public var cri:int = 0; //クリティカルダメージ
	public var exd:int = 0; //エクセレントダメージ
	/**
	 * 計算用
	 */
	public var min:int = 0; //最小ダメージ
	public var max:int = 0; //最大ダメージ
	public var hit_num:int = 0; //命中率
	public var hit_check:Boolean = false; //カスリダメージの有無
}
