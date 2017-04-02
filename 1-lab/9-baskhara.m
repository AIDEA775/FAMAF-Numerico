function mala(a,b,c)
  ((-b + sqrt(b^2 - 4 * a * c)) / 2 * a), 
  ((-b - sqrt(b^2 - 4 * a * c)) / 2 * a)
end

% TODO Pedir esta porque no la recuerdo
function buena(a,b,c)
  ((-b + sqrt(b^2 - 4 * a * c)) / 2 * a), 
  ((-b - sign(b) * sqrt(b^2 - 4 * a * c)) / 2 * a)
end
