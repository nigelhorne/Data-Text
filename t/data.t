#!perl -wT

use strict;
use warnings;
use Test::Most tests => 5;
use Test::Carp;

BEGIN {
	use_ok('Data::Text');
}

DATA: {
	my $d = new_ok('Data::Text');

	$d->append('Hello, world.');

	is($d->as_string(), 'Hello, world.', 'Basic test');

	does_carp_that_matches(
		sub {
			$d->append("\n\t. A new paragraph.\n");
		},
		qr/attempt to add/
	);

	is($d->as_string(), 'Hello, world.', "Didn't add");
}
