package Csv
{
	import mx.controls.CheckBox;
	import mx.controls.ComboBox;
	import mx.controls.Label;
	
	public class Item
	{
		//アイテムのデータ
		public var f_kind:ComboBox;
		public var f_item:ComboBox;
		public var f_luck:CheckBox;
		public var f_luck_label:Label;
		public var f_plus:ComboBox;
		public var f_op:ComboBox;
		public var f_cop:ComboBox;
		public var f_exop:Array = new Array();
		public var f_enop:ComboBox;
		public var f_enop_value:ComboBox;
		public var f_soop:Array = new Array();
		public var f_soop_value:Array = new Array();
		public var f_sobonus:Array = new Array();
		public var f_arrow:ComboBox;//矢
		public var f_380:CheckBox;//380OP
		public var f_380_label:Label;//380OPラベル
		public var name:String;
		
		//EXOP
		public function getExop(index:int):ComboBox{
			return f_exop[index];
		}
		//ソケットOP
		public function getSoop(index:int):Array{
			return f_soop[index];
		}
		
		public function Item(namestr:String)
		{
			name = namestr;
		}

	}
}