package AAgetter
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.FocusEvent;
	
	import mx.containers.Canvas;
	import mx.containers.FormItem;
	import mx.containers.HBox;
	import mx.containers.VBox;
	import mx.controls.ComboBox;
	import mx.controls.TextArea;
	import mx.controls.TextInput;
	import mx.core.Container;
	
	public class InputForm
	{
		public function InputForm(ptgroup:String)
		{
			//入力フォームを作る
			name = ptgroup;
			canvas = new Canvas();
			//外枠
			var h:HBox = new HBox();
			canvas.addChild(h);
				//2列目
				var vbox:VBox = new VBox();
				h.addChild(vbox);
					//いろいろと入力するエリア
					result = createTextArea(vbox);
				//2列目
				vbox = new VBox();
				h.addChild(vbox);
					//1段目
					var hbox:HBox = new HBox();
					vbox.addChild(hbox);
						//タイトル
						title = createTitle(hbox);
						//スキル
						skill = createSkill(hbox);
						//攻撃速度
						speed = createNumberInput("攻撃速度",hbox,3);
						//攻撃速度(ms)
						speedms = createNumberInput("速度(ms)",hbox,4);
						//ディレイ(ms)
						delay = createNumberInput("ディレイ(ms)",hbox,4);
					//2段目
					hbox = new HBox();
					vbox.addChild(hbox);
						//最小ダメージ
						min = createNumberInput("最小",hbox,5);
						//最大ダメージ
						max = createNumberInput("最大",hbox,5);
						//クリティカルダメージ
						cri = createNumberInput("クリ",hbox,5);
						//EXDダメージ
						exd = createNumberInput("EXD",hbox,5);
						//クリティカル確率
						criper = createNumberInput("クリ確率",hbox,3,true);
						//EXD確率
						exdper = createNumberInput("EXD確率",hbox,3,true);
						//ダブルダメージ確率
						wdper = createNumberInput("WD確率",hbox,3,true);
		}
		//入力フォーム
		private var canvas:Canvas;
		
		private var result:TextArea;//結果を表示するためのテキストエリア
		private var hit:int=0;//累積HIT数
		private var damage:int=0;//累積ダメージ
		private var win:int=0;//勝利回数
		private var attempts:int=0;//試行回数
		
		public var name:String;
		
		private var title:TextInput;
		private var skill:ComboBox;
		private var speed:TextInput;
		private var speedms:TextInput;
		private var delay:TextInput;
		private var min:TextInput;
		private var max:TextInput;
		private var cri:TextInput;
		private var exd:TextInput;
		private var criper:TextInput;
		private var exdper:TextInput;
		private var wdper:TextInput;
		
		public function getContainer():Container{
			//入力フォームを返す
			return canvas;
		}
		//各種フォーム====================================================
		private function createFormItem(label:String,obj:DisplayObject):Container{
			var fi:FormItem = new FormItem();
			fi.label = label;
			fi.addChild(obj);
			return fi;
		}
		private function createTextArea(container:Container):TextArea{
			var ta:TextArea = new TextArea();
			ta.width = 100;
			ta.height = 60;
			ta.editable = false;
			ta.setStyle("fontSize","8");
			container.addChild(ta);
			return ta;
		}
		private function createTitle(container:Container):TextInput{
			var ti:TextInput = new TextInput();
			//ti.width = 80;
			ti.text = "タイトル";
			container.addChild(ti);
			return ti;
		}
		private function createSkill(container:Container):ComboBox{
			var sel:ComboBox = new ComboBox();
			sel.dataProvider = [
					 "ゴッドブロー"
					,"マルチショット"
					,"ファイアスクリーム"
					,"カオティックディセイアー"
					,"ブラッドアタック"
					,"チェーンライトニング"
					];
			container.addChild(sel);
			return sel;
		}
		private function createNumberInput(label:String,container:Container,maxChars:int,percent:Boolean=false):TextInput{
			var ti:TextInput = new TextInput();
			ti.restrict = "0-9";
			ti.maxChars = maxChars;
			ti.width = 16 + maxChars * 8;
			if(percent){
				ti.addEventListener(FocusEvent.FOCUS_OUT,validatePercent);
				ti.text = "0";
			}else{
				ti.addEventListener(FocusEvent.FOCUS_OUT,validateNotZero);
				ti.text = "1";
			}
			container.addChild(createFormItem(label,ti));
			return ti;
		}
		//イベント========================================================
		/**
		 * validatePercent(event:Event):void
		 * 有効な値の範囲であるかチェック(0<=i<=100)
		 **/
		private function validatePercent(event:Event):void{
			var i:int = parseInt(event.target.text);
			if(i > 100) i=100;
			event.target.text = i.toString();
		}
		/**
		 * validateNotZero(event:Event):void
		 * 有効な値の範囲であるかチェック(0<i)
		 **/
		private function validateNotZero(event:Event):void{
			var i:int = parseInt(event.target.text);
			if(i == 0) i=1;
			event.target.text = i.toString();
		}
		//補助関数========================================================
		public function getData():InputData{
			var id:InputData = new InputData();
			id.title = this.title.text;
			id.name = this.name;
			id.skill = this.skill.selectedLabel;
			id.speed = parseInt(this.speed.text);
			id.speedms = parseInt(this.speedms.text);
			id.delay = parseInt(this.delay.text);
			id.min = parseInt(this.min.text);
			id.max = parseInt(this.max.text);
			id.cri = parseInt(this.cri.text);
			id.exd = parseInt(this.exd.text);
			id.criper = parseInt(this.criper.text);
			id.exdper = parseInt(this.exdper.text);
			id.wdper = parseInt(this.wdper.text);
			return id;
		}
		public function setData(id:InputData):void{
			var index:int=0;
			this.title.text = id.title;
			//this.name = id.name;
			for(var i:int=0;i<this.skill.dataProvider.length;i++)
				if(this.skill.dataProvider[i] == id.skill)
					this.skill.selectedIndex = i;
			this.speed.text = id.speed.toString();
			this.speedms.text = id.speedms.toString();
			this.delay.text = id.delay.toString();
			this.min.text = id.min.toString();
			this.max.text = id.max.toString();
			this.cri.text = id.cri.toString();
			this.exd.text = id.exd.toString();
			this.criper.text = id.criper.toString();
			this.exdper.text = id.exdper.toString();
			this.wdper.text = id.wdper.toString();
		}
		public function setResult(id:InputData):void{
			hit += id.tmpspeed/id.speedms;
			damage += id.tmpdamage;
			if(id.tmpwin)win++;
			this.attempts++;
			
			var str:String = "攻撃回数 " + (Math.floor(hit*10/attempts)/10).toString() + "回\n";
			str += "平均 " + (Math.floor(damage*10/attempts)/10).toString() + "ダメージ\n";
			str += "勝利回数 " + win + "回\n";
			str += "勝率" + (Math.floor(win*1000/attempts)/10).toString() + "%";
			result.text = str;
		}
		public function clearResult():void{
			this.result.text = "";
			this.hit = 0;
			this.damage = 0;
			this.win = 0;
			this.attempts = 0;
		}
	}
}
