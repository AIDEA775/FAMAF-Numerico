# Metodo de biseccion
# f funcion, dado x retorna f(x)
# I vector, intervalo [a, b]
# e escalar, tolerancia del error
# m entero, numero maximo de iteraciones

function [hx, hf] = rbisec(f, I, e, m)
  a = I(1);
  b = I(2);

  fa = f(a);
  fb = f(b);
  l = (b - a); # largo del intervalo

  hx = [];
  hf = [];

  if sign(fa) == sign(fb) || b < a
    disp("Mal intervalo de entrada!")
    break;
  end

  for k = 1 : m
    l = l / 2; 
    c = a + l; # punto medio
    fc = f(c); # valor del punto medio

    # guardar historico
    hx(k) = c;
    hf(k) = fc;

    if abs(fc) < e
      break;
    end

    if sign(fc) == sign(fb)
      # lado izquierdo
      b = c;
      fb = fc;
    else
      # lado derecho
      a = c;
      fa = fc;
    end
  end
end


# funciones
fun_ej2a = @(x) tan(x) - 2 * x
fun_ej2b = @(x) x ^ 2 - 3

