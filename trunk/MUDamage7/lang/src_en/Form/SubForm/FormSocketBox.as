package Form.SubForm {
	public class FormSocketBox extends VBox {
		private var names:Array;
		private var values:Array;
		private var bonuses:Array;
		/**
		 * SocketBoxを作成
		 */
		public function FormSocketBox() {
			var hbox:HBox = new HBox();
			this.addChild(hbox);
			//soopの作成
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
				e.name = i;
				names[i] = e;
				hbox.addChild(e);
				//値フォームの作成
				e = new ComboBox();
				e.width = 80;
				e.rowCount = 6;
				e.name = i;
				values[i] = e;
				hbox.addChild(e);
			}
			//ボーナスソケットオプションの作成
			for(i=0;i<2;i++){
				e = new ComboBox();
				e.addEventListener(ListEvent.CHANGE,eventChangeBonus);
				e.width = 140;
				e.rowCount = 6;
				e.name = i;
				bonuses = e;
				FormCommon.hide(e);
				hbox.addChild(e);
			}
		}
		/**
		 * ソケット名クリック時のイベント
		 */
		private function eventChangeName(event:Event):boolean {
			var item:Item = d.getItemByName(event.target.name);
			var index:int = parseInt(event.target.id.match(/[0-9]/g)[0]);
			
			if(item.f_kind.selectedIndex == 0)return false;//ファイルを開く対応
			
			//ソケットOPが重複していないかチェック
			var count:int=0;
			var att:Array=new Array();// 0.炎 1.稲妻 2.氷 3.水 4.風 5.地
			for(var n:int=0;n<6;n++)att[n]=0;//初期値0を代入
			for each(var i:Object in item.f_soop){//同じのが2個以上ないか確認
				if(i.selectedIndex == item.f_soop[index].selectedIndex)count++;
				//ボーナスソケットの確認
				if(i.selectedIndex <= 0)continue;
				if(i.selectedItem[1] == "Fire")att[0]++;
				if(i.selectedItem[1] == "Lightning")att[1]++;
				if(i.selectedItem[1] == "Ice")att[2]++;
				if(i.selectedItem[1] == "Water")att[3]++;
				if(i.selectedItem[1] == "Wind")att[4]++;
				if(i.selectedItem[1] == "Earth")att[5]++;
			}
			if(count >= 2){item.f_soop[index].selectedIndex=0;}
			
			//ボーナスソケットのインデックスを一時保存
			var b0:int=item.f_sobonus[0].selectedIndex;
			var b1:int=item.f_sobonus[1].selectedIndex;
			//ボーナスソケットの作成
			for(n=0;n<2;n++){
				if(att[0] && att[1] && att[2])//武器のボーナス
					if(item.f_item.selectedItem[3]=="Staff" || item.f_item.selectedItem[3]=="Book")
						item.f_sobonus[n].dataProvider = ["","Magic +5","Skill +11"];//杖
					else
						item.f_sobonus[n].dataProvider = ["","Dmg +11","Skill +11"];//剣
				if(att[3] && att[4] && att[5])//防具のボーナス
					item.f_sobonus[n].dataProvider = ["","Defence +24","Max Life +29"];
			}
			//ボーナスソケットの非表示
			hide(item.f_sobonus[0]);
			hide(item.f_sobonus[1]);
			//ボーナスソケットの表示
			if((att[0] && att[1] && att[2])||(att[3] && att[4] && att[5]))//1つ目の発生条件
				{show(item.f_sobonus[0]);item.f_sobonus[0].selectedIndex=b0;}
			if((att[0]>=2 && att[1] && att[2])||(att[3]>=2 && att[4] && att[5])
				||(att[0] && att[1]>=2 && att[2]>=2)||(att[3] && att[4]>=2 && att[5]>=2))//2つ目の発生条件
				{show(item.f_sobonus[1]);item.f_sobonus[1].selectedIndex=b1;}
			
			//ソケットOPの数値を作成
			var a:Array = event.target.selectedItem[2];
			if(names[index].selectedIndex == 0)a = [""];
			
			var j:int = 0;
			if(values[index].dataProvider != "")
				j = values[index].selectedIndex;//現在のIndexを保持
			
			item.f_soop_value[index].dataProvider = a;
			
			item.f_soop_value[index].selectedIndex = j;
			return true;
		}
		/**
		 * ソケットボーナスクリック時のイベント
		 */
		private function eventChangeBonus(event:Event):boolean {
			if(FormCommon.isDupplication(bonuses))
				return false;
			return true;
		}
		/**
		 * ソケット名のコンポーネント配列を返す
		 */
		public function getNames():Array {
			return names;
		}
		public function getValues():Array {
			return values;
		}
		public function getBonuses():Array {
			return bonuses;
		}
	}
}
