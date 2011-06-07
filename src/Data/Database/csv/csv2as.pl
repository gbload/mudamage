#!/usr/bin/perl -w
#
# アイテムデータの再構成
require "header.pl";

sub L;
sub printArray;
sub inc3;
sub inc3_5;
sub inc1_5;
sub inc_arg;
sub inc;
sub inc_sub;
sub mul_shield;
sub merge;

$filename = $ARGV[0];
$class = $ARGV[1];

open(FH,$filename);
@dat = <FH>;
close(FH);

# Header
&header::header($class);

# Body
my $i=0;
my @array=();
for($i=1;$i<@dat;$i++){
	my @dats = split(",",$dat[$i]);
	foreach(@dats){
		$_ =~ s/"//g;
	}
	my $j=0;
	my @a=();
	# 武器、防具、盾で構成を変える。
	if($dats[0] eq "武器"){
		# item,label,kind,type,hand,job,lv,speed,skill,spec,exspec,setspec,require,exrequire
		for($j=0;$j<@dats;$j++){
			if($j==5){ #job
				push(@a,&printArray(5,11,\@dats));
				$j=11;
			}elsif($j==15 || $j==20 || $j==25){ # spec:normal ex set
				push(@a,&merge(
					&inc3($dats[$j]),
					&inc3($dats[$j+1]),
					&inc3_5($dats[$j+2]),
					&inc1_5($dats[$j+3]),
					&inc3_5($dats[$j+4])
				));
				$j+=4;
			}elsif($j==30 || $j==40){ # require:normal ex
				my @b=();
				my $n=0;
				for($n=0;$n<10;$n+=2){
					push(@b,&inc_arg($dats[$j+$n],$dats[$j+$n+1]))
				}
				push(@a,&merge(@b));
				$j+=9;
			}else{
				push(@a,&L($dats[$j]));
			}
		}
	}elsif($dats[3] eq "盾"){
		# item,label,kind,type,hand,job,lv,speed,skill,series,spec,exspec,setspec,require,exrequire
		for($j=0;$j<@dats;$j++){
			if($j==5){ #job
				push(@a,&printArray(5,11,\@dats));
				$j=11;
			}elsif($j==15 || $j==17 || $j==19){ # spec:normal ex
				push(@a,&merge(
					&inc_arg($dats[$j],1,0),
					&inc3($dats[$j+1])
				));
				$j++;
			}elsif($j==19){ # spec:set
				push(@a,&merge(
					&mul_shield(&inc_arg($dats[17],1,0)),
					&inc3($dats[18])
				));
				$j++;
			}elsif($j==21 || $j==31){ # require:normal ex
				my @b=();
				my $n=0;
				for($n=0;$n<10;$n+=2){
					push(@b,&inc_arg($dats[$j+$n],$dats[$j+$n+1]))
				}
				push(@a,&merge(@b));
				$j+=9;
			}else{
				push(@a,&L($dats[$j]));
			}
		}
	}elsif($dats[0] eq "防具"){
		# item,label,kind,type,job,lv,speed,series,spec,exspec,setspec,require,exrequire
		for($j=0;$j<@dats;$j++){
			if($j==4){ #job
				push(@a,&printArray(4,10,\@dats));
				$j=10;
			}elsif($j==14 || $j==15 || $j==16){ # spec:normal ex set
				push(@a,&merge(
					&inc3($dats[$j])
				));
			}elsif($j==17 || $j==27){ # require:normal ex
				my @b=();
				my $n=0;
				for($n=0;$n<10;$n+=2){
					push(@b,&inc_arg($dats[$j+$n],$dats[$j+$n+1]))
				}
				push(@a,&merge(@b));
				$j+=9;
			}else{
				push(@a,&L($dats[$j]));
			}
		}
	}else{
		print STDERR "Error!";
	}
	push(@array,"[".join(",",@a)."]");
}

print "[\n".join(",\n",@array)."\n]";

# Footer
&header::footer();

exit;

# 数字と文字列の判別して、文字列なら""で囲む
sub L(){
	my $text = $_[0];
	if($text !~ /\d/){$text = '"'.$text.'"';}
	return $text;
}

# 配列作成
sub printArray(){
	my $start = $_[0];
	my $end = $_[1];
	my $tmp = $_[2];
	my @dats = @$tmp;
	my $n=0;
	my @a=();
	for($n=$start;$n<=$end;$n++){
		push(@a,&L($dats[$n]));
	}

	return "[".join(",",@a)."]";
}
# +3
sub inc3(){
	return &inc($_[0],3,1);
}
# +3.5
sub inc3_5(){
	return &inc($_[0],3.5,0.5);
}
# +1.5
sub inc1_5(){
	return &inc($_[0],1.5,0.5);
}
# arg
sub inc_arg(){
	return &inc($_[0],$_[1],0);
}
# inc
sub inc(){
	if($_[0] !~ /\d/){return &inc_sub(-1,0,0);}
	elsif($_[0]>0){return &inc_sub($_[0],$_[1],$_[2]);}
	else{return &inc_sub($_[0],0,0);}
}
# inc_sub
sub inc_sub(){
	my $init=$_[0];
	my $inc1=$_[1];
	my $inc2=$_[2];
	my @a=();
	my $tmp=$init;
	push(@a,int($tmp));
	for($n=0;$n<=15;$n++){
		$tmp+=$inc1;
		if($n>=10){$tmp+=($n-9)*$inc2;}
		push(@a,int($tmp));
	}
	return \@a;
}
# *1.5 for set shield
sub mul_shield(){
	my $tmp = $_[0];
	my @a = @$tmp;
	foreach(@a){
		$tmp = $_ * 1.5;
		if(($tmp*10)%10){$tmp++;}
		$_ = $tmp;
	}
	return \@a;
}
# spec array merge
sub merge(){
	my @a=();
	my $n=0;
	my $m=0;
	for($m=0;$m<=15;$m++){
		my @d=();
		for($n=0;$n<@_;$n++){
			my $b = $_[$n];
			my @c = @$b;
			push(@d,$c[$m]);
		}
		push(@a,"	[".join(",",@d)."]");
	}
	return "[\n".join(",\n",@a)."\n]";
}