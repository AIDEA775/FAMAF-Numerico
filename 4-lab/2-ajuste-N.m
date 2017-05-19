clear();

function a_ej()
  x = linspace(0, 1, 50);
  y = asin(x);
  plot(x, y, ';Funcion Original;g')

  for i = 0 : 5
    p = polyfit(x, y, i);
    y_ajust = polyval(p, x);
    hold on;
    plot(x, y_ajust, [';Grado ' num2str(i) ';'], 'color', [i/6,i/6,i/6]);
  endfor

endfunction

function b_ej()
endfunction
