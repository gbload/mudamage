// ActionScript file
import MuCalc.MLVcount;
import MuCalc.MuChar;

import flash.events.MouseEvent;

import mx.containers.Canvas;
import mx.containers.HBox;
import mx.controls.Button;
import mx.controls.Label;

public namespace calcform;

calcform var cow:VBox;
calcform var row:HBox;
calcform function ln():void{
	use namespace calcform;
	var hbox:HBox = new HBox();
	row = hbox;
	cow.addChild(hbox);
}
calcform function text(str:String,color:String="",t:String=""):void{
	use namespace calcform;
	var te:Label = new Label();
	te.text = str;
	//文字の色
	var c:String = "";
	if(color == "red")c = "#FF5555";
	else if(color == "blue")c = "#5555FF";
	else if(color == "cyan")c = "#5599FF";
	else if(color == "green")c = "#55BB55";
	else if(color == "purple")c = "#AA55DD";
	if(c != "")te.setStyle("color",c);
	//ツールチップ
	if(t != ""){
		te.toolTip = t;
		te.setStyle("textDecoration","underline");
	}
	
	row.addChild(te);
	
}
calc function panel():void{
	use namespace calcform;
	use namespace dat;
	use namespace calc;
	var i:int=0;
	//フォームの値を取得
	getForm();
	//キャンバスの作成
	var canvas:Canvas = new Canvas();
	canvas.label = d.f_title.text;
	click::tabindex++;
	canvas.name = click::tabindex.toString();
	form::tab.addChild(canvas);
	//ボタンの作成
	var frame:Canvas = new Canvas();//×印つけるため
	frame.name = click::tabindex.toString();
	var button:Button = new Button();//上のメニューバーに追加するボタン
	button.height = 20;
	button.name = click::tabindex.toString();
	if(d.f_title.text != "")//ボタンのラベル
		button.label = "　" + d.f_title.text;//タイトル
	else
		button.label = "　" + d.f_map.selectedLabel;//マップ名
	button.addEventListener(MouseEvent.CLICK,click::tab);
	frame.addChild(button);//フレームに追加
	form::acb.addChild(frame);//メニューバーに追加
		//×印の作成
		var peke:Canvas = new Canvas();
		var peketext:Label = new Label();
		peketext.text = " ×";
		frame.addChild(peketext);
		peke.width = 20;
		peke.height = 20;
		peke.name = click::tabindex.toString();//タブインデックスの名前
		peke.addEventListener(MouseEvent.CLICK,click::closeCalc);//閉じるイベント
		frame.addChild(peke);
	//ボタンイベントの実行
	button.dispatchEvent(new MouseEvent(MouseEvent.CLICK) as Event);
	
	//各種情報の書き込み
	//大枠
	var fo:Form = new Form();
	canvas.addChild(fo);
	//ボタン枠
	var hbox:HBox = new HBox();
	fo.addChild(hbox);
	//削除ボタン
	button = new Button();
	button.label = "閉じる";
	button.name = click::tabindex.toString();
	button.addEventListener(MouseEvent.CLICK,click::closeCalc);
	hbox.addChild(button);
	//HTML出力ボタン
//	button = new Button();
//	button.label = "HTML出力";
//	button.name = click::tabindex.toString();
//	//button.addEventListener(MouseEvent.CLICK,calc::showHTMLTimer);
//	button.addEventListener(MouseEvent.CLICK,calcform::showHTML);
//	hbox.addChild(button);
	//外枠
	hbox = new HBox();
	cow = new VBox();
	hbox.addChild(cow);
	fo.addChild(hbox);
	
	//MLVのチェック
	var tmpcount:MLVcount;
	if(dat::d.f_lv.text != "400"){
		tmpcount = dat::mlvcount;
		dat::mlvcount = new MLVcount();
	}
	//MuChar
	var muc:MuChar = calcchar::main();
	//MLVのチェック
	if(dat::d.f_lv.text != "400"){
		dat::mlvcount = tmpcount;
	}
	
	//1行目
	ln();
	//クラスの表示
	text(d.f_job.text);
	//レベルの表示
	text("LV:" + muc.lv);
	
	//2行目
	ln();
	//各種ステータス
	var color:String = ""
	if(muc.add_str)color="blue"; else color="";
	text("力:" + muc.str,color);
	if(muc.add_agi)color="blue"; else color="";
	text("敏捷:" + muc.agi,color);
	if(muc.add_vit)color="blue"; else color="";
	text("体力:" + muc.vit,color);
	if(muc.add_ene)color="blue"; else color="";
	text("エナジー:" + muc.ene,color);
	if(muc.job == 4){
		if(muc.add_rec)color="blue"; else color="";
		text("統率:" + muc.rec,color);
	}
	
	//3行目
	ln();
	text("HP:" + muc.hp);text("SD:" + muc.sd);text("マナ:" + muc.mana);text("AG:" + muc.ag);
	
	//4行目
	ln();
	if(muc.job == 0 || muc.job == 2 || muc.job == 3 || muc.job == 4 || muc.job == 6)text("攻撃速度:" + muc.speed);
	if(muc.job == 1 || muc.job == 3 || muc.job == 5)text("魔法速度:" + muc.magicspeed);
	
	//5行目
	ln();
	if(muc.job == 0 || muc.job == 2 || muc.job == 3 || muc.job == 4 || muc.job == 6)//攻撃組み
		text("攻撃力:" + muc.minmax[0] + "～" + muc.minmax[1]);
	//攻撃成功率
	text("(率" + muc.hit +"/対人" +muc.pvphit +")");
	ln();
	if(muc.job == 1 || muc.job == 3 || muc.job == 5)//魔法組み
		text("魔力:" + muc.minmax[2] + "～" + muc.minmax[3]);
	if(muc.job == 5)//呪い組み
		text(" 呪い:" + muc.noroi[0] + "～" + muc.noroi[1]);
	
	//6行目
	ln();
	text("防御力:" + muc.def);
	//防御成功率
	text("(率" + muc.avoid +"/対人" +muc.pvpavoid +")");
	
	//7行目
	ln();
	text("通常:" + (muc.normal/100) + "%");
	text("クリ:" + (muc.cri/100) + "%");
	text("EXD:" + muc.exd + "%");
	
	//8行目
	ln();
	//防御無視　WD
	text("無視:" + muc.ignore + "%");
	text("WD:" + muc.wd + "%");
	
	//9行目
	ln();
	var setname:String = "";
	var setops:String = "";
	for each(var ii:Object in setop_array)//セット名
		if(ii.num >= 2)//2箇所以上
			for(var j:int=0;j<c.setop.length;j++)//セットOPのデータを繰り返し確認
				if(c.setop[j][0] == ii.label){//セット名の一致
					setname = ii.label;
					setops = setname + "\n";
					for(var k:int=2;k<=ii.num;k++){
						setops += c.setop[j][k][0] + "\n";
						if(k == c.setop[j][1] + 1){//フルOPを取得
							setops += "\n";
							for(var l:int=0;l<c.setop[j][k+1].length;l++){
								setops += c.setop[j][k+1][l][0] + "\n";
							}
						}
					}
					//表示
					text(setname + " " + (k-1),"cyan",setops);
					break;
				}
	
	//10行目
	ln();
	text("A+:" + muc.support_a);
	text("G+:" + muc.support_g);
	text("C+:" + muc.support_c);
	text("SL:" + muc.support_sl + "%");
	text("SB:" + muc.support_sb + "%");
	ln();
	text("インナーベーション:" + muc.support_inner + "%");
	text("ウイークネス:" + muc.support_weak + "%");
	if(muc.support_ba || muc.support_berserker || muc.support_se){
		ln();
		if(muc.support_ba)text("血戦(敵Def10%低下)");
		if(muc.support_berserker)text("バーサーカー:" + muc.support_berserker + "%");
		if(muc.support_se)text("スペルエンハンス(最小魔力20%上昇)");
	}
	
	
	//2列目
	cow = new VBox();
	hbox.addChild(cow);
	//1行目
	ln();
	//ペット
	if(d.f_pet.selectedLabel != "なし")text(d.f_pet.selectedLabel);
	if(d.f_petsub1.visible && d.f_petsub1.selectedLabel != "")text(d.f_petsub1.selectedLabel);
	if(d.f_petsub2.visible && d.f_petsub2.selectedLabel != "")text(d.f_petsub2.selectedLabel);
	
	//2行目
	ln();//羽
	if(d.f_wing.f_item.selectedLabel != "なし"){
		var op:String = d.f_wing.f_op.selectedLabel;
		if(op == "opなし")op = "N";
		text(d.f_wing.f_item.selectedLabel + d.f_wing.f_plus.selectedLabel
				+ op);
		if(d.f_wing.f_luck.selected)text("幸運");
		text("攻" + wing_inc +"%");
		if(wing_dec)text("守" + wing_dec + "%");
		text(d.f_wing.f_cop.selectedLabel);
	}
	
	//3行目
	ln();//ネック
	if(d.f_neck.f_kind.selectedLabel == "EX"){
		text("EXネック","green");
		for(i = 0;i < d.f_neck.f_exop.length;i++){
			text(d.f_neck.f_exop[i].selectedLabel,"green");
		}
	}else if(d.f_neck.f_kind.selectedLabel == "セット"){
		text(d.f_neck.f_item.selectedLabel,"cyan");
		text(d.f_neck.f_cop.selectedLabel,"cyan");
	}else if(d.f_neck.f_kind.selectedLabel == "ショップ"){
			text("ショップ","purple");
			text(d.f_neck.f_shopitem.selectedLabel,"purple");
	}
	
	//4行目～10行目
	var ia:Array = [d.f_right,d.f_left,d.f_helm,d.f_armor,d.f_glove,d.f_garter,d.f_boots];
	var iname:Array = ["右:","左:","兜:","鎧:","手:","腰:","足:"];
	var spec:Object;
	var specitem:Object;
	var specstr:String;
	color="";
	for(i = 0;i < ia.length;i++){
		ln();
		text(iname[i]);
		if(ia[i].f_kind.selectedLabel == "鷹"){
			text("鷹 "+ia[i].f_op.selectedLabel);
		}else if(ia[i].f_kind.selectedLabel != "なし"){
			//文字色の指定
			color = "";
			if(ia[i].f_kind.selectedLabel == "EX")color="green";
			if(ia[i].f_kind.selectedLabel == "セット")color="cyan";
			if(ia[i].f_kind.selectedLabel == "ソケット" 
				|| ia[i].f_kind.selectedLabel == "EXソケット")color="purple";
			//"EX"の表示
			if(ia[i].f_kind.selectedLabel == "EX" || ia[i].f_kind.selectedLabel == "EXソケット")
				text("EX",color);
			//OPの取得
			op = ia[i].f_op.selectedLabel;
			if(op == "opなし")op = "N";
			//要求スペックの作成
			specstr = "";
			specitem = ia[i].f_item.selectedItem;
			if(ia[i].f_kind.selectedLabel == "EX")
				spec = specitem[13][ia[i].f_plus.selectedIndex];//EX
			else
				spec = specitem[12][ia[i].f_plus.selectedIndex];//通常
			if(ia[i].f_item.selectedItem[0] == "武器"){
				if(spec[0] > 0 || spec[1] > 0)
					specstr += "攻撃力 " + (spec[0]+ia[i].f_op.selectedItem.value) 
								+ "～" + (spec[1]+ia[i].f_op.selectedItem.value) + "\n";
				if(spec[5] > 0)specstr += "魔力 " + spec[5] + "%\n";
				if(spec[6] > 0)specstr += "ペット " + spec[6] + "%\n";
				if(spec[7] > 0)specstr += "呪い " + spec[7] + "%\n";
				specstr += "速度 " + specitem[7]+ "\n";
				if(spec[2] > 0)specstr += "要求力 " + (spec[2] + (ia[i].f_op.selectedIndex * 5)) + "\n";
				if(spec[3] > 0)specstr += "要求敏捷 " + spec[3] + "\n";
				if(spec[4] > 0)specstr += "要求エナジー " + spec[4] + "\n";
				if(specitem[6] > 0)specstr += "要求LV " + specitem[6] + "\n";
			}else{
				var defpl:int=0;
				var avoidpl:int=0;
				if(ia[i].f_item.selectedItem[3] == "盾")avoidpl=ia[i].f_op.selectedItem.value;
				else defpl=ia[i].f_op.selectedItem.value;
				if(spec[3] > 0)specstr += "防御力 " + (spec[3]+defpl) + "\n";
				if(spec[4] > 0)specstr += "防御成功率 " + (spec[4]+avoidpl) + "\n";
				if(specitem[7] > 0)specstr += "速度 " + specitem[7] + "\n";
				if(spec[0] > 0)specstr += "要求力 " + (spec[0] + (ia[i].f_op.selectedIndex * 5)) + "\n";
				if(spec[1] > 0)specstr += "要求敏捷 " + spec[1] + "\n";
				if(spec[2] > 0)specstr += "要求エナジー " + spec[2] + "\n";
				if(specitem[6] > 0)specstr += "要求LV " + specitem[6] + "\n";
			}
			//アイテム名　+13 op16
			text(ia[i].f_item.selectedLabel + ia[i].f_plus.selectedLabel + op,color,specstr);
			//エンチャントの表示
			if(ia[i].f_enop.visible)
				if(ia[i].f_enop.selectedIndex > 0)
					text(ia[i].f_enop.selectedLabel + "+" + ia[i].f_enop_value.selectedLabel,color);
			//幸運の表示
			if(ia[i].f_luck.selected)text("幸運",color);
			if(spec[5] > 0)text("("+spec[5]+"%)",color);
			//EXOPの表示
			if(ia[i].f_kind.selectedLabel == "EX" || ia[i].f_kind.selectedLabel == "EXソケット"){
				for(j = 0;j < ia[i].f_exop.length;j++){
					if(ia[i].f_exop[j].selectedLabel != "")text(ia[i].f_exop[j].selectedLabel,color);
				}
			}
			//セットのステータス表示
			if(ia[i].f_kind.selectedLabel == "セット")
				text(ia[i].f_cop.selectedLabel,color);
			//ソケットOPの表示	
			if(ia[i].f_kind.selectedLabel == "ソケット" || ia[i].f_kind.selectedLabel == "EXソケット"){
				ln();//改行
				for(j = 0;j < ia[i].f_soop.length;j++){
					if(ia[i].f_soop[j].selectedLabel)text(ia[i].f_soop[j].selectedLabel + "+" + ia[i].f_soop_value[j].selectedLabel,color);
				}
				for(j = 0;j < ia[i].f_sobonus.length;j++)
					if(ia[i].f_sobonus[j].visible && ia[i].f_sobonus[j].selectedLabel)
						text(ia[i].f_sobonus[j].selectedLabel,color);
			}
			//380OPの表示
			if(ia[i].f_380.visible && ia[i].f_380.selected){
				ln();//改行
				if(i==0 || i==1)text("対人ダメージ+200　対人攻撃成功率+10",color);//右手
				if(i==2)text("SD回復量+20　対人防御成功率+10",color);//兜
				if(i==3)text("SD自動回復　対人防御成功率+10",color);//鎧
				if(i==4)text("最大生命+200　対人防御成功率+10",color);//グラブ
				if(i==5)text("対人防御力+200　対人防御成功率+10",color);//ガーダー
				if(i==6)text("最大SD+700　対人防御成功率+10",color);//ブーツ
			}
		}
	}
	
	//11行目 12行目
	ia = [d.f_ring1,d.f_ring2];
	for(i = 0;i < 2;i++){
		ln();//リング
		if(ia[i].f_kind.selectedLabel == "EX"){
			text("EXリング","green");
			for(j = 0;j < ia[i].f_exop.length;j++){
				text(ia[i].f_exop[j].selectedLabel,"green");
			}
		}else if(ia[i].f_kind.selectedLabel == "セット"){
			text(ia[i].f_item.selectedLabel,"cyan");
			text(ia[i].f_cop.selectedLabel,"cyan");
		}else if(ia[i].f_kind.selectedLabel == "魔法師"){
			text("魔法師の指輪");
		}else if(ia[i].f_kind.selectedLabel == "パンダ変化"){
			text("パンダ変化の指輪　攻撃力+30/魔力+30");
		}else if(ia[i].f_kind.selectedLabel == "スケルトン"){
			text("スケルトン変身の指輪　攻撃力+40/魔力+40/呪い+40");
		}else if(ia[i].f_kind.selectedLabel == "ショップ"){
			text("ショップ","purple");
			text(ia[i].f_shopitem.selectedLabel,"purple");
		}
	}
	//計算テーブル
	damage::table(muc,fo);
}