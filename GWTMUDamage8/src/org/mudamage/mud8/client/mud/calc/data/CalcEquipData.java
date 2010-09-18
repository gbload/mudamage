package org.mudamage.mud8.client.mud.calc.data;

import org.mudamage.mud8.client.mud.static_data.EnchantOptionStaticData;
import org.mudamage.mud8.client.mud.static_data.ExOptionStaticData;
import org.mudamage.mud8.client.mud.static_data.SocketOptionStaticData;

public class CalcEquipData {
	public Integer item=0;
	public Integer def=0;
	public Integer avoid=0;
	public Integer plus=0;
	public Integer op=0;
	public Integer speed=0;
	// セットアイテム
	public Integer str=0;
	public Integer agi=0;
	public Integer vit=0;
	public Integer ene=0;
	// オプション類
	public Integer[] enop=new Integer[EnchantOptionStaticData.LAST];
	public Boolean[] exop=new Boolean[ExOptionStaticData.LAST];
	public Integer[] soop=new Integer[SocketOptionStaticData.LAST];
	public Integer[] sobonus;
}
