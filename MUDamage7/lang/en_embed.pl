#!/usr/bin/perl -w
$filename = $ARGV[0];
open(FH,$filename);
@dat = <FH>;
close(FH);

open(FH,"result.txt");
@dat2 = <FH>;
close(FH);

foreach(@dat2){
	$_ =~ s/\n//g;
}

my $len2 = @dat2;

for($i=0;$i<$len2;$i+=2){
	if($i+1 < $len2 && $dat2[$i+1] ne ""){
		foreach(@dat){
			$tmp1 = "\"$dat2[$i]\"";
			$tmp1 =~ s/\(/\\\(/g;
			$tmp1 =~ s/\)/\\\)/g;
			$tmp1 =~ s/\[/\\\[/g;
			$tmp1 =~ s/\]/\\\]/g;
			$tmp2 = "\"$dat2[$i+1]\"";
			# if($_ =~ /$tmp1/){print $_;}
			$_ =~ s/$tmp1/$tmp2/g;
		}
	}
}
foreach(@dat){
	print $_;
}
exit;

open(FH,">$filename");
foreach(@dat){
	print FH $_,"\n";
}
close(FH);

exit;
