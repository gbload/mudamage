package PVP {
	import MuCalc.MuChar;
	import MuData.Internal;
	
	import mx.containers.*;
	import mx.controls.*;
	/**
	 * キャラクターのステータスや装備を表示するCanvas
	 */
	public class PVPCharacterScreen extends HBox {
		private var muc:MuChar;
		private var c:Internal;
	
		private var row:HBox; // 行
		private var col:VBox; // 列
		/**
		 * コンストラクタ
		 */
		public function PVPCharacterScreen(muc:MuChar) {
			super();
			this.muc = muc;
			this.c = Internal.getInstance();
			
			init();
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
			var job:Array = [
				"Dark Knight","Dark Wizard","Fairy Elf","Magic Gladiator","Dark Lord","Summoner","Rage Fighter"
			];
		
			ln();
			
			text(job[muc.job]); // 職
			text("LV:" + muc.lv);// LV
			
			ln();
			
			textAddStatus("Strength:", muc.str, muc.add_str);
			textAddStatus("Agility:", muc.agi, muc.add_agi);
			textAddStatus("Vitality:", muc.vit, muc.add_vit);
			textAddStatus("energy:", muc.ene, muc.add_ene);
			if(muc.job == 4) // ダークロードのみ
				textAddStatus("Command:", muc.rec, muc.add_rec);
			
			ln();
			
			text("HP:" + muc.hp);
			text("SD:" + muc.sd);
			text("Mana:" + muc.mana);
			text("AG:" + muc.ag);
		}
		/**
		 * 攻撃関連のステータスを表示
		 */
		private function setAttack():void{
			ln();
			
			if(muc.job == 0 || muc.job == 2 || muc.job == 3 || muc.job == 4 || muc.job == 6)text("Speed:" + muc.speed);
			if(muc.job == 1 || muc.job == 3 || muc.job == 5)text("Magic Speed" + muc.magicspeed);
			
			ln();
			
			if(muc.job == 0 || muc.job == 2 || muc.job == 3 || muc.job == 4 || muc.job == 6)//攻撃組み
				text("Dmg:" + muc.minmax[0] + "-" + muc.minmax[1]);
			//攻撃成功率
			text("(rate" + muc.hit +"/PvP" +muc.pvphit +")");
			
			ln();
			
			if(muc.job == 1 || muc.job == 3 || muc.job == 5)//魔法組み
				text("Magic:" + muc.minmax[2] + "-" + muc.minmax[3]);
			if(muc.job == 5)//呪い組み
				text(" Curse:" + muc.noroi[0] + "-" + muc.noroi[1]);
		}
		/**
		 * 防御関連のステータスを表示
		 */
		private function setDefense():void{
			ln();
			
			text("Defence:" + muc.def);
			//防御成功率
			text("(rate" + muc.avoid +"/PvP" +muc.pvpavoid +")");
		}
		/**
		 * クリティカルやEXD等の確率を表示
		 */
		private function setSpecialAttackRate():void{
			ln();
			
			text("Normal:" + (muc.normal/100) + "%");
			text("cri:" + (muc.cri/100) + "%");
			text("EXD:" + muc.exd + "%");

			ln();
			//防御無視　WD
			text("Ignore:" + muc.ignore + "%");
			text("WD:" + muc.wd + "%");
		}
		/**
		 * セットオプション
		 */
		private function setSetOption():void{
			ln();
			
			var setname:String = "";
			var setops:String = "";
			for each(var ii:Object in muc.setop_names)//セット名
				if(ii.num >= 2)//2箇所以上
					for(var j:int=0;j<c.setop.length;j++)//セットOPのデータを繰り返し確認
						if(c.setop[j][0] == ii.label){//セット名の一致
							setname = ii.label;
							setops = setname + "\n";
							for(var k:int=2;k<=ii.num;k++){
								setops += c.setop[j][k][0] + "\n";
								if(k == c.setop[j][1] + 1){//フルOPを取得
									setops += "\n";
									for(var l:int=0;l<c.setop[j][k+1].length;l++){
										setops += c.setop[j][k+1][l][0] + "\n";
									}
								}
							}
							//表示
							text(setname + " " + (k-1),"cyan",setops);
							break;
						}
		}
		private function setSupport():void{
			ln();
			
			text("A+:" + muc.support_a);
			text("G+:" + muc.support_g);
			text("C+:" + muc.support_c);
			text("SL:" + muc.support_sl + "%");
			text("SB:" + muc.support_sb + "%");
			ln();
			text("Innovation:" + muc.support_inner + "%");
			text("Weakness:" + muc.support_weak + "%");
			if(muc.support_ba || muc.support_berserker || muc.support_se){
				ln();
				if(muc.support_ba)text("Fire Slash (Def -10%)");
				if(muc.support_berserker)text("Berserker:" + muc.support_berserker + "%");
				if(muc.support_se)text("Expansion of Wizardry(Minimum Dmg+20%)");
			}
		}
	}
}
