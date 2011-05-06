package AAgetter
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.containers.Canvas;
	import mx.containers.Form;
	import mx.containers.HBox;
	import mx.containers.VBox;
	import mx.controls.Alert;
	import mx.controls.Button;
	import mx.controls.ComboBox;
	import mx.controls.Label;
	import mx.core.Container;
	
	public class AAgetter
	{
		public function AAgetter()
		{
			//石造破壊シミュレータを作る
			canvas = new Canvas();
			//外枠
			var form:Container = new Form() as Container;
			canvas.addChild(form);
				//ラベル
				createTitle(form);
				//クリアボタン
				createClearButton(form);
				//計算フォームから追加するためのボタン
				createAddCalcData(form);
				//PT A
				pt_A = createPTForm(form);
				pt_A.name = "PT_A";
					//ラベルと追加ボタン
					createPTHeader(pt_A);
					//入力フォームの作成
					//createInputForm(pt_A,pt_A.name);
				//PT A
				pt_B = createPTForm(form);
				pt_B.name = "PT_B";
					//ラベルと追加ボタン
					createPTHeader(pt_B);
				//CalcForm
				createCalcForm(form);
					
		}
		//石造破壊シミュレータのCanvas
		private var canvas:Canvas;
		private var pt_A:Container;
		private var pt_B:Container;
		private var ptm_A:Array=new Array();
		private var ptm_B:Array=new Array();
		private var ptcount:int;
		private var calcSkill:ComboBox;
		private var calcAddButton:Button;
		public function getContainer():Container{
			//石造破壊シミュレータのCanvasを返す
			return canvas;
		}
		//各種フォーム====================================================
		private function createClearButton(container:Container):void{
			var button:Button = new Button();
			button.label = "clear";
			button.addEventListener(MouseEvent.CLICK,eventClear);
			container.addChild(button);
		}
		private function createTitle(container:Container):void{
			var la:Label = new Label();
			la.text = "Blood Castle AA Getter Simulator(beta)";
			la.setStyle("fontSize","18");
			la.setStyle("fontWeight","bold");
			container.addChild(la);
		}
		private function createAddCalcData(container:Container):void{
			var hbox:HBox = new HBox();
			container.addChild(hbox);
			
			//スキル選択フォーム
			var co:ComboBox = new ComboBox();
			co.dataProvider = [
							 "Death Stab"
							,"Multi-Shot"
							,"Fire Scream"
							,"Chaotic Diseier"
							,"Fire Slash"
							,"Chain Lightning"
							];
			co.rowCount = 10;
			hbox.addChild(co);
			calcSkill = co;
			
			//計算ボタン
			var b:Button = new Button();
			b.label = "Add from MUDamage Form";
			hbox.addChild(b);
			calcAddButton = b;
		}
		private function createPTForm(container:Container):Container{
			var form:Form = new Form();
			form.setStyle("borderStyle","solid");
			container.addChild(form);
			return form as Container;
		}
		private function createPTHeader(container:Container):void{
			var hbox:HBox = new HBox();
			container.addChild(hbox);
				//タイトルラベル
				createLabel(hbox,container.name,15);
				//追加ボタン
				createAddButton(hbox,container.name);
		}
		private function createAddButton(container:Container,ptgroup:String):void{
			var button:Button = new Button();
			button.label = "Add";
			button.name = ptgroup;
			button.addEventListener(MouseEvent.CLICK,eventAddInputForm);
			container.addChild(button);
		}
		private function createLabel(container:Container,str:String,size:int=10):void{
			var la:Label = new Label();
			la.text = str;
			la.setStyle("fontSize",size.toString());
			la.setStyle("fontWeight","bold");
			container.addChild(la);
		}
		private function createInputForm(container:Container,ptgroup:String):void{
			//一意な名前を決定する
			var name:String = ptgroup + ":" + ptcount.toString();
			ptcount++;
			//外枠
			var hbox:HBox = new HBox();
			hbox.name = name;
			container.addChild(hbox);
				//縦
				var vbox:VBox = new VBox();
				hbox.addChild(vbox);
					//削除ボタン
					var button:Button = new Button();
					button.label = "Remove";
					button.name = name;
					button.addEventListener(MouseEvent.CLICK,eventDeleteInputForm);
					vbox.addChild(button);
					//移動ボタン
					button = new Button();
					button.label = "Move";
					button.name = name;
					button.addEventListener(MouseEvent.CLICK,eventMoveInputForm);
					vbox.addChild(button);
				//InputFormの作成
				var inputform:InputForm = new InputForm(name);
				hbox.addChild(inputform.getContainer());
				if(ptgroup == pt_A.name)ptm_A.push(inputform);
				else ptm_B.push(inputform);
		}
		private function createCalcForm(container:Container):void{
			var calcform:CalcForm = new CalcForm(this);
			container.addChild(calcform.getContainer());
		}
		//イベント========================================================
		private function eventClear(event:Event):void{
			for(var i:int=0;i<ptm_A.length;i++)
				(ptm_A[i] as InputForm).clearResult();
			for(i=0;i<ptm_B.length;i++)
				(ptm_B[i] as InputForm).clearResult();
		}
		private function eventAddInputForm(event:Event):void{
			if(event.target.name == pt_A.name)
				createInputForm(pt_A,pt_A.name);
			else
				createInputForm(pt_B,pt_B.name);
		}
		private function eventDeleteInputForm(event:Event):void{
			var name:Array = (event.target.name as String).split(":");
			if(name[0] == pt_A.name)
				deleteInputForm(pt_A,ptm_A,event.target.name);
			else
				deleteInputForm(pt_B,ptm_B,event.target.name);
		}
		private function eventMoveInputForm(event:Event):void{
			var name:Array = (event.target.name as String).split(":");
			if(name[0] == pt_A.name)
				moveInputForm(pt_A,pt_B,ptm_A,ptm_B,event.target.name);
			else
				moveInputForm(pt_B,pt_A,ptm_B,ptm_A,event.target.name);
		}
		//補助関数========================================================
		private function deleteInputForm(pt:Container,ptm:Array,name:String):void{
			var tmp:Array = new Array();
			for(var i:int=0;i<ptm.length;i++){
				if(ptm[i].name == name){//削除する対象
					pt.removeChild(pt.getChildByName(name));//キャンバスから削除
					continue;
				}else{
					tmp.push(ptm[i]);
				}
			}
			if(pt.name == pt_A.name)ptm_A = tmp;
			else ptm_B = tmp;
		}
		private function moveInputForm(pt_pre:Container,pt_next:Container,ptm_pre:Array,ptm_next:Array,name:String):void{
			var tmp:Array = new Array();
			for(var i:int=0;i<ptm_pre.length;i++){
				if(ptm_pre[i].name == name){//移動する対象
					//移動元のキャンバスから削除
					pt_pre.removeChild(pt_pre.getChildByName(name));
					//移動先のキャンバスへ追加
					createInputForm(pt_next,pt_next.name);
					ptm_next[ptm_next.length-1].setData(ptm_pre[i].getData());
					continue;
				}else{
					tmp.push(ptm_pre[i]);
				}
			}
			if(pt_pre.name == pt_A.name)ptm_A = tmp;
			else ptm_B = tmp;
		}
		public function getData():Array{
			var a:Array = new Array();
			for(var i:int=0;i<ptm_A.length;i++)
				a.push((ptm_A[i] as InputForm).getData());
			for(i=0;i<ptm_B.length;i++)
				a.push((ptm_B[i] as InputForm).getData());
			return a;
		}
		public function setData(datas:InputData):void{
			//InputFormの作成
			createInputForm(pt_A,pt_A.name);
			//データをセットする
			ptm_A[ptm_A.length-1].setData(datas);
		}
		public function setResult(datas:Array):void{
			for each(var data:InputData in datas){
				for each(var ptm:InputForm in ptm_A)
					if(ptm.name == data.name)ptm.setResult(data);
				for each(ptm in ptm_B)
					if(ptm.name == data.name)ptm.setResult(data);
			}
		}
		public function addEvent(func:Function):ComboBox{
			calcAddButton.addEventListener(MouseEvent.CLICK,func);
			return calcSkill;
		}
	}
}