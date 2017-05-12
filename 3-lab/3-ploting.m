function lab3_ej3()
  global fun3;
  # funcion verdadera
  x = linspace(1, 5, 1000);
  y = arrayfun(fun3, x);

  # interpolacion
  xi = 1:5;
  w = inewton(xi, arrayfun(fun3, xi), x);

  plot(x,y,'r-', x, w, 'c*');
endfunction

function lab3_ej4(n)
  global fun4;
  global fun4_i;
  # funcion verdadera
  x = linspace(-1, 1, 200);
  y = arrayfun(fun4, x);

  # interpolacion
  xi = arrayfun(fun4_i, [1:n], n);
  w = inewton(xi, arrayfun(fun4, xi), x);

  plot(x,y,'r-', x, w, 'c*');
endfunction

function lab_ej5()
  S = load("datos/datos_aeroCBA.dat");
  year = S(:, 1)';
  temp = S(:, 2)';

  x = []; # Años con temp conocida
  y = []; # Temperatura conocida
  z = []; # Temperatura interpolados
  w = []; # Años interpolados

  for i = 1 : length(year)
    if isnan(temp(i)) == 0
        y = [y temp(i)];
        x = [x year(i)];
    else
        z = [z year(i)];
    endif
  endfor

  w = interp1(x,y,z, 'spline', 'extrap');
  resultado = [z' w'];

  figure(1);
  newplot(1);

  hold on;

  plot(x, y, 'r.', 'markersize', 12);
  plot(z, w, 'bp', 'markersize', 14);
  w = interp1(x, y, [1957:1:2016], 'spline', 'extrap');
  plot([1957:2016], w, 'g-', 'linewidth', 2, [1957:2016], 2, 'g*', 'markersize', 12);
  h = legend('datos', 'interp NaN', 'Interp todos');

  set(h, 'fontsize', 12);

  hold off;
endfunction

global fun3 = @(x) 1 / x

global fun4 = @(x) 1 / (1 + 25 * x ^ 2)
global fun4_i = @(i, n) 2 * (i - 1) / n - 1

