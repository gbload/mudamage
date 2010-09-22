// ActionScript file
import flash.events.Event;
import flash.events.FocusEvent;
import flash.events.MouseEvent;
import flash.net.SharedObject;
import flash.net.SharedObjectFlushStatus;

import mx.containers.Form;
import mx.containers.HBox;
import mx.containers.Panel;
import mx.controls.Alert;
import mx.controls.Button;
import mx.controls.List;
import mx.controls.Text;
import mx.controls.TextArea;
import mx.controls.TextInput;
import mx.events.CloseEvent;
import mx.events.ListEvent;

public namespace menu;

menu function big(event:Event):void{
	use namespace form;
	this.scaleX += 0.1;
	this.scaleY += 0.1;
	if(this.scaleX > 2.0)this.scaleX = 2.0;
	if(this.scaleY > 2.0)this.scaleY = 2.0;
}
menu function small(event:Event):void{
	use namespace form;
	this.scaleX -= 0.1;
	this.scaleY -= 0.1;
	if(this.scaleX < 0.5)this.scaleX = 0.5;
	if(this.scaleY < 0.5)this.scaleY = 0.5;
}

menu function save(event:Event):void{
	var p:Panel = new Panel();
	
	p.title = "保存";
	p.name = "save";
	p.setStyle("borderAlpha","1.0");
	p.setStyle("borderColor","#DDDDFF");
	
	var f:Form = new Form();//Layout用
	f.name = "form";
	p.addChild(f);
	
	var te:Text = new Text();//案内
	te.text = "以下のタイトルで保存します。";
	te.setStyle("fontWeight","bold");
	f.addChild(te);
	
	var ti:TextInput = new TextInput();//名前の入力
	ti.text = dat::d.f_title.text;
	ti.name = "title";
	f.addChild(ti);
	
	var hbox:HBox = new HBox();//ボタン用のLayout
	f.addChild(hbox);
	
	var b:Button = new Button();//保存ボタン
	b.label = "保存";
	b.addEventListener(MouseEvent.CLICK,menu::savebutton);
	hbox.addChild(b);
	
	b = new Button();//キャンセルボタン
	b.label = "キャンセル";
	b.addEventListener(MouseEvent.CLICK,menu::savebutton);
	hbox.addChild(b);
	
	te = new Text();//案内
	te.text = "\n現在保存されているデータ：";
	te.setStyle("fontWeight","bold");
	f.addChild(te);
	
	var myso:SharedObject = SharedObject.getLocal("mud");//現在保存されてるデータ
	var i:int = 0;
	var list:List = new List();
	list.name = "list";
	list.percentWidth = 100;
	list.addEventListener(ListEvent.ITEM_CLICK,menu::savelist);
	var a:Array = new Array();
	f.addChild(list);
	if(myso.data.mud != null){
		for(i=0;i<myso.data.mud.length;i++){
			a.push("-" + myso.data.mud[i][0]);
		}
	}
	list.dataProvider = a;
	if(i == 0){
		te = new Text();
		te.text = "データがありません。";
		f.addChild(te);
	}else{
		b = new Button();//削除ボタン
		b.label = "削除";
		b.addEventListener(MouseEvent.CLICK,menu::savedelete);
		f.addChild(b);
	}
	
	this.addChild(p);
}
menu function savelist(event:Event):void{
	var p:Panel = this.getChildByName("save") as Panel;
	((p.getChildByName("form") as Form).getChildByName("title") as TextInput).text = event.target.selectedItem.slice(1);
}
menu function savedelete(event:Event):Boolean{
	var p:Panel = this.getChildByName("save") as Panel;
	var list:List = ((p.getChildByName("form") as Form).getChildByName("list") as List);
	var title:String = (list.selectedItem as String).slice(1);
	var myso:SharedObject = SharedObject.getLocal("mud");//現在保存されてるデータ
	var i:int=0;
	var ch:Boolean = false;
	//データの削除
	if(event.type == "close" && (event as CloseEvent).detail == Alert.YES){
		for(i=0;i<myso.data.mud.length;i++){
			if(myso.data.mud[i][0] == title){myso.data.mud.splice(i,1);break;}
		}
		Alert.show("[" + title + "]" + "を削除しました。");
		this.removeChild(p);
		menu::save(new MouseEvent(MouseEvent.CLICK) as Event);
		return false;
	}
	//削除するデータをチェック
	for(i=0;i<myso.data.mud.length;i++){
		if(myso.data.mud[i][0] == title){ch=true;break;}
	}
	if(ch == true){
		Alert.show("[" + title + "]" + "を削除します。"
					,"確認",(Alert.YES | Alert.NO),null,menu::savedelete);
		return false;
	}else{
		Alert.show("上記リストから削除するデータを選択してください。");
		return false;
	}
	return true;
}
menu function savebutton(event:Event):Boolean{
	var p:Panel = this.getChildByName("save") as Panel;
	var title:String = ((p.getChildByName("form") as Form).getChildByName("title") as TextInput).text;
	if(event.type == "close" && (event as CloseEvent).detail == Alert.NO){
		this.removeChild(p);
		return false;
	}
	if(event.target.label == "キャンセル"){
		this.removeChild(p);
		return false;
	}
	if(event.target.label == "保存"){
		//上書き保存のチェック
		var myso:SharedObject = SharedObject.getLocal("mud");//現在保存されてるデータ
		var i:int=0;
		var ch:Boolean = false;
		if(myso.data.mud != null){
			for(i=0;i<myso.data.mud.length;i++){
				if(myso.data.mud[i][0] == title){ch=true;break;}
			}
		}
		if(ch == true){
			Alert.show("すでのそのタイトルのデータが存在します。上書きしますか？"
						,"確認",(Alert.YES | Alert.NO),null,menu::savebutton);
			return false;
		}
	}
	//保存
	menu::savedata(title);
	this.removeChild(p);
	return true;
}
menu function savedata(title:String):void{
	use namespace dat;
	var myso:SharedObject = SharedObject.getLocal("mud");
	var a:Array = menu::getdata(title);//フォームのデータを取得
	
	//上書き保存のチェック
	var ch:Boolean = false;
	var soa:Array = myso.data.mud;
	if(soa == null){soa = new Array();soa.push(a);}
	else{
		for(var k:int=0;k<soa.length;k++){
			if(soa[k][0] == title){soa[k] = a;ch=true;break;}
		}
		if(ch == false){soa.push(a);}
	}
	myso.data.mud = soa;

	//なんかよく分からないけどエラーキャッチ
	try{
		var flushStatus:String = myso.flush();
	}catch(error:Error){
		Alert.show("Error:データの保存に失敗しました。　"+flushStatus);
	}
    if (flushStatus != null) {
        switch (flushStatus) {
            case SharedObjectFlushStatus.PENDING:
                Alert.show("データの保存を許可してください。");
                break;
            case SharedObjectFlushStatus.FLUSHED:
                Alert.show("データを保存しました。");
                break;
        }
    }
}
menu function getdata(title:String):Array{
	use namespace dat;
	var a:Array = new Array();
	
	a[0] = title;//タイトル
	a[1] = d.f_job.selectedIndex;//職
	a[2] = new Array();//ペット
	a[2][0] = d.f_pet.selectedIndex;
	a[3] = new Array();//羽
	a[3][0] = d.f_wing.f_item.selectedIndex;
	a[3][1] = d.f_wing.f_plus.selectedIndex;
	a[3][2] = d.f_wing.f_op.selectedIndex;
	a[3][3] = d.f_wing.f_cop.selectedIndex;
	a[3][4] = d.f_wing.f_luck.selected;
	a[4] = new Array();//ネックレス
	a[4][0] = d.f_neck.f_kind.selectedIndex;
	a[4][1] = d.f_neck.f_item.selectedIndex;
	a[4][2] = d.f_neck.f_cop.selectedIndex;
	for(var i:int=0;i<5;i++)//EXOP
		a[4][i+3] = d.f_neck.f_exop[i].selectedIndex;
	var item:Array = [d.f_right,d.f_left,d.f_helm,d.f_armor,d.f_glove,d.f_garter,d.f_boots];
	for(i=0;i<item.length;i++){
		a[5+i] = new Array();//装備
		a[5+i][0] = item[i].f_kind.selectedIndex;
		a[5+i][1] = item[i].f_item.selectedIndex;
		a[5+i][2] = item[i].f_plus.selectedIndex;
		a[5+i][3] = item[i].f_op.selectedIndex;
		a[5+i][4] = item[i].f_luck.selected;
		a[5+i][5] = item[i].f_enop.selectedIndex;
		a[5+i][6] = item[i].f_enop_value.selectedIndex;
		a[5+i][7] = item[i].f_cop.selectedIndex;
		for(var j:int=0;j<5;j++)//EXOP
			a[5+i][8+j] = item[i].f_exop[j].selectedIndex;
		for(j=0;j<5;j++){//ソケットOP
			a[5+i][13+j*2] = item[i].f_soop[j].selectedIndex;
			a[5+i][13+j*2+1] = item[i].f_soop_value[j].selectedIndex;
		}
		for(j=0;j<2;j++){//ボーナスソケット
			a[5+i][23+j] = item[i].f_sobonus[j].selectedIndex;
		}
		//380OP
		a[5+i][25] = item[i].f_380.selected;
		//矢
		if(i==0)a[5+i][26] = item[i].f_arrow.selectedIndex;
	}
	item = [d.f_ring1,d.f_ring2];//リング
	for(i=0;i<item.length;i++){
		a[12+i] = new Array();
		a[12+i][0] = item[i].f_kind.selectedIndex;
		a[12+i][1] = item[i].f_item.selectedIndex;
		a[12+i][2] = item[i].f_cop.selectedIndex;
		for(j=0;j<5;j++)
			a[12+i][j+3] = item[i].f_exop[j].selectedIndex;
	}
	a[14] = new Array();//ステータス
	a[14][0] = d.f_lv.text;
	a[14][1] = d.f_str.text;
	a[14][2] = d.f_agi.text;
	a[14][3] = d.f_vit.text;
	a[14][4] = d.f_ene.text;
	a[14][5] = d.f_rec.text;
	a[15] = new Array();//サポート
	a[15][0] = d.s_aplus.text;
	a[15][1] = d.s_cplus.text;
	a[15][2] = d.s_sl.text;
	a[15][3] = d.s_sb.text;
	a[15][4] = d.s_gplus.text;
	a[15][5] = d.s_ba.selected;
	a[15][6] = d.s_berserker.selected;
	a[15][7] = d.s_se.selected;
	a[15][8] = d.s_inner.text;
	a[15][9] = d.s_weak.text;
	a[16] = new Array();//その他
	a[16][0] = d.s_sera.selected;
	a[16][1] = d.s_sake.selected;
	a[16][2] = d.s_myou.selected;
	a[16][3] = d.s_item.selectedIndex;
	a[16][4] = d.s_scroll.selectedIndex;
	a[16][5] = d.s_hiyaku.selectedIndex;
	a[17] = new Array();//マップ
	a[17][0] = d.f_map.selectedIndex;
	a[18] = d.f_mlv.text;
	a[19] = new Array();
	for(i=0;i<=MLV.num;i++)//マスターレベル
		a[19][i] = mlvcount.getSkill(i);
	//2009/11/04
	//ペットサブフォーム
	a[20] = new Array();
	a[20][0] = d.f_petsub1.selectedIndex;
	a[20][1] = d.f_petsub2.selectedIndex;
	//2009/12/03
	//カウンターリベリオン、ドッペルゲンガー用
	a[21] = d.f_mapLv.text;
	//2010/03/02
	//エンブレム・イベントでの経験値増加入力フォーム
	a[22] = d.f_exp.text;
	return a;
}
menu function open(event:Event):Boolean{
	var p:Panel = new Panel();
	
	p.title = "開く";
	p.name = "open";
	p.setStyle("borderAlpha","1.0");
	p.setStyle("borderColor","#DDFFDD");
	
	var f:Form = new Form();//Layout用
	f.name = "form";
	p.addChild(f);
	
	var te:Text = new Text();//案内
	te.text = "以下のタイトルを開きます。";
	te.setStyle("fontWeight","bold");
	f.addChild(te);
	
	var ti:TextInput = new TextInput();//名前の入力
	ti.text = dat::d.f_title.text;
	ti.name = "title";
	f.addChild(ti);
	
	var hbox:HBox = new HBox();//ボタン用のLayout
	f.addChild(hbox);
	
	var b:Button = new Button();//保存ボタン
	b.label = "開く";
	b.addEventListener(MouseEvent.CLICK,menu::openbutton);
	hbox.addChild(b);
	
	b = new Button();//キャンセルボタン
	b.label = "キャンセル";
	b.addEventListener(MouseEvent.CLICK,menu::openbutton);
	hbox.addChild(b);
	
	te = new Text();//案内
	te.text = "\n現在保存されているデータ：";
	te.setStyle("fontWeight","bold");
	f.addChild(te);
	
	var myso:SharedObject = SharedObject.getLocal("mud");//現在保存されてるデータ
	var i:int = 0;
	var list:List = new List();
	list.name = "list";
	list.percentWidth = 100;
	list.addEventListener(ListEvent.ITEM_CLICK,menu::openlist);
	var a:Array = new Array();
	if(myso.data.mud != null){
		for(i=0;i<myso.data.mud.length;i++){
			a.push("-" + myso.data.mud[i][0]);
		}
	}
	list.dataProvider = a;
	f.addChild(list);
	if(i == 0){
		Alert.show("保存されているデータがありません。");
		return false;
	}
	
	this.addChild(p);
	return true;
}
menu function openlist(event:Event):void{
	var p:Panel = this.getChildByName("open") as Panel;
	((p.getChildByName("form") as Form).getChildByName("title") as TextInput).text = event.target.selectedItem.slice(1);
}
menu function openbutton(event:Event):Boolean{
	var p:Panel = this.getChildByName("open") as Panel;
	if(event.target.label == "キャンセル"){
		this.removeChild(p);
		return false;
	}
	var title:String = ((p.getChildByName("form") as Form).getChildByName("title") as TextInput).text;
	menu::opendata(title);
	this.removeChild(p);
	return true;
}
menu function opendata(title:String):Boolean{
	use namespace dat;
	var myso:SharedObject = SharedObject.getLocal("mud");
	var soa:Array = myso.data.mud;
	var ch:Boolean = false;
	var a:Array;
	for(var k:int=0;k<myso.data.mud.length;k++){
		if(myso.data.mud[k][0] == title){a = myso.data.mud[k];ch=true;break;}
	}
	if(!ch){
		Alert.show("指定したタイトルのデータが見つかりませんでした。");
		return false;
	}
	menu::setdata(a);
	Alert.show("データを読み込みました。");
	return true;
}
menu function setdata(a:Array):void{
	use namespace dat;
	//タイトル
	d.f_title.text = a[0];
	//ジョブ
	d.f_job.selectedIndex = a[1];
	d.f_job.dispatchEvent(new ListEvent(ListEvent.CHANGE) as Event);
	//ペット
	d.f_pet.selectedIndex = a[2][0];
	d.f_pet.dispatchEvent(new ListEvent(ListEvent.CHANGE) as Event);
	//羽
	d.f_wing.f_item.selectedIndex = a[3][0];
	d.f_wing.f_item.dispatchEvent(new ListEvent(ListEvent.CHANGE) as Event);
	d.f_wing.f_plus.selectedIndex = a[3][1];
	d.f_wing.f_op.selectedIndex = a[3][2];
	d.f_wing.f_cop.selectedIndex = a[3][3];
	d.f_wing.f_luck.selected = a[3][4];
	//ネックレス
	d.f_neck.f_kind.selectedIndex = a[4][0];
	d.f_neck.f_kind.dispatchEvent(new ListEvent(ListEvent.CHANGE) as Event);
	d.f_neck.f_item.selectedIndex = a[4][1];
	d.f_neck.f_item.dispatchEvent(new ListEvent(ListEvent.CHANGE) as Event);
	d.f_neck.f_cop.selectedIndex = a[4][2];
	for(var i:int=0;i<5;i++)
		d.f_neck.f_exop[i].selectedIndex = a[4][i+3];
	//各種装備
	var item:Array = [d.f_right,d.f_left,d.f_helm,d.f_armor,d.f_glove,d.f_garter,d.f_boots];
	for(i=0;i<item.length;i++){
		item[i].f_kind.selectedIndex = a[5+i][0];
		item[i].f_kind.dispatchEvent(new ListEvent(ListEvent.CHANGE) as Event);
		item[i].f_item.selectedIndex = a[5+i][1];
		item[i].f_item.dispatchEvent(new ListEvent(ListEvent.CHANGE) as Event);
		item[i].f_plus.selectedIndex = a[5+i][2];
		item[i].f_plus.dispatchEvent(new ListEvent(ListEvent.CHANGE) as Event);
		item[i].f_op.selectedIndex = a[5+i][3];
		item[i].f_luck.selected = a[5+i][4];
		item[i].f_enop.selectedIndex = a[5+i][5];
		item[i].f_enop.dispatchEvent(new ListEvent(ListEvent.CHANGE) as Event);
		item[i].f_enop_value.selectedIndex = a[5+i][6];
		item[i].f_cop.selectedIndex = a[5+i][7];
		for(var j:int=0;j<5;j++)
			item[i].f_exop[j].selectedIndex = a[5+i][8+j];
		for(j=0;j<5;j++){
			item[i].f_soop[j].selectedIndex = a[5+i][13+j*2];
			item[i].f_soop[j].dispatchEvent(new ListEvent(ListEvent.CHANGE) as Event);
			item[i].f_soop_value[j].selectedIndex = a[5+i][13+j*2+1];
		}
		for(j=0;j<2;j++){//ボーナスソケット
			item[i].f_sobonus[j].selectedIndex = a[5+i][23+j];
		}
		//380OP
		item[i].f_380.selected = a[5+i][25];
		//矢
		if(i==0)item[i].f_arrow.selectedIndex = a[5+i][26];
	}
	//リング
	item = [d.f_ring1,d.f_ring2];
	for(i=0;i<item.length;i++){
		item[i].f_kind.selectedIndex = a[12+i][0];
		item[i].f_kind.dispatchEvent(new ListEvent(ListEvent.CHANGE) as Event);
		item[i].f_item.selectedIndex = a[12+i][1];
		item[i].f_item.dispatchEvent(new ListEvent(ListEvent.CHANGE) as Event);
		item[i].f_cop.selectedIndex = a[12+i][2];
		for(j=0;j<5;j++)
			item[i].f_exop[j].selectedIndex = a[12+i][j+3];
	}
	//ステータス
	d.f_lv.text = a[14][0];
	d.f_str.text = a[14][1];
	d.f_agi.text = a[14][2];
	d.f_vit.text = a[14][3];
	d.f_ene.text = a[14][4];
	d.f_rec.text = a[14][5];
	d.f_lv.dispatchEvent(new FocusEvent(FocusEvent.FOCUS_OUT) as Event);
	//サポート系
	d.s_aplus.text = a[15][0];
	d.s_cplus.text = a[15][1];
	d.s_sl.text = a[15][2];
	d.s_sb.text = a[15][3];
	d.s_gplus.text = a[15][4];
	d.s_ba.selected = a[15][5];
	d.s_berserker.selected = a[15][6];
	d.s_se.selected = a[15][7];
	d.s_inner.text = a[15][8];
	d.s_weak.text = a[15][9];
	//補助アイテム系
	d.s_sera.selected = a[16][0];
	d.s_sake.selected = a[16][1];
	d.s_myou.selected = a[16][2];
	d.s_item.selectedIndex = a[16][3];
	d.s_scroll.selectedIndex = a[16][4];
	d.s_hiyaku.selectedIndex = a[16][5];
	//計算方法の指定（MAPなど）
	d.f_map.selectedIndex = a[17][0];
	d.f_map.dispatchEvent(new ListEvent(ListEvent.CHANGE) as Event);
	//マスターレベル
	d.f_mlv.text = a[18];
	for(i=0;i<MLV.num;i++){
		mlvcount.setSkill2(i,a[19][i]);
		//if(click::mlvLabel[i])click::mlvLabel[i].text = a[19][i];
	}
	click::mlvShow();//画像の表示
	click::mlvShowPoint();//ポイントの表示
	
	//2009/11/04
	//ペットサブフォーム
	d.f_petsub1.selectedIndex = a[20][0];
	d.f_petsub2.selectedIndex = a[20][1];
	
	//2009/12/03
	//カウンターリベリオン、ドッペルゲンガー用
	d.f_mapLv.text = a[21];
	
	//2010/03/02
	//エンブレム・イベントでの経験値増加入力フォーム
	d.f_exp.text = a[22];
	
	//Alert.show(a.toString());
}
menu function export(event:Event):Boolean{
	var p:Panel = new Panel();
	
	p.title = "エクスポート/インポート";
	p.name = "export";
	p.setStyle("borderAlpha","1.0");
	
	var f:Form = new Form();//Layout用
	f.name = "form";
	p.addChild(f);
	
	var te:Text = new Text();//案内
	te.text = "エクスポート/インポート";
	te.setStyle("fontWeight","bold");
	f.addChild(te);
	
	var ta:TextArea = new TextArea();
	ta.name = "data";
	ta.width = 300;
	ta.height = 300;
	ta.addEventListener(FocusEvent.FOCUS_IN,menu::sel);
	f.addChild(ta);
	
	var hbox:HBox = new HBox();//ボタン用のLayout
	f.addChild(hbox);
	
	var b:Button = new Button();//エクスポートボタン
	b.label = "エクスポート";
	b.addEventListener(MouseEvent.CLICK,menu::exportbutton);
	hbox.addChild(b);
	
	b = new Button();//インポートボタン
	b.label = "インポート";
	b.addEventListener(MouseEvent.CLICK,menu::exportbutton);
	hbox.addChild(b);
	
	b = new Button();//全選択ボタン
	b.label = "全選択";
	b.addEventListener(MouseEvent.CLICK,menu::exportbutton);
	hbox.addChild(b);
	
	b = new Button();//キャンセルボタン
	b.label = "キャンセル";
	b.addEventListener(MouseEvent.CLICK,menu::exportbutton);
	f.addChild(b);
	
	this.addChild(p);
	return true;
}
menu function exportbutton(event:Event):Boolean{
	var p:Panel = this.getChildByName("export") as Panel;	
	var a:Array;
	if(event.target.label == "キャンセル"){
		this.removeChild(p);
		return false;
	}
	if(event.target.label == "エクスポート"){
		a = menu::getdata(dat::d.f_title.text);
		((p.getChildByName("form") as Form).getChildByName("data") as TextArea).text = a.toString();
	}
	if(event.target.label == "インポート"){
		var str:String = ((p.getChildByName("form") as Form).getChildByName("data") as TextArea).text;
		var a2:Array = str.split(/,/g);
		menu::setdata(menu::exportdata(a2));
		Alert.show("データをインポートしました。");
	}
	if(event.target.label == "全選択"){
		((p.getChildByName("form") as Form).getChildByName("data") as TextArea).setFocus();
		((p.getChildByName("form") as Form).getChildByName("data") as TextArea).setSelection(0,((p.getChildByName("form") as Form).getChildByName("data") as TextArea).length);
	}
	return true;
}
menu function sel(event:Event):void{
	var p:Panel = this.getChildByName("export") as Panel;	
	((p.getChildByName("form") as Form).getChildByName("data") as TextArea).setFocus();
	((p.getChildByName("form") as Form).getChildByName("data") as TextArea).setSelection(0,((p.getChildByName("form") as Form).getChildByName("data") as TextArea).length);
}
menu function exportdata(a2:Array):Array{
	var a:Array = new Array();
	var index:int=0;
	
	a[0] = a2[index++];//タイトル
	a[1] = parseInt(a2[index++]);//職
	a[2] = new Array();//ペット
	a[2][0] = parseInt(a2[index++]);
	a[3] = new Array();//羽
	a[3][0] = parseInt(a2[index++]);
	a[3][1] = parseInt(a2[index++]);
	a[3][2] = parseInt(a2[index++]);
	a[3][3] = parseInt(a2[index++]);
	a[3][4] = (a2[index++] == "true");
	a[4] = new Array();//ネックレス
	a[4][0] = parseInt(a2[index++]);
	a[4][1] = parseInt(a2[index++]);
	a[4][2] = parseInt(a2[index++]);
	for(var i:int=0;i<5;i++)
		a[4][i+3] = parseInt(a2[index++]);
	for(i=0;i<7;i++){//装備
		a[5+i] = new Array();
		a[5+i][0] = parseInt(a2[index++]);
		a[5+i][1] = parseInt(a2[index++]);
		a[5+i][2] = parseInt(a2[index++]);
		a[5+i][3] = parseInt(a2[index++]);
		a[5+i][4] = (a2[index++] == "true");
		a[5+i][5] = parseInt(a2[index++]);
		a[5+i][6] = parseInt(a2[index++]);
		a[5+i][7] = parseInt(a2[index++]);
		for(var j:int=0;j<5;j++)
			a[5+i][8+j] = parseInt(a2[index++]);
		for(j=0;j<5;j++){
			a[5+i][13+j*2] = parseInt(a2[index++]);
			a[5+i][13+j*2+1] = parseInt(a2[index++]);
		}
		for(j=0;j<2;j++){
			a[5+i][23+j] = parseInt(a2[index++]);
		}
		a[5+i][25] = (a2[index++] == "true");
		if(i==0)a[5+i][26] = parseInt(a2[index++]);
	}
	for(i=0;i<2;i++){//リング
		a[12+i] = new Array();
		a[12+i][0] = parseInt(a2[index++]);
		a[12+i][1] = parseInt(a2[index++]);
		a[12+i][2] = parseInt(a2[index++]);
		for(j=0;j<5;j++)
			a[12+i][j+3] = parseInt(a2[index++]);
	}
	a[14] = new Array();//ステータス
	a[14][0] = a2[index++];
	a[14][1] = a2[index++];
	a[14][2] = a2[index++];
	a[14][3] = a2[index++];
	a[14][4] = a2[index++];
	a[14][5] = a2[index++];
	a[15] = new Array();//サポート
	a[15][0] = a2[index++];
	a[15][1] = a2[index++];
	a[15][2] = a2[index++];
	a[15][3] = a2[index++];
	a[15][4] = a2[index++];
	a[15][5] = (a2[index++] == "true");
	a[15][6] = (a2[index++] == "true");
	a[15][7] = (a2[index++] == "true");
	a[15][8] = a2[index++];
	a[15][9] = a2[index++];
	a[16] = new Array();//課金類
	a[16][0] = (a2[index++] == "true");
	a[16][1] = (a2[index++] == "true");
	a[16][2] = (a2[index++] == "true");
	a[16][3] = parseInt(a2[index++]);
	a[16][4] = parseInt(a2[index++]);
	a[16][5] = parseInt(a2[index++]);
	a[17] = new Array();//マップ
	a[17][0] = parseInt(a2[index++]);
	a[18] = a2[index++]
	a[19] = new Array();
	for(i=0;i<=MLV.num;i++)//マスターレベル
		a[19][i] = parseInt(a2[index++]);
	//2009/11/04
	//ペットサブフォーム
	a[20] = new Array();
	a[20][0] = parseInt(a2[index++]);
	a[20][1] = parseInt(a2[index++]);
	//2009/12/03
	//カウンターリベリオン、ドッペルゲンガー用
	a[21] = a2[index++];
	//2010/03/02
	//エンブレム・イベントでの経験値増加入力フォーム
	a[22] = a2[index++];
	return a;
}
