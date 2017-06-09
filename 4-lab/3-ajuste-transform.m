clear();

function a_ej()
  D = load("./datos/datos3a.mat");

  # y(x) = Cx^A -> ln(y(x)) = ln(C) + ln(A) * x
  # f(x) = ln(y(x))
  # a = ln(A) -> A = e^a
  # b = ln(C) -> C = e^b

  x = D.x;
  y_transf = log(D.y);

  p = polyfit(x, y_transf, 1);

  p_transf = e.^p;
  A = p_transf(1);
  C = p_transf(2);

  y_ajust = C.*(x.^A);

  plot(x, D.y, ';Puntos Originales;.',
       x, y_transf,';Puntos Transformados;.',
       x, polyval(p, x), ';Ajuste lineal;g',
       x, y_ajust, ';Ajuste Modelo;r')
endfunction

function b_ej()
  D = load("./datos/datos3b.mat");

  # y(x) = x/(Ax + B) -> x/y(x) = Ax + B
  # f(x) = x/y(x)
  # a = A
  # b = B

  x = D.xd;
  y_transf = x./D.yd;

  p = polyfit(x, y_transf, 1);

  A = p(1);
  B = p(2);

  y_ajust = x./(A*x + B);

  plot(x, D.yd, ';Puntos Originales;x-',
       x, y_ajust, ';Ajuste Modelo;r')
endfunction
