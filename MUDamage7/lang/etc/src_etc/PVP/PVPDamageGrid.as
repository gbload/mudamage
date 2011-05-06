package PVP {
	import mx.containers.*;
	import mx.controls.*;
	import mx.controls.dataGridClasses.DataGridColumn;
	/**
	 * ダメージ計算結果一覧のDataGrid
	 */
	public class PVPDamageGrid extends DataGrid {
		/**
		 * ヘッダ
		 * {fieldName,headerText,width}
		 */
		private static var headers:Array = [
				["skillname","Skill Name",150],
				["hitper","1Hit Dmg/sec",150],
				["speed","count/min",0],
				["even","1Hit Average",0],
				["minmax","min - max",150],
				["cri","Critical",0],
				["exd","XDMG",0],
				["hit","Hit Rate",0]
		];
		/**
		 * コンストラクタ
		 */
		public function PVPDamageGrid(result:Array) {
			super();
			// ヘッダの作成
			createHeader();
			// データの登録
			this.dataProvider = result;
			
		}
		/**
		 * 初期化
		 */
		private function init():void{
		}
		/**
		 * ヘッダを作成
		 */
		private function createHeader():void{
			var a:Array = new Array(); // ヘッダのカラムを入れる配列

			// ヘッダの作成
			for each(var h:Array in headers){
				var dgc:DataGridColumn = new DataGridColumn();
				dgc.dataField = h[0];
				dgc.headerText = h[1];
				if(h[2] != 0)dgc.width = h[2];
				a.push(dgc);
			}
			
			this.columns = a; // ヘッダを登録
		}
	}
}
