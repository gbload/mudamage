package Form.MUDamage.SubForm {
	import mx.controls.*;
	import mx.containers.*;
	import mx.core.*;
	import mx.collections.*;
	import mx.events.*;
	import flash.events.*;
	
	import Data.Database.*;
	
	public class FormCommon {
		public function FormCommon() {
			
		}
		private static var c:Internal = Internal.getInstance();
		/**
		 * コンポーネントを非表示にする
		 */
		public static function hide(obj:UIComponent):void{
			obj.visible = false;
			obj.includeInLayout = false;
		}
		/**
		 * コンポーネントを表示する
		 */
		public static function show(obj:UIComponent):void{
			if(obj!=null){
				obj.includeInLayout = true;
				obj.visible = true;
			}
		}
		/**
		 * 重複選択しているか確認
		 * @param ComboBoxの配列
		 * @param zero_flag 0インデックスも重複に含める場合true
		 * @return trueの場合、重複している
		 */
		public static function isDuplication(components:Array, zero_flag:Boolean=false):Boolean {
			for(var i:int=0; i<components.length; i++)
				for(var j:int=i+1; j<components.length; j++)
					if(zero_flag || (!zero_flag && components[i].selectedIndex != 0))
						if(components[i].selectedIndex == components[j].selectedIndex)
							return true;
			return false;
		}
		/**
		 * セレクタ
		 */
		public static function labelfunc(item:Object):String{
			if(item.toString() == "")return "";
			return item[1];
		}
		/**
		 * セレクタ2
		 */
		public static function labelfunc0(item:Object):String{
			if(item.toString() == "")return "";
			return item[0];
		}
	}
}
