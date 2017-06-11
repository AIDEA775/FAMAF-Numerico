run '1-soltr.m'

# A matriz cuadrada superior
# b vector
function x = sollu(A, b)
  [L, U, P] = lu(A);
  y = soltrinf(L, P*b);
  x = soltrsup(U, y);
endfunction
