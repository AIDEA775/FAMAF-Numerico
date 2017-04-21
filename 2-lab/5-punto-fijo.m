# Metodo de punto fijo
# f funcion, dado x retorna f(x)
# x0 escalar, primer punto
# e escalar, tolerancia del error
# m entero, numero maximo de iteraciones

function [hx] = ripf(fun, x0, e, m)
  hx = [x0];
  for k = 2 : m
    hx(k) = fun(hx(k-1));
    if abs(hx(k) - hx(k - 1)) < e
      break;
    endif
  endfor
endfunction


fun_ej4 = @(x) 2 ^ (x - 1)
