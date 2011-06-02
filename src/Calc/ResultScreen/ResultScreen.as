package Calc.ResultScreen {
	import MuCalc.MuChar;
	
	import mx.containers.*;
	import mx.controls.*;
	import mx.core.*;
	import flash.events.*;
	/**
	 * PVPダメージ計算の結果を表示する画面
	 */
	public class ResultScreen extends Form {
		private var muc1:MuChar;
		private var muc2:MuChar;
		
		/**
		 * コンストラクタ
		 */
		public function PVPResultScreen(muc1:MuChar, muc2:MuChar) {
			super();
			this.muc1 = muc1;
			this.muc2 = muc2;
			
			init();
		}
		/**
		 * 初期化
		 */
		private function init():void{
			// 閉じるボタン
			this.addChild(createCloseButton());
			
			// キャラクターステータス表示
			this.addChild(new PVPCharacterScreen(muc1));
			// ダメージ一覧Gridを表示
			this.addChild(new PVPDamageGrid(calcSkills(muc1,muc2)));
			
			// キャラクターステータス表示
			this.addChild(new PVPCharacterScreen(muc2));
			// ダメージ一覧Gridを表示
			this.addChild(new PVPDamageGrid(calcSkills(muc2,muc1)));
		}
		/**
		 * 閉じるボタン
		 */
		private function createCloseButton():Button{
			var button:Button = new Button();
			button.label = "閉じる";
			//button.name = click::tabindex.toString();
			var container:Container = this;
			button.addEventListener(MouseEvent.CLICK,
					function(event:Event):void{
						container.parent.removeChild(container);
					});
			
			return button;
		}
		/**
		 * ダメージを計算します。
		 */
		private function calcSkills(muc1:MuChar, muc2:MuChar):Array{
			var a:Array = new Array();
			//命中率計算
			var hit:int=0;
		
			var tmp_hit1:int = muc1.pvphit * muc1.lv;
			var tmp_hit2:int = muc2.pvphit * muc2.lv;
		
			hit = (tmp_hit1 / (tmp_hit1 + tmp_hit2))*100;
			
			//ダメージ計算
			var hit1array:Array = new Array();
			var minutearray:Array = new Array();
			//変数
			var r_min:int = 0;
			var l_min:int = 0;
			var r_max:int = 0;
			var l_max:int = 0;
			var x_min:int = 0;
			var x_max:int = 0;
			var x_cri:int = 0;
			var x_exd:int = 0;
			for(var j:int = 0;j<muc1.skill.length;j++){
				muc1.now_skill = muc1.skill[j];
				if(muc1.skill[j][5] == 4){//ダークスピリット
					if(muc1.skill[j][0] == "フレイムハンド(単体)"){
						x_min = PVPDamageCalculator.calcMagicDamage(muc1,muc2,muc1.darkspirit[0]);
						x_max = PVPDamageCalculator.calcMagicDamage(muc1,muc2,muc1.darkspirit[1]);
					}else{
						x_min = PVPDamageCalculator.calcMagicDamage(muc1,muc2,muc1.darkspirit[2]);
						x_max = PVPDamageCalculator.calcMagicDamage(muc1,muc2,muc1.darkspirit[3]);
					}
					x_cri=x_max;
					x_exd=0;
				}else if(muc1.skill[j][3] == "魔法"){//魔法
				    x_min = PVPDamageCalculator.calcMagicDamage(muc1,muc2,muc1.skill_minmax[j][0]);//最小
				    x_cri = PVPDamageCalculator.calcMagicDamage(muc1,muc2,muc1.skill_minmax[j][2]);//クリ
				    x_exd = PVPDamageCalculator.calcMagicDamage(muc1,muc2,muc1.skill_minmax[j][3]);//EXD
				    x_max = PVPDamageCalculator.calcMagicDamage(muc1,muc2,muc1.skill_minmax[j][1]);//最大
				}else{
				    x_min = PVPDamageCalculator.calcDamage(muc1,muc2,muc1.skill_minmax[j][0]);//最小
				    x_cri = PVPDamageCalculator.calcDamage(muc1,muc2,muc1.skill_minmax[j][2],true,false);//クリ
				    x_exd = PVPDamageCalculator.calcDamage(muc1,muc2,muc1.skill_minmax[j][3],false,true);//EXD
				    x_max = PVPDamageCalculator.calcDamage(muc1,muc2,muc1.skill_minmax[j][1]);//最大
				}
				//1HIT当たりのダメージを計算
				var hit1:int=0;//1hit当たりのダメージ
				if(muc1.skill[j][0] == "フレイムハンド(単体)"){//ダークスピリット
					hit1 += x_max * muc1.darkspirit[5]/100;//クリティカル率
					hit1 += ((x_min + x_max)/2) * (100 - muc1.darkspirit[5]) / 100;//通常
				}else if(muc1.skill[j][0] == "フレイムハンド(範囲)"){//フレイムハンド範囲
					//クリティカル確率0%
					hit1 += ((x_min + x_max)/2);//通常
				}else{//通常
					hit1 += x_exd * muc1.exd / 100;//EXD
					hit1 += x_cri * muc1.cri / 10000;//クリ
					hit1 += ((x_min + x_max)/2) * muc1.normal / 10000;//通常
					hit1 += hit1 * muc1.wd/100;//WD
				}
				hit1array.push(hit1);
				//1分当たりの攻撃回数を計算
				var minute:String;
				if(!muc1.skill[j][2][0])minute="0";//0だった場合
				else minute = (Math.floor(600000/muc1.skill[j][2][0])/10).toString();//攻撃回数計算
				if(!muc1.skill[j][2][0] || muc1.skill[j][2][1]==0)minute += "?";//不明又は未検証の場合
				minutearray.push(minute);
				//1HITダメージ/秒
				var second:int=0;
				if(muc1.skill[j][2][0])second = hit1 * 1000/muc1.skill[j][2][0];
				else second = 0;
				//計算結果をスタック
				a.push({skillname:muc1.skill[j][0]
					,hitper:second
					,speed:minute
					,even:hit1
					,minmax:x_min + "～" + x_max
					,hit:hit + "%"
					,cri:x_cri,exd:x_exd});
			}
			return a;
		}
		
	}
}
