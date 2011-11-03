package MuCalc
{
	import mx.controls.Alert;
	
	public class MLVcount
	{
		public function MLVcount()
		{
		}
		//変数*****************************************
		public var mlvpoint:int=0;
		//共通=========================================
		//防御向上
		public var pvpavoid:int = 0;
		public var poison_resist:int = 0;
		public var lightning_resist:int = 0;
		public var ice_resist:int = 0;
		public var def:int = 0;
		public var sd:int = 0;
		public var sd_heal:int = 0;
		//スキル強化
		public var hit:int = 0;
		public var hp:int = 0;
		public var ag:int = 0;
		//攻撃力向上
		public var pvphit:int = 0;
		public var monster_hp:int = 0;
		public var monster_mana:int = 0;
		public var monster_sd:int = 0;
		public var max_attack:int = 0;
		public var min_attack:int = 0;
		public var max_magic:int = 0;
		public var min_magic:int = 0;
		public var max_attack_magic:int = 0;
		public var min_attack_magic:int = 0;
		//成長・凡庸
		public var endurance1:int = 0;
		public var endurance2:int = 0;
		public var ah:int = 0;
		public var zen:int = 0;
		public var exp:int = 0;
		public var mana_dec:int = 0;
		public var pet_endurance:int = 0;
		//ナイト
		public var sl:int = 0;
		public var tc:int = 0;
		public var gb:int = 0;
		public var oi:int = 0;
		//ウィザード
		public var sb:int = 0;
		public var hell_fire:int = 0;
		public var soul_the_end:int = 0;
		public var sudden_ice:int = 0;
		//エルフ
		public var h:int = 0;
		public var midareuti:int = 0;
		public var g:int = 0;
		public var a:int = 0;
		//魔剣士
		public var tc_ma:int = 0;
		public var shining_blast:int = 0;
		public var soul_the_end_ma:int = 0;
		public var ba:int = 0;
		public var ps:int = 0;
		//ダークロード
		public var earth_shake:int = 0;
		public var fb:int = 0;
		public var fs:int = 0;
		//召喚師
		public var life:int = 0;
		public var sleep:int = 0;
		public var chain:int = 0;
		public var light:int = 0;
		//依存関係値 [LV,[依存するスキル],[影響を与えるスキル]]
		//共通=========================================
		//防御向上
		public var pvpavoid_d:Array = [1,[],[4,5,6]];
		public var poison_resist_d:Array = [2,[3],[7]];
		public var lightning_resist_d:Array = [2,[3],[7]];
		public var ice_resist_d:Array = [2,[3],[7]];
		public var def_d:Array = [3,[4,5,6],[29,30]];
		public var sd_d:Array = [4,[7],[]];
		public var sd_heal_d:Array = [4,[7],[]];
		//スキル強化
		public var hit_d:Array = [1,[],[21,23,24,2,28,47]];
		public var hp_d:Array = [3,[21,23,24,2,28,47],[37,38,39,40,41,42,43,44,45,49,50]];
		public var ag_d:Array = [3,[21,23,24,2,28,47],[37,38,39,40,41,42,43,44,45,49,50]];
		//攻撃力向上
		public var pvphit_d:Array = [1,[],[12,20,22,25,26,27,48]];
		public var monster_hp_d:Array = [2,[11],[13,14]];
		public var monster_mana_d:Array = [3,[12,20,22,25,26,27,48],[0,1,31,32,33,34,46]];
		public var monster_sd_d:Array = [3,[12,20,22,25,26,27,48],[0,1,31,32,33,34,46]];
		public var max_attack_d:Array = [4,[13,14],[]];
		public var min_attack_d:Array = [4,[13,14],[]];
		public var max_magic_d:Array = [4,[13,14],[]];
		public var min_magic_d:Array = [4,[13,14],[]];
		public var max_attack_magic_d:Array = [4,[13,14],[]];
		public var min_attack_magic_d:Array = [4,[13,14],[]];
		//成長・凡庸
		public var endurance1_d:Array = [1,[],[17,18]];
		public var endurance2_d:Array = [1,[],[17,18]];
		public var ah_d:Array = [2,[15,16],[19,36]];
		public var zen_d:Array = [2,[15,16],[19,36]];
		public var exp_d:Array = [3,[17,18],[35]];
		public var mana_dec_d:Array = [4,[19,36],[]];
		public var pet_endurance_d:Array = [3,[17,18],[35]];
		//ナイト
		public var sl_d:Array = [2,[11],[13,14]];
		public var tc_d:Array = [2,[8],[9,10]];
		public var gb_d:Array = [4,[9,10],[]];
		public var oi_d:Array = [4,[9,10],[]];
		//ウィザード
		public var sb_d:Array = [2,[11],[13,14]];
		public var hell_fire_d:Array = [2,[8],[9,10]];
		public var soul_the_end_d:Array = [4,[9,10],[]];
		public var sudden_ice_d:Array = [4,[9,10],[]];
		//エルフ
		public var h_d:Array = [2,[8],[9,10]];
		public var midareuti_d:Array = [2,[11],[13,14]];
		public var g_d:Array = [4,[9,10],[]];
		public var a_d:Array = [4,[9,10],[]];
		//魔剣士
		public var tc_ma_d:Array = [2,[8],[9,10]];
		public var shining_blast_d:Array = [2,[11],[13,14]];
		public var soul_the_end_ma_d:Array = [4,[13,14],[]];
		public var ba_d:Array = [4,[9,10],[]];
		public var ps_d:Array = [4,[9,10],[]];
		//ダークロード
		public var earth_shake_d:Array = [2,[11],[13,14]];
		public var fb_d:Array = [2,[8],[9,10]];
		public var fs_d:Array = [4,[9,10],[]];
		//召喚士
		public var life_d:Array = [2,[8],[9,10]];
		public var sleep_d:Array = [2,[11],[13,14]];
		public var chain_d:Array = [4,[9,10],[]];
		public var light_d:Array = [4,[9,10],[]];
		//関数================================================================
		public function getMLVPoint(mlv:int):int{
			var rank:int = 0;//スキルのLV
			var skill:int = 0;//スキルの値
			var add_point:int = 0;//追加ポイント
			mlvpoint = mlv;
			for(var i:int=0;i<=MLV.num;i++){
				rank = getD(i)[0];
				skill = getSkill(i);
				add_point = (skill - (5 - (rank - 1)));
				if(add_point < 0)add_point=0;
				mlvpoint -= skill + add_point;
			}
			return mlvpoint;
		}
		private function getD(i:int):Array{
			var depend:Array;
			//依存関係変数を選択
			if(i==0)depend = max_attack_magic_d;
			else if(i==1)depend = min_attack_magic_d;
			else if(i==2)depend = tc_ma_d;
			else if(i==3)depend = pvpavoid_d;
			else if(i==4)depend = poison_resist_d;
			else if(i==5)depend = lightning_resist_d;
			else if(i==6)depend = ice_resist_d;
			else if(i==7)depend = def_d;
			else if(i==8)depend = hit_d;
			else if(i==9)depend = hp_d;
			else if(i==10)depend = ag_d;
			else if(i==11)depend = pvphit_d;
			else if(i==12)depend = monster_hp_d;
			else if(i==13)depend = monster_mana_d;
			else if(i==14)depend = monster_sd_d;
			else if(i==15)depend = endurance1_d;
			else if(i==16)depend = endurance2_d;
			else if(i==17)depend = ah_d;
			else if(i==18)depend = zen_d;
			else if(i==19)depend = exp_d;
			else if(i==20)depend = sl_d;
			else if(i==21)depend = tc_d;
			else if(i==22)depend = sb_d;
			else if(i==23)depend = hell_fire_d;
			else if(i==24)depend = h_d;
			else if(i==25)depend = midareuti_d;
			else if(i==26)depend = shining_blast_d;
			else if(i==27)depend = earth_shake_d;
			else if(i==28)depend = fb_d;
			else if(i==29)depend = sd_d;
			else if(i==30)depend = sd_heal_d;
			else if(i==31)depend = max_attack_d;
			else if(i==32)depend = min_attack_d;
			else if(i==33)depend = max_magic_d;
			else if(i==34)depend = min_magic_d;
			else if(i==35)depend = mana_dec_d;
			else if(i==36)depend = pet_endurance_d;
			else if(i==37)depend = gb_d;
			else if(i==38)depend = oi_d;
			else if(i==39)depend = soul_the_end_d;
			else if(i==40)depend = sudden_ice_d;
			else if(i==41)depend = g_d;
			else if(i==42)depend = a_d;
			else if(i==43)depend = ba_d;
			else if(i==44)depend = ps_d;
			else if(i==45)depend = fs_d;
			else if(i==46)depend = soul_the_end_ma_d;
			else if(i==47)depend = life_d;
			else if(i==48)depend = sleep_d;
			else if(i==49)depend = chain_d;
			else if(i==50)depend = light_d;
			return depend;
		}
		public function getSkill(i:int):int{
			//スキルカウントを返す
			if(i==0)return max_attack_magic;
			else if(i==1)return min_attack_magic;
			else if(i==2)return tc_ma;
			else if(i==3)return pvpavoid;
			else if(i==4)return poison_resist;
			else if(i==5)return lightning_resist;
			else if(i==6)return ice_resist;
			else if(i==7)return def;
			else if(i==8)return hit;
			else if(i==9)return hp;
			else if(i==10)return ag;
			else if(i==11)return pvphit;
			else if(i==12)return monster_hp;
			else if(i==13)return monster_mana;
			else if(i==14)return monster_sd;
			else if(i==15)return endurance1;
			else if(i==16)return endurance2;
			else if(i==17)return ah;
			else if(i==18)return zen;
			else if(i==19)return exp;
			else if(i==20)return sl;
			else if(i==21)return tc;
			else if(i==22)return sb;
			else if(i==23)return hell_fire;
			else if(i==24)return h;
			else if(i==25)return midareuti;
			else if(i==26)return shining_blast;
			else if(i==27)return earth_shake;
			else if(i==28)return fb;
			else if(i==29)return sd;
			else if(i==30)return sd_heal;
			else if(i==31)return max_attack;
			else if(i==32)return min_attack;
			else if(i==33)return max_magic;
			else if(i==34)return min_magic;
			else if(i==35)return mana_dec;
			else if(i==36)return pet_endurance;
			else if(i==37)return gb;
			else if(i==38)return oi;
			else if(i==39)return soul_the_end;
			else if(i==40)return sudden_ice;
			else if(i==41)return g;
			else if(i==42)return a;
			else if(i==43)return ba;
			else if(i==44)return ps;
			else if(i==45)return fs;
			else if(i==46)return soul_the_end_ma;
			else if(i==47)return life;
			else if(i==48)return sleep;
			else if(i==49)return chain;
			else if(i==50)return light;
			return 0;
		}
		private function getDepend(i:int):Boolean{
			var depend:Array = getD(i);
			var bool:Boolean = false;
			var point:int = 0;
			var rank:int = 0;
			var skill:int = 0;
			var add_point:int = 0;
			//依存関係を求める
			if(depend[1].length > 0){
				for each(var j:int in depend[1]){
					/*
					if(getSkill(j) == 5){//MAXの場合
						bool = true;
						break;
					}
					*/
					rank = getD(j)[0];
					skill = getSkill(j);
					add_point = (skill - (5 - (rank - 1)));
					if(add_point < 0)add_point=0;
					point += skill + add_point;
				}
				if(point >= 4+rank)bool = true;
			}else bool = true;//依存するものがない場合
			return bool;
		}
		private function setEffect(i:int):void{
			//影響のあるスキルを全て0にする。
			var depend:Array = getD(i);
			for each(var j:int in depend[2]){
				setSkill2(j,0);
				if(depend[2].length > 0 && !getDepend(depend[2][0]))//影響を与えるものがあり、かつ依存するものがなくなる場合
					setEffect(j);
				//if(getSkill(j)==5)setEffect(j);
			}
		}
		public function setSkill(i:int,count:int):Boolean{
			if(count > 5) count = 5;//値の調整
			if(count < 0) count = 0;
			//依存関係のチェック
			if(!getDepend(i))return false;
			//影響用の一時変数
			var once:int = getSkill(i);
			//スキルLVをセット
			setSkill2(i,count);
			//影響のチェック
			//if(once==5 && count<5){//MAXでなくなるので、後ろを全部0にする
				var depend:Array = getD(i);
				if(depend[2].length > 0 && !getDepend(depend[2][0]))//影響を与えるものがあり、かつ依存するものがなくなる場合
					setEffect(i);
			//}
			return true;
		}
		public function setSkill2(i:int,count:int):void{
			//スキルカウントを返す
			if(i==0) max_attack_magic = count;
			else if(i==1) min_attack_magic = count;
			else if(i==2) tc_ma = count;
			else if(i==3) pvpavoid = count;
			else if(i==4) poison_resist = count;
			else if(i==5) lightning_resist = count;
			else if(i==6) ice_resist = count;
			else if(i==7) def = count;
			else if(i==8) hit = count;
			else if(i==9) hp = count;
			else if(i==10) ag = count;
			else if(i==11) pvphit = count;
			else if(i==12) monster_hp = count;
			else if(i==13) monster_mana = count;
			else if(i==14) monster_sd = count;
			else if(i==15) endurance1 = count;
			else if(i==16) endurance2 = count;
			else if(i==17) ah = count;
			else if(i==18) zen = count;
			else if(i==19) exp = count;
			else if(i==20) sl = count;
			else if(i==21) tc = count;
			else if(i==22) sb = count;
			else if(i==23) hell_fire = count;
			else if(i==24) h = count;
			else if(i==25) midareuti = count;
			else if(i==26) shining_blast = count;
			else if(i==27) earth_shake = count;
			else if(i==28) fb = count;
			else if(i==29) sd = count;
			else if(i==30) sd_heal = count;
			else if(i==31) max_attack = count;
			else if(i==32) min_attack = count;
			else if(i==33) max_magic = count;
			else if(i==34) min_magic = count;
			else if(i==35) mana_dec = count;
			else if(i==36) pet_endurance = count;
			else if(i==37) gb = count;
			else if(i==38) oi = count;
			else if(i==39) soul_the_end = count;
			else if(i==40) sudden_ice = count;
			else if(i==41) g = count;
			else if(i==42) a = count;
			else if(i==43) ba = count;
			else if(i==44) ps = count;
			else if(i==45) fs = count;
			else if(i==46) soul_the_end_ma = count;
			else if(i==47) life = count;
			else if(i==48) sleep = count;
			else if(i==49) chain = count;
			else if(i==50) light = count;
		}
	}
}