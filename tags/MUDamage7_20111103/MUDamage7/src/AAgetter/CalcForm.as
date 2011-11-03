package AAgetter
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.containers.Canvas;
	import mx.containers.HBox;
	import mx.controls.Alert;
	import mx.controls.Button;
	import mx.controls.ComboBox;
	import mx.core.Container;
	
	public class CalcForm
	{
		public function CalcForm(aa:AAgetter)
		{
			//CalcFormを作成
			aagetter = aa;
			canvas = new Canvas();
			//外枠
			var hbox:HBox = new HBox();
			canvas.addChild(hbox);
				//BCLV
				createBCLV(hbox);
				//計算ボタン
				createCalcButton(hbox);
				//連続計算ボタン
				createContinueButton(hbox);
		}
		
		private var canvas:Canvas;
		private var bclv:ComboBox;
		
		private var aagetter:AAgetter;
		
		private var timer:Timer = new Timer(0,0);
		private var calc:Calculation;
		
		public function getContainer():Container{
			//CalcFormのCanvasを返す
			return canvas;
		}
		
		//各種フォーム====================================================
		private function createBCLV(container:Container):void{
			bclv = new ComboBox();
			bclv.dataProvider = [
						 "BC1 HP65000"
						,"BC2 HP105000"
						,"BC3 HP145000"
						,"BC4 HP185000"
						,"BC5 HP225000"
						,"BC6 HP265000"
						,"BC7 HP305000"
						,"BC8 HP345000"
						];
			container.addChild(bclv);
		}
		private function createCalcButton(container:Container):void{
			var button:Button = new Button();
			button.label = "開始";
			button.addEventListener(MouseEvent.CLICK,eventCalc);
			container.addChild(button);
		}
		private function createContinueButton(container:Container):void{
			var button:Button = new Button();
			button.label = "連続";
			button.addEventListener(MouseEvent.CLICK,eventContinue);
			container.addChild(button);
		}
		//イベント========================================================
		private function eventCalc(event:Event):void{
			if(timer.running)return;
			//入力されたデータの取得
			var datas:Array = aagetter.getData();
			if(datas.length == 0)return;
			//計算クラスの初期化
			calc = new Calculation();
			//データのセット
			for(var i:int=0;i<datas.length;i++){
				calc.setData(datas[i]);
			}
			calc.setBCLV(bclv.selectedIndex + 1);
			//計算開始
			datas = calc.Calc();
			//計算結果の出力
			aagetter.setResult(datas);
		}
		private function eventContinue(event:Event):void{
			//入力されたデータの取得
			var datas:Array = aagetter.getData();
			if(datas.length == 0)return;
			//ボタンのラベルを変更
			event.target.label = "停止";
			//イベントの書き換え
			event.target.removeEventListener(MouseEvent.CLICK,eventContinue);
			event.target.addEventListener(MouseEvent.CLICK,eventStop);
			//計算クラスの初期化
			calc = new Calculation();
			//データのセット
			for(var i:int=0;i<datas.length;i++){
				calc.setData(datas[i]);
			}
			calc.setBCLV(bclv.selectedIndex + 1);
			//タイマーの準備
			timer = new Timer(0,9999999);
			timer.addEventListener(TimerEvent.TIMER,eventTimerCalc);
			timer.start();
		}
		private function eventStop(event:Event):void{
			//タイマーの停止
			timer.stop();
			//ボタンのラベルを変更
			event.target.label = "連続";
			//イベントの書き換え
			event.target.removeEventListener(MouseEvent.CLICK,eventStop);
			event.target.addEventListener(MouseEvent.CLICK,eventContinue);
		}
		private function eventTimerCalc(event:Event):void{
			event.target.repeatCount = 0;
			//計算開始
			var datas:Array = calc.Calc();
			//計算結果の出力
			aagetter.setResult(datas);
		}
		//補助関数========================================================
	}
}