global c;

function biseccion(fun)
  global c;
  x = linspace(0, 1.5, 1000);

  for i = 1 : 1000
    c = x(i);
    [hx, hf] = rbisec(fun, [0 1.5], 1e-5, 100);
    u(i) = hx(end);
  endfor

  plot(x,u)
end

function newton(fun)
  global c;
  x = linspace(0, 1.5, 1000);

  for i = 1 : 1000
    c = x(i);
    [hx, hf] = rnewton(fun, 0.75, 1e-5, 100);
    u(i) = hx(end);
  endfor

  plot(x,u)
end

function punto_fijo(fun)
  global c;
  x = linspace(0, 1.5, 1000);

  for i = 1 : 1000
    c = x(i);
    hx = ripf(fun, 0.75, 1e-5, 100);
    u(i) = hx(end);
  endfor

  plot(x,u)
end

function fy = fun_ej7(y)
  global  c;
  fy = y - exp(-(1 - c * y) ^ 2);
end

function fpy = fun_ej7dy(y)
  global c;
  fpy = 1 - exp(-(1 - c * y) ^ 2) * 2*(1 - c * y) * c;
end

# return f(y)
fun_bisec = @fun_ej7

# return [f(y), f'(y)]
fun_newton = @(y) deal(fun_ej7(y), fun_ej7dy(y))

# return exp(-(1 - c * y) ^ 2)
fun_ipf = @(y) -fun_ej7(y) + y

