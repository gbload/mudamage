#!/usr/bin/perl -w
# sourceのデータの内、destinationにないものだけdestinationに追加する
$filename1 = $ARGV[0]; # source
$filename2 = $ARGV[1]; # destination

open(FH,$filename1);
@dat1 = <FH>;
close(FH);

open(FH,$filename2);
@dat2 = <FH>;
close(FH);

foreach(@dat1){
	$_ =~ s/\n//g;
}
foreach(@dat2){
	$_ =~ s/\n//g;
}


my $len1 = @dat1;
my $len2 = @dat2;
%datH1 = ();
%datH2 = ();

# 2行ごとにデータを扱う
for($i=0;$i<$len1;$i+=2){
	$datH1{$dat1[$i]} = $dat1[$i+1];
}
for($i=0;$i<$len2;$i+=2){
	$datH2{$dat2[$i]} = $dat2[$i+1];
}

my @key1 = keys(%datH1);
my @key2 = keys(%datH2);

my %add = ();
my %add2 = ();
foreach $k1(@key1){
	my $check = 0;
	foreach $k2(@key2){
		if($k2 eq $k1){
			$check = 1;
			$add2{$k2} = $datH2{$k2};
		}
	}
	if($check == 0){
		$add{$k1} = $datH1{$k1};
	}
}

my @addkey = keys(%add);
foreach(@addkey){
	print $_,"\n",$add{$_},"\n";
}
my @addkey2 = keys(%add2);
foreach(@addkey2){
	print $_,"\n",$add2{$_},"\n";
}

exit;