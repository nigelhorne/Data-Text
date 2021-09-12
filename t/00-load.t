#!perl -T

use strict;

use Test::Most tests => 2;

BEGIN {
    use_ok('Data::Sentence') || print 'Bail out!';
}

require_ok('Data::Sentence') || print 'Bail out!';

diag("Testing Data::Sentence $Data::Sentence::VERSION, Perl $], $^X");
