package Calc {
	import mx.controls.*;
	import mx.containers.*;
	import mx.core.*;
	import mx.collections.*;
	import mx.events.*;
	import mx.formatters.*;
	import flash.events.*;

	import Form.MUDamage.SubForm.*;
	import Data.Database.*;
	import Data.Database.MLV.*;
	/**
	 * 対人ダメージ計算
	 */
	public class DamageCalculator {
		protected var f:Object;
		protected var i:ItemData;
		protected var c:CharacterData;
		protected var a:AttackData;
		private var m:Object;

		private static var mk:Object = D.getKey("monster");
		private static var nf:NumberFormatter = new NumberFormatter();
		
		protected static var affinity:Array = [
		    // 火、水、地、風、暗黒、無属性
		    [100,80,90,110,120,120],
		    [120,100,80,90,110,120],
		    [110,120,100,80,90,120],
		    [90,110,120,100,80,120],
		    [80,90,110,120,100,120]
		                                 ];
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
				exd:Boolean=false,
				min:Boolean=false):int{
			
			var d2:int = 0;
		    //[セットOP]両手武器装備時ダメージ増加%用
		    if(i.setop_hands){
				d2 = calcGuard1(d);
			    d2 = Math.max(d2,Math.floor(f.status.lv/10));//モンスDEF
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
		    if(f.pet.item=="フェンリル" && f.pet.sub1=="破壊")d += Math.floor(d*10/100);//フェンリル
		    /*
		     * 最終ダメージ後計算
		     */
		    d = calcGuard3(d);
		    d += calcAttribute(min);
		    
		    return d;
		}
		/**
		 * 魔法ダメージを計算します。
		 */
		public function calcMagicDamage(
				skill:Object,
				d:int,
				cri:Boolean=false,
				exd:Boolean=false,
				min:Boolean=false):int{
		    //ダメージ計算===========================
		    d += calcAttribute(min);
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
			d = calcGuard1Darkspirit(d);
			d = Math.max(d,Math.floor(f.left.darkspirit/10));
			d = calcGuard2(d);
			return d;
		}
		/**
		 * 最低ダメ判定前の防御計算を行ないます。
		 */
		protected function calcGuard1(s:int):int{
			var def:int = m[mk.def];
			/*
			 * 固定
			 */
		    if(f.support.iv_check.selected)// インナーベーション
		    	def -= SupportSkillCalculator.calcInnovation_Fixed(f.support);
		    /*
		     * 割合
		     */
			def -= Math.floor(def * c.support_inner/100);// インナーベーション
			def -= Math.floor(def * c.support_ba/100);// 血戦
			if(f.support.aminus_check.selected)// クリングブロー
				def -= Math.floor(def * SupportSkillCalculator.calcClingBlow(f.support)/100);
		    if(def < 0)def = 0;
			//引き算
			s = s - def;//(モンス攻撃 - DEF)
			//カスリダメージ
			if(c.hit < m[mk.avoid])
				s = Math.floor(s*0.3);
			return s;
		}
		/**
		 * 最低ダメ判定前の防御計算を行ないます。
		 */
		protected function calcGuard1Darkspirit(s:int):int{
			//引き算
			s = s - m[mk.def];//(モンス攻撃 - DEF)
			//カスリダメージ
			if(c.darkspirit_hit < m[mk.avoid])
				s = Math.floor(s*0.3);
			return s;
		}
		/**
		 * 最低ダメ判定後の防御計算を行ないます。
		 */
		protected function calcGuard2(s:int):int{
			return s;
		}
		/**
		 * 最終ダメ後の防御計算を行ないます。
		 */
		protected function calcGuard3(s:int):int{
			return s;
		}
		/**
		 * 被ダメージを計算します。
		 */
		public function calcSuffer(s:int):int{
			s = calcAttributeGuard(s);
			s = calcGuardCommon1(s,{f:f,i:i,c:c});
			s = calcAvoidance(s);
		    s = Math.max(s,Math.floor(m[mk.lv]/10));// 固定ダメ計算
			s = calcGuardCommon2(s,{f:f,i:i,c:c});
			return s;
		}
		/**
		 * カスリダメージ計算
		 */
		protected function calcAvoidance(s:int):int{
			if(m[mk.hit] != 0 && c.avoid > m[mk.hit])
				s = Math.floor(s * 30/100);//30%
			
			return s;
		}
		/**
		 * 共通:固定ダメージ前計算
		 */
		protected function calcGuardCommon1(s:int,muc:Object):int{
			var f:Object = muc.f;
			var i:ItemData = muc.i;
			var c:CharacterData = muc.c;
			
			s = s - c.def/2;//(モンス攻撃 - DEF)
			s = s - c.attribute_def;
			
			/*
			 * 固定
			 */
		    if(f.support.wn_check.selected)//ウィークネス
		    	s -= SupportSkillCalculator.calcWeakness_Fixed(f.support);
		    /*
		     * 割合
		     */
			//モンスターの攻撃力低下
			s -= Math.floor(s * c.support_weak/100);//ウイークネス
			if(f.support.gminus_check.selected)// クリングブロー
				s -= Math.floor(s * SupportSkillCalculator.calcBeastUpper(f.support)/100);
			
			// ダメ減
			var dec:int = 0;
			for each(var exop:Object in i.exops)
				if(exop["ダメ減"])
					dec += 4;
			dec += i.getEnchantProtects("ダメ減");
			s -= Math.floor(s*dec/100);
			
			return s;
		}
		/**
		 * 共通:固定ダメージ後計算
		 */
		protected function calcGuardCommon2(s:int,muc:Object):int{
			var f:Object = muc.f;
			var i:ItemData = muc.i;
			var c:CharacterData = muc.c;
		
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
			if(f.pet.item == "ダークホース")s = (s * (100 - Math.floor(15 + (f.pet.sub1_index+1)/2)) /100);// 15+Lv/2
			//羽の吸収
			s = (s * (100 - (i.getSpec(f.wing,"dec"))) / 100);
			//SBの減少
			s = s - Math.floor(s * c.support_sb/100);
			
			return s;
		}
		/**
		 * 属性ダメージ
		 */
		protected function calcAttribute(min:Boolean):int{
			var d:int = 0;
			if(c.attribute==5)return d;
			if(min)
				d += a.attribute.min;
			else
				d += a.attribute.max;
			// monster
			d += a.attribute_mon;
			// affinity
			d = Math.floor(d*(affinity[c.attribute][m[mk.attribute]] + a.attribute_affinity)/100);
			// guard
			d -= m[mk.def];
			// 最低ダメ設定
			if(min)
				d = Math.max(4, d);
			else
				d = Math.max(6, d);
			return d;
		}
		private function calcMonsterAttribute(min:Boolean):int{
			var d:int = 0;
			if(m[mk.attribute]==5)return d;
			if(min)
				d += m[mk.attribute_min];
			else
				d += m[mk.attribute_max];
			// affinity
			d = Math.floor(d*(affinity[m[mk.attribute]][c.attribute] + a.attribute_affinity)/100);
			return d;
		}
		protected function calcAttributeGuard(s:int):int{
			s = s - c.attribute_mon_def;
			return s;
		}
		/**
		 * ダメージを計算します。
		 */
		public function calcSkills():Array{
			var r:Array = new Array();
			//命中率計算
			var hit:Number = calcHit(c.hit);
			
			//ダメージ計算
			for(var n:String in a.skills){
				if(a.skills[n].skill[a.key.special]=="フレイムハンド"){
					r.push(calcDarkSpiritSkill(n));
				}else{
					if(m[mk.attribute_min]==0 || m[mk.attribute]!=5)
						r.push(calcSkill(n,hit));
					else
						for(var i:int=0;i<5;i++){
							m[mk.attribute] = i;
							r.push(calcSkill(n,hit));
						}
				}
			}
			// 被ダメージをスタック
			if(m!=null)
				if(m[mk.attribute_min]==0 || m[mk.attribute]!=5)
					r.push({minmax:calcSuffer(m[mk.min]+calcMonsterAttribute(true))
						+ "～" + calcSuffer(m[mk.max]+calcMonsterAttribute(false))});
				else
					for(i=0;i<5;i++){
						m[mk.attribute] = i;
						r.push({minmax:calcSuffer(m[mk.min]+calcMonsterAttribute(true))
							+ "～" + calcSuffer(m[mk.max]+calcMonsterAttribute(false))});
					}
			return r;
		}
		/**
		 * 各スキルのダメージ計算
		 */
		protected function calcSkill(n:String,hit:Number):ResultData{
			var data:ResultData = new ResultData();
			var data2:ResultData = new ResultData();
			data.skillname = a.skills[n].skill[a.key.name];
			data.hit_num = hit;
			data2.hit_num = 1;
			// damage calculation
			var func:Function = calcDamage;
			if(a.skills[n].skill[a.key.type]=="魔法"){
				func = calcMagicDamage;
			}
			data.min = func(a.skills[n],a.skills[n].min,false,false,true);
			data.max = func(a.skills[n],a.skills[n].max,false,false);
			data.cri = func(a.skills[n],a.skills[n].cri,true,false);
			data.exd = func(a.skills[n],a.skills[n].exd,false,true);
			// 防御無視計算
			var tmp:int = m[mk.def];
			m[mk.def] = 0;
			data2.min = func(a.skills[n],a.skills[n].min,false,false,true);
			data2.max = func(a.skills[n],a.skills[n].max,false,false);
			data2.cri = func(a.skills[n],a.skills[n].cri,true,false);
			data2.exd = func(a.skills[n],a.skills[n].exd,false,true);
			m[mk.def] = tmp;
			
			//1HIT当たりのダメージを計算
			data2.average = calcAverage(data2,a,c);//1hit当たりのダメージ
			data.average = calcAverage(data,a,c,data2);//1hit当たりのダメージ
			//1HITダメージ/秒
			data.averageper = calcAveragePerSecond(n,data,a);
			//1分当たりの攻撃回数を計算
			data.speed = calcSpeedPerMinute(n,a);
			//データの整形
			data.minmax = data.min + "〜" + data.max;
			nf.precision = 2; // 小数点以下2桁に設定
			data.hit = nf.format(hit*100) + "%";
			
			return data;
		}
		/**
		 * ダークスピリットのスキルダメージ計算
		 */
		protected function calcDarkSpiritSkill(n:String):ResultData{
			var data:ResultData = new ResultData();
			data.skillname = a.skills[n].skill[a.key.name];
			data.hit_num = calcHit(c.darkspirit_hit);
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
			nf.precision = 2; // 小数点以下2桁に設定
			data.hit = nf.format(data.hit_num*100) + "%";
			
			return data;
		}
		/**
		 * 命中率計算
		 * @param character data
		 * @param monster data
		 * @return hit
		 */
		protected function calcHit(c:int):Number{
			var hit:Number = 0;
			if(c < m[mk.avoid])
				hit = 0.05;
			else
				hit = 1.0 - (m[mk.avoid] / c);
			return hit;
		}
		/**
		 * 1hit当たりの平均ダメージ
		 * @param result data
		 * @param attack data
		 * @param character data
		 * @return average damage
		 */
		protected function calcAverage(data:ResultData,a:AttackData,c:CharacterData,data2:ResultData=null):int{
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
				if(data2!=null)
					hit1 = (hit1 * (1-c.ignore/100)) + (data2.average * (c.ignore/100));
			}
			hit1 *= data.hit_num;
			return hit1;
		}
		/**
		 * １秒当たりの1hit平均ダメージ
		 * @param result data
		 * @param attack data
		 * @return damage
		 */
		protected function calcAveragePerSecond(n:String,data:ResultData,a:AttackData):int{
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
		protected function calcSpeedPerMinute(n:String,a:AttackData):String{
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
	public var hit_num:Number = 0; //命中率
	public var hit_check:Boolean = false; //カスリダメージの有無
}
