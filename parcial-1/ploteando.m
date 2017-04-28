fun = @(x) x ^ 3 - 2;

x = linspace(0, 2, 100);

for i = 1 : 100
  y(i) = fun(x(i));
end

plot(x, y);
