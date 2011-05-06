#!/usr/bin/perl -w
# 文字列の長い順にソート
$filename = $ARGV[0];

open(FH,$filename);
@dat = <FH>;
close(FH);

foreach(@dat){
	$_ =~ s/\n//g;
}

my $len = @dat;

%dat2 = ();
# 3行ごとにデータを扱う
for($i=0;$i<$len;$i+=3){
	$dat2{$dat[$i]} = $dat[$i+1] . "\n" . $dat[$i+2];
}
@ja = keys(%dat2);

@ja = sort {length $b <=> length $a || $a cmp $b} @ja;

foreach(@ja){
	print $_,"\n",$dat2{$_},"\n";
}

exit;
