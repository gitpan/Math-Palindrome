package Math::Palindrome;

use strict;
use warnings;
use Carp qw(croak);

use base 'Exporter';
our @EXPORT_OK = qw{is_palindrome next_palindrome previous_palindrome};

sub is_palindrome {
return 1 if ($_[0] == reverse $_[0]);
}

#################### subroutine header begin ####################

=head2 is_palindrome

 Usage     : print "Palindrome\n" if (is_palindrome($n));
 Purpose   : This function just return true if $n is equivalent to its reverse.

=cut

#################### subroutine header end ####################

sub _digits_size {
	my @dsize = split //, shift;
	return scalar @dsize;
}

sub _previous_one_digits {
	my $n = shift;
	$n != 0 ? (return ($n - 1)) : croak "Just work with natural numbers!\n";	
}

sub _next_one_digits {
	my $n = shift;
	$n != 9 ? (return ($n + 1)) : (return 11);
}

sub _next_odd_digits {
	my $n = shift;
	my $r ;
	
	my $n_1 = substr $n, 0, scalar (split //, $n)/2; #first half part, without middle num(if exist)
	my $n_2 = substr $n, -(scalar (split //, $n)/2); #second half part, without middle num(if exist)
	my $n_3 = substr $n, 0, -(scalar (split //, $n)/2); #first half part, with middle num(if exist)
	
	if ($n == 999){$r = 1001}
	elsif ($n_1 <= reverse $n_2){
		$n_3++;
		$r = $n_3 . (reverse substr $n_3, 0, ((scalar (split //, $n_3))-1));
		
	}
	else{$r = $n_3 . (reverse substr $n_3, 0, ((scalar (split //, $n_3))-1))}
	
	return $r;
}

sub _next_even_digits {
	my $n = shift;
	my $r;
	
	my $n_1 = substr $n, 0, -(scalar (split //, $n)/2);#first half part
	my $n_2 = substr $n, (scalar (split //, $n)/2); #second half part
	
	if ($n == 99){$r = 101}
	elsif ($n_1 <= reverse$n_2){
		$n_1++;
		$r = $n_1 . reverse $n_1;
	}
	else{$r = $n_1 . reverse $n_1}
	
	return $r;
}

sub _previous_odd_digits {
	my $n = shift;
	my $r ;
	
	my $n_1 = substr $n, 0, scalar (split //, $n)/2; #first half part, without middle num(if exist)
	my $n_2 = substr $n, -(scalar (split //, $n)/2); #second half part, without middle num(if exist)
	my $n_3 = substr $n, 0, -(scalar (split //, $n)/2); #first half part, with middle num(if exist)
	
	if ($n <= 101){$r = 99}
	elsif ($n_1 >= reverse $n_2){
		$n_3--;
		$r = $n_3 . (reverse substr $n_3, 0, ((scalar (split //, $n_3))-1));
		
	}
	else{$r = $n_3 . (reverse substr $n_3, 0, ((scalar (split //, $n_3))-1))}
	
	return $r;
}

sub _previous_even_digits {
	my $n = shift;
	my $r;
	
	my $n_1 = substr $n, 0, -(scalar (split //, $n)/2);#first half part
	my $n_2 = substr $n, (scalar (split //, $n)/2); #second half part
	
	if ($n <= 11){$r = 9}
	elsif ($n_1 >= reverse $n_2){
		$n_1--;
		$r = $n_1 . reverse $n_1;
	}
	else{$r = $n_1 . reverse $n_1}
	
	return $r;
}

sub next_palindrome {
	my $num = shift;
	my $size = _digits_size($num);
	if ($size == 1){return _next_one_digits($num)}
	elsif ($size % 2 != 0){return _next_odd_digits($num)}
	else{return _next_even_digits($num)}
}
=head2 next_palindrome

 Usage     : next_palindrome(22);
 Returns   : 33
 Purpose   : This function just return true if $n is equivalent to its reverse.

=cut

sub previous_palindrome {
	my $num = shift;
	my $size = _digits_size($num);
	if ($size == 1){return _previous_one_digits($num)}
	elsif ($size % 2 != 0){return _previous_odd_digits($num)}
	else{return _previous_even_digits($num)}
}
=head2 next_palindrome

 Usage     : previous_palindrome(22);
 Returns   : 11
 Purpose   : This function just return true if $n is equivalent to its reverse.

=cut	




=head1 NAME

Palindrome - search and confirm palindromes numbers.

=head1 SYNOPSIS

  use Palindrome qw/is_palindrome next_palindrome previous_palindrome/;
  
  my $n = 22;
  if(is_palindrome($n)){print "True!\n"}
  else{print "False!\n"}
  
  $n = next_palindrome($n); # $n is 33
  
  $n = previous_palindrome($n); # $n is 11


=head1 DESCRIPTION

You can use this module to find and confirm palindrome numbers.

Blah blah blah.


=head1 USAGE



=head1 AUTHOR

    Aureliano C. P. Guedes
    CPAN ID: acpguedes
    guedes.aureliano@gmail.com

=head1 COPYRIGHT

This program is free software; you can redistribute
it and/or modify it under the same terms as Perl itself.

The full text of the license can be found in the
LICENSE file included with this module.


=head1 SEE ALSO

perl(1).

=cut

#################### main pod documentation end ###################


1;
# The preceding line will help the module return a true value

