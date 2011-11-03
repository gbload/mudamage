#!/usr/bin/perl -w
# 2行のデータを3行にする
$filename = $ARGV[0];

open(FH,$filename);
@dat = <FH>;
close(FH);

my $len = @dat;

# 2行ごとにデータを扱う
for($i=0;$i<$len;$i++){
	print $dat[$i];
	if($i%2==1 && $i!=0){
		print "\n";
	}
}

exit;
