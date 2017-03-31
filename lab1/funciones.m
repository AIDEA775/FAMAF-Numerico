function facf(n)
  result = 1;
  for i = 1 : n
    result *= i;
  end

  disp(result)
end

function mayor(x, y)
  if x == y
    disp("Son iguales")
  else
    max(x, y)
  end
end

function potencia(x, n)
  x ^ n
end

function potencia5(x)
  for i = 0 : 5
    potencia(x, i)
  end
end
