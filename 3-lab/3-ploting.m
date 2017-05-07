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
  
endfunction

global fun3 = @(x) 1 / x

global fun4 = @(x) 1 / (1 + 25 * x ^ 2)
global fun4_i = @(i, n) 2 * (i - 1) / n - 1

