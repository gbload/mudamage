#!/usr/bin/perl -w
$filelist = "filelist.txt";
$datafile = "ja2etc.txt";

open(FH,$filelist);
@files = <FH>;
close(FH);

open(FH,$datafile);
@dat2 = <FH>;
close(FH);

# remove \n
foreach(@files){
	$_ =~ s/\n//g;
}
foreach(@dat2){
	$_ =~ s/\n//g;
}

my $len2 = @dat2;

# read source files.
foreach $filename(@files){
	# read
	my $readfile = "../../src/" . $filename;
	open(FH,$readfile);
	@dat = <FH>;
	close(FH);
	# translation source code.
	foreach(@dat){
		if(index($_,"\"") != -1){
			for($i=0;$i<$len2;$i+=3){
				if($i+2 < $len2 && $dat2[$i+1] ne ""){
					$tmp1 = "\"$dat2[$i]\"";
					$tmp1 =~ s/\(/\\\(/g;
					$tmp1 =~ s/\)/\\\)/g;
					$tmp1 =~ s/\[/\\\[/g;
					$tmp1 =~ s/\]/\\\]/g;
					$tmp1 =~ s/\+/\\\+/g;
					$tmp1 =~ s/\_/\\\_/g;
					$tmp1 =~ s/\-/\\\-/g;
					$tmp1 =~ s/\|/\\\|/g;
					$tmp2 = "\"$dat2[$i+2]\"";
					if($dat2[$i+2] eq ""){
						$tmp2 = "\"$dat2[$i+1]\"";
					}
					$_ =~ s/$tmp1/$tmp2/g;
				}
			}
		}
	}
	# write
	my $writefile = "src_etc/" . $filename;
	open(FH,">$writefile");
	foreach(@dat){
		print FH $_;
	}
}


close(FH);

exit;
