x = 0;

l = 0;
i = 0;

while i < 10
  l += 0.1;
  i++; 
end

printf("l = %f\n\n", l)

while x ~= l
  x = x + 0.1
end
