function intenumcomp(@fun, a, b, N, regla)
  switch (regla)
    case 'trapecio'
      #
      return (fun(a) + fun(b)) / 2 * (b - a);
    case 'pm'
      #
    case 'simpson'
      #
    otherwise
      disp("Fail.")
endfunction
