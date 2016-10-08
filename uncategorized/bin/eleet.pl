#!/usr/bin/perl 

while(<>) {
	@words = split /\s/;
	foreach (@words) {
		s/^cool$/krad eleet/;
		s/([aeiou])ck/\1x0r/;
		s/s$/z/;
		s/ou/00/;
		s/^y/j/;
		tr/oleaSt/013457/;
	}
	$a = join ' ', @words;
	print $a."\n";
}
