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
			if(f.job=="ナイト")c.support_a = Math.floor(f.support.getValue(f.support.aplus) * 1.1);//A+
			else c.support_a = f.support.getValue(f.support.aplus);//A+
			if(f.job=="ナイト")c.support_g = Math.floor(f.support.getValue(f.support.gplus) * 1.1);//G+
			else c.support_g = f.support.getValue(f.support.aplus);//G+
			c.support_c = f.support.getValue(f.support.cplus);//C+
			c.support_sl = f.support.getValue(f.support.sl);//SL
			c.support_sb = f.support.getValue(f.support.sb);//SB
			if(f.support.getValue(f.support.sera))c.support_sera_a = Math.floor(f.status.lv/3) + 45;//セラ　攻撃力
			if(f.support.getValue(f.support.sera))c.support_sera_g = Math.floor(f.status.lv/5) + 50;//セラ　防御力
			if(f.support.getValue(f.support.se))c.support_se = 20;//スペルエンハンス
			if(f.support.getValue(f.support.ba))c.support_ba = 10;//BA
			c.support_inner = f.support.getValue(f.support.iv);//インナーベーション
			c.support_weak = f.support.getValue(f.support.wn);//ウイークネス
			if(f.support.getValue(f.support.ber))
				c.support_berserker = Math.floor(f.status.ene/30);//バーサーカー
			if(f.support.getValue(f.support.ht))
				c.support_vit = 16 + Math.ceil(f.status.ene/10);//体力上昇
			if(f.support.getValue(f.support.con))
				c.support_avoid = Math.min(Math.ceil(f.status.agi/3),200);//防御成功率上昇
			if(f.support.getValue(f.support.ig))
				c.support_ignore = Math.floor(f.status.ene/100);//敵の防御力無視
		}
		/**
		 * ステータスの計算
		 */
		private function calcStatus():void{
			c.add_str = i.setop_str + i.etc_str;
			c.add_agi = i.setop_agi + i.etc_agi;
			c.add_vit = i.setop_vit + i.etc_vit 
							+ i.getSocketProtects("体力増加") + c.support_vit;
			c.add_ene = i.setop_ene + i.etc_ene;
			c.add_rec = i.setop_rec + i.etc_rec + i.wing_rec;
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
			for(var n:Object in i.protects){
				// 防具のDEF
				c.def += i.getSpec(i.protects[n],"def");
				c.def += i.getValue(i.protects[n].option["防御"]);
				// シリーズのチェック
				if(n==0){
					check = (i.getItemData(i.protects[n],"series")) as String;
					min_lv = i.protects[n].plus;
				}else{
					if(check != i.getItemData(i.protects[n],"series"))
						check = "none";
					if(min_lv > i.protects[n].plus)
						min_lv = i.protects[n].plus;
				}
			}
			// 盾のDEF
			if(i.is_shield)
				c.def += i.getSpec(f.left,"def");
			// 羽のDEF
			c.def += i.getSpec(f.wing,"def");
			c.def += i.getValue(f.wing.option["防御"]);
			// ダークホースのDEF
			// 統一ボーナス
			if(check!="none")
				if(min_lv>9)
					c.def += Math.floor(c.def*((min_lv-9)*0.05));
			//MLVDEF
			//セットの盾装備時
//			if(shield_check)de += Math.floor(de*setop_shield/100);
			//ソケットの盾装備時
			if(i.is_shield)c.def += Math.floor(c.def*(i.getSocketProtects("盾装備時増加"))/100);
			//セットのDEF増加
//			de += setop_def;
			//ソケットのDEF増加
			c.def += i.getSocketProtects("防御力増加") * 2;
			//ボーナスソケットのDEF増加
//			de += sobonus_def * 2;
			//エンチャントのDEF増加
			c.def += i.getEnchantProtects("防御力上昇");
			//かぼちゃ、課金などのでDEF増加
//			de += etc_def * 2;
			//ペットによるDEF増加
			if(f.pet == "白と黒のポンガ")c.def += 100;//防御力+50 → DEF+100
			//ペットによるDEF増加
			if(f.pet == "白銀のアリオン")c.def += 100;//防御力+50 → DEF+100
			//バーサーカーによるDEF減少
			if(f.support.getValue(f.support.ber))
				c.def -= Math.floor(tmp * (50 - Math.floor(f.status.ene/45))/100);
		}
		/**
		 * 防御成功率の計算
		 */
		private function calcAvoid():void{
			var inc:int = D.getData("job_avoid")[f.job_index];
			// 敏捷
			c.avoid = c.agi/inc;
			// 盾の防御成功率
			if(i.is_shield){
				c.avoid += i.getSpec(f.left,"avoid");
				c.avoid += i.getValue(f.left.option["防御率"]);
			}
			// EXOP,ソケットOP
			for(var n:Object in i.protects){
				// EXOP
				if(i.protects[n].exop["防御成功"])
					c.avoid += Math.floor(c.avoid * 0.1);
				// ソケットOP
				c.avoid += Math.floor(c.avoid * i.getSocket(i.protects[n],"防御成功"));
			}
			var avoid_ori:int = c.avoid;
			// MasterSkill
//			c.avoid += 
			// サポートスキル、コンセントレーション
			c.avoid += c.support_avoid;
			// 統一ボーナス
			if(check!="none")c.avoid += Math.floor(avoid_ori * 0.1);//統一ボーナス
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
			c.hit = f.status.lv*inc[0] + Math.floor(c.agi/inc[1]) + Math.floor(c.str/inc[2]);
			if(f.job=="ダークロード")
				c.hit += c.rec/inc[3];
			// セットOP
			// ソケットOP
			c.hit += i.getSocketProtects("攻撃成功率");
			// MasterSkill
		}
		/**
		 * 対人攻撃成功率の計算
		 */
		private function calcPVPHit():void{
			var inc:Array = D.getData("job_pvp_hit")[f.job_index];
			// ステータス
			c.pvp_hit = Math.floor(f.status.lv*inc[0]) + Math.floor(c.agi/inc[1]);
			// エンチャントOP
			c.pvp_hit += i.getValue(f.right.enchant["対人攻撃率"]);
			c.pvp_hit += i.getValue(f.left.enchant["対人攻撃率"]);
			// MasterSkill
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
			// 追加体力
			c.life = c.add_vit * inc[1];//セットとソケットの体力＋
			//HP
			c.life += tmp;
			/*
			 * %の部分
			 */
			// SL
			c.life += Math.floor(tmp * c.support_sl/100);
			// EXOPの生命増加
			for(var n:Object in i.protects)
				if(i.protects[n].exop["生命増"])
					c.life += Math.floor(tmp * 4/100);
			// ソケットOPの生命増加
			c.life += Math.floor(tmp * i.getSocketProtects("最大生命増加")/100);
			/*
			 * 引き算の部分
			 */
			//バーサーカーのHP減少 基本HP * [40 - 純ene/60]%
			if(c.support_berserker)
				c.life -= Math.floor(tmp * ((40 - Math.floor(f.status.ene/60))/100));
			/*
			 * 足し算の部分
			 */
//			if(mlvcount.hp)hp += MLV.inf_hp[mlvcount.hp];//MLV
//			hp += setop_hp;//セットOPの生命
			c.life += i.getEnchantProtects("最大生命上昇");//エンチャントOPの生命
			c.life += i.getSocketBonusProtects("最大生命");//ボーナスソケットの生命増加
			c.life += i.wing_life;//羽の生命増加
			if(f.pet.item=="守護天使")c.life += 50;//天使の生命増加
			if(f.pet.item=="守護精霊")c.life += 50;//守護精霊の生命増加
//			hp += etc_hp;//かぼちゃ、課金などでのHP増加
			if(f.glove.op380)
				c.life += 200;//380OP
			if(f.pet.item=="フェンリル" && f.pet.sub1=="黄金")
				c.life += c.lv/2;//黄金のフェンリルの生命増加
		}
		/**
		 * マナの計算
		 */
		private function calcMana():void{
			var inc:Array = D.getData("job_mana")[f.job_index];
			var job_ene:int = D.getData("job_status")[f.job_index][3];
			// ステータス
			var tmp:int = inc[0] + (c.ene-job_ene)*inc[1] + (c.lv-1)*inc[2];
			// 追加エナジー
			c.mana += c.add_ene*inc[1];//セットのエナ＋
			//マナ
			c.mana += tmp;
			/*
			 * %増加部分
			 */
			// スウェルマナ
			// EXOPのマナ増加
			for(var n:Object in i.protects)
				if(i.protects[n].exop["マナ増"])
					c.mana += Math.floor(tmp * 4/100);//EXOPのマナ増加
			// ソケットOPのマナ増加
			c.mana += Math.floor(tmp * i.getSocketProtects("最大生命増加")/100);
			//バーサーカー [純ene/30]%
			if(c.support_berserker)
				c.mana += tmp - Math.floor(tmp * (100 - Math.floor(f.status.ene/30))/100);
			/*
			 * 足し算部分
			 */
//			mana += setop_mana;//セットOPのマナ＋
			c.mana += i.wing_mana;//羽
//			c.mana += etc_mana;//かぼちゃ、課金などでのマナ増加
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
//			if(mlvcount.sd)sd += MLV.inf_sd[mlvcount.sd];//MLV
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
//			if(mlvcount.ag)ag += MLV.inf_ag[mlvcount.ag];//MLV
//			ag += setop_ag;//セットOP
			c.ag += i.getEnchantProtects("最大AG上昇");//エンチャントOP
			c.ag += i.getSocketProtects("最大AG増加");//ソケットOP
			if(f.pet.item=="ディノラント")
				if(f.pet.sub1=="AG+50"||f.pet.sub2=="AG+50")
					c.ag += 50;
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
//			if(f.ring1==""){speed += 10;}//魔法師
//			if(etc_sake){speed += 20;}//酒
//			speed += etc_speed;//かぼちゃ、課金など
			if(f.pet.item=="デーモン"){speed += 10;}//デーモン
			if(f.pet.item=="スケルトンパージドラゴン"){speed += 10;}//スケルトンパージドラゴン
			
			// 適用
			c.speed += speed;
			c.magic_speed += speed;
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
//			exd += setop_exdper;//セットOPEXD
			// ソケットOP
			exd += i.getSocket(f.right,"EXD確率");
			exd += i.getSocket(f.left,"EXD確率");
			//クリ
			var cri:int = 0;
			var equips:Array = [f.wing,f.right,f.left,f.helm,f.armor,f.garter,f.glove,f.boots];
			// 装備の幸運
			for(var n:Object in equips)
				if(equips[n].luck)
					cri += 4;
//			cri += setop_criper;//セットOPクリ
			// ソケットOP
			exd += i.getSocket(f.right,"クリ確率");
			exd += i.getSocket(f.left,"クリ確率");
			
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
//			c.ignore += setop_ignore;//セットOP
			c.ignore += c.support_ignore;//レイジファイターバフ
			
			//ダブルダメージ
//			c.wd += setop_w;//セットOP
		}
		/**
		 * スキルの計算
		 */
		/*
		private function calcSkill():void{
			// 0 スキル名 1 スキル威力 2 速度[ms,検証] 3 魔法orスキル 4 属性ダメージ 5 特殊スキル 6 特殊係数
			//スキルを選択
			var skill:Array = dat::c.skill;
			var attribute:int = 0;//属性ダメージ
			var checknumber:int=0;
			var special:int=0;//特殊係数
			for each(var i:Array in skill)
				if(i[5][muc.job])//職確認
					if(i[4][0] <= muc.lv && i[4][1] <= muc.str && i[4][2] <= muc.agi
						&& i[4][3] <= muc.ene && i[4][4] <= muc.rec){//要求ステ確認
							//乗り物チェック
							if(muc.uniria || muc.dinolunt[0])checknumber=1;//ユニリア・ディノラント
							else if(muc.fenrir)checknumber=2;//フェンリル
							else if(muc.darkhorse)checknumber=3;//ダークホース
							else checknumber=0;//なし
							if(i[2][checknumber] == -1)continue;
							//ペット
							if(i[6]){
								if(i[6] == "ディノラント" && !muc.dinolunt[0])continue;//ディノラントの確認
								if(i[6] == "フェンリル" && !muc.fenrir)continue;//フェンリルの確認
								if(i[6] == "ダークホース" && !muc.darkhorse)continue;//ダークホースの確認
							}else if(i[7]){//武器S
								if(!((dat::d.f_right.f_kind.selectedLabel != "なし"//右手の有無
									&& i[0] == dat::d.f_right.f_item.selectedItem[8])//スキル名が一致するか
									||(dat::d.f_left.f_kind.selectedLabel != "なし"//左手の有無
									&& dat::d.f_left.f_item.selectedItem[0] == "武器"//左手が武器であるか
									&& i[0] == dat::d.f_left.f_item.selectedItem[8])))//スキル名が一致するか
									continue;
							}else if(i[9] == 4){//ダークスピリット
								if(dat::d.f_left.f_kind.selectedLabel != "鷹")continue;//鷹の有無
							}
							//スキルを追加
							//属性ダメージ計算
							attribute = 0;//初期化
							if(dat::d.f_neck.f_kind.selectedLabel == "セット"
								&& dat::d.f_neck.f_item.selectedItem[8] == i[8])//セットアイテム8番目の配列に属性、スキル8番目の配列に属性
								attribute +=5;//属性ダメージ＋5
							if(dat::d.f_ring1.f_kind.selectedLabel == "セット"
								&& dat::d.f_ring1.f_item.selectedItem[8] == i[8])//セットアイテム8番目の配列に属性、スキル8番目の配列に属性
								attribute +=5;//属性ダメージ＋5
							if(dat::d.f_ring2.f_kind.selectedLabel == "セット"
								&& dat::d.f_ring2.f_item.selectedItem[8] == i[8])//セットアイテム8番目の配列に属性、スキル8番目の配列に属性
								attribute +=5;//属性ダメージ＋5
							//特殊係数の追加
							special=0;
							//サドゥンアイス
							if(i[9] == 6 && dat::mlvcount.sudden_ice)
								special = 80 + 5 * dat::mlvcount.sudden_ice;
							muc.skill.push([i[0],i[1],i[2],i[3],attribute,i[9],special]);//スキルを追加
						}
			//スキル速度計算
			var check:Boolean=true;
			for each(i in muc.skill){
				//騎乗ペットの確認
				if(muc.uniria || muc.dinolunt[0])checknumber=1;//ユニリア・ディノラント
				else if(muc.fenrir)checknumber=2;//フェンリル
				else if(muc.darkhorse)checknumber=3;//ダークホース
				else checknumber=0;//なし
				//速度変化点
				var sp:Array=dat::c.speed[i[2][checknumber]];//速度変化点のデータを参照
				check=true;
				for(var k:int=sp.length - 1;k>=0;k--)
					if((i[3] == "スキル" && muc.speed >= sp[k][0]) || (i[3] == "魔法" && muc.magicspeed >= sp[k][0])){
						i[2] = [sp[k][1],sp[k][2]];
						check=false;
						break;
					}
				if(check)i[2] = [0,0];
			}
			//スキル強化
			var a:Array = [["トルネードクラッシュ",dat::mlvcount.tc,MLV.inf_tc]
							,["ゴッドブロー",dat::mlvcount.gb,MLV.inf_gb]
							,["オメガインパクト",dat::mlvcount.oi,MLV.inf_oi]
							,["ヘルファイア",dat::mlvcount.hell_fire,MLV.inf_hell_fire]
							,["ソウルジエンド",dat::mlvcount.soul_the_end,MLV.inf_soul_the_end]
							,["ソウルジエンド",dat::mlvcount.soul_the_end_ma,MLV.inf_soul_the_end_ma]
							,["サドゥンアイス",dat::mlvcount.sudden_ice,MLV.inf_sudden_ice]
							,["乱れ撃ち",dat::mlvcount.midareuti,MLV.inf_midareuti]
							,["パワースラッシュ",dat::mlvcount.ps,MLV.inf_ps]
							,["ブラッドアタック",dat::mlvcount.ba,MLV.inf_ba]
							,["シャイニングブラスト",dat::mlvcount.shining_blast,MLV.inf_shining_blast]
							,["トルネードクラッシュ",dat::mlvcount.tc_ma,MLV.inf_tc_ma]
							,["アースシェイク",dat::mlvcount.earth_shake,MLV.inf_earth_shake]
							,["ファイアバースト",dat::mlvcount.fb,MLV.inf_fb]
							,["ファイアスクリーム",dat::mlvcount.fs,MLV.inf_fs]
							,["チェーンライトニング",dat::mlvcount.chain,MLV.inf_chain]
							,["ライフドレイン",dat::mlvcount.life,MLV.inf_life]
							,["ライトニングショック",dat::mlvcount.light,MLV.inf_light]];
			for each(i in muc.skill)
				for each(var j:Array in a)
					if(j[1] && i[0] == j[0])i[1] += j[2][j[1]].skill;
		}
		*/
	}
}