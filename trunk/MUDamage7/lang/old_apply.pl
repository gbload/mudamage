#!/usr/bin/perl -w
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

foreach $k2(@key2){
	foreach $k1(@key1){
		if($k2 eq $k1){
			$datH2{$k2} = $datH1{$k1};
		}
	}
}

foreach(@key2){
	print $_,"\n",$datH2{$_},"\n";
}

exit;
