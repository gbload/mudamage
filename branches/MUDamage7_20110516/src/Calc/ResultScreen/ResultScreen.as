package Calc.ResultScreen {
	import mx.controls.*;
	import mx.containers.*;
	import mx.core.*;
	import mx.collections.*;
	import mx.events.*;
	import flash.events.*;

	import Form.MUDamage.SubForm.*;
	import Form.MUDamage.*;
	import Calc.*;
	import Data.Database.*;
	import Data.Database.MLV.*;
	/**
	 * PVPダメージ計算の結果を表示する画面
	 */
	public class ResultScreen extends Form {
		private var d:FormMUDamage;
		private var f:Object;
		private var i:ItemData;
		private var c:CharacterData;
		private var a:AttackData;
		
		/**
		 * コンストラクタ
		 */
		public function ResultScreen(d:FormMUDamage) {
			super();
			this.d = d;
			this.f = (new FormData(d)).getData();
			this.i = new ItemData(f);
			this.c = (new CharacterCalculator(f,i)).getData();
			this.a = (new AttackCalculator(f,i,c)).getData();
			
			init();
		}
		/**
		 * 初期化
		 */
		private function init():void{
			// 閉じるボタン
			this.addChild(createCloseButton());
			
			var hbox:HBox = new HBox();
			this.addChild(hbox);
			// キャラクターステータス表示
			hbox.addChild(new CharacterScreen(d,f,i,c,a));
			// キャラクター装備表示
			hbox.addChild(new ItemScreen(d,f,i,c));
			// ダメージ一覧Gridを表示
			this.addChild(new DamageGrid(calcSkills()));
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
		private function calcSkills():Array{
			var r:Array = new Array();
			var dc:DamageCalculator = new DamageCalculator(f,i,c,a);
			//命中率計算
			var hit:int=0;
		
//			var tmp_hit1:int = muc1.pvphit * muc1.lv;
//			var tmp_hit2:int = muc2.pvphit * muc2.lv;
//		
//			hit = (tmp_hit1 / (tmp_hit1 + tmp_hit2))*100;
			
			//ダメージ計算
			var hit1array:Array = new Array();
			var minutearray:Array = new Array();
			//変数
			var x_min:int = 0;
			var x_max:int = 0;
			var x_cri:int = 0;
			var x_exd:int = 0;
			for(var n:String in a.skills){
				var func:Function = dc.calcDamage;
				if(a.skills[n].skill[a.key.type]=="魔法"){
					func = dc.calcMagicDamage;
				}
				x_min = func(a.skills[n],a.skills[n].min,false,false);
				x_max = func(a.skills[n],a.skills[n].max,false,false);
				x_cri = func(a.skills[n],a.skills[n].cri,true,false);
				x_exd = func(a.skills[n],a.skills[n].exd,false,true);
				//1HIT当たりのダメージを計算
				var hit1:int=0;//1hit当たりのダメージ
				if(a.skills[n].skill[a.key.name] == "フレイムハンド(単体)"){//ダークスピリット
//					hit1 += x_max * muc1.darkspirit[5]/100;//クリティカル率
//					hit1 += ((x_min + x_max)/2) * (100 - muc1.darkspirit[5]) / 100;//通常
				}else if(a.skills[n].skill[a.key.name] == "フレイムハンド(範囲)"){//フレイムハンド範囲
					//クリティカル確率0%
//					hit1 += ((x_min + x_max)/2);//通常
				}else{//通常
					hit1 += x_exd * c.exd / 100;//EXD
					hit1 += x_cri * c.cri / 10000;//クリ
					hit1 += ((x_min + x_max)/2) * c.normal / 10000;//通常
					hit1 += hit1 * c.wd/100;//WD
				}
				hit1array.push(hit1);
				//1分当たりの攻撃回数を計算
				var minute:String;
				if(!a.skills[n].speed[0])minute="0";//0だった場合
				else minute = (Math.floor(600000/a.skills[n].speed[0])/10).toString();//攻撃回数計算
				if(!a.skills[n].speed[0] || a.skills[n].speed[1]==0)minute += "?";//不明又は未検証の場合
				minutearray.push(minute);
				//1HITダメージ/秒
				var second:int=0;
				if(a.skills[n].speed[0])second = hit1 * 1000/a.skills[n].speed[0];
				else second = 0;
				//計算結果をスタック
				r.push({skillname:a.skills[n].skill[a.key.name]
					,hitper:second
					,speed:minute
					,even:hit1
					,minmax:x_min + "～" + x_max
					,hit:hit + "%"
					,cri:x_cri,exd:x_exd});
			}
			return r;
		}
	}
}
