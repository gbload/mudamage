#!/usr/bin/perl -w
#
# アイテムデータの再構成

$filename = $ARGV[0]; # 追加先ファイル
$setfile = $ARGV[1]; # setitemファイル

open(FH,$filename);
@dat = <FH>;
close(FH);

open(FH,$setfile);
@set = <FH>;
close(FH);

foreach $set(@set){
	if(index($set,"label")!=-1){next;}
	my @sets = split(",",$set);
	my @name = split("の",$sets[1]);
	shift(@name);
	my $name = '"'.join("の",@name);
	my $n=0;
	my $check=0;
	for($n=0;$n<@dat;$n++){
		my @dats = split(",",$dat[$n]);
		if($name eq $dats[1]){
			#Equip
#			$dats[20] = $sets[18];
			#Shield
#			$dats[20] =~ s/"//g;
#			my $tmp = $dats[20]*1.5;
#			if(($tmp*10)%10){$tmp++;}
#			$dats[22] = $tmp;
#			$dats[23] = $dats[21];
			#Weapon
			$dats[28]=$sets[18];
			$dats[29]=$sets[19];
			$dats[30]=$sets[20];
			$dats[31]=$sets[21];
			$dats[32]=$sets[22];
			$dat[$n] = join(",",@dats);
			$check=1;
			last;
		}
	}
	if(!$check){
		print "Error!".$sets[1].":".$name;
	}
}

print @dat;

exit;
