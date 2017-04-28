function [x1, x2] = mala(a, b, c)
  x1 = (-b + sqrt(b^2 - 4 * a * c)) / 2 * a;
  x2 = (-b - sqrt(b^2 - 4 * a * c)) / 2 * a;
end

function [x1, x2] = buena(a, b, c)
  x1 = (-b - sign(b) * sqrt(b^2 - 4 * a * c)) / 2 * a;
  x2 = c /(a*x1);
end
