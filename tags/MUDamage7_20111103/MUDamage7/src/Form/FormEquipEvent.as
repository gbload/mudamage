package Form {
	private class FormEquipEvent {
		private var d:Dat;
		private var c:Internal;
		/**
		 * コンストラクタ
		 */
		public function FormEquipEvent(dat:Dat) {
			d = dat;
			c = Internal.getInstance();
		}
		/**
		 * kindChangeイベント
		 */
		public function eventKindChange(event:Event):void{
			var sel:String = (event.target as ComboBox).selectedLabel;
			var p:Container = d.formbox[event.target.name];
			var a:Array = new Array();
			var item:Item = d.getItemByName(event.target.name);
			switch(sel){
				case "なし":
					hideEquip(item);
					if(item.name == "right")show(d.f_left.f_kind);//右手に弓の場合消えているため
					p.setStyle("borderColor","#EEEEEE");
					break;
				case "通常":
					hideEquip(item);
					changeNormal(item,0);
					p.setStyle("borderColor","#B7BABC");//デフォルト色
					break;
				case "EX":
					hideEquip(item);
					changeNormal(item,0);
					changeEx(item);
					p.setStyle("borderColor","#99CC99");
					break;
				case "セット":
					hideEquip(item);
					changeSetitem(item);
					p.setStyle("borderColor","#99DDFF");
					break;
				case "ソケット":
					hideEquip(item);
					changeNormal(item,1);
					changeSocket(item);
					p.setStyle("borderColor","#AA99BB");
					break;
				case "EXソケット":
					hideEquip(item);
					changeNormal(item,1);
					changeSocket(item);
					changeEx(item);
					p.setStyle("borderColor","#BBBB99");
					break;
				case "鷹":
					hideEquip(item);
					for(var i:int=1;i<=50;i++){
						a.push("Lv"+i);
					}
					item.f_op.dataProvider = a;
					item.f_item.dataProvider = [["","","","","","","","","","","","","",""]];
					show(item.f_op);
					break;
			}
			if(item.f_item.selectedItem != null)item.f_item.dispatchEvent((new ListEvent(ListEvent.CHANGE)) as Event);			
		}
		public function eventItemChange(event:Event):void{
			//部位取得
			var item:Item = d.getItemByName(event.target.name);
			if(item.f_kind.selectedIndex > 0){
				//EXOPの変更
				exop(item);
				//OPの変更
				op(item);
				//380OPの変更
				if((item.f_item.selectedItem[2] == "通常" || item.f_item.selectedItem[2] == "EX")
				 && item.f_item.selectedItem[6] == 380){
					show(d.box380[item.name]);
				}else{
					hide(d.box380[item.name]);
					item.f_380.selected = false;
				}
				//セットOPの変更
				setop(item);
				//ソケットOPの変更
				soop(item);
				item.f_soop[0].dispatchEvent(new ListEvent(ListEvent.CHANGE) as Event);
				//ソケットOPフォームの非表示
				hide(item.f_soop[3]);hide(item.f_soop[4]);
				hide(item.f_soop_value[3]);hide(item.f_soop_value[4]);
				item.f_soop[3].selectedIndex=0;
				item.f_soop[4].selectedIndex=0;
				item.f_soop[3].dispatchEvent((new ListEvent(ListEvent.CHANGE)) as Event);
				item.f_soop[4].dispatchEvent((new ListEvent(ListEvent.CHANGE)) as Event);
				//弓の場合、左手フォームを隠す
				if(item.name == "right")
				if(item.f_item.selectedItem[3] == "弓"){
					d.f_left.f_kind.selectedIndex = 0;//左手を「なし」に設定
					d.f_left.f_kind.dispatchEvent((new ListEvent(ListEvent.CHANGE)) as Event);//イベントの呼び出し
					hide(d.f_left.f_kind);//左手フォームを隠す
					show(d.f_right.f_arrow);//矢のフォームを表示
					//ソケットOPフォームの表示
					show(item.f_soop[3]);show(item.f_soop[4]);
					show(item.f_soop_value[3]);show(item.f_soop_value[4]);
				//両手武器の場合、左手を隠す
				}else if(item.f_item.selectedItem[4] == "両手"){
					d.f_left.f_kind.selectedIndex = 0;//左手を「なし」に設定
					d.f_left.f_kind.dispatchEvent((new ListEvent(ListEvent.CHANGE)) as Event);//イベントの呼び出し
					hide(d.f_left.f_kind);//左手フォームを隠す
				}else{//元に戻す
					show(d.f_left.f_kind);
					hide(d.f_right.f_arrow);
				}
				//ラッキーアイテム用エンチャント表示
				if(item.f_kind.selectedLabel == "セット"){
					if(item.f_item.selectedItem[10] == "ラッキーLV1" || item.f_item.selectedItem[10] == "ラッキーLV2" || item.f_item.selectedItem[10] == "ラッキー LV2"){
						show(item.f_enop);
						show(item.f_enop_value);
					}else{
						hide(item.f_enop);
						hide(item.f_enop_value);
					}
				}
				//エンチャントOP変更
				if(item.f_enop.visible){
					en(item);
					enop(item);
				}
			}
		}
		public function eventSoopChange(event:Event):Boolean{
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
				if(i.selectedItem[1] == "炎")att[0]++;
				if(i.selectedItem[1] == "稲妻")att[1]++;
				if(i.selectedItem[1] == "氷")att[2]++;
				if(i.selectedItem[1] == "水")att[3]++;
				if(i.selectedItem[1] == "風")att[4]++;
				if(i.selectedItem[1] == "地")att[5]++;
			}
			if(count >= 2){item.f_soop[index].selectedIndex=0;}
			
			//ボーナスソケットのインデックスを一時保存
			var b0:int=item.f_sobonus[0].selectedIndex;
			var b1:int=item.f_sobonus[1].selectedIndex;
			//ボーナスソケットの作成
			for(n=0;n<2;n++){
				if(att[0] && att[1] && att[2])//武器のボーナス
					if(item.f_item.selectedItem[3]=="杖" || item.f_item.selectedItem[3]=="書")
						item.f_sobonus[n].dataProvider = ["","魔力+5","スキル+11"];//杖
					else
						item.f_sobonus[n].dataProvider = ["","攻撃力+11","スキル+11"];//剣
				if(att[3] && att[4] && att[5])//防具のボーナス
					item.f_sobonus[n].dataProvider = ["","防御力+24","最大生命+29"];
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
			var a:Array = new Array();
			a[0] = event.target.selectedItem[2][0];
			a[1] = event.target.selectedItem[2][1];
			a[2] = event.target.selectedItem[2][2];
			a[3] = event.target.selectedItem[2][3];
			a[4] = event.target.selectedItem[2][4];
			if(item.f_soop[index].selectedIndex == 0)a = [""];
			
			var j:int = 0;
			if(item.f_soop_value[index].dataProvider != "")
				j = item.f_soop_value[index].selectedIndex;//現在のIndexを保持
			
			item.f_soop_value[index].dataProvider = a;
			
			item.f_soop_value[index].selectedIndex = j;
			return true;
		}
		public function eventEnchantChange(event:Event):void{
			use namespace dat;
			var item:Item = d.getItemByName(event.target.name);
			if(item.f_enop.dataProvider.length){
				enop(item);
			}
		}
		public function eventPlusChange(event:Event):void{
			use namespace dat;
			var item:Item = d.getItemByName(event.target.name);
			if(item.f_enop.visible){
				en(item);
				enop(item);
			}
		}
		public function eventExopChange(event:Event):void{
			use namespace dat;
			var item:Item = d.getItemByName(event.target.name);//どの部位か取得
			var count:int=0;//EXOPが2個以上重複していないか確認するため
			for each(var i:ComboBox in item.f_exop)
				if(i.selectedIndex == event.target.selectedIndex)count++;
			//重複していたら、何も選択していない状態にする
			if(count >= 2)event.target.selectedIndex = 0;
		}
		private function resetEquip(item:Item):void{
			item.f_kind.selectedIndex = 0;
			item.f_item.dataProvider = [];
			item.f_plus.selectedIndex = 0;
			item.f_op.selectedIndex = 0;
			for(var i:int = 0;i<item.f_exop.length;i++){
				item.f_exop[i].selectedIndex = 0;
			}
			item.f_kind.dispatchEvent(new Event(Event.CHANGE));
		}
		private function showEquip(item:Item):void{
			show(item.f_luck);
			show(item.f_luck_label);
			show(item.f_item);
			show(item.f_plus);
			show(item.f_op);
		}
		private function hideEquip(item:Item):void{
			hide(item.f_luck);//幸運
			hide(item.f_luck_label);//幸運
			hide(item.f_item);//アイテム
			hide(item.f_plus);//＋
			hide(item.f_op);//op
			hide(d.exbox[item.name]);//EX
			hide(item.f_cop);//セットステータスOP
			hide(d.sobox[item.name]);//ソケット
			hide(item.f_enop);//エンチャント
			hide(item.f_enop_value)//エンチャントOP
			hide(d.box380[item.name]);//380op
			if(item.name == "right")hide(d.f_right.f_arrow);//矢のフォーム
		}
		private function showSet(item:Item):void{
			show(item.f_luck);
			show(item.f_luck_label);
			show(item.f_item);
			show(item.f_plus);
			show(item.f_op);
			show(item.f_cop);
		}
		private function changeNormal(item:Item,type:int):Boolean{
			use namespace dat;
			//フォームを表示
			showEquip(item);
			if(type==0){
				show(item.f_enop);//エンチャント
				show(item.f_enop_value)//エンチャントOP
			}
			//すでに作成されていないかチェック
			if(item.f_item.dataProvider != "" && c.getItemType(item.f_item.selectedItem) == type)return false;
			//アイテムの追加
			var jobindex:int = d.f_job.selectedIndex;//職取得
			if(item.name == "right")//右手
				//ソケットアイテムを除く 神具を除く
				if(type) item.f_item.dataProvider = c.getSocketRight(jobindex);
				else item.f_item.dataProvider = c.getRight(jobindex);
			else if(item.name == "left")//左手
				//ソケットアイテムを除く　両手武器を除く
				if(type) item.f_item.dataProvider = c.getSocketLeft(jobindex);
				else item.f_item.dataProvider = c.getLeft(jobindex);
			else if(item.name == "helm")
				if(type) item.f_item.dataProvider = c.getSocketEquip(jobindex,"兜");
				else item.f_item.dataProvider = c.getEquip(jobindex,"兜");
			else if(item.name == "armor")
				if(type) item.f_item.dataProvider = c.getSocketEquip(jobindex,"鎧");
				else item.f_item.dataProvider = c.getEquip(jobindex,"鎧");
			else if(item.name == "glove")
				if(type) item.f_item.dataProvider = c.getSocketEquip(jobindex,"手");
				else item.f_item.dataProvider = c.getEquip(jobindex,"手");
			else if(item.name == "garter")
				if(type) item.f_item.dataProvider = c.getSocketEquip(jobindex,"腰");
				else item.f_item.dataProvider = c.getEquip(jobindex,"腰");
			else if(item.name == "boots")
				if(type) item.f_item.dataProvider = c.getSocketEquip(jobindex,"足");
				else item.f_item.dataProvider = c.getEquip(jobindex,"足");
			//OPの追加
			op(item);
			//エンチャントOPの作成
			if(type==0){
				en(item);
			}
			return true;
		}
		private function changeSetitem(item:Item):Boolean{
			use namespace dat;
			//フォームを表示
			showSet(item);
			//すでに作成されていないかチェック
			if(item.f_item.dataProvider != "" && c.getItemType(item.f_item.selectedItem) == 2)return false;
			//アイテムの追加
			var jobindex:int = d.f_job.selectedIndex;//職取得
			if(item.name == "right")//右手
				//ソケットアイテムを除く 神具を除く
				item.f_item.dataProvider = c.getSetRight(jobindex);
			else if(item.name == "left")//左手
				//ソケットアイテムを除く　両手武器を除く
				item.f_item.dataProvider = c.getSetLeft(jobindex);
			else if(item.name == "helm")
				item.f_item.dataProvider = c.getSetEquip(jobindex,"兜");
			else if(item.name == "armor")
				item.f_item.dataProvider = c.getSetEquip(jobindex,"鎧");
			else if(item.name == "glove")
				item.f_item.dataProvider = c.getSetEquip(jobindex,"手");
			else if(item.name == "garter")
				item.f_item.dataProvider = c.getSetEquip(jobindex,"腰");
			else if(item.name == "boots")
				item.f_item.dataProvider = c.getSetEquip(jobindex,"足");
			//OPの追加
			op(item);
			
			//セットステータスOPの追加
			setop(item);
			
			return true;
		}
		private function changeEnchant(item:Item):Boolean{
			use namespace dat;
			if(!item.f_item.selectedItem)return false;//インポート対策
			var sel:int = item.f_enop.selectedIndex;
			item.f_enop.dataProvider = c.getEnchaunt(
					c.getEnchauntKind(item.f_item.selectedItem),
					item.f_plus.selectedIndex);
			item.f_enop.selectedIndex = sel;
			
			return true;
		}
		private function changeEnop(item:Item):Boolean{
			if(!item.f_enop.selectedItem)return false;//インポート対策
			var sel:int = item.f_enop_value.selectedIndex;
			var a:Array = new Array();
			for(var i:int=item.f_enop.selectedItem[2];i<=item.f_plus.selectedIndex,i<=13;i++){
				a.push(item.f_enop.selectedItem[3][i - item.f_enop.selectedItem[2]]);
			}
			item.f_enop_value.dataProvider = a;
			item.f_enop_value.selectedIndex = sel;
			return true;
		}
		private function changeEx(item:Item):Boolean{
			use namespace dat;
			//EXOPの作成
			exop(item);
			//表示
			show(d.exbox[item.name]);
			return true;
		}
		private function changeSocket(item:Item):Boolean{
			use namespace dat;
			//SOOPの作成
			soop(item);
			//表示
			show(d.sobox[item.name]);
			return true;
		}
		private function changeExop(item:Item):Boolean{
			use namespace dat;
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
		private function changeSoop(item:Item):Boolean{
			use namespace dat;
			if(!item.f_item.selectedItem)return false;//インポート対策
			//ソケットOPの作成
			var a:Array;
			var index:int=0;
			if(item.f_item.selectedItem[0] == "防具"){//防具
				if(item.f_soop[0].dataProvider != "" && item.f_soop[0].dataProvider[1][0] == "防御力増加")return false;
				a = c.socket_equip;
			}else{
				if(item.f_soop[0].dataProvider != "" && item.f_soop[0].dataProvider[1][0] == "攻撃魔力lv")return false;
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
			for(i=0;i < item.f_soop.length;i++){
				item.f_soop[i].dataProvider = a;
				item.f_soop[i].setStyle("alternatingItemColors",color);
				item.f_soop[i].dispatchEvent(new ListEvent(ListEvent.CHANGE) as Event);//ソケットOPの値の変更
			}
			return true;
		}
		private function changeOp(item:Item):Boolean{
			var a:Array;
			if(!item.f_item.selectedItem)return false;//インポート対策
			if(item.f_item.selectedItem[3] == "盾"){
				if(item.f_op.dataProvider != "" && item.f_op.dataProvider[0] != "Lv1"
				 && item.f_op.dataProvider[1].value == 5)return false;
				a = [{label:"opなし",value:0},
							{label:"op5",value:5},
							{label:"op10",value:10},
							{label:"op15",value:15},
							{label:"op20",value:20}]
			}else if(item.f_kind.selectedLabel == "鷹"){
				return false;
			}else{
				if(item.f_op.dataProvider != "" && item.f_op.dataProvider[0] != "Lv1"
				 && item.f_op.dataProvider[1].value == 4)return false;
				a = [{label:"opなし",value:0},
							{label:"op4",value:4},
							{label:"op8",value:8},
							{label:"op12",value:12},
							{label:"op16",value:16}]
			}
			item.f_op.dataProvider = a;
			return true;
		}
		private function changeSetop(item:Item):Boolean{
			if(!item.f_item.selectedItem)return false;//インポート対策
			var a:Array;
			var tmp:int=0;
			if(item.f_cop.dataProvider != "" && item.f_cop.dataProvider[0].type == item.f_item.selectedItem[9])
				return false;
			if(item.f_cop.dataProvider != "")tmp = item.f_cop.selectedIndex;//現在のIndexを保持
			if(item.f_item.selectedItem[9] == "")
				a = [{label:"",value:0,type:""}];
			else
				a = [{label:item.f_item.selectedItem[9] + "+5",value:5,type:item.f_item.selectedItem[9]}
					,{label:item.f_item.selectedItem[9] + "+10",value:10,type:item.f_item.selectedItem[9]}];
			item.f_cop.dataProvider = a;
			item.f_cop.selectedIndex = tmp;
			return true;
		}
	}
}
