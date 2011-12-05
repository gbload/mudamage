package Form.MUDamage {
	import mx.controls.*;
	import mx.containers.*;
	import mx.core.*;
	import mx.events.*;
	import flash.events.*;
	import flash.utils.Timer;
	
	import IO.FileIO.*;
	import Data.Database.*;
	import Common.*;
	/**
	 * FormMUDamageをジョブ毎に管理する
	 * @author sinlion
	 *
	 */
	public class Controller {
		private var container:Container;
		private var tabs:Array;
		private var now_tab:TabNavigator;
		private var job_bar:ToggleButtonBar;

		/**
		 * コンストラクタ
		 */
		public function Controller(container:Container){
			this.container = container;
			// 初期化
			tabs = new Array();
			// ジョブのToggleButton作成
			job_bar = new JobBar(this);
			container.addChild(job_bar);
			// タブナビゲーターの作成
			now_tab = createTab(0,true);
			tabs[0] = now_tab;
			container.addChild(now_tab);
		}
		/**
		 * TabNavigator
		 */
		private function createTab(job:int=0,flag:Boolean=false):TabNavigator{
			var tab:TabNavigator = new TabNavigator();
			// 位置を調整
			tab.x = 5;
			tab.y = 50;
			// 大きさを設定
			tab.width = 1000;
			tab.percentHeight = 100;
			// 境界線をなくす
			tab.setStyle("borderStyle","none");
			// タブを閉じるイベント
//			tab.addEventListener(KeyboardEvent.KEY_DOWN,eventKey);
//			tab.addEventListener(KeyboardEvent.KEY_UP,eventKey);
//			tab.addEventListener(FlexEvent.VALUE_COMMIT,eventClickClose);
			
			// 計算フォームの作成
			if(flag){
				var timer:Timer = new Timer(10,1);
				timer.addEventListener(TimerEvent.TIMER, functionEventTimer(tab,job));
				timer.start();
			}else{
				functionEventTimer(tab,job)(null);
			}
			
			return tab;
		}
		/**
		 * キー保存
		 */
		private var isShift:int = -1;
		private var isDuplicate:Boolean = false;
		private function eventKey(event:KeyboardEvent):void{
			if(event.shiftKey){
				isShift = event.target.selectedIndex;
			}else{
				isShift = -1;
			}
		}
		/**
		 * 閉じるイベント
		 */
		private function eventClickClose(event:FlexEvent):void{
			if(!isDuplicate && isShift!=-1){
				if(now_tab.selectedIndex!=0)
					now_tab.removeChild(now_tab.getChildAt(now_tab.selectedIndex));
				isDuplicate = true;
				if(now_tab.selectedIndex<isShift)
					isShift -= 1;
				now_tab.selectedIndex = isShift;
			}else{
				isDuplicate = false;
			}
		}
		/**
		 * function event timer
		 * 連続して処理をするとフォームのラベルがつかないため。
		 */
		private function functionEventTimer(tab:TabNavigator,job:int):Function{
			return function(event:Event):void{
				tab.addChild(createForm(job));
			};
		}
		/**
		 * Change TabNavigator
		 */
		public function changeTab(job:int=0):void{
			if(now_tab!=null){
				// 現在のタブを非表示
				now_tab.visible = false;
				// 新しいタブバーが未作成の場合、作成する
				if(tabs[job]==null){
					tabs[job] = createTab(job);
					container.addChild(tabs[job]);
				}
				// 新しいタブを表示する
				tabs[job].visible = true;
				// 現在のタブを変更する
				now_tab = tabs[job];
				// job_barと同期させる
				if(job_bar.selectedIndex != job)
					job_bar.selectedIndex = job;
			}
		}
		/**
		 * フォームを新規作成
		 */
		private function createForm(job:int=-1):FormMUDamage{
			var form:FormMUDamage = new FormMUDamage(this, job);
			form.label = "計算フォーム";
			
			return form;
		}
		/**
		 * 計算結果の表示
		 */
		public function showResult(result:Container):void{
			now_tab.addChild(result);
		}
		/**
		 * 現在表示されているフォームを取得
		 */
		public function getNowForm():FormMUDamage{
			return now_tab.getChildAt(0) as FormMUDamage;
		}
		public function getForm(job:int):FormMUDamage{
			return tabs[job].getChildAt(0) as FormMUDamage;
		}
	}
}