run '../6-lab/3-sollu.m'
run '../6-lab/2-egauss.m'

# x vector
# y vector
# n escalar
function z = ajuste1a(x, y, n)
  m = length(x);

  # Armar b
  bsum = @(i, p) y(i) * x(i) ^ p;
  for i = 0:n
    b(i+1,1) = sum(arrayfun(bsum, [1:m], i));
  endfor

  # Armar A
  asum = @(i, p) x(i) ^ p;
  for i = 0:n
    for j = 0:n
      A(i+1,j+1) = sum(arrayfun(asum, [1:m], i+j));
    endfor
  endfor

  z = sollu(A, b);
endfunction

x = -1:0.25:1;
y = [1.0000 0.8125 0.7500 0.8132 1.0000 1.3125 1.7500 2.3125 2.9505];
a = ajuste1a(x, y, 2)

# Armar el polinomio para polyval
for i = 1:length(a)
  p(i) = a(end - i + 1);
endfor

xreal = linspace(-1,1,100);

plot(x, y, ';Puntos Originales;g*',
     xreal, polyval(p, xreal), ';Ajuste;r');

