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
		private var muc:Object;
	
		private static var mk:Object = D.getKey("monster");
		
		/**
		 * コンストラクタ
		 */
		public function ResultScreen(d:FormMUDamage) {
			super();
			
			// スクロール対策
			this.setStyle("backgroundColor","#FFFFFF");//背景色を白色に
			
			muc = {};
			
			muc.d = d;
			muc.f = (new FormData(muc.d)).getData();
			muc.i = new ItemData(muc.f);
			muc.c = (new CharacterCalculator(muc.f,muc.i)).getData();
			muc.a = (new AttackCalculator(muc.f,muc.i,muc.c)).getData();
			// ラベル付
			this.label = muc.f.calc.map;
			
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
			hbox.addChild(new CharacterScreen(muc));
			// キャラクター装備表示
			hbox.addChild(new ItemScreen(muc));
			// モンスター取得
			var monsters:Array = getMonsters();
			var dc:DamageCalculator = new DamageCalculator(muc);
			for(var i:int=0;i<monsters.length;i++){
				if(i!=0 && monsters[i][mk.map]!=muc.f.calc.map)
					continue;
				// モンスター情報表示
				this.addChild(createLabel(monsters[i]));
				// ダメージ一覧Gridを表示
				dc.setMonster(monsters[i]);
				var dg:DamageGrid = new DamageGrid(dc.calcSkills());
				this.addChild(dg);
				// 被ダメージの行だけ色を変える
				var colors:Array = dg.getStyle("alternatingItemColors");
				for(var j:int=0;j<dg.rowCount;j++)
					colors[j] = colors[j%2];
				colors[dg.rowCount - 1] = 0xFFDDDD;
				dg.setStyle("alternatingItemColors", colors);
			}
		}
		/**
		 * モンスターデータの取得
		 */
		private function getMonsters():Array{
			var monsters:Array = new Array();
			monsters = D.getData("monster") as Array;
			if(muc.f.calc.map == "ドッペルゲンガー")
				monsters = monsters.concat((new DoubleGoer(muc.f.calc.sub2.index,muc.f.calc.sub1.index)).getMonster());
			else if(muc.f.calc.map == "カウンターリベリオン")
				monsters = monsters.concat((new ImperialGuardian(muc.f.calc.sub1.index)).getMonster());
//			else
//				monsters = D.getData("monster") as Array;
			return monsters;
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
		 * ラベルを作成
		 */
		private function createLabel(m:Object):Label{
			var label:Label = new Label();
			var str:String = "";
			// モンスター名
			str += m[mk.name];
			// Level
			str += " Lv" + m[mk.lv];
			// HP
			str += " HP" + m[mk.hp];
			// 攻撃力 & 率
			str += " 攻撃力" + m[mk.min] + "〜" + m[mk.max] + "(" + m[mk.hit] + ")";
			// 防御力 & 率
			str += " 防御力" + m[mk.def] + "(" + m[mk.avoid] + ")";
			// 経験値
			
			label.text = str;
			return label;
		}
	}
}
