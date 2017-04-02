function horn(coefs, x)
  p = coefs(1);
  for i = 2 : length(coefs)
    p = coefs(i) + x * p;
  end
  p
end
