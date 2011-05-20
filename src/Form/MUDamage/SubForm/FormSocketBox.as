package Form.MUDamage.SubForm {
	import mx.controls.*;
	import mx.containers.*;
	import mx.core.*;
	import mx.collections.*;
	import mx.events.*;
	import flash.events.*;

	import Form.MUDamage.*;
	import Data.Database.*;
	/**
	 * ソケットフォーム
	 * @author sinlion
	 *
	 */
	public class FormSocketBox extends VBox {
		private var item:ComboBox;
		private var c:Internal;
	
		private var names:Array = new Array();
		private var values:Array = new Array();
		private var bonuses:Array = new Array();
		/**
		 * SocketBoxを作成
		 */
		public function FormSocketBox(item:ComboBox) {
			this.item = item;
			this.c = Internal.getInstance();
			// イベントを登録
			item.addEventListener(ListEvent.CHANGE, eventChangeItem);
			
			/*
			 * SocketBoxを作成
			 */
			var hbox:HBox = new HBox();
			this.addChild(hbox);
			// 背景色変更
			this.setStyle("backgroundColor","#DDCCFF");//背景色を紫色に
			// ラベルの作成
			var la:Label = new Label();
			la.text = "　ソケットOP:";
			la.setStyle("fontWeight","bold");
			la.width = 120;
			hbox.addChild(la);
			//soopの作成
			var i:int = 0;
			var e:ComboBox;
			for(i=0;i<5;i++){
				if(i==3){//2行目に突入
					hbox = new HBox();
					this.addChild(hbox);
				}
				e = new ComboBox();
				e.addEventListener(ListEvent.CHANGE,eventChangeName);
				e.labelFunction = FormCommon.labelfunc0;
				e.width = 140;
				e.rowCount = 6;
				e.name = i.toString();
				names[i] = e;
				hbox.addChild(e);
				//値フォームの作成
				e = new ComboBox();
				e.width = 80;
				e.rowCount = 6;
				e.name = i.toString();
				values[i] = e;
				hbox.addChild(e);
			}
			//ボーナスソケットオプションの作成
			for(i=0;i<2;i++){
				e = new ComboBox();
				e.addEventListener(ListEvent.CHANGE,eventChangeBonus);
				e.width = 140;
				e.rowCount = 6;
				bonuses.push(e);
				FormCommon.hide(e);
				hbox.addChild(e);
			}
		}
		/**
		 * ソケット名クリック時のイベント
		 */
		private function eventChangeName(event:Event):Boolean {
			var target:ComboBox = event.target as ComboBox;
			var index:int = parseInt(target.name);
			
			//ソケットOPが重複していないかチェック
			var count:int=0;
			var att:Array=new Array();// 0.炎 1.稲妻 2.氷 3.水 4.風 5.地
			for(var n:int=0;n<6;n++)att[n]=0;//初期値0を代入
			for each(var item:Object in names){//同じのが2個以上ないか確認
				if(item.selectedIndex == target.selectedIndex)count++;
				//ボーナスソケットの確認
				if(item.selectedIndex <= 0)continue;
				if(item.selectedItem[1] == "炎")att[0]++;
				if(item.selectedItem[1] == "稲妻")att[1]++;
				if(item.selectedItem[1] == "氷")att[2]++;
				if(item.selectedItem[1] == "水")att[3]++;
				if(item.selectedItem[1] == "風")att[4]++;
				if(item.selectedItem[1] == "地")att[5]++;
			}
			if(count >= 2){target.selectedIndex=0;}
			
			//ボーナスソケットのインデックスを一時保存
			var b_index:Array = new Array();
			for(var i:int=0; i<bonuses.length; i++)
				b_index[i] = bonuses[i].selectedIndex;
			//ボーナスソケットの作成
			for(n=0;n<bonuses.length;n++){
				if(att[0] && att[1] && att[2])//武器のボーナス
					if(item.selectedItem[3]=="杖" || item.selectedItem[3]=="書")
						bonuses[n].dataProvider = ["","魔力+5","スキル+11"];//杖
					else
						bonuses[n].dataProvider = ["","攻撃力+11","スキル+11"];//剣
				if(att[3] && att[4] && att[5])//防具のボーナス
					bonuses[n].dataProvider = ["","防御力+24","最大生命+29"];
			}
			//ボーナスソケットの非表示
			for each(var bonus:ComboBox in bonuses)
				FormCommon.hide(bonus);
			//ボーナスソケットの表示
			if((att[0] && att[1] && att[2])||(att[3] && att[4] && att[5])){//1つ目の発生条件
				FormCommon.show(bonuses[0]);
				bonuses[0].selectedIndex=b_index[0];
				
			}
			if((att[0]>=2 && att[1] && att[2])||(att[3]>=2 && att[4] && att[5])
				||(att[0] && att[1]>=2 && att[2]>=2)||(att[3] && att[4]>=2 && att[5]>=2)){//2つ目の発生条件
				FormCommon.show(bonuses[1]);
				bonuses[1].selectedIndex=b_index;
			}
			
			//ソケットOPの数値を作成
			var a:Array = target.selectedItem[2];
			if(target.selectedIndex == 0)a = [""];
			
			var j:int = 0;
			if(values[index].dataProvider != "")
				j = values[index].selectedIndex;//現在のIndexを保持
			
			values[index].dataProvider = a;
			
			values[index].selectedIndex = j;
			return true;
		}
		/**
		 * ソケットボーナスクリック時のイベント
		 */
		private function eventChangeBonus(event:Event):void {
			if(FormCommon.isDuplication(bonuses))
				event.target.selectedIndex = 0;
		}
		/**
		 * アイテムフォーム変更時イベント
		 */
		private function eventChangeItem(event:Event):void{
			if(this.visible)
				changeSocket();
		}
		/**
		 * ソケットの種類を変更
		 */
		private function changeSocket():Boolean{
			//ソケットOPの作成
			var a:Array;
			var index:int=0;
			if(item.selectedItem[0] == "防具"){//防具
				if(names[0].dataProvider != "" && names[0].dataProvider[1][0] == "防御力増加")return false;
				a = c.socket_equip;
			}else{
				if(names[0].dataProvider != "" && names[0].dataProvider[1][0] == "攻撃魔力lv")return false;
				a = c.socket;
			}
			//色分け
			var color:Array = new Array();
			for(var i:int=0;i<a.length;i++){
				if(a[i][1] == "炎"){
					color[i] = "#FFDDDD";
				}else if(a[i][1] == "稲妻"){
					color[i] = "#FFFFDD";
				}else if(a[i][1] == "氷"){
					color[i] = "#EEDDFF";
				}else if(a[i][1] == "水"){
					color[i] = "#DDDDFF";
				}else if(a[i][1] == "風"){
					color[i] = "#DDFFDD";
				}else if(a[i][1] == "地"){
					color[i] = "#FFEEDD";
				}else{
					color[i] = "#FFFFFF";
				}
			}
			for(i=0;i < names.length;i++){
				names[i].dataProvider = a;
				names[i].setStyle("alternatingItemColors",color);
				names[i].dispatchEvent(new ListEvent(ListEvent.CHANGE) as Event);//ソケットOPの値の変更
			}
			return true;
		}
		/**
		 * ソケット名のフォームの配列を返す
		 */
		public function getNames():Array {
			return names;
		}
		/**
		 * ソケットの値フォームの配列を返す
		 */
		public function getValues():Array {
			return values;
		}
		/**
		 * ソケットボーナスフォームの配列を返す
		 */
		public function getBonuses():Array {
			return bonuses;
		}
	}
}
