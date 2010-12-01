// ActionScript file
import AAgetter.AAgetter;

import Csv.*;

import MuCalc.MLV;
import MuCalc.MLVcount;

import MuData.Internal;

import flash.events.Event;
import flash.events.FocusEvent;
import flash.events.MouseEvent;

import mx.collections.ArrayCollection;
import mx.containers.ApplicationControlBar;
import mx.containers.Box;
import mx.containers.Canvas;
import mx.containers.Form;
import mx.containers.FormItem;
import mx.containers.HBox;
import mx.containers.Panel;
import mx.containers.VBox;
import mx.containers.ViewStack;
import mx.controls.Button;
import mx.controls.CheckBox;
import mx.controls.ComboBox;
import mx.controls.Label;
import mx.controls.ProgressBar;
import mx.controls.TextArea;
import mx.controls.TextInput;
import mx.core.Container;
import mx.core.UIComponent;
import mx.events.ListEvent;

dat var d:Dat = new Dat();
dat var mlv:MLV = new MLV();
dat var mlvcount:MLVcount = new MLVcount();

dat var s:InputDat = new InputDat();//入力支援のデータを入れるところ
dat var sinit:Array = [72,102,300,25,10,18,408,663];//入力支援フォームの初期値
//[0.EEのエナ,1.DLのエナ,2.DLの統率,3.Kの体力,4.Kのエナ,5.Wの敏捷,6.Wのエナ,7.召喚師のエナ]

dat var aagetter:AAgetter;

form var out:Canvas;//大枠
form var formbox:Array = new Array();//装備フォーム
form var exbox:Array = new Array();//EXオプション
form var setbox:Array = new Array();//セットステータス
form var sobox:Array = new Array();//ソケットオプション
form var box380:Array = new Array();//380OP
form var helmbox:Container;//兜
form var fruitpoint:Array = new Array();//実のポイント
form var mlvpoint:Label;//MLVのポイント
form var mlvBox:Box;//MLV
form var sebox:Container;//スペルエンハンス
form var berserkerbox:Container;//バーサーカー
form var ignorebox:Container;//敵の防御力無視
form var mapBox:Container;

form var supportpanel:Panel;//入力支援のパネル

form var tab:ViewStack;
//form var acb:ApplicationControlBar;
form var acb:HBox;

form var pre:Canvas;
form var pro:ProgressBar;
form var textarea:TextArea = new TextArea();
form function init():void{
	//大枠から
	use namespace form;
	use namespace dat;
	//
	this.setStyle("backgroundColor","#FFFFFF");
	this.setStyle("fontSize","13");
	//this.setStyle("fontWeight","bold");
	this.setStyle("fontFamily","Verdana");
	
	//アプリケーションコントロールバー
	var a:ApplicationControlBar = new ApplicationControlBar();
	a.dock = true;
	this.addChild(a);
	//サイズ変更
	a.height = 50;
	a.setStyle("paddingBottom","0");
	a.setStyle("paddingTop","0");
	a.setStyle("paddingRight","0");
	a.setStyle("paddingTLeft","0");
	
	//1段目
	var vbox:VBox = new VBox();
	a.addChild(vbox);
	var hbox:HBox = new HBox();
	vbox.addChild(hbox);
	
	//バージョン情報
	var la:Label = new Label();
	la.text = "MUDamage7 ver1.96";
	hbox.addChild(la);
	
	//拡大縮小ボタン
	var b:Button = new Button();
	b.height = 20;
	b.label = "拡大";
	b.addEventListener(MouseEvent.CLICK,menu::big);
	hbox.addChild(b);
	b = new Button();
	b.height = 20;
	b.label = "縮小";
	b.addEventListener(MouseEvent.CLICK,menu::small);
	hbox.addChild(b);

	//セーブボタン
	b = new Button();
	b.height = 20;
	b.label = "保存";
	b.addEventListener(MouseEvent.CLICK,menu::save);
	hbox.addChild(b);
	//開くボタン
	b = new Button();
	b.height = 20;
	b.label = "開く";
	b.addEventListener(MouseEvent.CLICK,menu::open);
	hbox.addChild(b);
	
	//インポートとエクスポート
	b = new Button();
	b.height = 20;
	b.label = "エクスポート/インポート";
	b.addEventListener(MouseEvent.CLICK,menu::export);
	hbox.addChild(b);
	
	//石造破壊シミュレータ
	b = new Button();
	b.height = 20;
	b.label = "石造破壊シミュレータ";
	b.name = "0";
	b.addEventListener(MouseEvent.CLICK,click::tab);
	hbox.addChild(b);
	
	//2段目
	hbox = new HBox();
	vbox.addChild(hbox);
	acb = hbox;//計算結果表示用
	
	
	//計算結果ウインドウ
	b = new Button();
	b.height = 20;
	b.label = "計算フォーム";
	b.name = "1";
	b.addEventListener(MouseEvent.CLICK,click::tab);
	hbox.addChild(b);
	
	//============================================================================
	// タブ
	//============================================================================
	
	//タブウインドウ
	tab = new ViewStack();//new TabNavigator();
	//tab.percentWidth = 100;
	tab.width = 1000;
	tab.percentHeight = 100;
	//tab.addEventListener(Event.CHANGE,click::tab);
	//tab.addEventListener(IndexChangedEvent.CHANGE,click::tab);
	this.addChild(tab);
	
	//石造破壊シミュレータ
	dat::aagetter = new AAgetter();
	var aa:Container = aagetter.getContainer();
	dat::d.aa_skill = dat::aagetter.addEvent(click::calcButtonAAgetter);
	aa.name = "0";
	tab.addChild(aa);
	
	//本体
	out = new Canvas();
	var f:Form = new Form();
	out.addChild(f);
	out.label = "MUDamage7";
	out.name = "1";
	tab.addChild(out);
	tab.selectedIndex = 1;
	//this.addChild(out);
	
	
	//テスト用
	/*
	var inter:Internal = new Internal();
	f.addChild(form::textarea);
	form::textarea.text =  inter.getRight(0).toString();
	var but:Button = new Button();
	//but.addEventListener(MouseEvent.CLICK,click::testbutton);
	f.addChild(but);
	*/
	//var aaaa:Array = dat::c.speed;
	//c.htmlExport([["あいうえお"]]);
	
	//============================================================================
	//　メイン
	//============================================================================
	
	//タイトルフォームの作成
	var fi:FormItem = new FormItem();
	fi.label = "タイトル:";
	var t:TextInput = new TextInput();
	fi.addChild(t);
	d.f_title = t;
	f.addChild(fi)
	
	//dummyフォームの作成
	f.addChild(formExp());
	
	//クラスフォームの作成
	f.addChild(formJob());
	
	//ペットフォームの作成
	f.addChild(formPet());
	
	//ステータスフォームの作成
	out.addChild(formStatus());
	
	//羽のフォームの作成
	f.addChild(formWing());
	
	//ネックのフォームの作成
	f.addChild(formNeck());
	
	//右手フォームの作成
	f.addChild(formEquip("右:",d.f_right,d.f_right.name));
	
	//左手フォームの作成
	f.addChild(formEquip("左:",d.f_left,d.f_left.name));
	
	//兜フォームの作成
	form::helmbox = formEquip("兜:",d.f_helm,d.f_helm.name);
	f.addChild(form::helmbox);
	
	//鎧フォームの作成
	f.addChild(formEquip("鎧:",d.f_armor,d.f_armor.name));
	
	//手フォームの作成
	f.addChild(formEquip("手:",d.f_glove,d.f_glove.name));
	
	//腰フォームの作成
	f.addChild(formEquip("腰:",d.f_garter,d.f_garter.name));
	
	//足フォームの作成
	f.addChild(formEquip("足:",d.f_boots,d.f_boots.name));
	
	//リング１のフォームの作成
	f.addChild(formRing("リング1",d.f_ring1,d.f_ring1.name));
	
	//リング２のフォームの作成
	f.addChild(formRing("リング2",d.f_ring2,d.f_ring2.name));
	
	//各種サポートのフォーム
	f.addChild(formSupport());
	
	//入力支援パネルの作成
	formInputSupport();
	
	//計算ボタンの作成
	f.addChild(formCalc());
	
	//MLVキャンバスの作成
	formMLV();
	
	
	
}
form var te:TextArea;
form function labelfunc(item:Object):String{
	if(item.toString() == "")return "";
	return item[1];
}
form function labelfunc0(item:Object):String{
	if(item.toString() == "")return "";
	return item[0];
}
private function hide(obj:UIComponent):void{
	obj.visible = false;
	obj.includeInLayout = false;
}
private function createPlus():ComboBox{
	var e:ComboBox = new ComboBox();
	hide(e);
	e.dataProvider = new ArrayCollection(dat::c.plus);
	//e.rowCount = 14;
	return e;
}
private function formExp():FormItem{
	var fi:FormItem = new FormItem();
	fi.direction = "horizontal";
	fi.label = "経験値増加(%)：";
	fi.toolTip = "エンブレムやイベントの経験値増加を入力してください。\n\n" + 
			"修練のエンブレム:150%\n" + 
			"豊穣のエンブレム:200%\n" + 
			"絆のエンブレム:\n" + 
			"2人200% 3人210% 4人220% 5人230%\n\n" + 
			"以下入力例です。\n\n" + 
			"イベントで経験値2倍、豊穣で2倍　→　合計400%\n" + 
			"絆のエンブレムを3人PTで使用　→　210%";
	fi.setStyle("color","#7777FF");
	//fi.setStyle("textDecoration","underline");
	
	var t:TextInput = new TextInput();
	t.restrict = "0-9";
	t.maxChars = 3;
	t.width = 42;
	t.addEventListener(FocusEvent.FOCUS_OUT,click::statusChange);
	t.addEventListener(FocusEvent.FOCUS_IN,click::focusEvent);
	
	dat::d.f_exp = t;
	
	fi.addChild(t);
	
	return fi;
}
private function formJob():FormItem{
	var fi:FormItem = new FormItem();
	fi.direction = "horizontal";
	fi.label = "クラス：";
	var co:ComboBox = new ComboBox();
	co.rowCount = 10;
	dat::d.f_job = co;
	co.dataProvider = new ArrayCollection(
		["ナイト","ウィザード","エルフ","魔剣士","ダークロード","召喚師","レイジーファイター"]);
	co.addEventListener(ListEvent.CHANGE,click::jobChange);
	fi.addChild(co);
	
	return fi;
}
private function formWing():FormItem{
	var fi:FormItem = new FormItem();
	fi.direction = "horizontal";
	fi.label = "羽：";

	//アイテムフォームの作成
	var item:ComboBox = new ComboBox();
	item.addEventListener(ListEvent.CHANGE,click::wingChange);
	item.dataProvider = dat::c.getWing(dat::d.f_job.selectedIndex);
	//item.labelField = "name";
	dat::d.f_wing.f_item = item;
	fi.addChild(item);
		//Alert.show(dat::c.getWing(dat::d.f_job.selectedIndex).toString());
	
	//幸運の作成
	dat::d.f_wing.f_luck = new CheckBox();
	hide(dat::d.f_wing.f_luck);
	fi.addChild(dat::d.f_wing.f_luck);
	var la:Label = new Label();
	dat::d.f_wing.f_luck_label = la;
	hide(la);
	la.text = "幸運";
	fi.addChild(la);
	
	//+フォームの作成
	var plus:ComboBox = createPlus();
	dat::d.f_wing.f_plus = plus;
	fi.addChild(plus);
	
	//opフォームの作成
	var op:ComboBox = new ComboBox();
	op.rowCount = 10;
	op.labelFunction = form::labelfunc0;
	hide(op);
	dat::d.f_wing.f_op = op;
	fi.addChild(op);
	
	//copフォームの作成
	var cop:ComboBox = new ComboBox();
	hide(cop);
	dat::d.f_wing.f_cop = cop;
	fi.addChild(cop);
	
	return fi;
}
private function formEquip(name:String,item:Item,f_name:String):FormItem{
	use namespace dat;
	var fi:FormItem = new FormItem();
	fi.label = name;
	//fi.setStyle("borderStyle","solid");//枠
	form::formbox[f_name] = fi;//配列に保存

	//fi.direction = "horizontal";
	//Hbox
	var hbox:HBox = new HBox();
	fi.addChild(hbox);
	
	//kindフォームの作成
	var kind:ComboBox = new ComboBox();
	item.f_kind = kind;
	kind.name = f_name;
	kind.addEventListener(ListEvent.CHANGE,click::kindChange);
	var data:ArrayCollection = new ArrayCollection(["なし","通常","EX","セット","ソケット","EXソケット"]);
	kind.dataProvider = data;
	kind.rowCount = 7;
	hbox.addChild(kind);
	
	//幸運の作成
	item.f_luck = new CheckBox();
	item.f_luck.name = f_name;
	hide(item.f_luck);
	hbox.addChild(item.f_luck);
	var la:Label = new Label();
	item.f_luck_label = la;
	item.f_luck_label.name = f_name;
	hide(la);
	la.text = "幸運";
	hbox.addChild(la);
	
	//アイテムフォームの作成
	item.f_item = new ComboBox();
	item.f_item.addEventListener(ListEvent.CHANGE,click::itemChange);
	item.f_item.name = f_name;
	item.f_item.width = 250;
	//item.f_item.labelField = "name";
	item.f_item.labelFunction = form::labelfunc;
	item.f_item.rowCount = 10;
	hide(item.f_item);
	hbox.addChild(item.f_item);
	
	//+の作成
	item.f_plus = createPlus();
	item.f_plus.name = f_name;
	item.f_plus.addEventListener(ListEvent.CHANGE,click::plus);
	hbox.addChild(item.f_plus);
	
	//opの作成
	item.f_op = new ComboBox();
	item.f_op.name = f_name;
	hide(item.f_op);
	hbox.addChild(item.f_op);
	
	//エンチャントOPの作成
	item.f_enop = new ComboBox();
	item.f_enop.name = f_name;
	item.f_enop.labelFunction = form::labelfunc0;
	item.f_enop.addEventListener(ListEvent.CHANGE,click::en);
	hide(item.f_enop);
	hbox.addChild(item.f_enop);
	item.f_enop_value = new ComboBox();
	item.f_enop_value.name = f_name;
	item.f_enop_value.width = 80;
	hide(item.f_enop_value);
	hbox.addChild(item.f_enop_value);
	
	//セットのステータスOP作成
	item.f_cop = new ComboBox();
	item.f_cop.name = f_name;
	hide(item.f_cop);
	hbox.addChild(item.f_cop);
	
	hbox = new HBox();
	fi.addChild(hbox);
	form::exbox[f_name] = hbox;
	hide(hbox);
	hbox.setStyle("backgroundColor","#DDFFDD");//背景色を緑色に
	//ラベル
	la = new Label();
	la.text = "　EXOP:";
	la.setStyle("fontWeight","bold");
	la.width = 120;
	hbox.addChild(la);
	//exopの作成
	for(var i:int=0;i<5;i++){
		var e:ComboBox = new ComboBox();
		e.width = 120;
		e.rowCount = 6;
		//hide(e);
		e.addEventListener(ListEvent.CHANGE,click::exopChange);
		item.f_exop[i] = e;
		item.f_exop[i].name = f_name;
		hbox.addChild(e);
	}
	
	//ソケットOPの作成
	var vbox:VBox = new VBox();
	fi.addChild(vbox);
	form::sobox[f_name] = vbox;
	hide(vbox);
	vbox.setStyle("backgroundColor","#DDCCFF");//背景色を紫色に
	//2行の箱を作る
	hbox = new HBox();
	vbox.addChild(hbox);
	//ラベル
	la = new Label();
	la.text = "　ソケットOP:";
	la.setStyle("fontWeight","bold");
	la.width = 120;
	hbox.addChild(la);
	//soopの作成
	for(i=0;i<5;i++){
		if(i==3){hbox = new HBox();vbox.addChild(hbox);}//2行目に突入
		e = new ComboBox();
		e.addEventListener(ListEvent.CHANGE,click::soopChange);
		//e.setStyle("alternatingItemColors",["#FF0000","#00FF00","#0000FF"]);
		e.labelFunction = form::labelfunc0;
		e.width = 140;
		e.rowCount = 6;
		item.f_soop[i] = e;
		item.f_soop[i].name = f_name;
		item.f_soop[i].id = f_name + "soop" + i;
		hbox.addChild(e);
		//値フォームの作成
		e = new ComboBox();
		e.width = 80;
		e.rowCount = 6;
		item.f_soop_value[i] = e;
		item.f_soop_value[i].name = f_name;
		item.f_soop_value[i].id = f_name + "soopv" + i;
		hbox.addChild(e);
	}
	//ボーナスソケットオプションの作成
	for(i=0;i<2;i++){
		e = new ComboBox();
		//e.setStyle("alternatingItemColors",["#FF0000","#00FF00","#0000FF"]);
		e.addEventListener(ListEvent.CHANGE,click::sobonusChange);
		e.width = 140;
		e.rowCount = 6;
		item.f_sobonus[i] = e;
		item.f_sobonus[i].name = f_name;
		hide(e);
		hbox.addChild(e);
	}
	
	//矢のフォーム作成
	if(name == "右:"){//右手のみ
		//矢のフォーム
		e = new ComboBox();
		hide(e);
		e.width = 140;
		e.dataProvider = ["矢+N","矢+1","矢+2","矢+3"];
		item.f_arrow = e;
		fi.addChild(e);
	}
	
	//380OPのフォーム作成
	hbox = new HBox();
	fi.addChild(hbox);
	form::box380[f_name] = hbox;
	hide(hbox);
	//380OPの作成
	item.f_380 = new CheckBox();
	item.f_380.name = f_name;
	hbox.addChild(item.f_380);
	la = new Label();
	item.f_380_label = la;
	item.f_380_label.name = f_name;
	la.text = "380op";
	hbox.addChild(la);
	
	return fi;
}
private function formNeck():FormItem{
	use namespace dat;
	var fi:FormItem = new FormItem();
	fi.width = 900;
	fi.label = "ネック:";
	fi.direction = "horizontal";
	var f_name:String = "neck";
	
	//kindフォームの作成
	var kind:ComboBox = new ComboBox();
	d.f_neck.f_kind = kind;
	kind.name = f_name;
	kind.addEventListener(ListEvent.CHANGE,click::kindChangeAcc);
	var data:ArrayCollection = new ArrayCollection(["なし","EX","セット"]);
	kind.dataProvider = data;
	kind.rowCount = 6;
	fi.addChild(kind);
	
	var hbox:HBox = new HBox();
	hide(hbox);
	form::exbox[f_name] = hbox;
	fi.addChild(hbox);
	//exopの作成
	for(var i:int=0;i<5;i++){
		var e:ComboBox = new ComboBox();
		e.width = 120;
		e.rowCount = 7;
		//hide(e);
		d.f_neck.f_exop[i] = e;
		e.addEventListener(ListEvent.CHANGE,click::exopChange);
		e.name = f_name;
		e.dataProvider = ["","EXD","速度+7","攻撃lv20","攻撃2%","魔力lv20","魔力2%"];
		hbox.addChild(e);
	}
	
	//setitemの作成
	hbox = new HBox();
	hide(hbox);
	form::setbox[f_name] = hbox;
	fi.addChild(hbox);
	//setitemの作成
	var si:ComboBox = new ComboBox();
	hbox.addChild(si);
	si.name = f_name;
	si.addEventListener(ListEvent.CHANGE,click::accitemChange);
	si.rowCount = 20;
	si.dataProvider = c.getSetNeck();
	si.labelFunction = form::labelfunc;
	d.f_neck.f_item = si;
	//ステータスOPの作成
	var cop:ComboBox = new ComboBox();
	cop.name = f_name;
	hbox.addChild(cop);
	d.f_neck.f_cop = cop;
	change::setop(d.f_neck);//OPの作成
	
	return fi;
}
private function formRing(name:String,item:Item,f_name:String):FormItem{
	use namespace dat;
	var fi:FormItem = new FormItem();
	fi.width = 900;
	fi.label = name;
	fi.direction = "horizontal";
	
	//kindフォームの作成
	var kind:ComboBox = new ComboBox();
	item.f_kind = kind;
	kind.name = f_name;
	kind.addEventListener(ListEvent.CHANGE,click::kindChangeAcc);
	var data:ArrayCollection = new ArrayCollection(["なし","EX","セット","魔法師","大魔法師","パンダ変化","スケルトン"]);
	kind.dataProvider = data;
	kind.rowCount = 6;
	fi.addChild(kind);
	
	var hbox:HBox = new HBox();
	hide(hbox);
	form::exbox[f_name] = hbox;
	fi.addChild(hbox);
	//exopの作成
	for(var i:int=0;i<5;i++){
		var e:ComboBox = new ComboBox();
		e.width = 120;
		e.rowCount = 6;
		//hide(e);
		item.f_exop[i] = e;
		e.addEventListener(ListEvent.CHANGE,click::exopChange);
		e.name = f_name;
		e.dataProvider = ["","防御成功","ダメ減","生命増","マナ増","ダメ反"];
		hbox.addChild(e);
	}
	
	//setitemの作成
	hbox = new HBox();
	hide(hbox);
	form::setbox[f_name] = hbox;
	fi.addChild(hbox);
	//setitemの作成
	var si:ComboBox = new ComboBox();
	hbox.addChild(si);
	si.addEventListener(ListEvent.CHANGE,click::accitemChange);
	si.name = f_name;
	si.rowCount = 20;
	si.dataProvider = c.getSetRing();
	si.labelFunction = form::labelfunc;
	item.f_item = si;
	//ステータスOPの作成
	var cop:ComboBox = new ComboBox();
	cop.name = f_name;
	hbox.addChild(cop);
	item.f_cop = cop;
	change::setop(item);//OPの作成
	
	return fi;
}
private function formStatus():Form{
	use namespace dat;
	//Form作成
	var f:Form = new Form();
	f.includeInLayout = false;
	f.x = 350;
	f.setStyle("borderStyle","solid");
	
	//Levelフォームの作成
	var lvform:FormItem = new FormItem();
	lvform.label = "LV：";
	lvform.direction = "horizontal";
	var lv:TextInput = new TextInput();
	d.f_lv = lv;
	lv.restrict = "0-9";
	lv.maxChars = 3;
	lv.width = 42;
	lv.addEventListener(FocusEvent.FOCUS_OUT,click::statusChange);
	lv.addEventListener(FocusEvent.FOCUS_IN,click::focusEvent);
	lvform.addChild(lv);
	f.addChild(lvform);
	
	//ポイントの表示
	var point:Label = new Label();
	point.text = "ポイント";
	lvform.addChild(point);
	form::fruitpoint.push(point);
	point = new Label();
	point.text = "2000";
	lvform.addChild(point);
	form::fruitpoint.push(point);
	point = new Label();
	point.text = "    生成";
	lvform.addChild(point);
	form::fruitpoint.push(point);
	point = new Label();
	point.text = "100/106";
	lvform.addChild(point);
	form::fruitpoint.push(point);
	
	//位置調整用ダミー
	point = new Label();
	point.text = "     ";
	lvform.addChild(point);
	//MLVボタンの作成
	var button:Button = new Button();
	button.addEventListener(MouseEvent.CLICK,click::mlv);
	button.label = "MLV";
	lvform.addChild(button);
	
	//HBox
	var hbox:HBox = new HBox();
	f.addChild(hbox);
	
	//各種ステータスフォームの作成
	var stform:FormItem;
	var l:Array = ["力：","敏捷：","体力：","エナジー：","統率："]
	for(var i:int = 0;i<5;i++){
		stform = new FormItem();
		stform.label = l[i];
		var st:TextInput = new TextInput();
		if(i==0)d.f_str = st;
		if(i==1)d.f_agi = st;
		if(i==2)d.f_vit = st;
		if(i==3)d.f_ene = st;
		if(i==4)d.f_rec = st;
		st.addEventListener(FocusEvent.FOCUS_IN,click::focusEvent);
		st.restrict = "0-9";
		st.maxChars = 4;
		st.width = 52;
		st.addEventListener(FocusEvent.FOCUS_OUT,click::statusChange);
		stform.addChild(st);
		hbox.addChild(stform);
	}
	
	//統率フォームを非表示にする
	d.f_rec.parent.visible = false;
	
	//値を初期化
	change::statusChange();
	
	return f;
}
private function formPet():FormItem{
	var fi:FormItem = new FormItem();
	fi.direction = "horizontal";
	fi.label = "ペット：";
	//ペットを選択するフォーム
	var co:ComboBox = new ComboBox();
	dat::d.f_pet = co;
	co.dataProvider = new ArrayCollection(
		["なし","サタン","守護天使","デーモン","守護精霊"
		,"ユニリア","ディノラント","フェンリル"
		,"白と黒のポンガ","白銀のアリオン","スケルトンパージドラゴン"]);
	co.rowCount = 20;
	co.addEventListener(ListEvent.CHANGE,click::petChange);
	fi.addChild(co);
	//補助フォーム1（ダークホースのLV、フェンリルの種類、ディノラントのOPなど）
	co = new ComboBox();
	co.dataProvider = [""];
	dat::d.f_petsub1 = co;
	co.addEventListener(ListEvent.CHANGE,click::petsubChange);
	hide(co);
	fi.addChild(co);
	//補助フォーム2（ディノラントのOPなど）
	co = new ComboBox();
	co.dataProvider = [""];
	dat::d.f_petsub2 = co;
	co.addEventListener(ListEvent.CHANGE,click::petsubChange);
	hide(co);
	fi.addChild(co);
	
	return fi;
}
private function formCalc():HBox{
	var hbox:HBox = new HBox();
	
	//マップ選択フォーム
	var co:ComboBox = new ComboBox();
	co.addEventListener(ListEvent.CHANGE,click::changeMap);
	co.dataProvider = dat::c.map;
	co.rowCount = 10;
	dat::d.f_map = co;
	hbox.addChild(co);
	//サブフォーム
	var h:HBox = new HBox();
	hbox.addChild(h);
	hide(h);
	form::mapBox = h;
	var fi:FormItem = new FormItem();
	fi.label = "Lv";
	h.addChild(fi);
	var ti:TextInput = new TextInput();
	dat::d.f_mapLv = ti;
	ti.addEventListener(FocusEvent.FOCUS_OUT,click::changeMapLv);
	ti.text = "1";
	ti.addEventListener(FocusEvent.FOCUS_IN,click::focusEvent);
	ti.restrict = "0-9";
	ti.maxChars = 3;
	ti.width = 42;
	fi.addChild(ti);
	
	//計算ボタン
	var b:Button = new Button();
	b.label = "計算";
	b.addEventListener(MouseEvent.CLICK,click::calcButton);
	hbox.addChild(b);
	
	return hbox;
}
private function formSupport():Container{
	use namespace dat;
	var vbox:Form = new Form();
	vbox.setStyle("borderStyle","solid");
	
	//1行目
	var hbox:HBox = new HBox();
	vbox.addChild(hbox);
		//A+
		var fi:FormItem = new FormItem();
		hbox.addChild(fi);
		fi.setStyle("fontSize","13");
		fi.label = "A+：";
		var te:TextInput = new TextInput();
		fi.addChild(te);
		d.s_aplus = te;
		te.restrict = "0-9.";
		te.maxChars = 6;
		te.width = 72;
		te.addEventListener(FocusEvent.FOCUS_IN,click::focusEvent);
		//G+
		fi = new FormItem();
		hbox.addChild(fi);
		fi.setStyle("fontSize","13");
		fi.label = "G+：";
		te = new TextInput();
		fi.addChild(te);
		d.s_gplus = te;
		te.restrict = "0-9";
		te.maxChars = 3;
		te.width = 42;
		te.addEventListener(FocusEvent.FOCUS_IN,click::focusEvent);
		//C+
		fi = new FormItem();
		hbox.addChild(fi);
		fi.setStyle("fontSize","13");
		fi.label = "C+：";
		te = new TextInput();
		fi.addChild(te);
		d.s_cplus = te;
		te.restrict = "0-9";
		te.maxChars = 3;
		te.width = 42;
		te.addEventListener(FocusEvent.FOCUS_IN,click::focusEvent);
		//SL
		fi = new FormItem();
		hbox.addChild(fi);
		fi.setStyle("fontSize","13");
		fi.label = "SL：";
		te = new TextInput();
		fi.addChild(te);
		d.s_sl = te;
		te.restrict = "0-9";
		te.maxChars = 3;
		te.width = 42;
		te.addEventListener(FocusEvent.FOCUS_IN,click::focusEvent);
		//SB
		fi = new FormItem();
		hbox.addChild(fi);
		fi.setStyle("fontSize","13");
		fi.label = "SB：";
		te = new TextInput();
		fi.addChild(te);
		d.s_sb = te;
		te.restrict = "0-9";
		te.maxChars = 2;
		te.width = 32;
		te.addEventListener(FocusEvent.FOCUS_IN,click::focusEvent);
		//入力支援
		var button:Button = new Button();
		button.label = "入力支援";
		button.addEventListener(MouseEvent.CLICK,click::Support);
		hbox.addChild(button);
	//2行目
	hbox = new HBox();
	vbox.addChild(hbox);
		//血戦
		var ch:CheckBox = new CheckBox();
		d.s_ba = ch;
		hbox.addChild(ch);
		var la:Label = new Label();
		la.text = "血戦";
		hbox.addChild(la);
		//スペルエンハンス
		var box:HBox = new HBox();
		ch = new CheckBox();
		d.s_se = ch;
		box.addChild(ch);
		la = new Label();
		la.text = "スペルエンハンス";
		box.addChild(la);
		hbox.addChild(box);
		form::sebox = box;
		hide(box);//隠す
		//バーサーカー
		box = new HBox();
		ch = new CheckBox();
		d.s_berserker = ch;
		box.addChild(ch);
		la = new Label();
		la.text = "バーサーカー";
		box.addChild(la);
		hbox.addChild(box);
		form::berserkerbox = box;
		hide(box);//隠す
		//敵の防御力無視
		box = new HBox();
		ch = new CheckBox();
		d.s_ignore = ch;
		box.addChild(ch);
		la = new Label();
		la.text = "敵の防御力無視";
		box.addChild(la);
		hbox.addChild(box);
		form::ignorebox = box;
		hide(box);//隠す
		//インナーベーション
		fi = new FormItem();
		hbox.addChild(fi);
		fi.setStyle("fontSize","13");
		fi.label = "インナーベーション：";
		te = new TextInput();
		fi.addChild(te);
		d.s_inner = te;
		te.restrict = "0-9";
		te.maxChars = 2;
		te.width = 32;
		te.addEventListener(FocusEvent.FOCUS_IN,click::focusEvent);
		//ウイークネス
		fi = new FormItem();
		hbox.addChild(fi);
		fi.setStyle("fontSize","13");
		fi.label = "ウイークネス：";
		te = new TextInput();
		fi.addChild(te);
		d.s_weak = te;
		te.restrict = "0-9";
		te.maxChars = 2;
		te.width = 32;
		te.addEventListener(FocusEvent.FOCUS_IN,click::focusEvent);
		//体力向上
		fi = new FormItem();
		hbox.addChild(fi);
		fi.setStyle("fontSize","13");
		fi.label = "体力向上：";
		te = new TextInput();
		fi.addChild(te);
		d.s_vit = te;
		te.restrict = "0-9";
		te.maxChars = 3;
		te.width = 42;
		te.addEventListener(FocusEvent.FOCUS_IN,click::focusEvent);
		//防御成功率向上
		fi = new FormItem();
		hbox.addChild(fi);
		fi.setStyle("fontSize","13");
		fi.label = "防御成功率向上：";
		te = new TextInput();
		fi.addChild(te);
		d.s_avoid = te;
		te.restrict = "0-9";
		te.maxChars = 3;
		te.width = 42;
		te.addEventListener(FocusEvent.FOCUS_IN,click::focusEvent);
	//2行目
	hbox = new HBox();
	vbox.addChild(hbox);
		//セラフィー
		ch = new CheckBox();
		d.s_sera = ch;
		hbox.addChild(ch);
		la = new Label();
		la.text = "セラフィー";
		hbox.addChild(la);
		//酒
		ch = new CheckBox();
		d.s_sake = ch;
		hbox.addChild(ch);
		la = new Label();
		la.text = "酒";
		hbox.addChild(la);
		//妙薬
		ch = new CheckBox();
		d.s_myou = ch;
		hbox.addChild(ch);
		la = new Label();
		la.text = "妙薬";
		hbox.addChild(la);
		//サンタ・花見・ジャックランタン
		var co:ComboBox = new ComboBox();
		d.s_item = co;
		co.dataProvider = ["なし","速度+10","攻撃力+25","防御力+100","生命+500","マナ+500"
								,"攻撃力+40","生命+700","マナ+700"
								,"速度+15","攻撃力+30","AG回復+10"];
		co.rowCount = 20;
		hbox.addChild(co);
		//課金スクロール
		co = new ComboBox();
		d.s_scroll = co;
		co.dataProvider = ["ｽｸﾛｰﾙなし","速度+15","攻撃力+30","魔力+30"
							,"防御力+60","生命+200","マナ+300","クリダメ+20%","EXDダメ+20%"];
		co.rowCount = 10;
		hbox.addChild(co);
		//課金秘薬
		co = new ComboBox();
		d.s_hiyaku = co;
		co.dataProvider = ["秘薬なし","力+50","敏捷+50","体力+50","エナ+50","統率+50"];
		co.rowCount = 10;
		hbox.addChild(co);
	
	return vbox;
}
private function formInputSupport():void{
	use namespace dat;
	var p:Panel = new Panel();
	form::supportpanel = p;
	p.title = "入力支援";
	p.name = "support";
	p.setStyle("borderAlpha","1.0");
	p.setStyle("borderColor","#EEEEFF");
	p.setStyle("backgroundAlpha","1.0");

	//大枠
	var h:HBox = new HBox();
	p.addChild(h);

	//1列目
	var f:Form = new Form();
	h.addChild(f);
	
	//閉じるボタン
	var b:Button = new Button();//閉じるボタン
	b.label = "閉じる";
	b.addEventListener(MouseEvent.CLICK,click::closeSupport);
	f.addChild(b);
	
	//EE
	var v:Form = new Form();
	f.addChild(v);
	v.setStyle("borderStyle","solid");
	var hbox:HBox = new HBox();
	v.addChild(hbox);
	var ta:TextArea = new TextArea();
	ta.text = "備考：※A+の要求エナ92\n" + 
			"A+,G+共にMLVでの上昇値は未検証";
	ta.percentWidth = 100;
	v.addChild(ta);
	var vbox:VBox = new VBox();
	hbox.addChild(vbox);
		//EEのエナ
		var fi:FormItem = new FormItem();
		vbox.addChild(fi);
		fi.setStyle("fontSize","13");
		fi.label = "EEのエナ：";
		var te:TextInput = new TextInput();
		fi.addChild(te);
		te.text = sinit[0].toString();//エルフのエナの初期値
		te.restrict = "0-9";
		te.maxChars = 4;
		te.width = 52;
		te.name = "ee_ene";
		s.supportdatas[s.EE_ENE] = te;
		te.addEventListener(FocusEvent.FOCUS_OUT,click::InputSupport);
		//MLV A+強化
		var co:ComboBox = new ComboBox();
		vbox.addChild(co);
		co.dataProvider = ["A+MLv0[(ｴﾅ/7)+3]","A+MLv1[(ｴﾅ/6.7)+6]","A+MLv2[(ｴﾅ/6.2)+9]"
							,"A+MLv3[(ｴﾅ/5.9)+12]","A+MLv4[(ｴﾅ/5.6)+15]","A+MLv5[(ｴﾅ/5.3)+18]"];
		co.selectedIndex = 0;
		co.rowCount = 10;
		co.name = "mlv_a";
		s.supportdatas[s.MLV_A] = co;
		co.addEventListener(ListEvent.CHANGE,click::InputSupport);
		//MLV G+強化
		co = new ComboBox();
		vbox.addChild(co);
		co.dataProvider = ["G+MLv0[(ｴﾅ/8)+2]","G+MLv1[(ｴﾅ/7.6)+4]","G+MLv2[(ｴﾅ/7.2)+6]"
							,"G+MLv3[(ｴﾅ/6.8)+8]","G+MLv4[(ｴﾅ/6.4)+10]","G+MLv5[(ｴﾅ/6)+12]"];
		co.selectedIndex = 0;
		co.rowCount = 10;
		co.name = "mlv_g";
		s.supportdatas[s.MLV_G] = co;
		co.addEventListener(ListEvent.CHANGE,click::InputSupport);
	vbox = new VBox();
	hbox.addChild(vbox);
		//→
		var la:Label = new Label();
		la.text = "→";
		la.setStyle("fontWeight","bold");
		la.setStyle("fontSize","20");
		vbox.addChild(la);
	vbox = new VBox();
	hbox.addChild(vbox);
		//A+
		fi = new FormItem();
		vbox.addChild(fi);
		fi.setStyle("fontSize","13");
		fi.label = "A+：";
		var hb:HBox = new HBox();
		fi.addChild(hb);
		la = new Label();
		hb.addChild(la);
		la.text = "0";
		s.supportdatas[s.R_A] = la;
		var button:Button = new Button();
		button.label = "入力";
		button.name = s.R_A.toString();
		button.addEventListener(MouseEvent.CLICK,click::InputSupportCommit);
		hb.addChild(button);
		//G+
		fi = new FormItem();
		vbox.addChild(fi);
		fi.setStyle("fontSize","13");
		fi.label = "G+：";
		hb = new HBox();
		fi.addChild(hb);
		la = new Label();
		hb.addChild(la);
		la.text = "0";
		s.supportdatas[s.R_G] = la;
		button = new Button();
		button.label = "入力";
		button.name = s.R_G.toString();
		button.addEventListener(MouseEvent.CLICK,click::InputSupportCommit);
		hb.addChild(button);

	//インナーベーション、ウイークネス
	v = new Form();
	f.addChild(v);
	v.setStyle("borderStyle","solid");
	hbox = new HBox();
	v.addChild(hbox);
	ta = new TextArea();
	ta.text = "備考：インナーベーション(IV:innervation)・・・敵の防御力低下\n" + 
			"ウイークネス(WN:weakness)・・・敵の攻撃力低下\n" + 
			"IV = (エナ/90)+20 | WN = (エナ/65)+7 \n" + 
			"※IV 要求エナ912";
	ta.percentWidth = 100;
	ta.height = 80;
	v.addChild(ta);
	vbox = new VBox();
	hbox.addChild(vbox);
		//召喚師のエナ
		fi = new FormItem();
		vbox.addChild(fi);
		fi.setStyle("fontSize","13");
		fi.label = "召喚師のエナ：";
		te = new TextInput();
		fi.addChild(te);
		te.text = sinit[7].toString();//召喚師のエナの初期値
		te.restrict = "0-9";
		te.maxChars = 4;
		te.width = 52;
		te.name = "s_ene";
		s.supportdatas[s.S_ENE] = te;
		te.addEventListener(FocusEvent.FOCUS_OUT,click::InputSupport);
	vbox = new VBox();
	hbox.addChild(vbox);
		//→
		la = new Label();
		la.text = "→";
		la.setStyle("fontWeight","bold");
		la.setStyle("fontSize","20");
		vbox.addChild(la);
	vbox = new VBox();
	hbox.addChild(vbox);
		//インナーベーション
		fi = new FormItem();
		vbox.addChild(fi);
		fi.setStyle("fontSize","13");
		fi.label = "IV：";
		hb = new HBox();
		fi.addChild(hb);
		la = new Label();
		hb.addChild(la);
		la.text = "0";
		s.supportdatas[s.R_INNER] = la;
		la = new Label();
		hb.addChild(la);
		la.text = "%";
		button = new Button();
		button.label = "入力";
		button.name = s.R_INNER.toString();
		button.addEventListener(MouseEvent.CLICK,click::InputSupportCommit);
		hb.addChild(button);
		//ウイークネス
		fi = new FormItem();
		vbox.addChild(fi);
		fi.setStyle("fontSize","13");
		fi.label = "WN：";
		hb = new HBox();
		fi.addChild(hb);
		la = new Label();
		hb.addChild(la);
		la.text = "0";
		s.supportdatas[s.R_WEAK] = la;
		la = new Label();
		hb.addChild(la);
		la.text = "%";
		button = new Button();
		button.label = "入力";
		button.name = s.R_WEAK.toString();
		button.addEventListener(MouseEvent.CLICK,click::InputSupportCommit);
		hb.addChild(button);
		
	//確定値
	v = new Form();
	f.addChild(v);
	hbox = new HBox();
	v.addChild(hbox);
		//1行目
		la = new Label();
		la.text = "入力値：";
		hbox.addChild(la);
		//A+
		fi = new FormItem();
		hbox.addChild(fi);
		fi.setStyle("fontSize","13");
		fi.label = "A+：0";
		s.supportdatas[s.C_A] = fi;
		//G+
		fi = new FormItem();
		hbox.addChild(fi);
		fi.setStyle("fontSize","13");
		fi.label = "G+：0";
		s.supportdatas[s.C_G] = fi;
		//C+
		fi = new FormItem();
		hbox.addChild(fi);
		fi.setStyle("fontSize","13");
		fi.label = "C+：0";
		s.supportdatas[s.C_C] = fi;
		//SL
		fi = new FormItem();
		hbox.addChild(fi);
		fi.setStyle("fontSize","13");
		fi.label = "SL：0%";
		s.supportdatas[s.C_SL] = fi;
		//SB
		fi = new FormItem();
		hbox.addChild(fi);
		fi.setStyle("fontSize","13");
		fi.label = "SB：0%";
		s.supportdatas[s.C_SB] = fi;
	//2行目
	hbox = new HBox();
	v.addChild(hbox);
		//IV
		fi = new FormItem();
		hbox.addChild(fi);
		fi.setStyle("fontSize","13");
		fi.label = "インナーベーション：0%";
		s.supportdatas[s.C_INNER] = fi;
		//WN
		fi = new FormItem();
		hbox.addChild(fi);
		fi.setStyle("fontSize","13");
		fi.label = "ウイークネス：0%";
		s.supportdatas[s.C_WEAK] = fi;
		
	
	//2列目
	f = new Form();
	h.addChild(f);

	//C+
	v = new Form();
	f.addChild(v);
	v.setStyle("borderStyle","solid");
	hbox = new HBox();
	v.addChild(hbox);
	ta = new TextArea();
	ta.text = "備考：C+ = (エナ/30)+(統率/25)";
	ta.percentWidth = 100;
	ta.height = 20;
	v.addChild(ta);
	vbox = new VBox();
	vbox.width = 150;
	hbox.addChild(vbox);
		//DLのエナ
		fi = new FormItem();
		vbox.addChild(fi);
		fi.setStyle("fontSize","13");
		fi.label = "DLのエナ：";
		te = new TextInput();
		fi.addChild(te);
		te.text = sinit[1].toString();//DLのエナの初期値
		te.restrict = "0-9";
		te.maxChars = 4;
		te.width = 52;
		te.name = "dl_ene";
		s.supportdatas[s.DL_ENE] = te;
		te.addEventListener(FocusEvent.FOCUS_OUT,click::InputSupport);
		//DLのエナ
		fi = new FormItem();
		vbox.addChild(fi);
		fi.setStyle("fontSize","13");
		fi.label = "DLの統率：";
		te = new TextInput();
		fi.addChild(te);
		te.text = sinit[2].toString();//DLの統率の初期値
		te.restrict = "0-9";
		te.maxChars = 4;
		te.width = 52;
		te.name = "dl_rec";
		s.supportdatas[s.DL_REC] = te;
		te.addEventListener(FocusEvent.FOCUS_OUT,click::InputSupport);
	vbox = new VBox();
	hbox.addChild(vbox);
		//→
		la = new Label();
		la.text = "→";
		la.setStyle("fontWeight","bold");
		la.setStyle("fontSize","20");
		vbox.addChild(la);
	vbox = new VBox();
	hbox.addChild(vbox);
		//C+
		fi = new FormItem();
		vbox.addChild(fi);
		fi.setStyle("fontSize","13");
		fi.label = "C+：";
		hb = new HBox();
		fi.addChild(hb);
		la = new Label();
		hb.addChild(la);
		la.text = "0";
		s.supportdatas[s.R_C] = la;
		button = new Button();
		button.label = "入力";
		button.name = s.R_C.toString();
		button.addEventListener(MouseEvent.CLICK,click::InputSupportCommit);
		vbox.addChild(button);
		
	//SL
	v = new Form();
	f.addChild(v);
	v.setStyle("borderStyle","solid");
	hbox = new HBox();
	v.addChild(hbox);
	ta = new TextArea();
	ta.text = "備考：SL = (体力/100)+(エナ/20)+(PT人数-1)";
	ta.percentWidth = 100;
	ta.height = 20;
	v.addChild(ta);
	vbox = new VBox();
	vbox.width = 150;
	hbox.addChild(vbox);
		//ナイトの体力
		fi = new FormItem();
		vbox.addChild(fi);
		fi.setStyle("fontSize","13");
		fi.label = "ナイトの体力：";
		te = new TextInput();
		fi.addChild(te);
		te.text = sinit[3].toString();//ナイトの体力の初期値
		te.restrict = "0-9";
		te.maxChars = 4;
		te.width = 52;
		te.name = "k_vit";
		s.supportdatas[s.K_VIT] = te;
		te.addEventListener(FocusEvent.FOCUS_OUT,click::InputSupport);
		//ナイトのエナ
		fi = new FormItem();
		vbox.addChild(fi);
		fi.setStyle("fontSize","13");
		fi.label = "ナイトのエナ：";
		te = new TextInput();
		fi.addChild(te);
		te.text = sinit[4].toString();//ナイトのエナの初期値
		te.restrict = "0-9";
		te.maxChars = 4;
		te.width = 52;
		te.name = "k_ene";
		s.supportdatas[s.K_ENE] = te;
		te.addEventListener(FocusEvent.FOCUS_OUT,click::InputSupport);
		//MLV SL強化
		co = new ComboBox();
		vbox.addChild(co);
		co.dataProvider = ["MLv0","MLv1[+2]","MLv2[+4]"
							,"MLv3[+6]","MLv4[+8]","MLv5[+10]"];
		co.selectedIndex = 0;
		co.rowCount = 10;
		co.name = "mlv_sl";
		s.supportdatas[s.MLV_SL] = co;
		co.addEventListener(ListEvent.CHANGE,click::InputSupport);
		//MLV SL強化
		co = new ComboBox();
		vbox.addChild(co);
		co.dataProvider = ["PT:1人","PT:2人","PT:3人","PT:4人","PT:5人"];
		co.selectedIndex = 0;
		co.rowCount = 10;
		co.name = "ptm";
		s.supportdatas[s.PTM] = co;
		co.addEventListener(ListEvent.CHANGE,click::InputSupport);
	vbox = new VBox();
	hbox.addChild(vbox);
		//→
		la = new Label();
		la.text = "→";
		la.setStyle("fontWeight","bold");
		la.setStyle("fontSize","20");
		vbox.addChild(la);
	vbox = new VBox();
	hbox.addChild(vbox);
		//SL
		fi = new FormItem();
		vbox.addChild(fi);
		fi.setStyle("fontSize","13");
		fi.label = "SL：";
		hb = new HBox();
		fi.addChild(hb);
		la = new Label();
		hb.addChild(la);
		la.text = "0";
		s.supportdatas[s.R_SL] = la;
		la = new Label();
		hb.addChild(la);
		la.text = "%";
		button = new Button();
		button.label = "入力";
		button.name = s.R_SL.toString();
		button.addEventListener(MouseEvent.CLICK,click::InputSupportCommit);
		vbox.addChild(button);

	//SB
	v = new Form();
	f.addChild(v);
	v.setStyle("borderStyle","solid");
	hbox = new HBox();
	v.addChild(hbox);
	ta = new TextArea();
	ta.text = "備考：SB = (敏/50)+(エナ/200)";
	ta.percentWidth = 100;
	ta.height = 20;
	v.addChild(ta);
	vbox = new VBox();
	vbox.width = 150;
	hbox.addChild(vbox);
		//WIZの敏捷
		fi = new FormItem();
		vbox.addChild(fi);
		fi.setStyle("fontSize","13");
		fi.label = "WIZの敏捷：";
		te = new TextInput();
		fi.addChild(te);
		te.text = sinit[5].toString();//WIZの敏捷の初期値
		te.restrict = "0-9";
		te.maxChars = 4;
		te.width = 52;
		te.name = "w_agi";
		s.supportdatas[s.W_AGI] = te;
		te.addEventListener(FocusEvent.FOCUS_OUT,click::InputSupport);
		//WIZのエナ
		fi = new FormItem();
		vbox.addChild(fi);
		fi.setStyle("fontSize","13");
		fi.label = "WIZのエナ：";
		te = new TextInput();
		fi.addChild(te);
		te.text = sinit[6].toString();//WIZのエナの初期値
		te.restrict = "0-9";
		te.maxChars = 4;
		te.width = 52;
		te.name = "w_ene";
		s.supportdatas[s.W_ENE] = te;
		te.addEventListener(FocusEvent.FOCUS_OUT,click::InputSupport);
		//MLV SL強化
		co = new ComboBox();
		vbox.addChild(co);
		co.dataProvider = ["MLv0","MLv1[+3]","MLv2[+6]"
							,"MLv3[+9]","MLv4[+12]","MLv5[+15]"];
		co.selectedIndex = 0;
		co.rowCount = 10;
		co.name = "mlv_sb";
		s.supportdatas[s.MLV_SB] = co;
		co.addEventListener(ListEvent.CHANGE,click::InputSupport);
	vbox = new VBox();
	hbox.addChild(vbox);
		//→
		la = new Label();
		la.text = "→";
		la.setStyle("fontWeight","bold");
		la.setStyle("fontSize","20");
		vbox.addChild(la);
	vbox = new VBox();
	hbox.addChild(vbox);
		//SB
		fi = new FormItem();
		vbox.addChild(fi);
		fi.setStyle("fontSize","13");
		fi.label = "SB：";
		hb = new HBox();
		fi.addChild(hb);
		la = new Label();
		hb.addChild(la);
		la.text = "0";
		s.supportdatas[s.R_SB] = la;
		la = new Label();
		hb.addChild(la);
		la.text = "%";
		button = new Button();
		button.label = "入力";
		button.name = s.R_SB.toString();
		button.addEventListener(MouseEvent.CLICK,click::InputSupportCommit);
		vbox.addChild(button);
	
	//イベントの呼び出し
	button.dispatchEvent((new MouseEvent(MouseEvent.CLICK)) as Event);
	s.supportdatas[s.EE_ENE].dispatchEvent((new FocusEvent(FocusEvent.FOCUS_OUT)) as Event);
}
private function formMLV():void{
	//MLVクラスの新規作成
	dat::mlvcount = new MLVcount();
	//新規MLVキャンバスの作成
	form::mlvBox = new Box();
	//HBox
	var hbox:HBox = new HBox();
	form::mlvBox.addChild(hbox);
	//Levelフォームの作成
	var lvform:FormItem = new FormItem();
	lvform.label = "マスターレベル：";
	lvform.direction = "horizontal";
	var lv:TextInput = new TextInput();
	dat::d.f_mlv = lv;
	lv.text = "0";
	lv.restrict = "0-9";
	lv.maxChars = 3;
	lv.width = 42;
	lv.addEventListener(Event.CHANGE,click::mlvChange);
	lv.addEventListener(FocusEvent.FOCUS_IN,click::focusEvent);
	lvform.addChild(lv);
	hbox.addChild(lvform);
	//ポイントラベルの作成
	form::mlvpoint = new Label();
	form::mlvpoint.text = "ポイント 0/0";
	hbox.addChild(form::mlvpoint);
	
	//ツリーの準備
	var treeTitle:Array = [	["保護","平穏","加護","堅固","断固","守護"],
							["勇名","知恵","救援","闘志","正義","混沌"],
							["憤怒","超越","疾風","究極","征服","名誉"],
							["英雄","神秘","信念","勝利","栄光","信頼"]];
		//2番目2行目1列目の職依存のスキル TC 
	var tree2_2_1:Array = [21,23,24, 2,28,47];
		//2番目4行目1列目の職依存のスキル GB
	var tree2_4_1:Array = [37,39,41,43,45,49];
		//2番目4行目2列目の職依存のスキル OI
	var tree2_4_2:Array = [38,40,42,44,-1,50];
		//3番目2行目1列目の職依存のスキル SL
	var tree3_2_1:Array = [20,22,25,26,27,48];
		//3番目4行目1列目の職依存のスキル 最大攻撃
	var tree3_4_1:Array = [31,33,31, 0,31,33];
		//3番目4行目2列目の職依存のスキル 最小攻撃
	var tree3_4_2:Array = [32,34,32,46,32,34];
		//4番目3行目2列目の職依存のスキル ペット耐久
	var tree4_3_2:Array = [-1,-1,-1,-1,36,-1];
	var jobindex:int = dat::d.f_job.selectedIndex;
	
	//ツリーの作成
	hbox = new HBox();//横
	form::mlvBox.addChild(hbox);
		var vbox:VBox = new VBox();//縦1 4列
		vbox.width = 250;
		vbox.height = 350;
		hbox.addChild(vbox);
			//ツリー名
			vbox.addChild(click::treeName(treeTitle[0][jobindex]));
			//ツリー中身
			var fm:Form = new Form();
			fm.setStyle("borderStyle","solid");
			fm.percentWidth = 100;
			fm.percentHeight = 100;
			vbox.addChild(fm);
			//1段目
			var h:HBox = new HBox();
			fm.addChild(h);
				h.addChild(click::treeRow());
				h.addChild(click::treeRow());
				h.addChild(click::treeRow());
				h.addChild(click::treeRow(3));
			//2段目
			h = new HBox();
			fm.addChild(h);
				h.addChild(click::treeRow());
				h.addChild(click::treeRow(6));
				h.addChild(click::treeRow(5));
				h.addChild(click::treeRow(4));
			//3段目
			h = new HBox();
			fm.addChild(h);
				h.addChild(click::treeRow());
				h.addChild(click::treeRow());
				h.addChild(click::treeRow());
				h.addChild(click::treeRow(7));
			//4段目
			h = new HBox();
			fm.addChild(h);
				h.addChild(click::treeRow());
				h.addChild(click::treeRow());
				h.addChild(click::treeRow(29));
				h.addChild(click::treeRow(30));
			
		vbox = new VBox();//縦2 2列
		vbox.width = 150;
		vbox.height = 350;
		hbox.addChild(vbox);
			//ツリー名
			vbox.addChild(click::treeName(treeTitle[1][jobindex]));
			//ツリー中身
			fm = new Form();
			fm.setStyle("borderStyle","solid");
			fm.percentWidth = 100;
			fm.percentHeight = 100;
			vbox.addChild(fm);
			//1段目
			h = new HBox();
			fm.addChild(h);
				h.addChild(click::treeRow(8));
				h.addChild(click::treeRow());
			//2段目
			h = new HBox();
			fm.addChild(h);
				h.addChild(click::treeRow(tree2_2_1[jobindex]));
				h.addChild(click::treeRow());
			//3段目
			h = new HBox();
			fm.addChild(h);
				h.addChild(click::treeRow(9));
				h.addChild(click::treeRow(10));
			//4段目
			h = new HBox();
			fm.addChild(h);
				h.addChild(click::treeRow(tree2_4_1[jobindex]));
				h.addChild(click::treeRow(tree2_4_2[jobindex]));
			
		vbox = new VBox();//縦3 2列
		vbox.width = 150;
		vbox.height = 350;
		hbox.addChild(vbox);
			//ツリー名
			vbox.addChild(click::treeName(treeTitle[2][jobindex]));
			//ツリー中身
			fm = new Form();
			fm.setStyle("borderStyle","solid");
			fm.percentWidth = 100;
			fm.percentHeight = 100;
			vbox.addChild(fm);
			//1段目
			h = new HBox();
			fm.addChild(h);
				h.addChild(click::treeRow(11));
				h.addChild(click::treeRow());
			//2段目
			h = new HBox();
			fm.addChild(h);
				h.addChild(click::treeRow(tree3_2_1[jobindex]));
				h.addChild(click::treeRow(12));
			//3段目
			h = new HBox();
			fm.addChild(h);
				h.addChild(click::treeRow(13));
				h.addChild(click::treeRow(14));
			//4段目
			h = new HBox();
			fm.addChild(h);
				h.addChild(click::treeRow(tree3_4_1[jobindex]));
				h.addChild(click::treeRow(tree3_4_2[jobindex]));
			
		vbox = new VBox();//縦4 3列
		vbox.width = 200;
		vbox.height = 350;
		hbox.addChild(vbox);
			//ツリー名
			vbox.addChild(click::treeName(treeTitle[3][jobindex]));
			//ツリー中身
			fm = new Form();
			fm.setStyle("borderStyle","solid");
			fm.percentWidth = 100;
			fm.percentHeight = 100;
			vbox.addChild(fm);
			//1段目
			h = new HBox();
			fm.addChild(h);
				h.addChild(click::treeRow(15));
				h.addChild(click::treeRow(16));
				h.addChild(click::treeRow());
			//2段目
			h = new HBox();
			fm.addChild(h);
				h.addChild(click::treeRow(17));
				h.addChild(click::treeRow(18));
				h.addChild(click::treeRow());
			//3段目
			h = new HBox();
			fm.addChild(h);
				h.addChild(click::treeRow(19));
				h.addChild(click::treeRow(tree4_3_2[jobindex]));
				h.addChild(click::treeRow());
			//4段目
			h = new HBox();
			fm.addChild(h);
				h.addChild(click::treeRow(35));
				h.addChild(click::treeRow());
				h.addChild(click::treeRow());
}