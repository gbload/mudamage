package FileIO {
	import flash.net.SharedObject;
	import flash.net.SharedObjectFlushStatus;
	
	import mx.controls.*;
	
	import Csv.*;
	/**
	 * 静的に取り扱えるFileIO関連メソッド
	 */
	public static class StaticFileIO {
		private var d:Dat;
		
		public static function init(dat:Dat):void{
			this.d = dat;
		}
		/**
		 * コンストラクタ
		 */
		public function StaticFileIO() {
			
		}
		/**
		 * 指定したタイトルのデータを取得します。
		 * @param title:String
		 * @return array データ
		 */
		public static function open(title:String):Array{
			var myso:SharedObject = SharedObject.getLocal("mud");
			var soa:Array = myso.data.mud;
			var ch:Boolean = false;
			var a:Array;
			for(var k:int=0;k<myso.data.mud.length;k++){
				if(myso.data.mud[k][0] == title){a = myso.data.mud[k];ch=true;break;}
			}
			if(!ch){
				Alert.show("指定したタイトルのデータが見つかりませんでした。");
				return false;
			}
			return a;
		}
		/**
		 * 全てのデータを取得します。
		 * @return array データの配列
		 */
		public static function openAll():Array{
			var myso:SharedObject = SharedObject.getLocal("mud");
			var soa:Array = myso.data.mud;
			var ch:Boolean = false;
			var a:Array = new Array();
			for(var k:int=0;k<myso.data.mud.length;k++){
				a.push(myso.data.mud[k]);
			}
			return a;
		}
		public static function getData(title:String):Array{
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
	}
}
