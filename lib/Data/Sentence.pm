package Data::Sentence;

use warnings;
use strict;
use Carp;

=head1 NAME

Data::Sentence - Class defining a sentence

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

Handle a sentence in an OO way.

=head1 SUBROUTINES/METHODS

=head2 new

Creates a Data::Sentence object.

=cut

sub new {
	my $proto = shift;
	my $class = ref($proto) || $proto;

	# Use Data::Sentence->new(), not Data::Sentence::new()
	if(!defined($class)) {
		carp(__PACKAGE__, ' use ->new() not ::new() to instantiate');
		return;
	}

	return bless { }, $class;
}

=head2 as_string

Returns the sentence as a string.

=cut

sub as_string {
	my $self = shift;

	return $self->{'data'};
}

=head1 AUTHOR

Nigel Horne, C<< <njh at bandsman.co.uk> >>

=head1 BUGS

=head1 SEE ALSO

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Data::Sentence

You can also look for information at:

=over 4

=item * MetaCPAN

L<https://metacpan.org/release/Data-Sentence>

=item * RT: CPAN's request tracker

L<https://rt.cpan.org/NoAuth/Bugs.html?Dist=Data-Sentence>

=item * CPANTS

L<http://cpants.cpanauthors.org/dist/Data-Sentence>

=item * CPAN Testers' Matrix

L<http://matrix.cpantesters.org/?dist=Data-Sentence>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Data-Sentence>

=item * CPAN Testers Dependencies

L<http://deps.cpantesters.org/?module=Data::Sentence>

=back

=head1 LICENSE AND COPYRIGHT

Copyright 2010-2021 Nigel Horne.

This program is released under the following licence: GPL2

=cut

1;
