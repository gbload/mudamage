package Calc {
	import MuCalc.MuChar;
	/**
	 * 対人ダメージ計算
	 */
	public class DamageCalculator {
		/**
		 * 攻撃ダメージを計算します。
		 */
		public static function calcDamage(
				muc1:MuChar,
				muc2:MuChar,
				d:int,
				cri:Boolean=false,
				exd:Boolean=false):int{
			
			var d2:int = 0;
		    //[セットOP]両手武器装備時ダメージ増加%用
		    if(muc1.op_hands){
				d2 = calcGuard1(muc1,muc2,(d - muc1.op_miracle));
			    d2 = Math.max(d2,Math.floor((muc1.lv - muc1.add_lv)/10));//モンスDEF
			    d2 = calcGuard2(muc1,muc2,d2);
			    
			    d2 = Math.floor(d2 * muc1.op_hands / 100);
		    }
			
		    //ダメージ計算
			d = calcGuard1(muc1,muc2,d);
		    d = Math.max(d,Math.floor((muc1.lv - muc1.add_lv)/10));//モンスDEF
		    d = calcGuard2(muc1,muc2,d);
		    
		    //[セットOP]両手武器装備時ダメージ増加%
		    if(muc1.op_hands)d += d2;
		    //[課金アイテム]クリダメ増加%
		    if(cri)d += Math.floor(d * muc1.etc_cri / 100);
		    //[課金アイテム]EXDダメ増加%
		    if(exd)d += Math.floor(d * muc1.etc_exd / 100);
	
		    if(muc1.dinolunt[0])d += Math.floor(d*15/100);//ディノラント
		    if(muc1.satan)d += Math.floor(d*30/100);//サタン
		    
		    d += Math.floor(d * muc1.wing_inc/100);//羽
		    if(muc1.fenrir==2)d += Math.floor(d*10/100);//フェンリル
		    
		    //スキル%
		    if(muc1.now_skill[0] == "プラズマストーム"){
		    	d += Math.floor(d * 1.2);
			}else if(muc1.job == 0){//ナイトのとき
		    	d += Math.floor(d * Math.floor((100 + muc1.ene/10))/100);//スキル%
		    }else if(muc1.job == 4){//ダークロードのとき
		    	if(muc1.now_skill[5] == 5) d += Math.floor(d * Math.floor((100 + muc1.ene/25))/100);//スキル%
		    	else d += Math.floor(d * Math.floor((100 + muc1.ene/20))/100);//スキル%
		    }else if(muc1.job == 2){//エルフのとき TODO 乱れ打ちなどを特殊スキルに
		    	d += 0;//乱れ打ちとか　スキル%なし
		    }else if(muc1.job == 6){//レイジファイターのとき
		    	if(muc1.now_skill[5] == 10)//武器スキル、チェーンドライブ
		    		d += Math.floor(d * Math.floor((50 + muc1.vit/10))/100);//スキル%
		    	else if(muc1.now_skill[5] == 11)//ダークサイド
		    		d += Math.floor(d * Math.floor((100 + muc1.agi/8 + muc1.ene/10))/100);//スキル%
		    	else if(muc1.now_skill[5] == 12)//ドラゴンロアー
		    		d += Math.floor(d * Math.floor((50 + muc1.ene/10))/100);//スキル%
		    }else{
		    	d += d;//スキル200%
		    }
		    
		    //[セットOP]ダメージ増加
		    d += muc1.op_damage;
		    //コンボスキル
		    if(muc1.now_skill[5] == 7){
		    	d += Math.floor((muc1.str + muc1.agi + muc1.ene)/2);
		    }
		    
		    return d;
		}
		/**
		 * 魔法ダメージを計算します。
		 */
		public static function calcMagicDamage(
				muc1:MuChar,
				muc2:MuChar,
				d:int):int{
		    //ダメージ計算===========================
			d = calcGuard1(muc1,muc2,d);
		    d = Math.max(d,Math.floor((muc1.lv - muc1.add_lv)/10));//max[攻撃力-モンス,lv/10]
		    d = calcGuard2(muc1,muc2,d);
		    
		    if(muc1.dinolunt[0])d += Math.floor(d*15/100);//ディノラント
		    if(muc1.satan)d += Math.floor(d*30/100);//サタン
		    //[デーモン]
		    if(muc1.deamon){d += Math.floor(d * 0.4);}
		    d += Math.floor(d*muc1.wing_inc/100);
		    if(muc1.fenrir==2)d += Math.floor(d*10/100);//フェンリル
		    
		    //[セットOP]ダメージ増加
		    d += muc1.op_damage;
		    //サドゥンアイス
		    if(muc1.now_skill[5])d += muc1.now_skill[6];
		    
		    return d;
			
		}
		private static function calcDarkSpritDamage(
				muc1:MuChar,
				muc2:MuChar,
				d:int):int{
			d = calcGuard1(muc1,muc2,d);
			d = Math.max(d,Math.floor(muc1.darkspirit[5]/10));
			d = calcGuard2(muc1,muc2,d);
			return d;
		}
		/**
		 * 最低ダメ判定前の防御計算を行ないます。
		 */
		private static function calcGuard1(
				muc1:MuChar,
				muc2:MuChar,
				s:int):int{
			//引き算
			s = s - muc2.def/2;//(モンス攻撃 - DEF)
			s = s - muc2.support_g;//G+
			s = s - muc2.support_sera_g;//セラフィー
			//モンスターの攻撃力低下
			s -= Math.floor(s * muc2.support_weak/100);//ウイークネス
			//ダメ減加算
			var dec:int = 0;
			dec += muc2.guard_op_exop_dec * 4;//EXOPダメ減
			dec += muc2.guard_op_enop_dec;//エンチャントOPダメ減
			dec += muc2.guard_op_soop_dec;//ソケットOPダメ減
			s = s - Math.floor(s * dec/100);
			//カスリダメージ
//			if(avoided)
//				s = Math.floor(s * 30/100);//30%
			return s;
		}
		/**
		 * 最低ダメ判定後の防御計算を行ないます。
		 */
		private static function calcGuard2(
				muc1:MuChar,
				muc2:MuChar,
				s:int):int{
			//天使の吸収
			if(muc2.angel)s = (s * 80 / 100);//20%吸収
			//守護精霊の吸収
			if(muc2.spirit)s = (s * 70 / 100);//30%吸収
			//ディノラントの吸収
			if(muc2.dinolunt[0]){
				if(muc2.dinolunt[1]==3 || muc2.dinolunt[2]==3)s = (s * 85 / 100);//15%吸収
				else s = (s * 90 / 100);//10%吸収
			}
			//フェンリルの吸収
			if(muc2.fenrir==3)s = (s * 90/100);//10%吸収
			//ダークホースの吸収
			if(muc2.darkhorse)s = (s * (100 - Math.floor((15 + muc2.darkhorse/2))) /100);// 15+Lv/2
			//羽の吸収
			s = (s * (100 - muc2.wing_dec) / 100);
			//SBの減少
			s = s - Math.floor(s * muc2.support_sb/100);
			
			return s;
		}
	}
}
