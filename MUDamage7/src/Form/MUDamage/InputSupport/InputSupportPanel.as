package Form.MUDamage.InputSupport {
	public class InputSupportPanel {
		private var knight_vit:TextInput;
		private var knight_ene:TextInput;
		private var wizard_agi:TextInput;
		private var wizard_ene:TextInput;
		private var elf_ene:TextInput;
		private var drakload_ene:TextInput;
		private var darkload_rec:TextInput;
		private var summoner_ene:TextInput;
	
		private var master_aplus1:TextInput; // attack plus
		private var master_aplus2:TextInput;
		private var master_gplus1:TextInput; // guard plus
		private var master_gplus2:TextInput;
		private var master_cplus1:TextInput; // critical plus
		private var master_cplus2:TextInput;
		private var master_cplus3:TextInput;
		private var master_sl1:TextInput; // swell life
		private var master_sl2:TextInput;
		private var master_sb1:TextInput; // soul barrier
		private var master_sb2:TextInput;
		private var master_iv1:TextInput; // inner vation
		private var master_iv2:TextInput;
		private var master_wn1:TextInput; // weakness
		private var master_wn2:TextInput;
		private var master_con1:TextInput; // concentration
		private var master_con2:TextInput;
		private var master_ht1:TextInput; // high tension
		private var master_ht2:TextInput;
	
		private var ptm:TextInput; // party member number

		private var aplus_label:Label;
		private var aplus:HBox;
		private var gplus:HBox;
		private var cplus:HBox;
		private var sl:HBox;
		private var sb:HBox;
		private var iv:HBox;
		private var wn:HBox;
		private var con:HBox;
		private var ht:HBox;
		/**
		 * 
		 */
		public function InputSupportPanel() {
			initCommonTextInput();
			initBox();
		}
		/**
		 * 
		 */
		private function initCommonTextInput():void{
			knight_vit = createStatus();
			knight_ene = createStatus();
			wizard_agi = createStatus();
			wizard_ene = createStatus();
			elf_ene = createStatus();
			drakload_ene = createStatus();
			darkload_rec = createStatus();
			summoner_ene = createStatus();
		}
		/**
		 * 
		 */
		private function createStatus(min:int=0,max:int=-1):TextInput{
			var ti:TextInput = new TextInput();
			createStatusEventListener(ti,min,max);
		}
		/**
		 * 
		 */
		private function createStatusEventListener(ti:TextInput,min:int=0,max:int=-1):void{
			ti.addEventListener(FocusEvent.FOCUS_OUT,function(){
				var num:int = parseInt(ti.text);
				if(num < min)num = min;
				if(max != -1 && num > max)num = max;
			};)
		}
		/**
		 * 
		 */
		private function initBox():void{
			
		}
	}
}