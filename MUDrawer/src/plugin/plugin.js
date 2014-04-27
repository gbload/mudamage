/*****************************************************
 * plugin.js
 * プラグイン管理
 * 　各jsファイルの依存関係等を管理する。
 * 
 *****************************************************/

/**
 * プラグイン管理オブジェクト
 * 
 * @class
 * @name plugin
 * @memberOf mudrawer.src
 * @namespace mudrawer.src.plugin
 */
mudrawer.src.plugin = {
		/**
		 * Array dependency
		 * 依存関係を保持する変数
		 * 
		 * @static
		 * @memberOf mudrawer.src.plugin
		 * @type Array
		 */
		dependency: [],

		/**
		 * void setDependency()
		 * 依存関係を登録する
		 * 
		 * @static
		 * @memberOf mudrawer.src.plugin
		 * @param Array 依存するファイル名の配列
		 * @type void
		 */
		setDependency: function(array){
			
		}
};