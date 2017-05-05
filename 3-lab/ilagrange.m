# x vector, puntos x de la tabla
# y vector, puntos y de la tabla
# z vector, puntos donde evaluar el polinomio generado
function [w] = ilagrange(x, y, z)
  p = lagrangepoly(x, y);
  for i = 1 : length(z)
    w(i) = polyval(p, z(i));
  end
endfunction

# x vector, puntos x de la tabla
# y vector, puntos y de la tabla
# f vector, coefientes del polinomio de lagrange
function f = lagrangepoly(xi, yi)
  n = length(xi);
  f = zeros(1, n);
  Ilog = logical(eye(n));
  for i = 1 : n
    # coeficientes del numerador de li
    # Ilog(i,:) es la i columna de la identidad
    # ~Ilog(i,:) es la negacion, todos 1s y un solo 0
    # xi(~Ilog(i,:)) seleccionar las posiciones de xi con 1s
    # poly(xi(~Ilog(i,:))) devuelve los coeficientes de la funcion
    # que tiene raices en los xi elegidos
    Pi = poly(xi(~Ilog(i,:)));
    # Pi es el polinomio del numerador
    # xi(Ilog(i,:)) es el xi
    # polyval(Pi, xi(i)) evalua Pi en xi
    # y lo divide a Pi y tenemos a li
    Pi = Pi ./ polyval(Pi, xi(i));
    # yi * li
    Pi = Pi .* yi(i);
    # sumar coeficientes
    f = f + Pi;
  end
endfunction
