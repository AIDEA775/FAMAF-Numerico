run '1-intenumcomp.m'

#  Calcular mediante la regla del trapecio compuesta
# y la regla de Simpson compuesta, las siguientes
# integrales, con una tolerancia de error de 10−5:

function a_ej()
  a_fun = @(x) x * e ^ (-x)
  trapecio = intenumcomp(a_fun, 0, 1, 200, 'trapecio')
  simpson = intenumcomp(a_fun, 0, 1, 8, 'simpson')
endfunction

function b_ej()
  b_fun = @(x) x * sin(x)
endfunction

function c_ej()
  c_fun = @(x) (1 + x ^ 2) ^ (3/2)
endfunction
