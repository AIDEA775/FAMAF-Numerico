result = 1;
for i = 1 : 6
  result *= i;
end

disp(result)

% 5c
function facf(n)
  result = 1;
  for i = 1 : n
    result *= i;
  end

  disp(result)
end
