# Generated from Makefile.PL using makefilepl2cpanfile

requires 'perl', '5.008';

requires 'Carp';
requires 'Encode';
requires 'IPC::System::Simple';
requires 'Lingua::Conjunction';
requires 'Object::Configure', '0.16';
requires 'Params::Get', '0.13';
requires 'Scalar::Util';
requires 'String::Util';
requires 'overload';

on 'configure' => sub {
	requires 'ExtUtils::MakeMaker', '6.64';
};

on 'test' => sub {
	requires 'Data::Random';
	requires 'FindBin';
	requires 'IPC::Run3';
	requires 'IPC::System::Simple';
	requires 'Test::Carp';
	requires 'Test::Compile';
	requires 'Test::DescribeMe';
	requires 'Test::Most';
	requires 'Test::Needs';
	requires 'Test::NoWarnings';
	requires 'Test::Returns';
	requires 'Test::Which';
};

on 'develop' => sub {
	requires 'Devel::Cover';
	requires 'Perl::Critic';
	requires 'Test::Pod';
	requires 'Test::Pod::Coverage';
};
