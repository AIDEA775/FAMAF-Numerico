# x vector de escalares
# y vector igual a integral de 0 a xi de cos(t) dt
#? N debe ser x/0.1+1? para que ver comandos floor ceil y round?
run '1-intenumcomp.m'

function y = senint(x)
  f = @(x) intenumcomp(@cos, 0, x, x/0.1+1, 'trapecio');
  y = arrayfun(f, x);
endfunction

x = 0:0.5:2*pi;
plot(x, sin(x), ';Sin;g',
     x, senint(x), ';Senint;ro');
