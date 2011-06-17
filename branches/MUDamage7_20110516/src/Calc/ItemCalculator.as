package Calc {
	import mx.controls.*;
	import mx.containers.*;
	import mx.core.*;
	import mx.collections.*;
	import mx.events.*;
	import flash.events.*;

	import Form.MUDamage.SubForm.*;
	import Data.Database.*;
	import Data.Database.MLV.*;
	/**
	 * オプションを計算
	 * @author sinlion
	 *
	 */
	public class ItemCalculator{
		private var f:Object;
		public var data:ItemData;
		public function OptionCalculator(f:Object){
			this.f = f;
			data = new ItemData();
		}
		private function calcWeapon():void{
			var item:String = f.right.item.item;
			var d:Object = D.getData(item);
			var k:Object = D.getKey(item);
			data.weapon_min = d[k.spec][f.right.plus][k.min];
			data.weapon_max = d[k.spec][f.right.plus][k.max];
			data.weapon_magic = d[k.spec][f.right.plus][k.magic];
			data.weapon_pet = d[k.spec][f.right.plus][k.pet];
			data.weapon_curse = d[k.spec][f.right.plus][k.curse];
			
			data.left_weapon_min = d[k.spec][f.right.plus][k.min];
			data.left_weapon_min = d[k.spec][f.right.plus][k.min];
			data.left_weapon_min = d[k.spec][f.right.plus][k.min];
			data.left_weapon_min = d[k.spec][f.right.plus][k.min];
			// 二刀流の有無
			if(f.right.kind != "なし" && f.left.kind != "なし")
				if(f.left.item.item.search("weapon")!=-1)
					data.is_dual_wield=true;
			// 防具のリスト
			data.protects=[f.helm,f.armor,f.garter,f.glove,f.boots];
			if(f.left.kind != "なし")
				if(f.left.item.item.search("shield")!=-1){
					data.protects.unshift(f.left); // 盾の追加
					data.is_shield=true; // 盾の有無
				}
		}
		/**
		 * 羽の計算
		 */
		private function calcWing():void{
			var d:Object = D.getData("wing");
			var k:Object = D.getKey("wing");
			data.wing_inc = d[k.spec][f.wing.plus][k.inc];
			data.wing_dec = d[k.spec][f.wing.plus][k.dec];
			data.wing_def = d[k.spec][f.wing.plus][k.def];
			if(f.wing.cop=="生命増加")
				data.wing_life = 50 + f.wing.plus*5;
			if(f.wing.cop=="マナ増加")
				data.wing_mana = 50 + f.wing.plus*5;
			if(f.wing.cop=="防御無視3%")
				data.wing_ignore = 3;
			if(f.wing.cop=="防御無視5%")
				data.wing_ignore = 5;
			if(f.wing.cop=="統率増加")
				data.wing_rec = 10 + f.wing.plus*5;
		}
		/**
		 * EXOPを計算
		 */
		private function calcExellentOption():void{
			//EXOP
			if(D.form_right.getKind().selectedLabel == "EX"){
				for(var i:int = 0;i<D.form_right.getExop().getOptions().length;i++){
					var e:String = d.f_right.f_exop[i].selectedLabel;
					if(e == "攻撃2%")exop2per=true;//EXOP攻撃力2%
					if(e == "攻撃lv20")exoplv20=true;//EXOP攻撃力LV/20
					if(e == "魔力2%")exopmagic2per=true;//EXOP魔力2%
					if(e == "魔力lv20")exopmagiclv20=true;//EXOP魔力LV/20
					if(e == "EXD")exopexd=true;//EXOPEXD
					if(e == "速度+7")exopspeed=true;//EXOP速度
				}
			}
			//EXOP左手
			if(d.f_left.f_kind.selectedLabel == "EX" || d.f_left.f_kind.selectedLabel == "EXソケット"){
				if(d.f_left.f_item.selectedItem[0] == "武器"){
					for(i = 0;i<d.f_left.f_exop.length;i++){
						e = d.f_left.f_exop[i].selectedLabel;
						if(e == "攻撃2%")exopleft2per=true;//EXOP攻撃力2%
						if(e == "攻撃lv20")exopleftlv20=true;//EXOP攻撃力LV/20
						if(e == "魔力2%")exopleftmagic2per=true;//EXOP魔力2%
						if(e == "魔力lv20")exopleftmagiclv20=true;//EXOP魔力LV/20
						if(e == "EXD")exopleftexd=true;//EXOPEXD
						if(e == "速度+7")exopleftspeed=true;//EXOP速度
					}
				}
			}
			//EXOPアクセ
			if(d.f_neck.f_kind.selectedLabel == "EX" || d.f_neck.f_kind.sel waectedLabel == "EXソケット"){
				for(i = 0;i<d.f_neck.f_exop.length;i++){
					e = d.f_neck.f_exop[i].selectedLabel;
					if(e == "攻撃2%")exopac2per=true;//EXOP攻撃力2%
					if(e == "攻撃lv20")exopaclv20=true;//EXOP攻撃力LV/20
					if(e == "魔力2%")exopacmagic2per=true;//EXOP魔力2%
					if(e == "魔力lv20")exopacmagiclv20=true;//EXOP魔力LV/20
					if(e == "EXD")exopacexd=true;//EXOPEXD
					if(e == "速度+7")exopacspeed=true;//EXOP速度
				}
			}
			//EXOP防具
			equipExop(d.f_helm);
			equipExop(d.f_armor);
			equipExop(d.f_glove);
			equipExop(d.f_garter);
			equipExop(d.f_boots);
			if(d.f_left.f_item.dataProvider != "" && d.f_left.f_item.selectedItem[0] == "防具")equipExop(d.f_left);//盾のとき
			equipExop(d.f_ring1);
			equipExop(d.f_ring2);
		}
		private function calcExellentOptionProtect(item:Item):Boolean{
			use namespace calc;
			if(!(item.f_kind.selectedLabel == "EX" || item.f_kind.selectedLabel == "EXソケット"))return false;
			for(var i:int = 0;i<item.f_exop.length;i++){
				if(item.f_exop[i].selectedLabel == "防御成功")exop_avoid++;
				if(item.f_exop[i].selectedLabel == "ダメ減")exop_dec++;
				if(item.f_exop[i].selectedLabel == "ダメ反")exop_ref++;
				if(item.f_exop[i].selectedLabel == "生命増")exop_hp++;
				if(item.f_exop[i].selectedLabel == "マナ増")exop_mana++;
			}
			return true;
		}
		private function calcEnchantOption(){
			
		}
		private function calcSetOption(){
			
		}
		private function calcSocketOption(){
			
		}
		/**
		 * 補助関数
		 */
		public function getSpec(obj:Object,str:String):int{
			if(obj.item != null){
				// validate
				if(obj.key[str]==null)
					Alert.show("Error ItemCalculator getSpec():"+str+"");
				// spec
				var spec:int = obj.key.spec;
				if(obj.item[obj.key.kind] == "EX")
					spec = obj.key.exspec;
				if(obj.item[obj.key.kind] == "セット")
					spec = obj.key.setspec;
				return obj.item[spec][obj.plus][obj.key[str]];
			}
		}
		public function getItemData(obj:Object,str:String):int{
			if(obj.item != null){
				if(obj.key[str]==null)
					Alert.show("Error ItemCalculator getItemData():"+str+"");
				return obj.item[obj.key[str]];
			}
		}
		public function getValue(obj:Object):Object{
			return validateValue(obj);
		}
		public function getEnchantProtects(str:String):Object{
			var value:int = 0;
			for(var n:Object in data.protects)
				value += validateValue(data.protects[n].enchant[str]);
			return value;
		}
		public function getSocket(obj:Object,str:String):Object{
			return validateValue(obj.socket[str]);
		}
		public function getSocketProtects(str:String):Object{
			var value:int = 0;
			for(var n:Object in data.protects)
				value += validateValue(data.protects[n].socket[str]);
			return value;
		}
		public function getSocketBonusProtects(str:String):Object{
			var value:int = 0;
			for(var n:Object in data.protects)
				value += validateValue(data.protects[n].socket[str]);
			return value;
		}
		/**
		 * validate
		 */
		private function validateValue(obj:Object):int{
			if(obj!=null)
				return obj;
			return 0;
		}

	}
}