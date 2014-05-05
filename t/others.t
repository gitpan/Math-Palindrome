# -*- perl -*-

use strict;
use warnings;
use Test::Simple tests => 100056;
use Math::Palindrome ':all';


ok(is_palindrome(111));
ok(!is_palindrome(123));
ok(next_palindrome(11) == 22);
my $n = 0;
for (1..100000){
	$n = next_palindrome($n);
	ok(is_palindrome($n));
}
ok(previous_palindrome(22) == 11);
my @a = increasing_sequence(25, 111);
ok(is_palindrome($_)) foreach @a;
my @b = decreasing_sequence(25, 10000);
ok(is_palindrome($_)) foreach @b;
ok(palindrome_after(5) == 5);
ok(palindrome_before(5) == 55);