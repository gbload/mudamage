package Csv
{
	public class InputDat
	{
		public var supportdatas:Array = new Array();
		public var index:int = 0;
		//EE関連
		public var EE_ENE:int = index++;
		public var MLV_A:int = index++;
		public var MLV_G:int = index++;
		public var R_A:int = index++;
		public var R_G:int = index++;
		//C+関連
		public var DL_ENE:int = index++;
		public var DL_REC:int = index++;
		public var MLV_C:int = index++;
		public var R_C:int = index++;
		//SL関連
		public var K_VIT:int = index++;
		public var K_ENE:int = index++;
		public var MLV_SL:int = index++;
		public var PTM:int = index++;
		public var R_SL:int = index++;
		//SB関連
		public var W_AGI:int = index++;
		public var W_ENE:int = index++;
		public var MLV_SB:int = index++;
		public var R_SB:int = index++;
		//召喚師関連
		public var S_ENE:int = index++;
		public var R_INNER:int = index++;
		public var R_WEAK:int = index++;
		//確定値
		public var C_A:int = index++;
		public var C_G:int = index++;
		public var C_C:int = index++;
		public var C_SL:int = index++;
		public var C_SB:int = index++;
		public var C_INNER:int = index++;
		public var C_WEAK:int = index++;
		
		public function InputDat()
		{
		}

	}
}