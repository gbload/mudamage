#!/usr/bin/perl -w
$filename = $ARGV[0];

open(FH,$filename);
@dat = <FH>;
close(FH);

foreach(@dat){
	$_ =~ s/\n//g;
}

my $len = @dat;

%dat2 = ();
# 2行ごとにデータを扱う
for($i=0;$i<$len;$i+=2){
	$dat2{$dat[$i]} = $dat[$i+1];
}
@ja = keys(%dat2);

@ja = sort {length $b <=> length $a || $a cmp $b} @ja;

foreach(@ja){
	print $_,"\n",$dat2{$_},"\n";
}

exit;
