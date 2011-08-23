package IO.FileIO {
	import flash.events.*;
	import mx.events.*;
	import mx.controls.*;
	
	import Form.MUDamage.*;
	import Data.Resource.*;
	
	public class StaticFormIO {
		/**
		 * 静的メソッド
		 */
//		public static function getData(title:String,d:FormMUDamage):Array{
//			return getInstance().getData(title,d);
//		}
//		public static function setData(a:Array,d:FormMUDamage):Boolean{
//			return getInstance().setData(a,d);
//		}
//		public static function importData(a2:Array):Array{
//			return getInstance().importData(a2);
//		}
//		private static function getInstance():StaticFormIO{
//			if(instance == null)
//				instance = new StaticFormIO();
//			return instance;
//		}
		/**
		 * コンストラクタ
		 */
		public function StaticFormIO() {
			super();
		}
		/**
		 * 計算フォームからデータを取得します。
		 */
		public static function getData(title:String,d:FormMUDamage):Array{
			var a:Array = new Array();
			
			a[0] = title;//タイトル
			a[1] = d.form_job.selectedIndex;//職
			a[2] = new Array();//ペット
			a[2][0] = d.form_pet.getItem().selectedIndex;
			a[3] = new Array();//羽
			a[3][0] = d.form_wing.getItem().selectedIndex;
			a[3][1] = d.form_wing.getItemAttr().getPlus().selectedIndex;
			a[3][2] = d.form_wing.getItemAttr().getOption().selectedIndex;
			a[3][3] = d.form_wing.getCop().selectedIndex;
			a[3][4] = d.form_wing.getItemAttr().getLuck().selected;
			a[4] = new Array();//ネックレス
			a[4][0] = d.form_neck.getKind().selectedIndex;
			a[4][1] = d.form_neck.getItem().selectedIndex;
			a[4][2] = d.form_neck.getSetop().selectedIndex;
			for(var i:int=0;i<5;i++)//EXOP
				a[4][i+3] = d.form_neck.getExellent().getOptions()[i].selectedIndex;
			var item:Array = [d.form_right,d.form_left,d.form_helm,d.form_armor,d.form_glove,d.form_garter,d.form_boots];
			for(i=0;i<item.length;i++){
				a[5+i] = new Array();//装備
				a[5+i][0] = item[i].getKind().selectedIndex;
				a[5+i][1] = item[i].getItem().selectedIndex;
				a[5+i][2] = item[i].getItemAttr().getPlus().selectedIndex;
				a[5+i][3] = item[i].getItemAttr().getOption().selectedIndex;
				a[5+i][4] = item[i].getItemAttr().getLuck().selected;
				a[5+i][5] = item[i].getEnchant().getKind().selectedIndex;
				a[5+i][6] = item[i].getEnchant().getValue().selectedIndex;
				a[5+i][7] = item[i].getSetop().selectedIndex;
				for(var j:int=0;j<5;j++)//EXOP
					a[5+i][8+j] = item[i].getExellent().getOptions()[j].selectedIndex;
				for(j=0;j<5;j++){//ソケットOP
					a[5+i][13+j*2] = item[i].getSocket().getNames()[j].selectedIndex;
					a[5+i][13+j*2+1] = item[i].getSocket().getValues()[j].selectedIndex;
				}
				for(j=0;j<2;j++){//ボーナスソケット
					a[5+i][23+j] = item[i].getSocket().getBonuses()[j].selectedIndex;
				}
				//380OP
				a[5+i][25] = item[i].getOp380().selected;
				//矢
				if(i==0)a[5+i][26] = item[i].getArrow().selectedIndex;
			}
			item = [d.form_ring1,d.form_ring2];//リング
			for(i=0;i<item.length;i++){
				a[12+i] = new Array();
				a[12+i][0] = item[i].getKind().selectedIndex;
				a[12+i][1] = item[i].getItem().selectedIndex;
				a[12+i][2] = item[i].getSetop().selectedIndex;
				for(j=0;j<5;j++)
					a[12+i][j+3] = item[i].getExellent().getOptions()[j].selectedIndex;
			}
			a[14] = new Array();//ステータス
			a[14][0] = d.form_status.getLevel().text;
			a[14][1] = d.form_status.getStr().text;
			a[14][2] = d.form_status.getAgi().text;
			a[14][3] = d.form_status.getVit().text;
			a[14][4] = d.form_status.getEne().text;
			a[14][5] = d.form_status.getRec().text;
			a[15] = new Array();//サポート
			a[15][0] = d.form_support.getValue2(d.form_support.aplus);
			a[15][1] = d.form_support.getValue2(d.form_support.cplus);
			a[15][2] = d.form_support.getValue2(d.form_support.sl);
			a[15][3] = d.form_support.getValue2(d.form_support.sb);
			a[15][4] = d.form_support.getValue2(d.form_support.gplus);
			a[15][5] = d.form_support.getValue2(d.form_support.ba);
			a[15][6] = d.form_support.getValue2(d.form_support.ber);
			a[15][7] = d.form_support.getValue2(d.form_support.se);
			a[15][8] = d.form_support.getValue2(d.form_support.iv);
			a[15][9] = d.form_support.getValue2(d.form_support.wn);
			a[16] = new Array();//その他
			a[16][0] = d.form_support.getValue2(d.form_support.sera);
			a[16][1] = d.form_support.getValue2(d.form_support.ale);
			a[16][2] = d.form_support.getValue2(d.form_support.miracle);
			a[16][3] = d.form_support.getValue2(d.form_support.item);
			a[16][4] = d.form_support.getValue2(d.form_support.scroll);
			a[16][5] = d.form_support.getValue2(d.form_support.leap);
			a[17] = new Array();//マップ
			a[17][0] = d.form_calc.getMap().selectedIndex;
			a[18] = d.form_status.getMasterSkillTree().getLevel().text;
			//バージョン情報
			a[19] = Version.version_number;
			//2009/11/04
			//ペットサブフォーム
			a[20] = new Array();
			a[20][0] = d.form_pet.getSub1().selectedIndex;
			a[20][1] = d.form_pet.getSub2().selectedIndex;
			//2009/12/03
			//カウンターリベリオン、ドッペルゲンガー用
			a[21] = 0;
			//2010/03/02
			//エンブレム・イベントでの経験値増加入力フォーム
			a[22] = d.form_exp.text;
			//2010/09/28
			//レイジファイターサポートスキル
			a[23] = new Array();
			a[23][0] = d.form_support.getValue2(d.form_support.ig);
			a[23][1] = d.form_support.getValue2(d.form_support.ht);
			a[23][2] = d.form_support.getValue2(d.form_support.con);
			//2011/03/24
			//ドッペルゲンガーとカウンターリベリオン
			a[24] = new Array();
			a[24][0] = 0;
			a[24][1] = 0;
			return a;
		}
		/**
		 * データを計算フォームに入れます。
		 */
		public static function setData(a2:Array,d:FormMUDamage):Boolean{
			var a:Array;
			// version check
			if(parseInt(a2[19]) >= 2.20){// latest version
				a = a2;
			}else{
				a = importData(a2.toString().split(/,/g));
			}
			//タイトル
			d.form_title.text = a[0];
			//ジョブ
			d.form_job.selectedIndex = a[1];
			d.form_job.dispatchEvent(new ListEvent(ListEvent.CHANGE) as Event);
			//ペット
			d.form_pet.getItem().selectedIndex = a[2][0];
			d.form_pet.getItem().dispatchEvent(new ListEvent(ListEvent.CHANGE) as Event);
			//羽
			d.form_wing.getItem().selectedIndex = a[3][0];
			d.form_wing.getItem().dispatchEvent(new ListEvent(ListEvent.CHANGE) as Event);
			d.form_wing.getItemAttr().getPlus().selectedIndex = a[3][1];
			d.form_wing.getItemAttr().getOption().selectedIndex = a[3][2];
			d.form_wing.getCop().selectedIndex = a[3][3];
			d.form_wing.getItemAttr().getLuck().selected = a[3][4];
			//ネックレス
			d.form_neck.getKind().selectedIndex = a[4][0];
			d.form_neck.getKind().dispatchEvent(new ListEvent(ListEvent.CHANGE) as Event);
			d.form_neck.getItem().selectedIndex = a[4][1];
			if(a[4][1] && a[4][1] != -1)
				d.form_neck.getItem().dispatchEvent(new ListEvent(ListEvent.CHANGE) as Event);
			d.form_neck.getSetop().selectedIndex = a[4][2];
			for(var i:int=0;i<5;i++)
				d.form_neck.getExellent().getOptions()[i].selectedIndex = a[4][i+3];
			//各種装備
			var item:Array = [d.form_right,d.form_left,d.form_helm,d.form_armor,d.form_glove,d.form_garter,d.form_boots];
			for(i=0;i<item.length;i++){
				item[i].getKind().selectedIndex = a[5+i][0];
				item[i].getKind().dispatchEvent(new ListEvent(ListEvent.CHANGE) as Event);
				item[i].getItem().selectedIndex = a[5+i][1];
				if(a[5+i][1] && a[5+i][1] != -1)
					item[i].getItem().dispatchEvent(new ListEvent(ListEvent.CHANGE) as Event);
				item[i].getItemAttr().getPlus().selectedIndex = a[5+i][2];
				if(a[5+i][2] && a[5+i][2] != -1)
					item[i].getItemAttr().getPlus().dispatchEvent(new ListEvent(ListEvent.CHANGE) as Event);
				item[i].getItemAttr().getOption().selectedIndex = a[5+i][3];
				item[i].getItemAttr().getLuck().selected = a[5+i][4];
				item[i].getEnchant().getKind().selectedIndex = a[5+i][5];
				if(a[5+i][5] && a[5+i][1] != -1)
					item[i].getEnchant().getKind().dispatchEvent(new ListEvent(ListEvent.CHANGE) as Event);
				item[i].getEnchant().getValue().selectedIndex = a[5+i][6];
				item[i].getSetop().selectedIndex = a[5+i][7];
				for(var j:int=0;j<5;j++)
					item[i].getExellent().getOptions()[j].selectedIndex = a[5+i][8+j];
				for(j=0;j<5;j++){
					item[i].getSocket().getNames()[j].selectedIndex = a[5+i][13+j*2];
					if(a[5+i][13+j*2] && a[5+i][13+j*2] != -1)
						item[i].getSocket().getNames()[j].dispatchEvent(new ListEvent(ListEvent.CHANGE) as Event);
					item[i].getSocket().getValues()[j].selectedIndex = a[5+i][13+j*2+1];
				}
				for(j=0;j<2;j++){//ボーナスソケット
					item[i].getSocket().getBonuses()[j].selectedIndex = a[5+i][23+j];
				}
				//380OP
				item[i].getOp380().selected = a[5+i][25];
				//矢
				if(i==0)item[i].getArrow().selectedIndex = a[5+i][26];
			}
			//リング
			item = [d.form_ring1,d.form_ring2];
			for(i=0;i<item.length;i++){
				item[i].getKind().selectedIndex = a[12+i][0];
				item[i].getKind().dispatchEvent(new ListEvent(ListEvent.CHANGE) as Event);
				item[i].getItem().selectedIndex = a[12+i][1];
				if(a[12+i][1] && a[12+i][1] != -1)
					item[i].getItem().dispatchEvent(new ListEvent(ListEvent.CHANGE) as Event);
				item[i].getSetop().selectedIndex = a[12+i][2];
				for(j=0;j<5;j++)
					item[i].getExellent().getOptions()[j].selectedIndex = a[12+i][j+3];
			}
			//ステータス
			d.form_status.getLevel().text = a[14][0];
			d.form_status.getStr().text = a[14][1];
			d.form_status.getAgi().text = a[14][2];
			d.form_status.getVit().text = a[14][3];
			d.form_status.getEne().text = a[14][4];
			d.form_status.getRec().text = a[14][5];
			d.form_status.getLevel().dispatchEvent(new FocusEvent(FocusEvent.FOCUS_OUT) as Event);
			//サポート系
			d.form_support.setValue(d.form_support.aplus,a[15][0]);
			d.form_support.setValue(d.form_support.cplus,a[15][1]);
			d.form_support.setValue(d.form_support.sl,a[15][2]);
			d.form_support.setValue(d.form_support.sb,a[15][3]);
			d.form_support.setValue(d.form_support.gplus,a[15][4]);
			d.form_support.setValue(d.form_support.ba,a[15][5]);
			d.form_support.setValue(d.form_support.ber,a[15][6]);
			d.form_support.setValue(d.form_support.se,a[15][7]);
			d.form_support.setValue(d.form_support.iv,a[15][8]);
			d.form_support.setValue(d.form_support.wn,a[15][9]);
			//補助アイテム系
			d.form_support.setValue(d.form_support.sera,a[16][0]);
			d.form_support.setValue(d.form_support.ale,a[16][1]);
			d.form_support.setValue(d.form_support.miracle,a[16][2]);
			d.form_support.setValue(d.form_support.item,a[16][3]);
			d.form_support.setValue(d.form_support.scroll,a[16][4]);
			d.form_support.setValue(d.form_support.leap,a[16][5]);
			//計算方法の指定（MAPなど）
			d.form_calc.getMap().selectedIndex = a[17][0];
			d.form_calc.getMap().dispatchEvent(new ListEvent(ListEvent.CHANGE) as Event);
			//マスターレベル
			d.form_status.getMasterSkillTree().getLevel().text = a[18];
//			for(i=0;i<MLV.num;i++){
//				mlvcount.setSkill2(i,a[19][i]);
//				//if(click::mlvLabel[i])click::mlvLabel[i].text = a[19][i];
//			}
			//click::mlvShow();//画像の表示
			//click::mlvShowPoint();//ポイントの表示
			
			//2009/11/04
			//ペットサブフォーム
			d.form_pet.getSub1().selectedIndex = a[20][0];
			d.form_pet.getSub2().selectedIndex = a[20][1];
			
			//2009/12/03
			//カウンターリベリオン、ドッペルゲンガー用
//			d.form_map_doublegoer_lv.selectedIndex = a[21];
			
			//2010/03/02
			//エンブレム・イベントでの経験値増加入力フォーム
			d.form_exp.text = a[22];
			
			//2010/09/28
			//レイジファイターサポートスキル
			d.form_support.setValue(d.form_support.ig,a[23][0]);
			d.form_support.setValue(d.form_support.ht,a[23][1]);
			d.form_support.setValue(d.form_support.con,a[23][2]);
			
			//2011/03/24
			//ドッペルゲンガーとカウンターリベリオン
//			d.form_map_doublegoer_ptm.selectedIndex = a[24][0];
//			d.form_map_imperialguardian_lv.selectedIndex = a[24][1];
			
			//Alert.show(a.toString());
			
			return true;
		}
		/**
		 * インポートデータをShardObject用のデータに変換する。
		 * @param Array インポートデータ
		 * @return Array ShardObject用のデータ
		 */
		public static function importData(a2:Array):Array{
			var a:Array = new Array();
			var index:int=0;
			
			a[0] = a2[index++];//タイトル
			a[1] = parseInt(a2[index++]);//職
			a[2] = new Array();//ペット
			a[2][0] = parseInt(a2[index++]);
			a[3] = new Array();//羽
			a[3][0] = parseInt(a2[index++]);
			a[3][1] = parseInt(a2[index++]);
			a[3][2] = parseInt(a2[index++]);
			a[3][3] = parseInt(a2[index++]);
			a[3][4] = (a2[index++] == "true");
			a[4] = new Array();//ネックレス
			a[4][0] = parseInt(a2[index++]);
			a[4][1] = parseInt(a2[index++]);
			a[4][2] = parseInt(a2[index++]);
			for(var i:int=0;i<5;i++)
				a[4][i+3] = parseInt(a2[index++]);
			for(i=0;i<7;i++){//装備
				a[5+i] = new Array();
				a[5+i][0] = parseInt(a2[index++]);
				a[5+i][1] = parseInt(a2[index++]);
				a[5+i][2] = parseInt(a2[index++]);
				a[5+i][3] = parseInt(a2[index++]);
				a[5+i][4] = (a2[index++] == "true");
				a[5+i][5] = parseInt(a2[index++]);
				a[5+i][6] = parseInt(a2[index++]);
				a[5+i][7] = parseInt(a2[index++]);
				for(var j:int=0;j<5;j++)
					a[5+i][8+j] = parseInt(a2[index++]);
				for(j=0;j<5;j++){
					a[5+i][13+j*2] = parseInt(a2[index++]);
					a[5+i][13+j*2+1] = parseInt(a2[index++]);
				}
				for(j=0;j<2;j++){
					a[5+i][23+j] = parseInt(a2[index++]);
				}
				a[5+i][25] = (a2[index++] == "true");
				if(i==0)a[5+i][26] = parseInt(a2[index++]);
			}
			for(i=0;i<2;i++){//リング
				a[12+i] = new Array();
				a[12+i][0] = parseInt(a2[index++]);
				a[12+i][1] = parseInt(a2[index++]);
				a[12+i][2] = parseInt(a2[index++]);
				for(j=0;j<5;j++)
					a[12+i][j+3] = parseInt(a2[index++]);
			}
			a[14] = new Array();//ステータス
			a[14][0] = a2[index++];
			a[14][1] = a2[index++];
			a[14][2] = a2[index++];
			a[14][3] = a2[index++];
			a[14][4] = a2[index++];
			a[14][5] = a2[index++];
			a[15] = new Array();//サポート
			a[15][0] = a2[index++];
			a[15][1] = a2[index++];
			a[15][2] = a2[index++];
			a[15][3] = a2[index++];
			a[15][4] = a2[index++];
			a[15][5] = (a2[index++] == "true");
			a[15][6] = (a2[index++] == "true");
			a[15][7] = (a2[index++] == "true");
			a[15][8] = a2[index++];
			a[15][9] = a2[index++];
			a[16] = new Array();//課金類
			a[16][0] = (a2[index++] == "true");
			a[16][1] = (a2[index++] == "true");
			a[16][2] = (a2[index++] == "true");
			a[16][3] = parseInt(a2[index++]);
			a[16][4] = parseInt(a2[index++]);
			a[16][5] = parseInt(a2[index++]);
			a[17] = new Array();//マップ
			a[17][0] = parseInt(a2[index++]);
			a[18] = a2[index++];
			if(a2[index] == "")
				a[19] = "2.20";
			else if(a2[index].length > 1)
				a[19] = a2[index++];
			else
				index+=51;
			//2009/11/04
			//ペットサブフォーム
			a[20] = new Array();
			a[20][0] = parseInt(a2[index++]);
			a[20][1] = parseInt(a2[index++]);
			//2009/12/03
			//カウンターリベリオン、ドッペルゲンガー用
			a[21] = a2[index++];
			//2010/03/02
			//エンブレム・イベントでの経験値増加入力フォーム
			a[22] = a2[index++];
			//2010/09/28
			//レイジファイターサポートスキル
			a[23] = new Array();
			a[23][0] = a2[index++];
			a[23][1] = a2[index++];
			a[23][2] = a2[index++];
			//2011/03/24
			//ドッペルゲンガーとカウンターリベリオン
			a[24] = new Array();
			a[24][0] = a2[index++];
			a[24][1] = a2[index++];
			return a;
		}
	}
}
