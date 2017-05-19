clear();

function a_ej()
  D = load("./datos/datos1a.mat");

  x = D.xd;
  y = D.yd;

  p = polyfit(x, y, 1);
  y_ajust = polyval(p, x);

  plot(x, y, ';Puntos Originales;.', x, y_ajust, ';Ajuste Lineal;r')
endfunction

function b_ej()
  x = linspace(1, 10, 20);
  y = 3/4 * x - 1/2;

  y_disp = y + randn(1, 20);

  p = polyfit(x, y_disp, 1);
  y_ajust = polyval(p, x);
  plot(x, y, ';Funcion Original;g-', x, y_disp, ';Dispercion Normal;.', x, y_ajust, ';Ajuste Lineal;r');
endfunction
