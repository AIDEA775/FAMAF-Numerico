# Metodo de Newton
# f funcion, dado x retorna f(x)
# f funcion, dado x retorna f'(x)
# x0 escalar, primer punto
# e escalar, tolerancia del error
# m entero, numero maximo de iteraciones

function [hx, hf] = rnewton_modif(f, fp, x0, e, m)
  hx = [];
  hf = [];

  # primer punto
  hx(1) = x0;
  hf(1) = f(x0);
  fpx = fp(x0);

  # le pegaste de una
  if abs(hf(1)) < e
    disp("Enhorabuena!")
    break;
  end

  for k = 2 : m
    # calcular nuevo punto
    # xk = xk-1- f(xk-1) / fp(x0)
    hx(k) = hx(k - 1) - hf(k - 1) / fpx;

    # calcular f(xk)
    hf(k) = f(hx(k));

    # parar |xk − xk−1| / |xk| < e ó |f (x k )| < e,
    if abs(hx(k) - hx(k - 1)) / abs(hx(k)) < e || abs(hf(k)) < e
      break;
    end
  endfor
endfunction


fun = @(x) x ^ 3 - 2
fun_p = @(x) 3 * x ^ 2
