// ActionScript file
import mx.core.UIComponent;
import Csv.Item;

import MuCalc.MLV;

import flash.events.Event;
import flash.events.MouseEvent;

import mx.containers.Box;
import mx.containers.Canvas;
import mx.containers.Panel;
import mx.containers.TitleWindow;
import mx.containers.VBox;
import mx.controls.Alert;
import mx.controls.ComboBox;
import mx.controls.Label;
import mx.controls.TextInput;
import mx.core.IFlexDisplayObject;
import mx.events.CloseEvent;
import mx.events.ListEvent;
import mx.managers.PopUpManager;

public namespace click;
public namespace change;

click var mlvLabel:Array = new Array();
click var mlvAlpha:Array = new Array();
click var visible_check:Boolean = false;


private function show(obj:UIComponent):void{
	if(obj!=null){
		obj.includeInLayout = true;
		obj.visible = true;
	}
}
click function changeMapLv(event:Event):void{
	//LVの値のチェック
	var lv:int = parseInt(event.target.text);
	if(lv < 1) lv = 1;
	if(lv > 600) lv = 600;
	event.target.text = lv.toString();
}
click function changeMap(event:Event):void{
	//マップ変更に伴うサブフォームの表示
	var map:String = event.target.selectedLabel;
	if(map == "ドッペルゲンガー" || map == "カウンターリベリオン")
		show(form::mapBox);
	else hide(form::mapBox);
}
click function focusEvent(event:Event):void{
	//全選択にする
	event.target.parent.setSelection(0,event.target.length);
}
click function sobonusChange(event:Event):void{
	var item:Item = dat::d.getItemByName(event.target.name);//どの部位か取得
	if(item.f_sobonus[0].selectedIndex == item.f_sobonus[1].selectedIndex){
		event.target.selectedIndex=0;
	}
}
click function InputSupportCommit(event:Event):void{
	use namespace dat;
	//入力支援で入力された値を計算フォームに確定させる
	//ターゲットフォームを取得
	var target:TextInput = new TextInput();
	if(event.target.name == s.R_A)target = d.s_aplus;
	if(event.target.name == s.R_G)target = d.s_gplus;
	if(event.target.name == s.R_C)target = d.s_cplus;
	if(event.target.name == s.R_SL)target = d.s_sl;
	if(event.target.name == s.R_SB)target = d.s_sb;
	if(event.target.name == s.R_INNER)target = d.s_inner;
	if(event.target.name == s.R_WEAK)target = d.s_weak;
	//コピー
	target.text = s.supportdatas[event.target.name].text;
	//パネルにコピー
	s.supportdatas[s.C_A].label = "A+:"+d.s_aplus.text;
	s.supportdatas[s.C_G].label = "G+:"+d.s_gplus.text;
	s.supportdatas[s.C_C].label = "C+:"+d.s_cplus.text;
	s.supportdatas[s.C_SL].label = "SL:"+d.s_sl.text+"%";
	s.supportdatas[s.C_SB].label = "SB:"+d.s_sb.text+"%";
	s.supportdatas[s.C_INNER].label = "インナーベーション:"+d.s_inner.text+"%";
	s.supportdatas[s.C_WEAK].label = "ウイークネス:"+d.s_weak.text+"%";
}
click function InputSupport(event:Event):void{
	use namespace dat;
	//nameを取得
	var name:String = event.target.parent.name;
	//入力支援
	if(event.target.className == "UITextField"){
		event.target.text = "0"+event.target.text;//NaN防止
		if(name == "ee_ene" && parseInt(event.target.text) < sinit[0])
			s.supportdatas[s.EE_ENE].text = sinit[0];
		if(name == "dl_ene" && parseInt(event.target.text) < sinit[1])
			s.supportdatas[s.DL_ENE].text = sinit[1];
		if(name == "dl_rec" && parseInt(event.target.text) < sinit[2])
			s.supportdatas[s.DL_REC].text = sinit[2];
		if(name == "k_vit" && parseInt(event.target.text) < sinit[3])
			s.supportdatas[s.K_VIT].text = sinit[3];
		if(name == "k_ene" && parseInt(event.target.text) < sinit[4])
			s.supportdatas[s.K_ENE].text = sinit[4];
		if(name == "w_agi" && parseInt(event.target.text) < sinit[5])
			s.supportdatas[s.W_AGI].text = sinit[5];
		if(name == "w_ene" && parseInt(event.target.text) < sinit[6])
			s.supportdatas[s.W_ENE].text = sinit[6];
		if(name == "s_ene" && parseInt(event.target.text) < sinit[7])
			s.supportdatas[s.S_ENE].text = sinit[7];
		event.target.text = parseInt(event.target.text).toString();//NaN防止
	}
	//計算
	var list:Array;
	var list2:Array;
	var x:int = 0;
	var y:int = 0;
	//A+
	list = [70,67,62,59,56,53];//ｘのリスト
	list2 = [3,6,9,12,15,18];//yのリスト（＋α）
	x = list[s.supportdatas[s.MLV_A].selectedIndex];//ｘの値
	y = list2[s.supportdatas[s.MLV_A].selectedIndex];//yの値
	if(parseInt(s.supportdatas[s.EE_ENE].text) >= 92){//要求エナ制限
		var tmp:Number = Math.floor(((parseInt(s.supportdatas[s.EE_ENE].text)*10 / x) + y)*100)/100;
		if(Math.floor(tmp*1.1) != Math.floor(((parseInt(s.supportdatas[s.EE_ENE].text)*10 / x) + y)*1.1))
			tmp += 0.01;
		s.supportdatas[s.R_A].text = tmp;
	}else//要求エナに満たない場合
		s.supportdatas[s.R_A].text = "0";
	//G+
	list = [80,76,72,68,64,60];//ｘのリスト
	list2 = [2,4,6,8,10,12];//yのリスト（＋α）
	x = list[s.supportdatas[s.MLV_G].selectedIndex];//ｘの値
	y = list2[s.supportdatas[s.MLV_G].selectedIndex];//yの値
	s.supportdatas[s.R_G].text = Math.floor(parseInt(s.supportdatas[s.EE_ENE].text)*10 / x) + y;
	//C+
	s.supportdatas[s.R_C].text = Math.floor(parseInt(s.supportdatas[s.DL_ENE].text) / 30)
								+ Math.floor(parseInt(s.supportdatas[s.DL_REC].text) / 25);
	//SL
	list = [12,14,16,18,20,22];//ｘのリスト
	x = list[s.supportdatas[s.MLV_SL].selectedIndex];//ｘの値
	s.supportdatas[s.R_SL].text = Math.floor(parseInt(s.supportdatas[s.K_VIT].text) / 100)
								+ Math.floor(parseInt(s.supportdatas[s.K_ENE].text) / 20)
								+ s.supportdatas[s.PTM].selectedIndex + x;
	//SB
	list = [10,13,16,19,22,25];//ｘのリスト
	x = list[s.supportdatas[s.MLV_SB].selectedIndex];//ｘの値
	s.supportdatas[s.R_SB].text = Math.floor(parseInt(s.supportdatas[s.W_AGI].text) / 50)
								+ Math.floor(parseInt(s.supportdatas[s.W_ENE].text) / 200) + x;
	//インナーベーション
	if(parseInt(s.supportdatas[s.S_ENE].text) >= 912)//要求エナ制限
		s.supportdatas[s.R_INNER].text = Math.floor(parseInt(s.supportdatas[s.S_ENE].text) / 90) + 20;
	else//要求エナに満たない場合
		s.supportdatas[s.R_INNER].text = "0";
	//ウイークネス
	s.supportdatas[s.R_WEAK].text = Math.floor(parseInt(s.supportdatas[s.S_ENE].text) / 65) + 7;
	
}
click function Support(event:Event):void{
	//入力支援のパネルを表示
	this.addChild(form::supportpanel);
	click::InputSupportCommit((new MouseEvent(MouseEvent.CLICK)) as Event);
}
click function closeSupport(event:Event):void{
	//入力支援のパネルを閉じる
	var p:Panel = this.getChildByName("support") as Panel;
	this.removeChild(p);
}
click function petChange(event:Event):void{
	use namespace dat;
	//ペットの補助フォームを隠す
	hide(d.f_petsub1);
	hide(d.f_petsub2);
	//ペットの補助フォームの作成及び表示
	if(event.target.selectedLabel == "ディノラント"){
		show(d.f_petsub1);
		show(d.f_petsub2);
		d.f_petsub1.dataProvider = ["","AG+50","攻撃速度+5","ダメージ吸収+5%"];
		d.f_petsub2.dataProvider = ["","AG+50","攻撃速度+5","ダメージ吸収+5%"];
	}else if(event.target.selectedLabel == "フェンリル"){
		show(d.f_petsub1);
		d.f_petsub1.dataProvider = ["ノーマル","破壊","守護","黄金"];
	}else if(event.target.selectedLabel == "ダークホース"){
		show(d.f_petsub1);
		var a:Array = new Array();
		for(var i:int=1;i<=50;i++){
			a.push("LV"+i.toString());
		}
		d.f_petsub1.dataProvider = a;
	}
}
click function petsubChange(event:Event):void{
	if(dat::d.f_petsub1.selectedLabel == dat::d.f_petsub2.selectedLabel)
		event.target.selectedIndex = 0;
}
click function exopChange(event:Event):void{
	use namespace dat;
	var item:Item = d.getItemByName(event.target.name);//どの部位か取得
	var count:int=0;//EXOPが2個以上重複していないか確認するため
	for each(var i:ComboBox in item.f_exop)
		if(i.selectedIndex == event.target.selectedIndex)count++;
	//重複していたら、何も選択していない状態にする
	if(count >= 2)event.target.selectedIndex = 0;
}
click function kindChange(event:Event):void{
	use namespace dat;
	var sel:String = (event.target as ComboBox).selectedLabel;
	var p:Container = form::formbox[event.target.name];
	var a:Array = new Array();
	var item:Item = d.getItemByName(event.target.name);
	switch(sel){
		case "なし":
			change::hideEquip(item);
			if(item.name == "right")show(dat::d.f_left.f_kind);//右手に弓の場合消えているため
			p.setStyle("borderColor","#EEEEEE");
			break;
		case "通常":
			change::hideEquip(item);
			change::normal(item,0);
			p.setStyle("borderColor","#B7BABC");//デフォルト色
			break;
		case "EX":
			change::hideEquip(item);
			change::normal(item,0);
			change::ex(item);
			p.setStyle("borderColor","#99CC99");
			break;
		case "セット":
			change::hideEquip(item);
			change::setitem(item);
			p.setStyle("borderColor","#99DDFF");
			break;
		case "ソケット":
			change::hideEquip(item);
			change::normal(item,1);
			change::so(item);
			p.setStyle("borderColor","#AA99BB");
			break;
		case "EXソケット":
			change::hideEquip(item);
			change::normal(item,1);
			change::so(item);
			change::ex(item);
			p.setStyle("borderColor","#BBBB99");
			break;
		case "鷹":
			change::hideEquip(item);
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
click function kindChangeAcc(event:Event):void{
	use namespace dat;
	var sel:String = (event.target as ComboBox).selectedLabel;
	var p:Panel = new Panel();
	var item:Item = d.getItemByName(event.target.name);
	switch(sel){
		case "なし":
		default:
			hide(form::exbox[item.name]);
			hide(form::setbox[item.name]);
			p.setStyle("borderColor","#EEEEEE");
			break;
		case "EX":
			hide(form::setbox[item.name]);
			show(form::exbox[item.name]);
			p.setStyle("borderColor","#99CC99");
			break;
		case "セット":
			hide(form::exbox[item.name]);
			show(form::setbox[item.name]);
			change::setitem(item);
			p.setStyle("borderColor","#99DDFF");
			break;
	}
}
click function wingChange(event:Event):void{
	use namespace dat;
	var wingname:String = d.f_wing.f_item.selectedLabel;
	if(wingname == "なし"){
		//各種隠し
		change::hideWing();
	}else{
		//opの作成
		var op:Array = c.getWingOp(wingname);
		d.f_wing.f_op.dataProvider = op;
		
		//copの作成
		var cop:Array = c.getWingCop(wingname);
		d.f_wing.f_cop.dataProvider = cop;
		
		//各種表示
		show(d.f_wing.f_luck);
		show(d.f_wing.f_luck_label);
		show(d.f_wing.f_plus);
		if(op.length > 1)show(d.f_wing.f_op);
		if(cop.length > 1)show(d.f_wing.f_cop);
	}
}
click function itemChange(event:Event):void{
	use namespace dat;
	//部位取得
	var item:Item = d.getItemByName(event.target.name);
	if(item.f_kind.selectedIndex > 0){
		//EXOPの変更
		change::exop(item);
		//OPの変更
		change::op(item);
		//380OPの変更
		if((item.f_item.selectedItem[2] == "通常" || item.f_item.selectedItem[2] == "EX")
		 && item.f_item.selectedItem[6] == 380){
			show(form::box380[item.name]);
		}else{
			hide(form::box380[item.name]);
			item.f_380.selected = false;
		}
		//セットOPの変更
		change::setop(item);
		//ソケットOPの変更
		change::soop(item);
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
		//エンチャントOP変更
		if(item.f_kind.selectedLabel == "通常" || item.f_kind.selectedLabel == "EX"){
			change::en(item);
			change::enop(item);
		}
	}
}
click function accitemChange(event:Event):void{
	use namespace dat;
	//部位取得
	var item:Item = d.getItemByName(event.target.name);
	//セットOPの変更
	change::setop(item);
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
private function resetAcc(item:Item):void{
	item.f_kind.selectedIndex = 0;
	for(var i:int = 0;i<item.f_exop.length;i++){
		item.f_exop[i].selectedIndex = 0;
	}
	item.f_kind.dispatchEvent(new Event(Event.CHANGE));
}
click function jobChange(event:Event):void{
	use namespace dat;
	//ステータスの変更
	if(d.f_job.selectedLabel == "ダークロード") d.f_rec.parent.visible = true;
	else d.f_rec.parent.visible = false;
	d.f_lv.text = "0";
	d.f_str.text = "0";
	d.f_agi.text  = "0";
	d.f_vit.text  = "0";
	d.f_ene.text  = "0";
	d.f_rec.text  = "0";
	change::statusChange();
	//羽の変更
	d.f_wing.f_item.dataProvider = c.getWing(d.f_job.selectedIndex);
	click::wingChange(new Event(Event.CHANGE));
	//ペットフォームの変更
	if(d.f_job.selectedLabel == "ダークロード")
		d.f_pet.dataProvider = new ArrayCollection(
			["なし","サタン","守護天使","デーモン","守護精霊"
			,"ユニリア","ディノラント","フェンリル","ダークホース"
			,"白と黒のポンガ","白銀のアリオン","スケルトンパージドラゴン"]);
	else
		d.f_pet.dataProvider = new ArrayCollection(
			["なし","サタン","守護天使","デーモン","守護精霊"
			,"ユニリア","ディノラント","フェンリル"
			,"白と黒のポンガ","白銀のアリオン","スケルトンパージドラゴン"]);
	d.f_pet.dispatchEvent((new ListEvent(ListEvent.CHANGE)) as Event);
	//各種アイテムフォームのリセット
	resetEquip(d.f_right);
	resetEquip(d.f_left);
	resetEquip(d.f_helm);
	resetEquip(d.f_armor);
	resetEquip(d.f_glove);
	resetEquip(d.f_garter);
	resetEquip(d.f_boots);
	resetAcc(d.f_neck);
	resetAcc(d.f_ring1);
	resetAcc(d.f_ring2);
	formMLV();//MLVウインドウの再作成
	//魔剣士の場合　兜を隠す
	if(d.f_job.selectedLabel == "魔剣士")form::helmbox.visible = false;
	else form::helmbox.visible = true;
	//WIZの場合、スペルエンハンスを表示
	if(d.f_job.selectedLabel == "ウィザード")show(form::sebox);
	else{hide(form::sebox);d.s_se.selected = false;}
	//召喚師の場合、バーサーカーを表示
	if(d.f_job.selectedLabel == "召喚師")show(form::berserkerbox);
	else{hide(form::berserkerbox);d.s_berserker.selected = false;}
	//ダークロードの場合、鷹を表示する
	if(d.f_job.selectedLabel == "ダークロード")
		d.f_left.f_kind.dataProvider = ["なし","通常","EX","セット","ソケット","EXソケット","鷹"];
	else
		d.f_left.f_kind.dataProvider = ["なし","通常","EX","セット","ソケット","EXソケット"];
	//レイジファイターの場合、敵の防御力無視を表示
	if(d.f_job.selectedLabel == "レイジファイター"){
		show(form::ignorebox);
		form::glovebox.visible = false;
	}else{
		hide(form::ignorebox);
		d.s_ignore.selected = false;
		form::glovebox.visible = true;
	}
	
}
click function soopChange(event:Event):Boolean{
	var item:Item = dat::d.getItemByName(event.target.name);
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
click function en(event:Event):void{
	use namespace dat;
	var item:Item = d.getItemByName(event.target.name);
	if(item.f_enop.dataProvider.length){
		change::enop(item);
	}
}
click function plus(event:Event):void{
	use namespace dat;
	var item:Item = d.getItemByName(event.target.name);
	if(item.f_kind.selectedLabel == "通常" || item.f_kind.selectedLabel == "EX"){
		change::en(item);
		change::enop(item);
	}
}
click function statusChange(event:Event):void{
	change::statusChange();
}
click function calcButton(event:Event):void{
	calc::panel();
}
click function calcButtonAAgetter(event:Event):void{
	calc::AACalcDamage();
}
click var tabindex:int=2;
click function tab(event:Event):void{
	form::tab.selectedIndex = form::tab.getChildIndex(form::tab.getChildByName(event.target.name));
}
click function closeCalc(event:Event):void{
	form::acb.removeChild(form::acb.getChildByName(event.target.name));//上のバーからボタンを削除
	form::tab.removeChildAt(form::tab.getChildIndex(form::tab.getChildByName(event.target.name)));//ページを削除
}

click function mlv(event:Event):void{
	//LV400かチェック
	if(dat::d.f_lv.text == "400"){
		//PopUpManagerでモーダルON（背景をぼやかせる）
		//PopUpはTitleWindowで作成
		var pop:TitleWindow = PopUpManager.createPopUp(this,TitleWindow,true) as TitleWindow;
		pop.width = 820;
		pop.height = 500;
		pop.setStyle("borderColor","black");
		pop.setStyle("borderAlpha","0.3");
		pop.showCloseButton = true;//右上の×ボタン
		pop.addEventListener(CloseEvent.CLOSE,click::mlvclose);//右上の×ボタンのイベント
		PopUpManager.centerPopUp(pop);
		pop.title = "マスターレベル";//タイトル
		
		pop.addChild(form::mlvBox);//MLVキャンバスを載せる
	}else{
		Alert.show("LVを400にしてください。");
	}
}
click function treeRow(i:int = -1):VBox{
	var vbox:VBox = new VBox();
	vbox.width=48;
	if(i < 0)return vbox;
	vbox.addChild(click::mlvCanvas(i));
	return vbox;
}
click function treeName(str:String):Canvas{
	//ツリー名を中心に表示させるためのオブジェクト
	var can:Canvas = new Canvas();
	can.percentWidth = 100;
		var la:Label = new Label();//ツリー名
		la.text = str;
		la.setStyle("horizontalCenter","0");
	can.addChild(la);
	return can;
}
click function mlvCanvas(i:int):Canvas{
	//マスターレベルスキルのアイコンに＋－のボタンとかをくっつける
	var can:Canvas = new Canvas();
	can.setStyle("backgroundColor","#000000");
	can.width = 32;
	can.height = 28;
	//マスターレベルのスキルアイコンを貼り付ける
	can.addChild(dat::mlv.img[i]);
	dat::mlv.img[i].addEventListener(MouseEvent.CLICK,click::mlvPlusMax);
	//不活性表示用
	var can2:Canvas = new Canvas();
	can2.setStyle("backgroundColor","#000000");
	can2.setStyle("backgroundAlpha","0.4");
	can2.width = 32;
	can2.height = 28;
	can2.toolTip = dat::mlv.img[i].toolTip;
	can2.name = i.toString();
	can2.addEventListener(MouseEvent.CLICK,click::mlvPlusMax);
	click::mlvAlpha[i] = can2;//配列に保存
	can.addChild(can2);
	//▲矢印
		var la:Label = new Label();
		la.name = i.toString();//識別用
		la.width = 12;
		la.height = 12;
		la.x = 20;
		la.y = 0;
		la.setStyle("fontSize","6");
		la.setStyle("color","#FFFFFF");
		la.text = "▲";
	can.addChild(la);
	//▼矢印
		la = new Label();
		la.name = i.toString();//識別用
		la.width = 12;
		la.height = 12;
		la.x = 20;
		la.y = 16;
		la.setStyle("fontSize","6");
		la.setStyle("color","#FFFFFF");
		la.text = "▼";
	can.addChild(la);
	//スキルレベル
		la = new Label();
		la.name = i.toString();//識別用
		la.width = 12;
		la.height =20;
		la.x = 20;
		la.y = 6;
		la.setStyle("fontSize","10");
		la.setStyle("color","#FFFFFF");
		la.text = "0";
	click::mlvLabel[i] = la;//配列に保存
	can.addChild(la);
	//イベント用ダミー▲矢印
		var box:Box = new Box();
		box.addEventListener(MouseEvent.CLICK,click::mlvPlus);
		box.name = i.toString();//識別用
		box.width = 12;
		box.height = 14;
		box.x = 20;
		box.y = 0;
	can.addChild(box);
	//イベント用ダミー▼矢印
		box = new Box();
		box.addEventListener(MouseEvent.CLICK,click::mlvZero);
		box.name = i.toString();//識別用
		box.width = 12;
		box.height = 14;
		box.x = 20;
		box.y = 14;
	can.addChild(box);
	//サイズを1.5倍に拡大
	can.scaleX = 1.5;
	can.scaleY = 1.5;
	return can;
}
click function mlvPlusMax(event:Event):void{
	use namespace dat;
	//マスタースキルの＋
	var i:int = parseInt(event.target.name);//ターゲット
	//カウンタを増やす
	mlvcount.setSkill(i,5);
	//表示する。
	click::mlvShow();
	//ポイントの表示
	click::mlvShowPoint();
}
click function mlvPlus(event:Event):void{
	use namespace dat;
	//マスタースキルの＋
	var i:int = parseInt(event.target.name);//ターゲット
	//カウンタを増やす
	mlvcount.setSkill(i,mlvcount.getSkill(i)+1);
	//表示する。
	click::mlvShow();
	//ポイントの表示
	click::mlvShowPoint();
}
click function mlvZero(event:Event):void{
	use namespace dat;
	//マスタースキルの－
	var i:int = parseInt(event.target.name);//ターゲット
	//カウンタを減らす
	mlvcount.setSkill(i,0);
	//表示を-1する。
	//click::mlvLabel[i].text = mlvcount.getSkill(i).toString();
	click::mlvShow();
	//ポイントの表示
	click::mlvShowPoint();
}
click function mlvShow():void{
	for(var i:int = 0;i <= MLV.num;i++){
		if(click::mlvLabel[i]){//存在の確認
			click::mlvLabel[i].text = dat::mlvcount.getSkill(i).toString();
			if(click::mlvLabel[i].text == "0")
				click::mlvAlpha[i].setStyle("backgroundAlpha","0.4");//活性化
			else
				click::mlvAlpha[i].setStyle("backgroundAlpha","0.0");//不活性化
		}
	}
}
click function mlvShowPoint():void{
	var point:int = dat::mlvcount.getMLVPoint(parseInt(dat::d.f_mlv.text));
	if(point < 0)form::mlvpoint.setStyle("color","#FF0000");
	else form::mlvpoint.setStyle("color","#0B333C");
	form::mlvpoint.text = "ポイント " + point + "/" + dat::d.f_mlv.text;
}
click function mlvclose(event:Event):void{
	PopUpManager.removePopUp(event.target as IFlexDisplayObject);	
}
click function mlvChange(event:Event):void{
	//MLVのLVが変更されたとき
	var lv:int = parseInt(dat::d.f_mlv.text);
	if(lv>200) dat::d.f_mlv.text = "200";
	else dat::d.f_mlv.text = lv.toString();
	//ポイントの表示
	click::mlvShowPoint();
}
change function statusChange():void{
	use namespace dat;
	var jobpoint:int = 0;
	//ステータスフォームが変更されたとき
	//各種制限値
	var i:int = parseInt(d.f_lv.text);
	if(i > 400) i = 400;
	if(i == 0) i = 1;
	d.f_lv.text = i.toString();
	//力制限
	var limit:int;
	i = parseInt(d.f_str.text);
	limit = dat::c.getJobPoint(d.f_job.selectedIndex,"str");
	jobpoint += limit;
	if(i < limit) i = limit;
	d.f_str.text = i.toString(); 
	//敏制限
	i = parseInt(d.f_agi.text);
	limit = dat::c.getJobPoint(d.f_job.selectedIndex,"agi");
	jobpoint += limit;
	if(i < limit) i = limit;
	d.f_agi.text = i.toString(); 
	//体力制限
	i = parseInt(d.f_vit.text);
	limit = dat::c.getJobPoint(d.f_job.selectedIndex,"vit");
	jobpoint += limit;
	if(i < limit) i = limit;
	d.f_vit.text = i.toString(); 
	//エナジー制限
	i = parseInt(d.f_ene.text);
	limit = dat::c.getJobPoint(d.f_job.selectedIndex,"ene");
	jobpoint += limit;
	if(i < limit) i = limit;
	d.f_ene.text = i.toString(); 
	//統率制限
	if(d.f_job.selectedLabel == "ダークロード"){
		i = parseInt(d.f_rec.text);
		limit = dat::c.getJobPoint(d.f_job.selectedIndex,"rec");
		jobpoint += limit;
		if(i < limit) i = limit;
		d.f_rec.text = i.toString(); 
	}
	    //ポイント計算
	    //実の生成ポイント計算
	    var fruitmax:int = 0;
	    var point:int = 0;
	    var lv:int = parseInt(d.f_lv.text);
	    var str:int = parseInt(d.f_str.text);
	    var agi:int = parseInt(d.f_agi.text);
	    var vit:int = parseInt(d.f_vit.text);
	    var ene:int = parseInt(d.f_ene.text);
	    var rec:int = 0;
	    if(d.f_job.selectedLabel == "魔剣士" || d.f_job.selectedLabel == "レイジファイター"){//mの計算
	        //ポイント計算
	        point = (lv-1)*7;
	        if(lv>=380)point += 20;
	        if(lv==400)point += 50;
	        //実のポイント計算
	        if(lv>=10)fruitmax += 2;
	        fruitmax += Math.floor(lv/10) * 2;
	        if(lv>220)fruitmax += Math.floor((lv-220)/10);
	    }else if(d.f_job.selectedLabel == "ダークロード"){//dの計算
	        //ポイント計算
	        point = (lv-1)*7;
	        if(lv>=380)point += 20;
	        if(lv==400)point += 50;
	        //実のポイント計算
	        if(lv>=10)fruitmax += 2;
	        fruitmax += Math.floor(lv/10) * 2;
	        if(lv>220)fruitmax += Math.floor((lv-220)/10);
	        if(lv>250)fruitmax += Math.floor((lv-250)/10);
	        //統率
	        rec = parseInt(d.f_rec.text);
	    }else{//k w e sの計算
	        //ポイント計算
	        point = (lv-1)*5;
	        if(lv>=150)point += 20;
	        if(lv>220)point += lv - 220;
	        if(lv>=380)point += 20;
	        if(lv==400)point += 50;
	        //実のポイント計算
	        if(lv>=10)fruitmax += 2;
	        fruitmax += Math.floor(lv/10) * 2;
	        if(lv>=130)fruitmax += Math.floor((lv-120)/10);
	        if(lv>=260)fruitmax += Math.floor((lv-250)/10);
	        if(lv>=390)fruitmax += Math.floor((lv-380)/10);
	    }
	    point = point - ((str+agi+vit+ene+rec) - jobpoint);
	    var fruitnow:int = 0;
	    if(point < 0)fruitnow = - point;
	    if(fruitnow > fruitmax)fruitnow = fruitmax;
	    point += fruitnow;
	    //表示
	    form::fruitpoint[1].text = point.toString();
	    if(point < 0)form::fruitpoint[1].setStyle("color","#FF0000");
	    else form::fruitpoint[1].setStyle("color","#0B333C");
	    form::fruitpoint[3].text = fruitnow.toString() + "/" + fruitmax.toString();
}
change function showEquip(item:Item):void{
	show(item.f_luck);
	show(item.f_luck_label);
	show(item.f_item);
	show(item.f_plus);
	show(item.f_op);
}
change function hideEquip(item:Item):void{
	hide(item.f_luck);//幸運
	hide(item.f_luck_label);//幸運
	hide(item.f_item);//アイテム
	hide(item.f_plus);//＋
	hide(item.f_op);//op
	hide(form::exbox[item.name]);//EX
	hide(item.f_cop);//セットステータスOP
	hide(form::sobox[item.name]);//ソケット
	hide(item.f_enop);//エンチャント
	hide(item.f_enop_value)//エンチャントOP
	hide(form::box380[item.name]);//380op
	if(item.name == "right")hide(dat::d.f_right.f_arrow);//矢のフォーム
}
change function showSet(item:Item):void{
	show(item.f_luck);
	show(item.f_luck_label);
	show(item.f_item);
	show(item.f_plus);
	show(item.f_op);
	show(item.f_cop);
}
change function hideWing():void{
	use namespace dat;
	//各種隠し
	hide(d.f_wing.f_cop);
	hide(d.f_wing.f_op);
	hide(d.f_wing.f_plus);
	hide(d.f_wing.f_luck);
	hide(d.f_wing.f_luck_label);
}
change function normal(item:Item,type:int):Boolean{
	use namespace dat;
	//フォームを表示
	change::showEquip(item);
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
	change::op(item);
	//エンチャントOPの作成
	if(type==0){
		change::en(item);
	}
	return true;
}
change function setitem(item:Item):Boolean{
	use namespace dat;
	//フォームを表示
	change::showSet(item);
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
	change::op(item);
	
	//セットステータスOPの追加
	change::setop(item);
	
	return true;
}
change function en(item:Item):Boolean{
	use namespace dat;
	if(!item.f_item.selectedItem)return false;//インポート対策
	var sel:int = item.f_enop.selectedIndex;
	item.f_enop.dataProvider = c.getEnchaunt(
			c.getEnchauntKind(item.f_item.selectedItem),
			item.f_plus.selectedIndex);
	item.f_enop.selectedIndex = sel;
	
	return true;
}
change function enop(item:Item):Boolean{
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
change function ex(item:Item):Boolean{
	use namespace dat;
	//EXOPの作成
	change::exop(item);
	//表示
	show(form::exbox[item.name]);
	return true;
}
change function so(item:Item):Boolean{
	use namespace dat;
	//SOOPの作成
	change::soop(item);
	//表示
	show(form::sobox[item.name]);
	return true;
}
change function exop(item:Item):Boolean{
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
change function soop(item:Item):Boolean{
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
change function op(item:Item):Boolean{
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
change function setop(item:Item):Boolean{
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
