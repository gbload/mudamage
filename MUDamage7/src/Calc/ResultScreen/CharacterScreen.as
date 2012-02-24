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
	public class CharacterScreen extends VBox {
		private var d:FormMUDamage;
		private var f:Object;
		private var i:ItemData;
		private var c:CharacterData;
		private var a:AttackData;
	
		private var row:HBox; // 行
		/**
		 * コンストラクタ
		 */
		public function CharacterScreen(muc:Object) {
			super();
			this.d = muc.d;
			this.f = muc.f;
			this.i = muc.i;
			this.c = muc.c;
			this.a = muc.a;
			
			init();
		}
		/**
		 * 初期化
		 */
		private function init():void{
			setStatus();
			setAttack();
			setDefense();
			setSpecialAttackRate();
			setSetOption();
			setSupport();
		}
		/**
		 * 改行
		 */
		private function ln():void{
			var hbox:HBox = new HBox();
			row = hbox;
			this.addChild(hbox);
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
			text("AG:" + c.ag, "", "3秒毎にAG回復+"+c.agh);
		}
		/**
		 * 攻撃関連のステータスを表示
		 */
		private function setAttack():void{
			ln();
			
			text("攻撃速度:" + c.speed);
			text("魔法速度:" + c.magic_speed);
			
			ln();
			
//			if(f.job_index == 0 || f.job_index == 2 || f.job_index == 3 || f.job_index == 4 || f.job_index == 6)//攻撃組み
				text("攻撃力:" + a.attack.min + "～" + a.attack.max);
			//攻撃成功率
			text("(率" + c.hit +"/対人" +c.pvp_hit +")");
			
			ln();
			
//			if(f.job_index == 1 || f.job_index == 3 || f.job_index == 5)//魔法組み
				text("魔力:" + a.magic.min + "～" + a.magic.max);
			if(f.job_index == 5)//呪い組み
				text(" 呪い:" + a.curse.min + "～" + a.curse.max);
			
			if(f.property.name!=""){
				ln();
				text("属性攻撃力:" + a.attribute.min + "～" + a.attribute.max);
			}
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
			ln();
			
			var setname:String = "";
			var setop_text:String = "";
			var setops:Array=D.getData("set_option") as Array;
			for(var ii:String in i.setop_names)//セット名
				if(i.setop_names[ii] >= 2)//2箇所以上
					for(var j:int=0;j<setops.length;j++)//セットOPのデータを繰り返し確認
						if(setops[j][0] == ii){//セット名の一致
							setname = ii;
							setop_text = setname + "\n";
							for(var k:int=2;k<=i.setop_names[ii];k++){
								setop_text += setops[j][k][0] + "\n";
								if(k == setops[j][1] + 1){//フルOPを取得
									setop_text += "\n";
									for(var l:int=0;l<setops[j][k+1].length;l++){
										setop_text += setops[j][k+1][l][0] + "\n";
									}
								}
							}
							//表示
							text(setname + " " + (k-1),"cyan",setop_text);
							break;
						}
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
