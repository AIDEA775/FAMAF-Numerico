function f = rfibonacci(n)
  if n == 1
    f = 1;
  else if n == 2
    f = 2;
  else
    fn = 2;
    fnmo = 1;
    for i = 3 : n
      f = fn + fnmo;
      fnmo = fn;
      fn = f;
    endfor
  endif
end
