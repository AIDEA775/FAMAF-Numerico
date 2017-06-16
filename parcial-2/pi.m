run '../5-lab/1-intenumcomp.m';

fun = @(x) sqrt(1 - x^2);

intenumcomp(fun, -1, 1, 700, 'simpson') * 2
