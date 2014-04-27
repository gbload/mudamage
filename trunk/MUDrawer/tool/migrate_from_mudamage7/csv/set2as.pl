#!/usr/bin/perl -w
#
# セットアイテムデータの作成
require "header.pl";

$filename = $ARGV[0]; # 対応するファイル
$setfile = $ARGV[1]; # setitemファイル
$class = $ARGV[2];

open(FH,$filename);
@dat = <FH>;
close(FH);

open(FH,$setfile);
@set = <FH>;
close(FH);

# Header
&header::header($class);

# Body
my @a=();
foreach $set(@set){
	if(index($set,"label")!=-1){next;}
	$set =~ s/"//g;
	if($set eq ""){next;}
	my @sets = split(",",$set);
	my @name = split("の",$sets[1]);
	shift(@name);
	my $name = join("の",@name);
	my $n=0;
	my $check=0;
	my @b=();
	for($n=1;$n<@dat;$n++){
		my @dats = split(",",$dat[$n]);
		$dats[1] =~ s/"//g;
		if($name eq $dats[1]){
			# データの作成
			push(@b,'"'.$sets[1].'"');
			push(@b,$n-1);
			push(@b,'"'.$sets[15].'"');
			push(@b,'"'.$sets[16].'"');
			
			push(@a,"[".join(",",@b)."]");
			$check=1;
			last;
		}
	}
	if(!$check){
		print STDERR "Error!".$sets[1].":".$name;
	}
}

print "[\n".join(",\n",@a)."\n]";

# Footer
&header::footer();

exit;
