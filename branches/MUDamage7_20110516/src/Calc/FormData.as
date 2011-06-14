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
	 * trim form data.
	 * @author sinlion
	 *
	 */
	public class FormData{
		private var data:Object = {
			job:"",
			job_index:0,
			pet:initPet(),
			wing:initWing(),
			neck:initNeck(),
			ring1:initRing(),
			ring2:initRing(),
			right:initWeapon(),
			left:initWeapon(),
			helm:initProtect(),
			armor:initProtect(),
			garter:initProtect(),
			glove:initProtect(),
			boots:initProtect(),
			status:initStatus(),
			support:initSupport(),
			master_skill:initMasterSkill()
		};
		private function initPet():Object{
			return {
				item:"",
				sub1:"",
				sub2:""
			}
		}
		private function initWing():Object{
			return {
				item:null,
				key:null,
				plus:0,
				option:{},
				luck:false,
				cop:""
			}
		}
		private function initNeck():Object{
			var obj:Object = initEquipBase();
			obj.option = {
				type:"",value:0
			};
			return obj;
		}
		private function initRing():Object{
			var obj:Object = initNeck();
			return obj;
		}
		private function initProtect():Object{
			var obj:Object = initEquip();
			return obj;
		}
		private function initWeapon():Object{
			var obj:Object = initEquip();
			obj.arrow = "";
			return obj;
		}
		private function initEquip():Object{
			var obj:Object = initEquipBase();
			obj.plus = 0;
			option:{
				type:"",value:0
			},
			obj.enchant = {
					type:"",value:0
			};
			obj.socket = {};
			obj.socket_bonus = {};
			obj.380op = false;
			return obj;
		}
		private function initEquipBase():Object{
			return {
				kind:"なし",
				item:null,
				key:null,
				set_status:{
					type:"",value:0
				},
				exop:{}
			};
		}
		private function initStatus():Object{
			return {
				lv:0,
				mlv:0,
				str:0,
				agi:0,
				vit:0,
				ene:0,
				rec:0
			};
		}
		private function initSupport():Object{
			return {
//				aplus:0,
//				gplus:0,
//				cplus:0,
//				sl:0,
//				sb:0,
//				iv:0, // インナーベーション
//				wn:0, // ウィークネス
//				ba:false,
//				ht:false, // レイジ体力向上
//				con:false, // レイジ防御成功率向上
//				ber:false, // バーサーカー
//				se:false, // スペルエンハンス
//				ig:false, // レイジ敵の防御力無視 デモリジョン
//				sera:false, // セラフィー
//				ale:false, // 酒
//				miracle:false, // 妙薬
//				item:"", // 補助アイテム サンタ・花見・ジャックランタン
//				scroll:"", // 課金スクロール
//				leap:"", // 課金秘薬
			};
		}
		private function initMasterSkill():Object{
			return {};
		}
		/**
		 * コンストラクタ
		 */
		public function FormData(d:FormMUDamage){
			setPet(d.form_pet,data.pet);
			setWing(d.form_wing,data.wing);
			setWeapon(d.form_right,data.right);
			setWeapon(d.form_left,data.left);
			setProtect(d.form_helm,data.helm);
			setProtect(d.form_armor,data.armor);
			setProtect(d.form_garter,data.garter);
			setProtect(d.form_glove,data.glove);
			setProtect(d.form_boots,data.boots);
			setNeck(d.form_neck,data.neck);
			setRing(d.form_ring1,data.ring1);
			setRing(d.form_ring2,data.ring2);
			setStatus(d.form_status,data.status);
		}
		public function getData():Object{
			return data;
		}
		/**
		 * 値のセット
		 */
		private function setPet(form:Object,obj:Object):void{
			obj.item = form.getItem().selectedLabel;
			obj.sub1 = form.getItem().selectedLabel;
			obj.sub2 = form.getItem().selectedLabel;
		}
		private function setWing(form:Object,obj:Object):void{
			obj.item = D.getData(form.getItem().selectedItem.item)[form.getItem().selectedItem.index];
			obj.key = D.getKey(form.getItem().selectedItem.item);
			if(form.getItemAttr().visible){
				obj.plus = form.getItemAttr().getPlus().selectedIndex;
				obj.luck = form.getItemAttr().getLuck().selected;
				obj.option = form.getItemAttr().getOption().selectedItem;
			}
			if(form.getCop().visible)
				obj.cop = form.getCop().selectedLabel;
		}
		private function setWeapon(form:Object,obj:Object):void{
			setEquip();
			if(form.getArrow().visible)
				obj.arrow = form.getArrow().selectedLabel;
		}
		private function setProtect(form:Object,obj:Object):void{
			setEquip();
		}
		private function setNeck(form:Object,obj:Object):void{
			setEquipBase();
			if(form.getOption().visible)
				obj.option = form.getOption().selectedItem;
		}
		private function setRing(form:Object,obj:Object):void{
			setNeck();
		}
		private function setEquip(form:Object,obj:Object):void{
			setEquipBase();
			if(form.visible){
				if(form.getItemAttr().visible){
					obj.plus = form.getItemAttr().getPlus().selectedIndex;
					obj.luck = form.getItemAttr().getLuck().selected;
				}
				if(form.getEnchant().visible){
					if(form.getEnchant().getKind().selectedLabel != "")
						obj.enchant[form.getEnchant().getKind().selectedLabel] =
							parseInt(form.getEnchant().getValue().selectedLabel);
				}
				if(form.getSocket().visible){
					var names:Array = form.getSocket().getNames();
					var values:Array = form.getSocket().getValues();
					for(var i:int=0;i<names.length;i++)
						if(names[i].selectedLabel != "")
							obj.socket[names[i].selectedLabel] = {
								value:parseInt(values[i].selectedLabel),
								attr:names[i].selectedItem[1]
							};
					var bonuses:Array = form.getSocket().getBonuses();
					for(var i:int=0;i<bonuses.length;i++)
						if(bonuses[i].selectedLabel != "")
							obj.socket_bonus[bonuses[i].selectedLabel.split("+")[0]] = 
								parseInt(bonuses[i].selectedLabel.split("+")[1]);
				}
				if(form.getOp380().visible)
					obj.380op = form.getOp380().selected;
			}
		}
		private function setEquipBase(form:Object,obj:Object):void{
			if(obj.visible){
				obj.kind = form.getKind().selectedLabel;
				if(form.getItem().visible){
					obj.item = D.getData(form.getItem().selectedItem.item)[form.getItem().selectedItem.index];
					obj.key = D.getKey(form.getItem().selectedItem.item);
				}
				if(form.getSetop().visible)
					obj.set_status = form.getSetop().selectedItem;
				if(form.getExellent().visible)
					for each(var op in form.getExellent().getOptions())
						if(op.selectedLabel != "")
							obj.exop[op.selectedLabel] = true;
			}
		}
		private function setStatus(form:Object,obj:Object):void{
			obj.lv = parseInt(form.getLevel().text);
			obj.str = parseInt(form.getStr().text);
			obj.agi = parseInt(form.getAgi().text);
			obj.vit = parseInt(form.getVit().text);
			obj.ene = parseInt(form.getEne().text);
			if(form.getRec().visible)
				obj.rec = parseInt(form.getRec().text);
		}
		private function setSupport(form:Object,obj:Object):void{
			obj = form.form_support;
		}
	}
}