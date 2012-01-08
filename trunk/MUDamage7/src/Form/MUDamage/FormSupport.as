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
	
	public class FormSupport extends Form{
		private var d:FormMUDamage;
	
		private var size:int = 0;
		private var names:Object;
		private var hbox:HBox;
	
		private var input_support:Button;
		private var buff_form:FormBuff;
	
		public var aplus:TextInput;
		public var gplus:TextInput;
		public var cplus:TextInput;
		public var sl:TextInput;
		public var sb:TextInput;
		public var iv:TextInput; // インナーベーション
		public var wn:TextInput; // ウィークネス
		public var ba:CheckBox;
		public var ht:CheckBox; // レイジ体力向上
		public var con:CheckBox; // レイジ防御成功率向上
		public var ber:CheckBox; // バーサーカー
		public var se:CheckBox; // スペルエンハンス
		public var ig:CheckBox; // レイジ敵の防御力無視 デモリジョン
		public var sera:CheckBox; // セラフィー
		public var ale:CheckBox; // 酒
		public var miracle:CheckBox; // 妙薬
		public var item:ComboBox; // 補助アイテム サンタ・花見・ジャックランタン
		public var scroll:ComboBox; // 課金スクロール
		public var leap:ComboBox; // 課金秘薬
	
		private var item_data:Array = ["なし","速度+10","攻撃力+25","防御力+100","生命+500","マナ+500"
										,"攻撃力+40","生命+700","マナ+700"
										,"速度+15","攻撃力+30","AG回復+10"];
		private var scroll_data:Array = ["ｽｸﾛｰﾙなし","速度+15","攻撃力+30","魔力+30"
											,"防御力+60","生命+200","マナ+300","クリダメ+20%","EXDダメ+20%"];
		private var leap_data:Array = ["秘薬なし","力+50","敏捷+50","体力+50","エナ+50","統率+50"];
		/**
		 * コンストラクタ
		 */
		public function FormSupport(d:FormMUDamage) {
			this.d = d;
			
			this.setStyle("borderStyle","solid");
			
			initForm();
			createInputSupport();
		}
		/**
		 * 
		 */
		private function createInputSupport():void{
			input_support = new Button();
			input_support.label = "入力支援(未完)";
			input_support.addEventListener(MouseEvent.CLICK,eventClick);
			this.addChild(input_support);
			buff_form = new FormBuff(d);
		}
		/**
		 * 入力支援ボタンクリック時イベント
		 */
		private function eventClick(event:Event):void{
			var pop:TitleWindow = PopUpManager.createPopUp(d,TitleWindow,true) as TitleWindow;
			pop.width = d.width;
			pop.height = d.height;
			pop.setStyle("borderColor","black");
			pop.setStyle("borderAlpha","0.3");
			pop.showCloseButton = true;//右上の×ボタン
			pop.addEventListener(CloseEvent.CLOSE,eventClickPopupClose);//右上の×ボタンのイベント
//			PopUpManager.centerPopUp(pop);
			pop.title = "SupportSkill";//タイトル
			
			pop.addChild(buff_form);//buff_formを載せる
		}
		/**
		 * ポップアップを閉じる
		 */
		private function eventClickPopupClose(event:Event):void{
			PopUpManager.removePopUp(event.target as IFlexDisplayObject);
		}
		/**
		 * フォームの初期化
		 */
		private function initForm():void{
			ln();
			aplus 	= createTextInput("A+：");
			gplus	= createTextInput("G+：");
			cplus 	= createTextInput("C+：");
			sl	 	= createTextInput("SL：");
			sb 		= createTextInput("SB：");
			iv 		= createTextInput("IV：");
			wn		= createTextInput("WN：");
			
			ln();
			ba = createCheckBox("血戦");
			ht = createCheckBox("体力向上");
			con= createCheckBox("防御成功率向上");
			ber= createCheckBox("バーサーカー");
			se = createCheckBox("スペルエンハンス");
			ig = createCheckBox("敵の防御力無視")
			sera = createCheckBox("セラフィー");
			ale = createCheckBox("酒");
			
			ln();
			item = createComboBox(item_data);
			scroll = createComboBox(scroll_data);
			leap = createComboBox(leap_data);
			
		}
		/**
		 * 改行
		 */
		private function ln():void{
			hbox = new HBox();
			this.addChild(hbox);
		}
		/**
		 * ComboBoxを作成
		 */
		private function createComboBox(data:Array):ComboBox{
			var co:ComboBox = new ComboBox();
			co.dataProvider = data;
			co.rowCount = 10;
			hbox.addChild(co);
			return co;
		}
		/**
		 * CheckBoxを作成
		 */
		private function createCheckBox(label:String):CheckBox{
			// CheckBoxの作成
			var ch:CheckBox = new CheckBox();
			hbox.addChild(ch);
			// ラベルの作成
			var la:Label = new Label();
			la.text = label;
			hbox.addChild(la);
			return ch;
		}
		/**
		 * TextInputを作成
		 */
		private function createTextInput(label:String):TextInput{
			// FormItemの作成
			var fi:FormItem = new FormItem();
			hbox.addChild(fi);
			fi.label = label;
			// TextInputの作成
			var te:TextInput = new TextInput();
			fi.addChild(te);
			te.restrict = "0-9";
			te.maxChars = 6;
			te.width = 32;
			te.addEventListener(FocusEvent.FOCUS_IN,FormCommon.eventFocusAllSelection);
			return te;
		}
		/**
		 * 値を返す
		 */
		public function getValue(obj:Object):Object{
			if(obj is ComboBox)
				return (obj as ComboBox).selectedLabel;
			if(obj is CheckBox)
				return (obj as CheckBox).selected;
			if(obj is TextInput)
				return parseInt((obj as TextInput).text);
			else
				return null;
		}
		/**
		 * 値を返す（データ保存用）
		 */
		public function getValue2(obj:Object):Object{
			if(obj is ComboBox)
				return (obj as ComboBox).selectedIndex;
			if(obj is CheckBox)
				return (obj as CheckBox).selected;
			if(obj is TextInput)
				return (obj as TextInput).text;
			else
				return null;
		}
		/**
		 * 値を登録
		 */
		public function setValue(obj:Object,value:Object):void{
			if(obj is ComboBox)
				(obj as ComboBox).selectedIndex = (value as int);
			if(obj is CheckBox)
				(obj as CheckBox).selected = (value as Boolean);
			if(obj is TextInput)
				(obj as TextInput).text = value.toString();
		}
	}
}
