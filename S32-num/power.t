use v6;

use Test;

plan 37;

# Real **
is(0 ** 0,    1, "0 ** 0 ==  1");
is(0 ** 1,    0, "0 ** 1 ==  0");
is(1 ** 2,    1, "1 **  2 ==  1");
is(4 ** 0,    1, "4 **  0 ==  1");
is(4 ** 1,    4, "4 **  1 ==  4");
is(4 ** 2,   16, "4 **  2 == 16");
is(4 ** 0.5,  2, "4 ** .5 ==  2");
is(4 ** (1/2), 2, "4 ** (1/2) == 2 ");
is(4 ** (-1/2), 0.5, "4 ** (-1/2) == 1/2 ");
is((-2) ** 2, 4, "-2 ** 2 = 4");

is(1 ** Inf, 1, '1**Inf=1');
is(0 ** Inf, 0, '0**Inf=0');
is(Inf ** 2, Inf, 'Inf**2 = Inf');
is((-Inf) ** 3, -Inf, '(-Inf)**3 = -Inf');
is(Inf ** Inf, Inf, 'Inf**Inf = Inf');
is(NaN ** 2, NaN, "NaN propagates with integer powers");
is(NaN ** 3.14, NaN, "NaN propagates with numeric powers");
is(0 ** NaN, NaN, "0**NaN=NaN");

is(NaN ** 1i, NaN, "NaN**1i=NaN");
#?rakudo todo '1i**NaN should be NaN'
is(1i ** NaN, NaN, "1i**NaN=NaN");

#?rakudo todo 'NaN**0 should be NaN'
is(NaN ** 0, NaN, "NaN**0=NaN");

is(NaN ** NaN, NaN, "NaN**NaN=NaN");
is(Inf ** NaN, NaN, "Inf**NaN=NaN");
is(NaN ** Inf, NaN, "NaN**Inf=NaN");

is_approx(exp(1) ** 0.5,  exp(0.5), "e **  .5 ==   exp(.5)");
is_approx(exp(1) ** 2.5,  exp(2.5), "e ** 2.5 ==  exp(2.5)");

# Complex **
# These work by accident
is((4 + 0i) ** 2, 4 ** 2, "(4+0i) ** 2 == 16");
is(1i ** 4, 1, "i ** 4 == 1");

#?rakudo 4 todo 'Complex ** not properly implemented yet'
is(1i ** 2, -1, "i ** 2 == -1");
is(1i ** 3, -1i, "i ** 3 == -i");
is(5i ** 3, -125i, "5i ** 3 = -125i");
is((-3i) ** 3, -27i, "3i ** 3 = -27i");

#?rakudo todo 'Complex ** not properly implemented yet'
{
    my $PI = 3.14159265358979323846264338327950288419716939937510;
    is_approx(exp(1) ** ($PI * 1i), -1, "e ** pi i = -1");
}

for (8i).roots(4) -> $z
{
    #?rakudo todo 'Complex ** not properly implemented yet'
    is_approx($z ** 4, 8i, "quartic root of 8i ** 4 = 8i");
}

done_testing;

# vim: ft=perl6
