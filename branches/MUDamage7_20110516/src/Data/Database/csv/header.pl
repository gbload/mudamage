package header;

sub header(){
	my $class = $_[0];
	my $package = "Data.Database";
	print "package ".$package."{\n";
	print "	internal class ".$class."{\n";
	print "		public static final var data:Array = ";
}

sub footer(){
	print ";\n";
	print "	}\n";
	print "}";
}

1;