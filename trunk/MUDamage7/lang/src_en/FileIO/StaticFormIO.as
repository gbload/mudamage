package FileIO {
	import flash.events.*;
	import mx.events.*;
	import mx.controls.*;
	import Csv.Dat;
	import MuCalc.MLV;
	import MuCalc.MLVcount;
	
	public class StaticFormIO {
		private var d:Dat;
		private var mlv:MLV;
		private var mlvcount:MLVcount;
		private static var instance:StaticFormIO; 
		/**
		 * 初期化
		 */
		public static function init(dat:Dat,mlv2:MLV,mlvcount2:MLVcount):void {
			instance = new StaticFormIO(dat,mlv2,mlvcount2);
		}
		/**
		 * 静的メソッド
		 */
		public static function getData(title:String):Array{
			return instance.getData(title);
		}
		public static function setData(a:Array):void{
			instance.setData(a);
		}
		public static function importData(a2:Array):Array{
			return instance.importData(a2);
		}
		/**
		 * コンストラクタ
		 */
		public function StaticFormIO(dat:Dat,mlv2:MLV,mlvcount2:MLVcount) {
			d = dat;
			mlv = mlv2;
			mlvcount = mlvcount;
		}
		/**
		 * 計算フォームからデータを取得します。
		 */
		public function getData(title:String):Array{
			var a:Array = new Array();
			
			a[0] = title;//タイトル
			a[1] = d.f_job.selectedIndex;//職
			a[2] = new Array();//ペット
			a[2][0] = d.f_pet.selectedIndex;
			a[3] = new Array();//羽
			a[3][0] = d.f_wing.f_item.selectedIndex;
			a[3][1] = d.f_wing.f_plus.selectedIndex;
			a[3][2] = d.f_wing.f_op.selectedIndex;
			a[3][3] = d.f_wing.f_cop.selectedIndex;
			a[3][4] = d.f_wing.f_luck.selected;
			a[4] = new Array();//ネックレス
			a[4][0] = d.f_neck.f_kind.selectedIndex;
			a[4][1] = d.f_neck.f_item.selectedIndex;
			a[4][2] = d.f_neck.f_cop.selectedIndex;
			for(var i:int=0;i<5;i++)//EXOP
				a[4][i+3] = d.f_neck.f_exop[i].selectedIndex;
			var item:Array = [d.f_right,d.f_left,d.f_helm,d.f_armor,d.f_glove,d.f_garter,d.f_boots];
			for(i=0;i<item.length;i++){
				a[5+i] = new Array();//装備
				a[5+i][0] = item[i].f_kind.selectedIndex;
				a[5+i][1] = item[i].f_item.selectedIndex;
				a[5+i][2] = item[i].f_plus.selectedIndex;
				a[5+i][3] = item[i].f_op.selectedIndex;
				a[5+i][4] = item[i].f_luck.selected;
				a[5+i][5] = item[i].f_enop.selectedIndex;
				a[5+i][6] = item[i].f_enop_value.selectedIndex;
				a[5+i][7] = item[i].f_cop.selectedIndex;
				for(var j:int=0;j<5;j++)//EXOP
					a[5+i][8+j] = item[i].f_exop[j].selectedIndex;
				for(j=0;j<5;j++){//ソケットOP
					a[5+i][13+j*2] = item[i].f_soop[j].selectedIndex;
					a[5+i][13+j*2+1] = item[i].f_soop_value[j].selectedIndex;
				}
				for(j=0;j<2;j++){//ボーナスソケット
					a[5+i][23+j] = item[i].f_sobonus[j].selectedIndex;
				}
				//380OP
				a[5+i][25] = item[i].f_380.selected;
				//矢
				if(i==0)a[5+i][26] = item[i].f_arrow.selectedIndex;
			}
			item = [d.f_ring1,d.f_ring2];//リング
			for(i=0;i<item.length;i++){
				a[12+i] = new Array();
				a[12+i][0] = item[i].f_kind.selectedIndex;
				a[12+i][1] = item[i].f_item.selectedIndex;
				a[12+i][2] = item[i].f_cop.selectedIndex;
				for(j=0;j<5;j++)
					a[12+i][j+3] = item[i].f_exop[j].selectedIndex;
			}
			a[14] = new Array();//ステータス
			a[14][0] = d.f_lv.text;
			a[14][1] = d.f_str.text;
			a[14][2] = d.f_agi.text;
			a[14][3] = d.f_vit.text;
			a[14][4] = d.f_ene.text;
			a[14][5] = d.f_rec.text;
			a[15] = new Array();//サポート
			a[15][0] = d.s_aplus.text;
			a[15][1] = d.s_cplus.text;
			a[15][2] = d.s_sl.text;
			a[15][3] = d.s_sb.text;
			a[15][4] = d.s_gplus.text;
			a[15][5] = d.s_ba.selected;
			a[15][6] = d.s_berserker.selected;
			a[15][7] = d.s_se.selected;
			a[15][8] = d.s_inner.text;
			a[15][9] = d.s_weak.text;
			a[16] = new Array();//その他
			a[16][0] = d.s_sera.selected;
			a[16][1] = d.s_sake.selected;
			a[16][2] = d.s_myou.selected;
			a[16][3] = d.s_item.selectedIndex;
			a[16][4] = d.s_scroll.selectedIndex;
			a[16][5] = d.s_hiyaku.selectedIndex;
			a[17] = new Array();//マップ
			a[17][0] = d.f_map.selectedIndex;
			a[18] = d.f_mlv.text;
			a[19] = new Array();
			for(i=0;i<=MLV.num;i++)//マスターレベル
				a[19][i] = mlvcount.getSkill(i);
			//2009/11/04
			//ペットサブフォーム
			a[20] = new Array();
			a[20][0] = d.f_petsub1.selectedIndex;
			a[20][1] = d.f_petsub2.selectedIndex;
			//2009/12/03
			//カウンターリベリオン、ドッペルゲンガー用
			a[21] = d.f_map_doublegoer_lv.selectedIndex;
			//2010/03/02
			//エンブレム・イベントでの経験値増加入力フォーム
			a[22] = d.f_exp.text;
			//2010/09/28
			//レイジファイターサポートスキル
			a[23] = new Array();
			a[23][0] = d.s_ignore.selected;
			a[23][1] = d.s_vit.selected;
			a[23][2] = d.s_avoid.selected;
			//2011/03/24
			//ドッペルゲンガーとカウンターリベリオン
			a[24] = new Array();
			a[24][0] = d.f_map_doublegoer_ptm.selectedIndex;
			a[24][1] = d.f_map_imperialguardian_lv.selectedIndex;
			return a;
		}
		/**
		 * 計算フォームからデータを取得します。
		 */
		public function setData(a:Array):void{
			//タイトル
			d.f_title.text = a[0];
			//ジョブ
			d.f_job.selectedIndex = a[1];
			d.f_job.dispatchEvent(new ListEvent(ListEvent.CHANGE) as Event);
			//ペット
			d.f_pet.selectedIndex = a[2][0];
			d.f_pet.dispatchEvent(new ListEvent(ListEvent.CHANGE) as Event);
			//羽
			d.f_wing.f_item.selectedIndex = a[3][0];
			d.f_wing.f_item.dispatchEvent(new ListEvent(ListEvent.CHANGE) as Event);
			d.f_wing.f_plus.selectedIndex = a[3][1];
			d.f_wing.f_op.selectedIndex = a[3][2];
			d.f_wing.f_cop.selectedIndex = a[3][3];
			d.f_wing.f_luck.selected = a[3][4];
			//ネックレス
			d.f_neck.f_kind.selectedIndex = a[4][0];
			d.f_neck.f_kind.dispatchEvent(new ListEvent(ListEvent.CHANGE) as Event);
			d.f_neck.f_item.selectedIndex = a[4][1];
			d.f_neck.f_item.dispatchEvent(new ListEvent(ListEvent.CHANGE) as Event);
			d.f_neck.f_cop.selectedIndex = a[4][2];
			for(var i:int=0;i<5;i++)
				d.f_neck.f_exop[i].selectedIndex = a[4][i+3];
			//各種装備
			var item:Array = [d.f_right,d.f_left,d.f_helm,d.f_armor,d.f_glove,d.f_garter,d.f_boots];
			for(i=0;i<item.length;i++){
				item[i].f_kind.selectedIndex = a[5+i][0];
				item[i].f_kind.dispatchEvent(new ListEvent(ListEvent.CHANGE) as Event);
				item[i].f_item.selectedIndex = a[5+i][1];
				item[i].f_item.dispatchEvent(new ListEvent(ListEvent.CHANGE) as Event);
				item[i].f_plus.selectedIndex = a[5+i][2];
				item[i].f_plus.dispatchEvent(new ListEvent(ListEvent.CHANGE) as Event);
				item[i].f_op.selectedIndex = a[5+i][3];
				item[i].f_luck.selected = a[5+i][4];
				item[i].f_enop.selectedIndex = a[5+i][5];
				item[i].f_enop.dispatchEvent(new ListEvent(ListEvent.CHANGE) as Event);
				item[i].f_enop_value.selectedIndex = a[5+i][6];
				item[i].f_cop.selectedIndex = a[5+i][7];
				for(var j:int=0;j<5;j++)
					item[i].f_exop[j].selectedIndex = a[5+i][8+j];
				for(j=0;j<5;j++){
					item[i].f_soop[j].selectedIndex = a[5+i][13+j*2];
					item[i].f_soop[j].dispatchEvent(new ListEvent(ListEvent.CHANGE) as Event);
					item[i].f_soop_value[j].selectedIndex = a[5+i][13+j*2+1];
				}
				for(j=0;j<2;j++){//ボーナスソケット
					item[i].f_sobonus[j].selectedIndex = a[5+i][23+j];
				}
				//380OP
				item[i].f_380.selected = a[5+i][25];
				//矢
				if(i==0)item[i].f_arrow.selectedIndex = a[5+i][26];
			}
			//リング
			item = [d.f_ring1,d.f_ring2];
			for(i=0;i<item.length;i++){
				item[i].f_kind.selectedIndex = a[12+i][0];
				item[i].f_kind.dispatchEvent(new ListEvent(ListEvent.CHANGE) as Event);
				item[i].f_item.selectedIndex = a[12+i][1];
				item[i].f_item.dispatchEvent(new ListEvent(ListEvent.CHANGE) as Event);
				item[i].f_cop.selectedIndex = a[12+i][2];
				for(j=0;j<5;j++)
					item[i].f_exop[j].selectedIndex = a[12+i][j+3];
			}
			//ステータス
			d.f_lv.text = a[14][0];
			d.f_str.text = a[14][1];
			d.f_agi.text = a[14][2];
			d.f_vit.text = a[14][3];
			d.f_ene.text = a[14][4];
			d.f_rec.text = a[14][5];
			d.f_lv.dispatchEvent(new FocusEvent(FocusEvent.FOCUS_OUT) as Event);
			//サポート系
			d.s_aplus.text = a[15][0];
			d.s_cplus.text = a[15][1];
			d.s_sl.text = a[15][2];
			d.s_sb.text = a[15][3];
			d.s_gplus.text = a[15][4];
			d.s_ba.selected = a[15][5];
			d.s_berserker.selected = a[15][6];
			d.s_se.selected = a[15][7];
			d.s_inner.text = a[15][8];
			d.s_weak.text = a[15][9];
			//補助アイテム系
			d.s_sera.selected = a[16][0];
			d.s_sake.selected = a[16][1];
			d.s_myou.selected = a[16][2];
			d.s_item.selectedIndex = a[16][3];
			d.s_scroll.selectedIndex = a[16][4];
			d.s_hiyaku.selectedIndex = a[16][5];
			//計算方法の指定（MAPなど）
			d.f_map.selectedIndex = a[17][0];
			d.f_map.dispatchEvent(new ListEvent(ListEvent.CHANGE) as Event);
			//マスターレベル
			d.f_mlv.text = a[18];
			for(i=0;i<MLV.num;i++){
				mlvcount.setSkill2(i,a[19][i]);
				//if(click::mlvLabel[i])click::mlvLabel[i].text = a[19][i];
			}
			//click::mlvShow();//画像の表示
			//click::mlvShowPoint();//ポイントの表示
			
			//2009/11/04
			//ペットサブフォーム
			d.f_petsub1.selectedIndex = a[20][0];
			d.f_petsub2.selectedIndex = a[20][1];
			
			//2009/12/03
			//カウンターリベリオン、ドッペルゲンガー用
			d.f_map_doublegoer_lv.selectedIndex = a[21];
			
			//2010/03/02
			//エンブレム・イベントでの経験値増加入力フォーム
			d.f_exp.text = a[22];
			
			//2010/09/28
			//レイジファイターサポートスキル
			d.s_ignore.selected = a[23][0];
			d.s_vit.selected = a[23][1];
			d.s_avoid.selected = a[23][2];
			
			//2011/03/24
			//ドッペルゲンガーとカウンターリベリオン
			d.f_map_doublegoer_ptm.selectedIndex = a[24][0];
			d.f_map_imperialguardian_lv.selectedIndex = a[24][1];
			
			//Alert.show(a.toString());
		}
		/**
		 * インポートデータをShardObject用のデータに変換する。
		 * @param Array インポートデータ
		 * @return Array ShardObject用のデータ
		 */
		public function importData(a2:Array):Array{
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
			a[18] = a2[index++]
			a[19] = new Array();
			for(i=0;i<=MLV.num;i++)//マスターレベル
				a[19][i] = parseInt(a2[index++]);
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
