package Calc {
	import mx.controls.*;
	import mx.containers.*;
	import mx.core.*;
	import mx.collections.*;
	import mx.events.*;
	import flash.events.*;

	import Form.MUDamage.SubForm.*;
	import Form.MUDamage.*;
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
			master_skill:initMasterSkill(),
			calc:initCalc()
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
			obj.option = {};
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
			obj.option = {},
			obj.enchant = {};
			obj.socket = {};
			obj.socket_bonus = {};
			obj.socket_attr = "none";
			obj.op380 = false;
			return obj;
		}
		private function initEquipBase():Object{
			return {
				kind:"なし",
				item:null,
				key:null,
				set_item:null,
				set_key:null,
				set_status:{},
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
			}
		}
		private function initSupport():Object{
			return {};
		}
		private function initMasterSkill():Object{
			return {};
		}
		private function initCalc():Object{
			return {
				map:""
			};
		}
		/**
		 * コンストラクタ
		 */
		public function FormData(d:FormMUDamage){
			setJob(d.form_job,data);
			setPet(d.form_pet,data.pet);
			setWing(d.form_wing,data.wing);
			setRight(d.form_right,data.right);
			setLeft(d.form_left,data.left);
			setProtect(d.form_helm,data.helm);
			setProtect(d.form_armor,data.armor);
			setProtect(d.form_garter,data.garter);
			setProtect(d.form_glove,data.glove);
			setProtect(d.form_boots,data.boots);
			setNeck(d.form_neck,data.neck);
			setRing(d.form_ring1,data.ring1);
			setRing(d.form_ring2,data.ring2);
			setStatus(d.form_status);
			setSupport(d.form_support);
			setMasterSkill(d.form_status.getMasterSkillTree());
			setCalc(d.form_calc);
		}
		public function getData():Object{
			return data;
		}
		/**
		 * 値のセット
		 */
		private function setJob(form:Object,obj:Object):void{
			obj.job = form.selectedLabel;
			obj.job_index = form.selectedIndex;
		}
		private function setPet(form:Object,obj:Object):void{
			obj.item = form.getItem().selectedLabel;
			obj.sub1 = form.getSub1().selectedLabel;
			obj.sub1_index = form.getSub1().selectedIndex;
			obj.sub2 = form.getSub2().selectedLabel;
		}
		private function setWing(form:Object,obj:Object):void{
			obj.item = D.getData(form.getItem().selectedItem.item)[form.getItem().selectedItem.index];
			obj.key = D.getKey(form.getItem().selectedItem.item);
			if(form.getItemAttr().visible){
				obj.plus = form.getItemAttr().getPlus().selectedIndex;
				obj.luck = form.getItemAttr().getLuck().selected;
				obj.option[form.getItemAttr().getOption().selectedItem.type] = 
					form.getItemAttr().getOption().selectedItem.value;
			}
			if(form.getCop().visible)
				obj.cop = form.getCop().selectedLabel;
		}
		private function setRight(form:Object,obj:Object):void{
			setEquip(form,obj);
			if(form.getArrow().visible)
				obj.arrow = form.getArrow().selectedLabel;
		}
		private function setLeft(form:Object,obj:Object):void{
			setEquip(form,obj);
			if(form.getArrow().visible)
				obj.arrow = form.getArrow().selectedLabel;
			if(form.getDarkspiritLevel().visible)
				obj.darkspirit = form.getDarkspiritLevel().selectedIndex + 1;
		}
		private function setProtect(form:Object,obj:Object):void{
			setEquip(form,obj);
		}
		private function setNeck(form:Object,obj:Object):void{
			setEquipBase(form,obj);
			if(form.getOption().visible)
				obj.option[form.getOption().selectedItem.type] = 
					form.getOption().selectedItem.value;
		}
		private function setRing(form:Object,obj:Object):void{
			setNeck(form,obj);
		}
		private function setEquip(form:Object,obj:Object):void{
			setEquipBase(form,obj);
			if(form.visible){
				if(form.getItemAttr().visible){
					obj.plus = form.getItemAttr().getPlus().selectedIndex;
					obj.luck = form.getItemAttr().getLuck().selected;
					obj.option[form.getItemAttr().getOption().selectedItem.type] = 
						form.getItemAttr().getOption().selectedItem.value;
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
						if(names[i].selectedLabel != ""){
							obj.socket[names[i].selectedLabel] = 
								parseInt(values[i].selectedLabel.split("分の1")[0].split("%")[0]);
							obj.socket_attr = names[i].selectedItem[1]; 
						}
					var bonuses:Array = form.getSocket().getBonuses();
					for(i=0;i<bonuses.length;i++)
						if(bonuses[i].selectedLabel != "")
							obj.socket_bonus[bonuses[i].selectedLabel.split("+")[0]] = 
								parseInt(bonuses[i].selectedLabel.split("+")[1]);
				}
				if(form.getOp380().visible)
					obj.op380 = form.getOp380().selected;
			}
		}
		private function setEquipBase(form:Object,obj:Object):void{
			if(form.visible){
				obj.kind = form.getKind().selectedLabel;
				if(form.getItem().visible){
					obj.item = D.getData(form.getItem().selectedItem.item)[form.getItem().selectedItem.index];
					obj.key = D.getKey(form.getItem().selectedItem.item);
					if(form.getItem().selectedItem.set_item!=null){
						obj.set_item = D.getData(form.getItem().selectedItem.set_item)[form.getItem().selectedItem.set_index];
						obj.set_key = D.getKey(form.getItem().selectedItem.set_item);
					}
				}
				if(form.getSetop().visible)
					obj.set_status[form.getSetop().selectedItem.type] = form.getSetop().selectedItem.value;
				if(form.getExellent().visible)
					for each(var op:ComboBox in form.getExellent().getOptions())
						if(op.selectedLabel != "")
							obj.exop[op.selectedLabel] = true;

			}
		}
		private function setStatus(form:Object):void{
			data.status.lv = parseInt(form.getLevel().text);
			data.status.str = parseInt(form.getStr().text);
			data.status.agi = parseInt(form.getAgi().text);
			data.status.vit = parseInt(form.getVit().text);
			data.status.ene = parseInt(form.getEne().text);
			if(form.getRec().visible)
				data.status.rec = parseInt(form.getRec().text);
		}
		private function setSupport(form:Object):void{
			data.support = form;
		}
		private function setMasterSkill(form:Object):void{
			data.status.mlv = parseInt(form.getLevel().text);
			data.master_skill = form;
		}
		private function setCalc(form:Object):void{
			data.calc.map = form.getMap().selectedLabel;
			if(form.getSub1().visible)
				data.calc.sub1 = {index: form.getSub1().selectedIndex,
					label:form.getSub1().selectedLabel};
			if(form.getSub2().visible)
				data.calc.sub2 = {index: form.getSub2().selectedIndex,
					label:form.getSub2().selectedLabel};
		}
	}
}