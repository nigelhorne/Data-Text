use strict;
use warnings;
use ExtUtils::MakeMaker 6.64;	# 6.64 for TEST_REQUIRES

WriteMakefile(
	NAME		=> 'Data::Sentence',
	AUTHOR		=> q{Nigel Horne <njh@bandsman.co.uk>},
	VERSION_FROM	=> 'lib/Data/Sentence.pm',
	ABSTRACT_FROM	   => 'lib/Data/Sentence.pm',
	((defined($ExtUtils::MakeMaker::VERSION) &&
	 ($ExtUtils::MakeMaker::VERSION >= 6.3002))
	  ? ('LICENSE'=> 'GPL')
	  : ()),
	'LIBS' => [''],   # e.g., '-lm'
	'DEFINE' => '',     # e.g., '-DHAVE_SOMETHING'
	'INC' => '',     # e.g., '-I/usr/include/other'
	PL_FILES	=> {},
	TEST_REQUIRES => {
		'Test::Most' => 0,
		'Test::NoWarnings' => 0,
		'Test::Warn' => 0,
	}, PREREQ_PM => {
		'Carp' => 0,
	},
	dist		=> { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
	clean		=> { FILES => 'Data-Sentence-*' },
	# META_ADD => {
		# provides => {}
	# },
	META_MERGE => {	# https://perldoc.perl.org/CPAN::Meta::Spec
		'meta-spec' => { version => 2 },
		resources => {
			repository => {
				type => 'git',
				url => 'git://github.com/nigelhorne/Data-Sentence.git',
				web => 'https://github.com/nigelhorne/Data-Sentence',
				repository => 'https://github.com/nigelhorne/Data-Sentence',
			}, bugtracker => {
				# web => 'https://rt.cpan.org/Public/Dist/Display.html?Name=Data-Sentence',
				web => 'https://github.com/nigelhorne/Data-Sentence/issues',
				url => 'https://github.com/nigelhorne/Data-Sentence/issues',
				mailto => 'bug-Data-Sentence@rt.cpan.org'
			}
		},
	},
	# MIN_PERL_VERSION	=> '5.008'
);
