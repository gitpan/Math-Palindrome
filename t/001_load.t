# -*- perl -*-

# t/001_load.t - check module loading and create testing directory

use Test::More tests => 2;

BEGIN { use_ok( 'Math::Palindrome' ); }

my $object = Math::Palindrome->new ();
isa_ok ($object, 'Math::Palindrome');


