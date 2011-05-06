package AAgetter
{
	public class InputData
	{
		public function InputData()
		{
		}
		public var title:String="";
		public var name:String="";
		public var skill:String="";
		public var speed:int=0;
		public var speedms:int=0;
		public var delay:int=0;
		public var min:int=0;
		public var max:int=0;
		public var cri:int=0;
		public var exd:int=0;
		public var criper:int=0;
		public var exdper:int=0;
		public var wdper:int=0;
		public var tmpspeed:int=0;//累積時間
		public var tmpdamage:int=0;//累積ダメージ
		public var tmpwin:Boolean=false;//勝利チェック
		
		public function initTmp():void{
			//一時保存用の変数を初期化
			tmpspeed=0;
			tmpdamage=0;
			tmpwin=false;
		}

	}
}