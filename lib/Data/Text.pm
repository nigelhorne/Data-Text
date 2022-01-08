package Data::Text;

use warnings;
use strict;
use Carp;
use String::Clean;
use String::Util;

=head1 NAME

Data::Text - Class to handle text in an OO way

=head1 VERSION

Version 0.09

=cut

our $VERSION = '0.09';

=head1 SYNOPSIS

Handle text in an OO way.

    use Data::Text;

    my $d = Data::Text->new("Hello, World!\n");

    print $d->as_string();

=head1 SUBROUTINES/METHODS

=head2 new

Creates a Data::Text object.

The optional parameter 'text' contains a string, or object, to initialise the object with.

=cut

sub new {
	my $proto = shift;
	my $class = ref($proto) || $proto;

	# Use Data::Text->new(), not Data::Text::new()
	if(!defined($class)) {
		Carp::carp(__PACKAGE__, ': use ->new() not ::new() to instantiate');
		return;
	}

	if(scalar(@_)) {
		my $self = bless { }, $class;

		return $self->set(@_);
	}

	return bless { }, $class;
}

=head2 set

Sets the object to contain the given text.

The argument can be a reference to an array of strings, or an object.
If called with an object, the message as_string() is sent to it for its contents.

    $d->set({ text => "Hello, World\!" });

=cut

sub set {
	my $self = shift;

	my %params;
	if(ref($_[0]) eq 'HASH') {
		%params = %{$_[0]};
	} elsif(scalar(@_) % 2 == 0) {
		%params = @_;
	} else {
		$params{'text'} = shift;
	}

	if(!defined($params{'text'})) {
		Carp::carp(__PACKAGE__, ': no text given');
		return;
	}

	if(ref($params{'text'})) {
		# Allow the text to be a reference to a list of strings
		if(ref($params{'text'}) eq 'ARRAY') {
			if(scalar(@{$params{'text'}}) == 0) {
				Carp::carp(__PACKAGE__, ': no text given');
				return;
			}
			delete $self->{'text'};
			foreach my $text(@{$params{'text'}}) {
				if(ref($text)) {
					$self = $self->append($text->as_string());
				} else {
					$self = $self->append($text);
				}
			}
			return $self;
		}
		$self->{'text'} = $params{'text'}->as_string();
	} else {
		$self->{'text'} = $params{'text'};
	}

	return $self;
}


=head2 append

Adds data given in "text" to the end of the object.
Contains a simple sanity test for consecutive punctuation.
I expect I'll improve that.

Successive calls to append() can be daisy chained.

    $d->set('Hello ')->append("World!\n");

The argument can be a reference to an array of strings, or an object.
If called with an object, the message as_string() is sent to it for its contents.

=cut

sub append {
	my $self = shift;

	my %params;
	if(ref($_[0]) eq 'HASH') {
		%params = %{$_[0]};
	} elsif(scalar(@_) % 2 == 0) {
		%params = @_;
	} else {
		$params{'text'} = shift;
	}

	if(!defined($params{'text'})) {
		Carp::carp(__PACKAGE__, ': no text given');
		return;
	}

	if(ref($params{'text'})) {
		# Allow the text to be a reference to a list of strings
		if(ref($params{'text'}) eq 'ARRAY') {
			if(scalar(@{$params{'text'}}) == 0) {
				Carp::carp(__PACKAGE__, ': no text given');
				return;
			}
			foreach my $text(@{$params{'text'}}) {
				if(ref($text)) {
					$self = $self->append($text->as_string());
				} else {
					$self = $self->append($text);
				}
			}
			return $self;
		}
		$params{'text'} = $params{'text'}->as_string();
	}

	# FIXME: handle ending with an abbreviation

	if($self->{'text'} && ($self->{'text'} =~ /[\.\,;]\s*$/)) {
		if($params{'text'} =~ /^\s*[\.\,;]/) {
			Carp::carp(__PACKAGE__,
			# die(__PACKAGE__,
				": attempt to add consecutive punctuation\n\tCurrent = '",
				$self->{'text'},
				"'\n\tAppend = '",
				$params{'text'},
				'"',
			);
			return;
		}
	}
	$self->{'text'} .= $params{'text'};

	return $self;
}

=head2 as_string

Returns the text as a string.

=cut

sub as_string {
	my $self = shift;

	return $self->{'text'};
}

=head2	length

Returns the length of the text.

=cut

sub length {
	my $self = shift;

	if(!defined($self->{'text'})) {
		return 0;
	}

	return length($self->{'text'});
}

=head2	trim

Removes leading and trailing spaces from the text.

=cut

sub trim {
	my $self = shift;

	$self->{'text'} = String::Util::trim($self->{'text'});

	return $self;
}

=head2	rtrim

Removes trailing spaces from the text.

=cut

sub rtrim {
	my $self = shift;

	$self->{'text'} = String::Util::rtrim($self->{'text'});

	return $self;
}

=head2	replace

Replaces words.

    use Data::Text;

    my $dt = Data::Text->new();
    $dt->append('Hello World');
    $dt->replace({ 'Hello' => 'Goodbye dear' });
    print $dt->as_string(), "\n";	# Outputs "Goodbye dear world"

=cut

sub replace {
	my $self = shift;

	$self->{'clean'} ||= String::Clean->new();
	$self->{'text'} = $self->{'clean'}->replace(shift, $self->{'text'}, shift);

	return $self;
}

=head1 AUTHOR

Nigel Horne, C<< <njh at bandsman.co.uk> >>

=head1 BUGS

=head1 SEE ALSO

L<String::Clean>, L<String::Util>

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Data::Text

You can also look for information at:

=over 4

=item * MetaCPAN

L<https://metacpan.org/release/Data-Text>

=item * RT: CPAN's request tracker

L<https://rt.cpan.org/NoAuth/Bugs.html?Dist=Data-Text>

=item * CPANTS

L<http://cpants.cpanauthors.org/dist/Data-Text>

=item * CPAN Testers' Matrix

L<http://matrix.cpantesters.org/?dist=Data-Text>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Data-Text>

=item * CPAN Testers Dependencies

L<http://deps.cpantesters.org/?module=Data::Text>

=back

=head1 LICENSE AND COPYRIGHT

Copyright 2021-2022 Nigel Horne.

This program is released under the following licence: GPL2

=cut

1;
