package AAgetter
{
	import mx.controls.Alert;
	
	public class Calculation
	{
		public function Calculation()
		{
			datas = new Array();
			hp = 345000;//BC8
		}
		
		//石造破壊計算
		private var datas:Array;
		private var hp:int;
		private var bclv:int=8;
		public function setData(data:InputData):Boolean{
			//計算に必要なデータをセットする
			//name skill speed(ms) min max cri exd criper exdper wdper
			datas.push(data);
			return true;
		}
		public function setBCLV(lv:int):void{
			if(lv<1)lv=1;
			if(lv>8)lv=8;
			bclv = lv;
			hp = 25000 + bclv*40000;
		}
		public function Calc():Array{
			//石造破壊計算の開始
			initCalc(datas);
			var ch:InputData;
			while(hp >= 0){//石造が破壊されるまでループ
				//攻撃プレイヤーを選択
				ch = getCharacter(datas);
				ch.tmpspeed += ch.speedms;
				//ダメージを計算
				for(var i:int=0;i<getHit(ch.skill);i++){
					var d:int = getDamage(ch);
					if("Chain Lightning"){
						if(i==1) d = Math.floor(d*0.7);
						else if(i==2) d = Math.floor(d*0.5);
					}
					ch.tmpdamage += d
					hp -= d;
					if(hp < 0)break;
				}
			}
			ch = getResult(datas);
			ch.tmpwin = true;
			//for(i=0;i<datas.length;i++)
			//	Alert.show(datas[i].tmpdamage);
			//返り値
			//resultname hitnum 1hitdamage
			return datas;
		}
		//プライベート関数=============================================================
		/**
		 * initCalc(a:Array):void
		 * datasのtmpデータを初期化する
		 * in datas
		 **/
		private function initCalc(a:Array):void{
			//計算の初期化
			for(var i:int=0;i<a.length;i++){
				(a[i] as InputData).initTmp();//tmp変数の初期化
				//タイミングのずれを設定
				if((a[i] as InputData).skill != "Death Stab"
					&& (a[i] as InputData).skill != "Chain Lightning")
					(a[i] as InputData).tmpspeed += getRand((a[i] as InputData).speedms);
				//ディレイを加算
				(a[i] as InputData).tmpspeed += (a[i] as InputData).delay;
			}
			hp = 25000 + bclv*40000;
		}
		/**
		 * getCharacter(a:Array):InputData
		 * 攻撃プレイヤーを選択
		 *in datas
		 **/ 
		private function getCharacter(a:Array):InputData{
			//攻撃プレイヤーを選択
			var r:InputData;
			var candidates:Array = new Array();//候補を入れる配列
			
			candidates.push(0);//最初の候補を入れる
			
			//累積時間で候補を選択
			for(var i:int=1;i<a.length;i++){
				if(a[i].tmpspeed == a[candidates[candidates.length-1]].tmpspeed){//累積時間が同じ場合。
					candidates.push(i);
				}else if(a[i].tmpspeed < a[candidates[candidates.length-1]].tmpspeed){//累積時間が小さい場合
					candidates = new Array();
					candidates.push(i);
				}
				//else 累積時間が大きい場合、候補に入れない。
			}
			
			//乱数で候補を選択
			if(candidates.length > 1){//候補が一つ以上ある場合
				//乱数で選択
				var rand:int = getRand(candidates.length);
				r = a[candidates[rand]] as InputData;
			}else
				r = a[candidates[0]] as InputData;
				
			return r;
		}
		/**
		 * getHit(skill:String):int
		 * HIT数を返す。
		 * スキル名で判別
		 **/
		private function getHit(skill:String):int{
			//HIT数を返す
			var hit:int = 1;
			if(skill == "Death Stab"){
				var i:int = getRand(100);
				if(i < 15) hit = 3;
				else if(i < 50) hit = 2;
				else hit = 1;
			}else if(skill == "Multi-Shot")
				hit = 5;
			else if(skill == "Fire Scream")
				hit = 3;
			else if(skill == "Chaotic Diseier")
				hit = 2;
			else if(skill == "Fire Slash")
				hit = 3;
			else if(skill == "Chain Lightning")
				hit = 3;
			else
				Alert.show("Error Skill.");
				
			return hit;
		}
		/**
		 * getDamage(id:InputData):int
		 * 1HITダメージを返す。
		 * 
		 **/
		private function getDamage(id:InputData):int{
			//1HITダメージを返す
			var d:int=0;
			if(id.exdper && id.exdper > getRand(100))//EXDの場合
				d = id.exd;
			else if(id.criper && id.criper > getRand(100))//クリの場合
				d = id.cri;
			else//通常の場合
				d = id.min + getRand(id.max - id.min);
				
			//WDの計算
			if(id.wdper && id.wdper > getRand(100))//WDの場合
				d += d;
				
			return d;
		}
		/**
		 * getResult(a:Array):InputData
		 * 最もダメージを与えたプレイヤーを返す
		 **/
		private function getResult(a:Array):InputData{
			var r:InputData;
			var candidates:Array = new Array();//候補を入れる配列
			
			candidates.push(0);//最初の候補を入れる
			
			//累積時間で候補を選択
			for(var i:int=1;i<a.length;i++){
				if(a[i].tmpdamage == a[candidates[candidates.length-1]].tmpdamage){//累積ダメージが同じ場合。
					candidates.push(i);
				}else if(a[i].tmpdamage > a[candidates[candidates.length-1]].tmpdamage){//累積ダメージが大きい場合
					candidates = new Array();
					candidates.push(i);
				}
				//else 累積ダメージが小さい場合、候補に入れない。
			}
			
			//乱数で候補を選択
			if(candidates.length > 1){//候補が一つ以上ある場合
				//乱数で選択
				var rand:int = getRand(candidates.length);
				r = a[candidates[rand]] as InputData;
			}else
				r = a[candidates[0]] as InputData;
				
			return r;
		}
		/**
		 * getRand(i:int):int
		 * 0<= r < i の整数を返す
		 * 
		 **/
		private function getRand(i:int):int{
			//0<= r < i の整数を返す
			return Math.floor(Math.random()*i)
		}
	}
}