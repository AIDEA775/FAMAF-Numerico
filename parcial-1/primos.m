function result = primos(n)
  pos = 1;
  for i = 1 : n
    if isprime(i) == 1
      result(pos) = i;
      pos = pos + 1;
    endif
  endfor
end
