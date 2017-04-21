global a = 27;

# Metodo de Newton
# f funcion, dado x retorna [f(x),f'(x)]
# x0 escalar, primer punto
# e escalar, tolerancia del error
# m entero, numero maximo de iteraciones

function [hx, hf] = rnewton(f, x0, e, m)
  hx = [];
  hf = [];

  # primer punto
  hx(1) = x0;
  [hf(1), fpx] = f(x0);

  # le pegaste de una
  if abs(hf(1)) < e
    disp("Enhorabuena!")
    break;
  end

  for k = 2 : m
    # calcular nuevo punto
    hx(k) = hx(k - 1) - hf(k - 1) / fpx;

    # calcular f(xk) y su derivada
    [hf(k), fpx] = f(hx(k));

    # parar |xk − xk−1| / |xk| < e ó |f (x k )| < e,
    if abs(hx(k) - hx(k - 1)) / abs(hx(k)) < e || abs(hf(k)) < e
      break;
    end
  endfor
endfunction


fun = @(x) deal(x ^ 3 + 8, 3 * x ^ 2)
fun_ej4 = @(x) deal(x ^ 3 - a, 3 * x ^ 2)
