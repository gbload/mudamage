#!/usr/bin/perl -w
# あいうえお順でソート
$filename = $ARGV[0];

open(FH,$filename);
@dat = <FH>;
close(FH);

foreach(@dat){
	$_ =~ s/\n//g;
}

my $len = @dat;

@dat2 = ();

# 3行ごとにデータを扱う
for($i=0;$i<$len;$i+=3){
	$dat2[$i/3] = $dat[$i] . "\n" . $dat[$i+1] . "\n" . $dat[$i+2];
}
@dat2 = sort(@dat2);

foreach(@dat2){
	print $_,"\n";
}

exit;
