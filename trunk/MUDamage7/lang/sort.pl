#!/usr/bin/perl -w
open(FH,"result.txt");
@dat = <FH>;
close(FH);

foreach(@dat){
	$_ =~ s/\n//g;
}

my $len = @dat;

@dat2 = ();

# 2行ごとにデータを扱う
for($i=0;$i<$len;$i+=2){
	$dat2[$i/2] = $dat[$i] . "\n" . $dat[$i+1];
}
@dat2 = sort(@dat2);

foreach(@dat2){
	print $_,"\n";
}

exit;
