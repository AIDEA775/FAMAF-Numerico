# Metodo de biseccion
# f funcion, dado x retorna f(x)
# I vector, intervalo [a, b]
# e escalar, tolerancia del error
# m entero, numero maximo de iteraciones

function rbisec(f, I, e, m)
  a = I(1);
  b = I(2);

  u = f(a);
  v = f(b);
  l = (b - a); # l de longitud del intervalo

  if sign(u) == sign(v) || b < a
    break;
  end

  for k = 1 : m
    l = l / 2; 
    c = a + e; # punto medio
    w = f(c); # valor del punto medio

    if abs(w) < e
      break;
    end

    if sign(w) == sign(v)
      # lado izquierdo
      b = c;
      v = w;
    else
      # lado derecho
      a = c;
      u = w;
    end
end
