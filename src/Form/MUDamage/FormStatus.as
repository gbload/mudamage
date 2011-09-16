package Form.MUDamage {
	import mx.controls.*;
	import mx.containers.*;
	import mx.core.*;
	import mx.collections.*;
	import mx.events.*;
	import mx.managers.*;
	import flash.events.*;

	import Form.MUDamage.SubForm.*;
	import Data.Database.*;
	
	public class FormStatus extends Form{
		private var d:FormMUDamage;
	
		private var level:TextInput;
		private var point:Label;
		private var fruit:Label;
		private var str:TextInput;
		private var agi:TextInput;
		private var vit:TextInput;
		private var ene:TextInput;
		private var rec:TextInput;
	
		private var mlv:FormMasterSkillTree;
	
		private var hbox:HBox;
		/**
		 * コンストラクタ
		 */
		public function FormStatus(d:FormMUDamage) {
			this.d = d;
			
			this.x = 350;
			this.setStyle("borderStyle","solid");
			
			initForm();
		}
		public function reset():void{
			str.text = "";
			agi.text = "";
			vit.text = "";
			ene.text = "";
			rec.text = "";
			//統率フォームを非表示にする
			if(d.getJob().selectedLabel != "ダークロード")
				rec.parent.visible = false;
			//値を初期化
			level.dispatchEvent(new FocusEvent(FocusEvent.FOCUS_OUT) as Event);
			
		}
		/**
		 * フォームを初期化
		 */
		private function initForm():void{
			ln();
			createLevel();
			createPoint();
			createMLV();
			
			ln();
			createStatus();
		}
		/**
		 * 改行
		 */
		private function ln():void{
			hbox = new HBox();
			this.addChild(hbox);
		}
		/**
		 * Levelフォームの作成
		 */
		private function createLevel():void{
			//Levelフォームの作成
			var lvform:FormItem = new FormItem();
			lvform.label = "LV：";
			lvform.direction = "horizontal";
			level = new TextInput();
			level.restrict = "0-9";
			level.maxChars = 3;
			level.width = 42;
			level.addEventListener(FocusEvent.FOCUS_IN,FormCommon.eventFocusAllSelection);
			level.addEventListener(FocusEvent.FOCUS_OUT,eventChangeStatus);
			lvform.addChild(level);
			hbox.addChild(lvform);
		}
		/**
		 * ポイントラベルの作成
		 */
		private function createPoint():void{
			var fi:FormItem;
			// ラベル
			fi = new FormItem();
			fi.label = "ポイント";
			hbox.addChild(fi);
			// ポイント
			point = new Label();
			point.text = "2000";
			fi.addChild(point);
			// 実のラベル
			fi = new FormItem();
			fi.label = "    生成";
			hbox.addChild(fi);
			// 実のポイント
			fruit = new Label();
			fruit.text = "100/106";
			fi.addChild(fruit);
			//位置調整用ダミー
		}
		/**
		 * MLVフォームの作成
		 */
		private function createMLV():void{
			//MLVボタンの作成
			var button:Button = new Button();
			button.addEventListener(MouseEvent.CLICK,eventClickMLV);
			button.label = "MLV";
			hbox.addChild(button);
			// MLVフォームの作成
			mlv = new FormMasterSkillTree(d);
		}
		/**
		 * ステータスフォームの作成
		 */
		private function createStatus():void{
			//各種ステータスフォームの作成
			var stform:FormItem;
			var l:Array = ["力：","敏捷：","体力：","エナジー：","統率："];
			for(var i:int = 0;i<5;i++){
				stform = new FormItem();
				stform.label = l[i];
				var st:TextInput = new TextInput();
				if(i==0)str = st;
				if(i==1)agi = st;
				if(i==2)vit = st;
				if(i==3)ene = st;
				if(i==4)rec = st;
				st.restrict = "0-9";
				st.maxChars = 4;
				st.width = 52;
				st.addEventListener(FocusEvent.FOCUS_IN,FormCommon.eventFocusAllSelection);
				st.addEventListener(FocusEvent.FOCUS_OUT,eventChangeStatus);
				stform.addChild(st);
				hbox.addChild(stform);
			}
			
			//統率フォームを非表示にする
			if(d.getJob().selectedLabel != "ダークロード")
				rec.parent.visible = false;
			
			//値を初期化
			level.dispatchEvent(new FocusEvent(FocusEvent.FOCUS_OUT) as Event);
		}
		/**
		 * ステータスフォームの変更時イベント
		 */
		private function eventChangeStatus(event:Event):void{
			var jobpoint:int = 0;
			// Validate
			validateLevel();
			jobpoint += validateStatus(str,"str");
			jobpoint += validateStatus(agi,"agi");
			jobpoint += validateStatus(vit,"vit");
			jobpoint += validateStatus(ene,"ene");
			if(d.getJob().selectedLabel == "ダークロード"){
				jobpoint += validateStatus(rec,"rec");
			}
			// ポイント変更
			changePoint(jobpoint);
		}
		/**
		 * Levelフォームの値を検証
		 */
		private function validateLevel():void{
			// level制限
			var i:int = parseInt(level.text);
			if(i > 400) i = 400;
			if(i == 0) i = 1;
			level.text = i.toString();
		}
		/**
		 * ステータスフォームの値を検証
		 */
		private function validateStatus(obj:TextInput,obj_name:String):int{
			//　制限
			var i:int = parseInt(obj.text);
			var init:int = D.getData("job_status")[d.getJob().selectedIndex][D.getKey("job_status")[obj_name]];
			if(i < init) i = init;
			obj.text = i.toString(); 
			return init;
		}
		/**
		 * ポイントを変更
		 */
		private function changePoint(jobpoint:int):void{
		    //ポイント計算
		   var fruitmax:int = 0;
		   var points:int = 0;
		   var lv:int = parseInt(level.text);
			var allocated_point:int =
					parseInt(str.text) +
					parseInt(agi.text) +
					parseInt(vit.text) +
					parseInt(ene.text);
			if(d.getJob().selectedLabel == "ダークロード")
				allocated_point += parseInt(rec.text);

		    //実の生成ポイント計算
		   if(d.getJob().selectedLabel == "魔剣士"){//mの計算
		        //ポイント計算
		       points = (lv-1)*7;
		       if(lv>=380)points += 20;
		       if(lv==400)points += 50;
		        //実のポイント計算
		       if(lv>=10)fruitmax += 2;
		       fruitmax += Math.floor(lv/10) * 2;
		       if(lv>220)fruitmax += Math.floor((lv-220)/10);
		   }else if(d.getJob().selectedLabel == "ダークロード"){//dの計算
		        //ポイント計算
		      points = (lv-1)*7;
		      if(lv>=380)points += 20;
		      if(lv==400)points += 50;
		        //実のポイント計算
		      if(lv>=10)fruitmax += 2;
		      fruitmax += Math.floor(lv/10) * 2;
		      if(lv>220)fruitmax += Math.floor((lv-220)/10);
		      if(lv>250)fruitmax += Math.floor((lv-250)/10);
			}else if(d.getJob().selectedLabel == "レイジファイター"){
				//ポイント計算
				points = (lv-1)*7;
			   	if(lv>=380)points += 20;
			   	if(lv==400)points += 50;
			   	//実のポイント計算
			   	if(lv>=10)fruitmax += 2;
			   	fruitmax += Math.floor(lv/10) * 2;
			   	if(lv>=130)fruitmax += Math.floor((lv-120)/10);
			   	if(lv>=260)fruitmax += Math.floor((lv-250)/10);
			   	if(lv>=390)fruitmax += Math.floor((lv-380)/10);
			}else{//k w e sの計算
			    //ポイント計算
				points = (lv-1)*5;
				if(lv>=150)points += 20;
				if(lv>220)points += lv - 220;
				if(lv>=380)points += 20;
				if(lv==400)points += 50;
			    //実のポイント計算
				if(lv>=10)fruitmax += 2;
				fruitmax += Math.floor(lv/10) * 2;
				if(lv>=130)fruitmax += Math.floor((lv-120)/10);
				if(lv>=260)fruitmax += Math.floor((lv-250)/10);
			   if(lv>=390)fruitmax += Math.floor((lv-380)/10);
			}
			points = points - (allocated_point - jobpoint);
			var fruitnow:int = 0;
			if(points < 0)fruitnow = - points;
			if(fruitnow > fruitmax)fruitnow = fruitmax;
			points += fruitnow;
			//表示
			point.text = points.toString();
			if(points < 0)point.setStyle("color","#FF0000");
			else point.setStyle("color","#0B333C");
			fruit.text = fruitnow.toString() + "/" + fruitmax.toString();
		}
		/**
		 * MLVボタンクリック時イベント
		 */
		private function eventClickMLV(event:Event):void{
			//LV400かチェック
//			if(dat::d.f_lv.text == "400"){
				//PopUpManagerでモーダルON（背景をぼやかせる）
				//PopUpはTitleWindowで作成
				var pop:TitleWindow = PopUpManager.createPopUp(d,TitleWindow,true) as TitleWindow;
				pop.width = 820;
				pop.height = 500;
				pop.setStyle("borderColor","black");
				pop.setStyle("borderAlpha","0.3");
				pop.showCloseButton = true;//右上の×ボタン
				pop.addEventListener(CloseEvent.CLOSE,eventClickPopupClose);//右上の×ボタンのイベント
				PopUpManager.centerPopUp(pop);
				pop.title = "MasterSkillTree";//タイトル
				
				pop.addChild(mlv);//MLVキャンバスを載せる
//			}else{
//				Alert.show("LVを400にしてください。");
//			}
		}
		/**
		 * ポップアップを閉じる
		 */
		private function eventClickPopupClose(event:Event):void{
			PopUpManager.removePopUp(event.target as IFlexDisplayObject);
		}
		/**
		 * level
		 */
		public function getLevel():TextInput{
			return level;
		}
		/**
		 * str
		 */
		public function getStr():TextInput{
			return str;
		}
		/**
		 * agi
		 */
		public function getAgi():TextInput{
			return agi;
		}
		/**
		 * vit
		 */
		public function getVit():TextInput{
			return vit;
		}
		/**
		 * ene
		 */
		public function getEne():TextInput{
			return ene;
		}
		/**
		 * rec
		 */
		public function getRec():TextInput{
			return rec;
		}
		public function getMasterSkillTree():FormMasterSkillTree{
			return mlv;
		}
	}
}
