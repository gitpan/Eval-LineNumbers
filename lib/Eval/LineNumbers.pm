
package Eval::LineNumbers;

use warnings;
use strict;
require Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw();
our @EXPORT_OK = qw(eval_line_numbers);

our $VERSION = 0.32;

sub eval_line_numbers
{
	my $level = 0;
	$level = shift
		if $_[0] =~ /^\d\d?$/;
	my($pkg, $file, $line) = caller($level);
	$line++;
	my $val = qq{#line $line "$file"\n}.join('',@_);
	return $val;
}
1;

__END__

=head1 NAME

Eval::LineNumbers - Add line numbers to heredoc blocks that contain perl source code

=head1 SYNOPSIS

 use Eval::LineNumbers qw(eval_line_numbes);

 eval eval_line_numbers(<<END_HEREIS);
   code
 END_HEREIS

=head1 DESCRIPTION

Add a C<#line "this-file" 392> comment to heredoc/hereis text that is going
to be eval'ed so that error messages will point back to the right place.

Please note: when you embed C<\n> in your code, it gets expanded in
double-quote hereis documents so it will mess up your line numbering.
Use C<\\n> instead when you can.

=head1 LICENSE

Copyright (C) 2009 David Muir Sharnoff.
Copyright (C) 2013 Google, Inc.

This package may be used and redistributed under the terms of either
the Artistic 2.0 or LGPL 2.1 license.

