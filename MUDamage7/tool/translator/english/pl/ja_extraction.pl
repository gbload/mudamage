#!/usr/bin/perl -w
$filename = $ARGV[0];

open(FH,$filename);
@dat = <FH>;
close(FH);

open(FH,"result3.txt");
@dat2 = <FH>;
close(FH);

foreach(@dat2){
	$_ =~ s/\n//g;
}

my @ja;
my @ja2;

foreach(@dat){
	my @tmp = ($_=~/\"([^"]+)\"/g);
	foreach $tmp2 (@tmp){
		if($tmp2 =~ /[^\w\=\!\#\$\%\&\'\(\)\-\s\.\,\/\?\_\*\+\;\:\]\[\\\<\>\@]/){
			push(@ja,$tmp2);
		}
	}
}

push(@ja,@dat2);

@ja = sort {length $b <=> length $a || $a cmp $b} @ja;

my $t="";
foreach(@ja){
	if($t eq $_){next;}
	else{$t = $_;}
	push(@ja2,$_);
}

open(FH,">result3.txt");
foreach(@ja2){
	print FH $_,"\n\n";
}
close(FH);

exit;
