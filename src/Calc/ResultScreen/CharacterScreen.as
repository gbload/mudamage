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
	 * キャラクターのステータスや装備を表示するCanvas
	 */
	public class CharacterScreen extends HBox {
		private var d:FormMUDamage;
		private var f:Object;
		private var i:ItemData;
		private var c:CharacterData;
	
		private var row:HBox; // 行
		private var col:VBox; // 列
		/**
		 * コンストラクタ
		 */
		public function CharacterScreen(d:FormMUDamage,f:Object,i:ItemData,c:CharacterData) {
			super();
			this.d = d;
			this.f = f;
			this.i = i;
			this.c = c;
			
			init();
		}
		/**
		 * 初期化
		 */
		private function init():void{
			createColumn();
			
			setStatus();
			setAttack();
			setDefense();
			setSpecialAttackRate();
			setSetOption();
			setSupport();
			
		}
		/**
		 * 新しいカラム
		 */
		private function createColumn():void{
			var vbox:VBox = new VBox();
			col = vbox;
			this.addChild(vbox);
		}
		/**
		 * 改行
		 */
		private function ln():void{
			var hbox:HBox = new HBox();
			row = hbox;
			col.addChild(hbox);
		}
		/**
		 * テキスト
		 */
		private function text(str:String, color:String="", t:String=""):void{
			var te:Label = new Label();
			te.text = str;
			//文字の色
			var c:String = "";
			if(color == "red")c = "#FF5555";
			else if(color == "blue")c = "#5555FF";
			else if(color == "cyan")c = "#5599FF";
			else if(color == "green")c = "#55BB55";
			else if(color == "purple")c = "#AA55DD";
			if(c != "")te.setStyle("color",c);
			//ツールチップ
			if(t != ""){
				te.toolTip = t;
				te.setStyle("textDecoration","underline");
			}
			
			row.addChild(te);
		}

		/**
		 * 追加ステータスのあるテキスト
		 */
		private function textAddStatus(str:String, value:int, add:int):void{
			if(add)
				text( str + value, "blue", (value-add) + "+" + add);
			else
				text( str + value);
		}
		/**
		 * ステータス表示
		 */
		private function setStatus():void{
			ln();
			
			text(f.job); // 職
			text("LV:" + c.lv);// LV
			
			ln();
			
			textAddStatus("力:", c.str, c.add_str);
			textAddStatus("敏捷:", c.agi, c.add_agi);
			textAddStatus("体力:", c.vit, c.add_vit);
			textAddStatus("エナジー:", c.ene, c.add_ene);
			if(f.job=="ダークロード") // ダークロードのみ
				textAddStatus("統率:", c.rec, c.add_rec);
			
			ln();
			
			text("HP:" + c.life);
			text("SD:" + c.sd);
			text("マナ:" + c.mana);
			text("AG:" + c.ag);
		}
		/**
		 * 攻撃関連のステータスを表示
		 */
		private function setAttack():void{
//			ln();
//			
//			text("攻撃速度:" + c.speed);
//			text("魔法速度:" + c.magicspeed);
//			
//			ln();
//			
//			if(c.job == 0 || c.job == 2 || c.job == 3 || c.job == 4 || c.job == 6)//攻撃組み
//				text("攻撃力:" + c.minmax[0] + "～" + c.minmax[1]);
//			//攻撃成功率
//			text("(率" + c.hit +"/対人" +c.pvphit +")");
//			
//			ln();
//			
//			if(c.job == 1 || c.job == 3 || c.job == 5)//魔法組み
//				text("魔力:" + c.minmax[2] + "～" + c.minmax[3]);
//			if(c.job == 5)//呪い組み
//				text(" 呪い:" + c.noroi[0] + "～" + c.noroi[1]);
		}
		/**
		 * 防御関連のステータスを表示
		 */
		private function setDefense():void{
			ln();
			
			text("防御力:" + c.def);
			//防御成功率
			text("(率" + c.avoid +"/対人" +c.pvp_avoid +")");
		}
		/**
		 * クリティカルやEXD等の確率を表示
		 */
		private function setSpecialAttackRate():void{
			ln();
			
			text("通常:" + (c.normal/100) + "%");
			text("クリ:" + (c.cri/100) + "%");
			text("EXD:" + c.exd + "%");

			ln();
			//防御無視　WD
			text("無視:" + c.ignore + "%");
			text("WD:" + c.wd + "%");
		}
		/**
		 * セットオプション
		 */
		private function setSetOption():void{
//			ln();
//			
//			var setname:String = "";
//			var setops:String = "";
//			for each(var ii:Object in c.setop_names)//セット名
//				if(ii.num >= 2)//2箇所以上
//					for(var j:int=0;j<c.setop.length;j++)//セットOPのデータを繰り返し確認
//						if(c.setop[j][0] == ii.label){//セット名の一致
//							setname = ii.label;
//							setops = setname + "\n";
//							for(var k:int=2;k<=ii.num;k++){
//								setops += c.setop[j][k][0] + "\n";
//								if(k == c.setop[j][1] + 1){//フルOPを取得
//									setops += "\n";
//									for(var l:int=0;l<c.setop[j][k+1].length;l++){
//										setops += c.setop[j][k+1][l][0] + "\n";
//									}
//								}
//							}
//							//表示
//							text(setname + " " + (k-1),"cyan",setops);
//							break;
//						}
		}
		private function setSupport():void{
			ln();
			
			text("A+:" + c.support_a);
			text("G+:" + c.support_g);
			text("C+:" + c.support_c);
			text("SL:" + c.support_sl + "%");
			text("SB:" + c.support_sb + "%");
			ln();
			text("インナーベーション:" + c.support_inner + "%");
			text("ウイークネス:" + c.support_weak + "%");
			if(c.support_ba || c.support_berserker || c.support_se){
				ln();
				if(c.support_ba)text("血戦(敵Def10%低下)");
				if(c.support_berserker)text("バーサーカー:" + c.support_berserker + "%");
				if(c.support_se)text("スペルエンハンス(最小魔力20%上昇)");
			}
		}
	}
}
