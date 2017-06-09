real = 1 - 1/e;
fun = @(x) e ^ (-x)
for t = {'trapecio' 'pm' 'simpson'}
  disp("");
  disp(char(t));
  for i = [4 10 20]
    aprox = intenumcomp(fun, 0, 1, i, char(t));
    i
    error = abs(real - aprox)
  endfor
endfor
