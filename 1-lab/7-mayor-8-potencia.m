% 7
function mayor(x, y)
  if x == y
    disp("Son iguales")
  else
    max(x, y)
  end
end

% 8a
function potencia(x, n)
  x ^ n
end

% 8b
function potencia5(x)
  for i = 0 : 5
    potencia(x, i)
  end
end
