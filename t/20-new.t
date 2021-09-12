#!perl -wT

use strict;

use lib 'lib';
use Test::Most tests => 2;
use Data::Sentence;

isa_ok(Data::Sentence->new(), 'Data::Sentence', 'Creating Data::Sentence object');
ok(!defined(Data::Sentence::new()));
