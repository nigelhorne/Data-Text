#!perl -wT

use strict;
use warnings;
use Test::Most tests => 7;
use Test::Carp;

BEGIN {
	use_ok('Data::Text');
}

CONJUNCTION: {
	my $d = new_ok('Data::Text');

	cmp_ok($d->appendconjunction('1', '2', '3')->as_string(), 'eq', '1, 2, and 3', 'conjunction works');

	$d = new_ok('Data::Text');
	my $d1 = new_ok('Data::Text' => ['a']);
	my $d2 = new_ok('Data::Text' => ['b']);

	cmp_ok($d->appendconjunction($d1, $d2), 'eq', 'a and b', 'conjunction works on objects');
}
