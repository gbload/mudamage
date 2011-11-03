#!/usr/bin/perl -w
$filename = $ARGV[0];
$datafile = "ja2en.txt";

open(FH,$filename);
@dat = <FH>;
close(FH);

open(FH,$datafile);
@dat2 = <FH>;
close(FH);

foreach(@dat2){
	$_ =~ s/\n//g;
}

my $len2 = @dat2;

#for($i=0;$i<$len2;$i+=2){
#	if($i+1 < $len2 && $dat2[$i+1] ne ""){
#		foreach(@dat){
#			$tmp1 = "\"$dat2[$i]\"";
#			$tmp1 =~ s/\(/\\\(/g;
#			$tmp1 =~ s/\)/\\\)/g;
#			$tmp1 =~ s/\[/\\\[/g;
#			$tmp1 =~ s/\]/\\\]/g;
#			$tmp2 = "\"$dat2[$i+1]\"";
#			# if($_ =~ /$tmp1/){print $_;}
#			$_ =~ s/$tmp1/$tmp2/g;
#		}
#	}
#}

foreach(@dat){
	if(index($_,"\"") != -1){
		for($i=0;$i<$len2;$i+=2){
			if($i+1 < $len2 && $dat2[$i+1] ne ""){
				$tmp1 = "\"$dat2[$i]\"";
				$tmp1 =~ s/\(/\\\(/g;
				$tmp1 =~ s/\)/\\\)/g;
				$tmp1 =~ s/\[/\\\[/g;
				$tmp1 =~ s/\]/\\\]/g;
				$tmp1 =~ s/\+/\\\+/g;
				$tmp1 =~ s/\_/\\\_/g;
				$tmp1 =~ s/\-/\\\-/g;
				$tmp1 =~ s/\|/\\\|/g;
				$tmp2 = "\"$dat2[$i+1]\"";
				$_ =~ s/$tmp1/$tmp2/g;
			}
		}
	}
}

#foreach(@dat){
#	print $_;
#}
#exit;

open(FH,">$filename");
foreach(@dat){
	print FH $_;
}
close(FH);

exit;
