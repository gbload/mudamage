package org.mudamage.mud8.client.mud.io;

public class InputData {
	// 経験値増加
	public int exp;
	// キャラクター職
	public int job;
	//ステータス
	public int lv;
	public int str;
	public int agi;
	public int vit;
	public int ene;
	public int rec;
	// ペット
	public String pet;
	public String pet_sub1;
	public String pet_sub2;
	// 羽
	public int wing_op;
	public int wing_cop;
	public int wing_def;
	public int wing_inc;
	public int wing_dec;
	// ネック
	public int neck_exop1;
	
	class InputAccData{
		
	}
	class InputEquipData{
		public int def;
		public int plus;
		public int op;
		public int en;
		public int enop;
		public int set;
		public int set_status;
		public int socket;
		public int socket_option;
		public int socket_bonus;
	}
	
}
