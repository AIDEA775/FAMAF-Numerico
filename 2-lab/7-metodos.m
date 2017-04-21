global c = 1;

function biseccion(fun)
  global c;
  x = linspace(0, 1.5, 1000);

  for i = 1 : 1000
    c = x(i);
    [hx, hf] = rbisec(fun, [0 1.5], 1e-5, 100);
    u(i) = hx(end)
  end

  plot(x,u)

endfunction

fun = @(y) y - exp(-(1 - c * y) ^ 2)
