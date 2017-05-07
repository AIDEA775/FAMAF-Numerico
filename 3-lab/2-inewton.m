# x vector, puntos x de la tabla
# y vector, puntos y de la tabla
# z vector, puntos donde evaluar el polinomio generado
function [w] = inewton(x, y, z)
  c = newtonpoly(x, y);
  n = length(c);
  p = zeros(1, n);
  for i = 1 : n
    Pi = poly(x(1:i - 1)); # prod j = 1:i (x - xj)
    Pi = Pi * c(i);
    p = p + [zeros(1, n - length(Pi)) Pi];
  end

  for i = 1 : length(z)
    w(i) = polyval(p, z(i));
  end

endfunction

function p = newtonpoly(xi, yi)
  n = length(xi);

  # Matriz diagonal inferior
  low = logical(tril(ones(n)));
  # Matriz diagonal inferior con una columna 0
  zlow = logical([zeros(n, 1) tril(ones(n))]);

  d = yi';
  for i = 1 : n - 1
    # resta del numerador
    # d(j, i+1) = d(j, i) - d(j-1, i) para todos las filas j
    d(1:n-i, i+1) = d(zlow(n-i, :)', i) - d(low(n-i, :)', i);

    # dividir por la resta
    # d(j, i+1) = d(j, i+1) / xi(i + j) - xi(j) para todos las filas j
    d(1:n-i, i+1) = d(1:n-i, i+1) ./ (xi(low(:, i+1)')' - xi(low(n-i, :))');
  endfor

  p = d(1, :);
endfunction
