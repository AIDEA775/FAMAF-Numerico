clear();

function a_ej()
  x = linspace(0, 1, 50);
  y = asin(x);
  plot(x, y, ';Funcion Original;k*')

  for i = 0 : 5
    p = polyfit(x, y, i);
    y_ajust = polyval(p, x);
    hold on;
    label = [';Grado ' num2str(i) ';'];
    plot(x, y_ajust, label, 'color', [i/5, (5-i)/5, abs(sin(i))]);
  endfor
endfunction

function b_ej()
  x = linspace(0, 4 * pi, 50);
  y = cos(x);
  plot(x, y, ';Funcion Original;k*')

  for i = 0 : 5
    p = polyfit(x, y, i);
    y_ajust = polyval(p, x);
    hold on;
    label = [';Grado ' num2str(i) ';'];
    plot(x, y_ajust, label, 'color', [i/5, (5-i)/5, abs(sin(i))]);
  endfor
endfunction
