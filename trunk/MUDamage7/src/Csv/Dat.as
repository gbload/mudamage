package Csv
{
	import mx.core.Container;
	import mx.controls.CheckBox;
	import mx.controls.ComboBox;
	import mx.controls.TextInput;
	
	public class Dat
	{
		//データ保持用のクラス
		public var f_title:TextInput;
		public var f_exp:TextInput;
		public var f_job:ComboBox;
		public var f_lv:TextInput;
		public var f_mlv:TextInput;
		public var f_str:TextInput;
		public var f_agi:TextInput;
		public var f_vit:TextInput;
		public var f_ene:TextInput;
		public var f_rec:TextInput;
		public var f_pet:ComboBox;
		public var f_petsub1:ComboBox;
		public var f_petsub2:ComboBox;
		public var f_wing:Item = new Item("wing");
		public var f_neck:Item = new Item("neck");
		public var f_right:Item = new Item("right");
		public var f_left:Item = new Item("left");
		public var f_helm:Item = new Item("helm");
		public var f_armor:Item = new Item("armor");
		public var f_glove:Item = new Item("glove");
		public var f_garter:Item = new Item("garter");
		public var f_boots:Item = new Item("boots");
		public var f_ring1:Item = new Item("ring1");
		public var f_ring2:Item = new Item("ring2");
		public var s_aplus:TextInput;//A+
		public var s_gplus:TextInput;//G+
		public var s_sl:TextInput;//SL
		public var s_sb:TextInput;//SB
		public var s_cplus:TextInput;//C+
		public var s_inner:TextInput;//召喚師のインナーベーション
		public var s_weak:TextInput;//召喚師のウイークネス
		public var s_vit:CheckBox;//体力上昇
		public var s_avoid:CheckBox;//防御成功率上昇
		public var s_ba:CheckBox;//血戦
		public var s_se:CheckBox;//スペルエンハンス
		public var s_berserker:CheckBox;//召喚師のバーサーカー
		public var s_ignore:CheckBox;//敵の防御力無視
		public var s_sera:CheckBox;//セラフィー
		public var s_sake:CheckBox;//酒
		public var s_myou:CheckBox;//妙薬
		public var s_item:ComboBox;//サンタ、かぼちゃ、桜
		public var s_scroll:ComboBox;//課金スクロール
		public var s_hiyaku:ComboBox;//課金秘薬
		public var f_map:ComboBox;
		public var f_map_doublegoer_lv:ComboBox;
		public var f_map_doublegoer_ptm:ComboBox;
		public var f_map_imperialguardian_lv:ComboBox;
		
		public var formbox:Array = new Array();//装備フォーム
		public var exbox:Array = new Array();//EXオプション
		public var setbox:Array = new Array();//セットステータス
		public var sobox:Array = new Array();//ソケットオプション
		public var shopbox:Array = new Array();//アイテムショップ
		public var box380:Array = new Array();//380OP
		public var helmbox:Container;//兜
		public var glovebox:Container;//兜
		public var fruitpoint:Array = new Array();//実のポイント
		
		public var aa_skill:ComboBox;//石造破壊シミュレータに渡すスキル
		
		public function getItemByName(name:String):Item{
			var item:Item;
			if(name == "right"){
				item = f_right;
			}else if(name == "left"){
				item = f_left;
			}else if(name == "helm"){
				item = f_helm;
			}else if(name == "armor"){
				item = f_armor;
			}else if(name == "glove"){
				item = f_glove;
			}else if(name == "garter"){
				item = f_garter;
			}else if(name == "boots"){
				item = f_boots;
			}else if(name == "neck"){
				item = f_neck;
			}else if(name == "ring1"){
				item = f_ring1;
			}else if(name == "ring2"){
				item = f_ring2;
			}else{
				item = null;
			}
			return item;
		}
		public function Dat()
		{
		}

	}
}