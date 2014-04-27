#!/usr/bin/perl -w
#
# アイテムデータの再構成
sub parse;
sub min;
sub isNotFound;
sub printArray;
sub printArray2;
sub analysisRequire;
sub analysisSpec;
sub output;
sub output2;

$filename = $ARGV[0];

open(FH,$filename);
@dat = <FH>;
close(FH);

# parse
$i = 0;
$start = 0;
@data = ();
$data_index = 0;
for($i=0;$i<@dat;$i++){
	$start = index($dat[$i],'['); 
	if($start != -1){
		$start++;
		$data[$data_index++] = &parse();
	}
}

#&printArray2(@data);


# require analysis
foreach $d1(@data){
	foreach $d2(@$d1){
#		print $$d2[1];
#		my $tmp = $$d2[12];
#		$$d2[14] = &analysisRequire(@$tmp);
#		print " EX:";
#		$tmp = $$d2[13];
#		$$d2[15] = &analysisRequire(@$tmp);
#		print "\n";
	}
}

# spec analysis
foreach $d1(@data){
	foreach $d2(@$d1){
#		print $$d2[1];
		my $tmp = $$d2[12];
		$$d2[12] = &analysisSpec(@$tmp);
#		$$d2[12] = "";
#		print " EX:";
#		$tmp = $$d2[13];
#		$$d2[13] = &analysisSpec(@$tmp);
		$$d2[13] = "";
#		print "\n";
	}
}

foreach(@data){
	output($_);
}

exit;
# 変数解析
# @param start index
# @param 
sub parse{
	my @array = ();
	my $array_index = 0;
	my $flag = 0;
	while(1){
		my $start1 = index($dat[$i],',',$start);
		my $start2 = index($dat[$i],'[',$start);
		my $start3 = index($dat[$i],']',$start);
		# indexを増やす
		if(&isNotFound($start1,$start2,$start3)){
			$i++;
			if($i>@dat){print "Error over!";}
			$start=0;
		}else{
			# 解析
			my $min = &min($start1,$start2,$start3);
			if($min == 0){# ,
				if($flag != -1){
					$array[$array_index++] = substr($dat[$i],$start,$start1-$start);
				}
				$start = $start1;
				$start++;
				$flag = 1;
			}elsif($min == 1){# [
				$start = $start2;
				$start++;
				$array[$array_index++] = &parse();
				$flag = -1;
			}else{# ]
				if($flag==1){
					$array[$array_index++] = substr($dat[$i],$start,$start3-$start);
				}
				$start = $start3;
				$start++;
				return \@array;
			}
		}
	}
}
# 最小の引数インデックスを返す
sub min{
	my $r = 1;
	my $r2 = $_[0];
	my $result = 0;
	for($r=1;$r<@_;$r++){
		if(($_[$r] != -1 && $r2 > $_[$r])
			|| $r2 == -1){
			$r2 = $_[$r];
			$result = $r;
		}
	}
	return $result;
}
# -1ならtrue
sub isNotFound{
	my $r = 0;
	my $result = 1;
	for($r=0;$r<@_;$r++){
		if($_[$r] != -1){
			$result = 0;
			return $result;
		}
	}
	return $result;
}
# 参照型による配列の表示
sub printArray{
	print "\n";
	foreach(@_){
		if (ref($_) eq "ARRAY") {
			&printArray(@$_);
		}else{
			print $_,",";
		}
	}
	print "\n";
}
# 
sub printArray2(){
	foreach $d1(@_){
		foreach $d2(@$d1){
			for($i=0;$i<=13;$i++){
				print $i.$$d2[$i]."\n";
			}
			print "\n";
		}
	}
}
# 要求ステータス解析
sub analysisRequire(){
	my @s = (2,3,-1,4,-1);
	# 微分
	my $n=0; # N,+1,+2....
	my $j=0; # 0.str 1.agi ....
	my @diff = ();
	for($n=1;$n<@_;$n++){
		for($j=0;$j<5;$j++){
			if($s[$j] == -1){next;}
			my $tmp;
			$tmp = $_[$n];
			my $tmp1 = $$tmp[$s[$j]];
			$tmp = $_[$n-1];
			my $tmp0 = $$tmp[$s[$j]];
			$diff[$j][$n-1] = $tmp1 - $tmp0;
		}
	}
	# 増加値を求める
	my @max = ();
	for($j=0;$j<5;$j++){
		if($s[$j] == -1){next;}
		my $tmp = 0;
		for($n=0;$n<15;$n++){
			$_ = $diff[$j][$n];
			if($tmp < 1){
				$tmp = $_;
			}elsif($_ > 0){
				if(abs($tmp - $_) <= 1){
					if($tmp < $_){$tmp=$_;}
				}else{
					print "Miss".$n."!";
				}
			}
		}
		$max[$j] = $tmp;
	}
	# validate
	my @result = ();
	for($j=0;$j<5;$j++){
		$result[$j] = ",";
		if($s[$j] == -1){next;}
		my $flag = 0;
		my $tmp;
		$tmp = $_[0];
		my $init = $$tmp[$s[$j]];
		my $inc = $max[$j] - 1;
		my $x = 0;
		my $y = 0;
		for($x=0;$x<1;$x+=0.01){
		for($y=0;$y<1;$y+=0.01){
		for($n=0;$n<15;$n++){
			$tmp = $_[$n];
			my $tmp1 = $$tmp[$s[$j]];
			if($tmp1 > 0){
				$tmp = int($init+$x+($inc+$y)*$n);
				if($tmp != $tmp1){
					#print $n.":".$tmp." ".$tmp1."\n";
					last;
				}
			}
		}
		if($n==15){#validate 成功
			$result[$j] = ();
			$result[$j][0] = $init+$x;
			$result[$j][1] = $inc+$y;
			$flag = 1;
			last;
		}
		if($flag){last;}
		}
		if($flag){last;}
		}
		if($flag==0){print "Error".$j.":".$n."!";}
	}
#	foreach(@result){
#		foreach $d(@$_){
#			print $d." ";
#		}
#	}
	return \@result;
}
# Spec 解析 +3increase
sub analysisSpec(){
	my @s = (0,1,5,6,7);
	# 微分
	my $n=0; # N,+1,+2....
	my $j=0; # 0.str 1.agi ....
	# validate
	my @result = ();
	for($j=0;$j<@s;$j++){
		$result[$j] = "";
		if($s[$j] == -1){next;}
		my $sum = 0;
		my $tmp;
		$tmp = $_[0];
		my $init = $$tmp[$s[$j]];
		for($n=1;$n<=13;$n++){
			if($init <= 0){next;}
			$tmp = $_[$n];
			my $tmp1 = $$tmp[$s[$j]];
			$tmp = $_[$n-1];
			my $tmp2 = $$tmp[$s[$j]];
			$tmp = $tmp1 - $tmp2;
			# 魔力、呪い
			if($j==2 || $j==4){
				# 初期値計算
				if($n==1){
					if($tmp == 3){$sum=0;}
					else{$init += 0.5;$sum=0.5;}
				}
				# flag
				my $inc = 3.5;
				if($n >= 10){$inc += ($n-9)*0.5;}
				my $inc_tmp = $inc;
				$inc = ($sum + $inc) - int($sum);
				$sum += $inc_tmp;
				$inc = int($inc);
				if($tmp != $inc){
					print $inc."Error".$j.":".$n."! ";
				}
			# ペット
			}elsif($j==3){
				# 初期値計算
				if($n==1){
					if($tmp == 1){$sum=0;}
					else{$init += 0.5;$sum=0.5;}
				}
				# flag
				my $inc = 1.5;
				if($n >= 10){$inc += ($n-9)*0.5;}
				my $inc_tmp = $inc;
				$inc = ($sum + $inc) - int($sum);
				$sum += $inc_tmp;
				$inc = int($inc);
				if($tmp != $inc){
					print $inc."Error".$j.":".$n."! ";
				}
			# +3
			}else{
				if($n >= 10){
					$tmp -= ($n-9);
				}
				if($tmp != 3){
					print "Error".$j.":".$n."!";
				}
			}
		}
		#validate 成功
		$result[$j] = $init;
	}
#	foreach(@result){
#		print $_;
#	}
	return \@result;
}
# CSV出力
sub output(){
	my $tmp = $_[0];
	my @tmp = @$tmp;
	my $n = 0;
	my $n1 = 0;
	for($n=0;$n<@tmp;$n++){
		output2($tmp[$n]);
		print "\n";
	}
}
sub output2(){
	foreach(@_){
		if (ref($_) eq "ARRAY") {
			&output2(@$_);
		}else{
			print $_,",";
		}
	}
}