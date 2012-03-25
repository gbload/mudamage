package Calc.ResultScreen {
	import mx.core.ClassFactory;
	import mx.containers.*;
	import mx.controls.*;
	import mx.controls.dataGridClasses.DataGridColumn;
	/**
	 * ダメージ計算結果一覧のDataGrid
	 */
	public class DamageGrid extends DataGrid {
		/**
		 * ヘッダ
		 * {fieldName,headerText,width}
		 */
		private static var headers:Array = [
				["skillname","スキル名",200],
				["total","合計(/秒)",60],
				["skillhit","HIT数",40],
				["averageper","1HITダメ/秒",60],
				["speed","回/分",50],
				["average","1HIT平均",60],
				["minmax","最小〜最大",100],
				["cri","クリティカル",60],
				["exd","EXD",60],
				["hit","命中率",70]
		];
		/**
		 * コンストラクタ
		 */
		public function DamageGrid(result:Array) {
			super();
			// ヘッダの作成
			createHeader();
			// データの登録
			this.dataProvider = result;
			// 行数の指定
			this.rowCount = result.length;
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
				dgc.itemRenderer = new ClassFactory(itemRenderer01);
				a.push(dgc);
			}
			
			this.columns = a; // ヘッダを登録
		}
	}
}
