package Form.SubForm {
	public class FormEx extends HBox {
		private var exops:Array;
		/**
		 * EXOPのBOXを作成
		 */
		public function FormEx() {
			exops = new Array();
			//exopの作成
			for(var i:int=0;i<5;i++){
				var e:ComboBox = new ComboBox();
				e.width = 120;
				e.rowCount = 6;
				//hide(e);
				e.addEventListener(ListEvent.CHANGE,click::exopChange);
				item.f_exop[i] = e;
				exops[i] = e;
				this.addChild(e);
			}	
		}
		/**
		 * クリックイベント
		 */
		private function eventClick(Event event):void {
			//EXOPが2個以上重複していないか確認するため
			var count:int=0;
			for each(var i:ComboBox in exops)
				if(i.selectedIndex == event.target.selectedIndex)count++;
			//重複していたら、何も選択していない状態にする
			if(count >= 2)event.target.selectedIndex = 0;
		}
		/**
		 * データをセット
		 */
		public function setData(String type):void {
			//EXOPの作成
			if(!item.f_item.selectedItem)return false;//インポート対策
			var a:Array;
			if(item.f_item.selectedItem[0] == "防具"){//防具
				if(item.f_exop[0].dataProvider != "" && item.f_exop[0].dataProvider[1] == "防御成功")return false;
				a = ["","防御成功","ダメ減","生命増","マナ増","ダメ反"];
			}else if(item.f_item.selectedItem[3] == "杖" || item.f_item.selectedItem[3] == "書"){
				//魔法系
				if(item.f_exop[0].dataProvider != "" && item.f_exop[0].dataProvider[3] == "魔力2%")return false;
				a = ["","EXD","速度+7","魔力2%","魔力lv20"];
			}else{
				//剣系
				if(item.f_exop[0].dataProvider != "" && item.f_exop[0].dataProvider[3] == "攻撃2%")return false;
				a = ["","EXD","速度+7","攻撃2%","攻撃lv20"];
			}
			for(var i:int = 0;i < item.f_exop.length;i++){
				item.f_exop[i].dataProvider = a;
			}
			return true;
		}
	}
}
