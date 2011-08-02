package IO.FileIO {
	import flash.net.SharedObject;
	import flash.net.SharedObjectFlushStatus;
	
	import mx.controls.*;
	/**
	 * 静的に取り扱えるFileIO関連メソッド
	 */
	public class StaticFileIO {
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
				return null;
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
		/**
		 * 指定したタイトルでデータを保存します。
		 * @param title
		 */
		public static function save(a:Array):Boolean{
			var myso:SharedObject = SharedObject.getLocal("mud");
	
			//上書き保存のチェック
			var ch:Boolean = false;
			var soa:Array = myso.data.mud;
			if(soa == null){
				soa = new Array();
				soa.push(a);
			}else{
				for(var k:int=0;k<soa.length;k++){
					if(soa[k][0] == a[0]){
						soa[k] = a;
						ch=true;
						break;
					}
				}
				if(ch == false)
						soa.push(a);
			}
			myso.data.mud = soa;
		
			//なんかよく分からないけどエラーキャッチ
			try{
				var flushStatus:String = myso.flush();
			}catch(error:Error){
				Alert.show("Error:データの保存に失敗しました。　"+flushStatus);
				return false;
			}
		    if (flushStatus != null) {
		        switch (flushStatus) {
		            case SharedObjectFlushStatus.PENDING:
		                Alert.show("データの保存を許可してください。");
		                return false;
		            case SharedObjectFlushStatus.FLUSHED:
		                return true;
		        }
		    }
		    return false;
		}
		/**
		 * データを削除します。
		 * @param title
		 */
		public static function deleteData(title:String):Boolean{
			var myso:SharedObject = SharedObject.getLocal("mud");//現在保存されてるデータ
			var ch:Boolean = false;
			for(var i:int=0;i<myso.data.mud.length;i++){
				if(myso.data.mud[i][0] == title){
					myso.data.mud.splice(i,1);
					ch = true;
					break;
				}
			}
			if(ch)
				return true;
			else
				return false;
		}
		/**
		 * 指定したタイトルが既に存在していないかチェックします。
		 * 既に存在している場合、trueになります。
		 * @param title
		 * @return boolean
		 */
		public static function isDuplication(title:String):Boolean{
			//上書き保存のチェック
			var myso:SharedObject = SharedObject.getLocal("mud");//現在保存されてるデータ
			var i:int=0;
			var ch:Boolean = false;
			if(myso.data.mud != null){
				for(i=0;i<myso.data.mud.length;i++){
					if(myso.data.mud[i][0] == title){ch=true;break;}
				}
			}
			return ch;
		}
		/**
		 * 保存されているデータのタイトル一覧を返します。
		 * @return array タイトル一覧
		 */
		public static function getTitleList():Array{
			var myso:SharedObject = SharedObject.getLocal("mud");//現在保存されてるデータ
			var a:Array = new Array();
			//読み込み
			if(myso.data.mud != null){
				for(var i:int=0;i<myso.data.mud.length;i++){
					a.push("-" + myso.data.mud[i][0]);
				}
			}
			return a;
		}
	}
}
