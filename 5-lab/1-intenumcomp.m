# Integra fun entre a y b usando el metodo regla compuesta en N particiones.
# Para Simpson, N debe ser par

function result = intenumcomp(fun, a, b, N, regla)
  x = linspace(a, b, N + 1);
  h = (b - a) / N;
  switch (regla)
    case 'trapecio'
      fsum = @(i) fun(a + h * i);
      # fun(x0) + 2 * sum(i = 1 to n-1 of xi) + fun(xn)
      p = fun(a) + 2 * sum(arrayfun(fsum, [1:N-1])) + fun(b);
      result = h/2 * p;
    case 'pm'
      # punto medio entre i e i+1
      # i+1 - la mitad
      # la mitad = h/2
      # i+1 = a + h*i
      fsum = @(i) fun(a + h*i - h/2);
      result = h * sum(arrayfun(fsum, [1:N]));
    case 'simpson'
      if (rem (N, 2) == 0)
        fsum1 = @(i) fun(a + (2 * i - 1) * h);
        sum1 = sum(arrayfun(fsum1, [1:N/2]));

        fsum2 = @(i) fun(a + 2 * i * h);
        sum2 = sum(arrayfun(fsum2, [1:(N - 2)/2]));
        p = fun(a) + 4 * sum1 + 2 * sum2 + fun(b);
        result = h/3 * p;
      else
        disp("N is odd");
      endif
    otherwise
      disp("Fail.");
  endswitch
endfunction

fx = @(x) x
f2x = @(x) x ^ 2
f3x = @(x) x ^ 3
