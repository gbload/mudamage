package Data.Database
{
	internal class Key
	{
		public static var key:Array = [
			//0 weapon
			{item:0,name:1,kind:2,type:3,hand:4,job:5,lv:6,speed:7,skill:8,spec:9,
					exspec:10,setspec:11,require:12,exrequire:13,ex_en_type:14,op:15,
				min:0,max:1,magic:2,pet:3,curse:4,
				str:0,agi:1,vit:2,ene:3,rec:4},
			//1 shield
			{item:0,name:1,kind:2,type:3,hand:4,job:5,lv:6,speed:7,skill:8,spec:9,
					exspec:10,setspec:11,require:12,exrequire:13,ex_en_type:14,op:15,
				def:0,avoid:1,
				str:0,agi:1,vit:2,ene:3,rec:4},
			//2 protect
			{item:0,name:1,kind:2,type:3,job:4,lv:5,speed:6,series:7,spec:8,exspec:9,
					setspec:10,require:11,exrequire:12,ex_en_type:13,op:14,
				def:0,
				str:0,agi:1,vit:2,ene:3,rec:4},
			//3 status
			{str:0,agi:1,vit:2,ene:3,rec:4},
			//4 wing
			{item:0,name:1,job:2,op:3,type:4,spec:5,cop:6,
				lv:0,def:1,inc:2,dec:3},
			//5 accessory
			{item:0,name:1,kind:2,type:3,op:4,job:5,lv:6,attr:7,ex_en_type:8},
			//6 skill
			{name:0,power:1,speed:2,type:3,require:4,job:5,pet:6,weapon:7,attr:8,special:9,master:10,hit:11,
				normal:0,uni:1,fenrir:2,darkhorse:3,
				lv:0,str:1,agi:2,vit:3,ene:4,rec:5},
			//7 set
			{name:0,index:1,status:2,series:3},
			//8 monster
			{map:0,name:1,lv:2,hp:3,min:4,max:5,def:6,avoid:7,hit:8,attribute_min:9,attribute_max:10,attribute_def:11,attribute:12},
			//9 lucky
			{item:0,name:1,kind:2,type:3,job:4,lv:5,speed:6,status:7,setname:8,series:9,spec:10,ex_en_type:11,
				def:0},
			//10 speed
			{type:0,a:1,b:2,checks:3,lower:0,upper:1,speed:1,check_flags:2},
			//11 ereutel
			{ereutel:0,rank:1,option:2,name:3,value:4}
		];
	}
}