run '1-soltr.m';

# A matriz cuadrada superior
# b vector
# U matriz triangular superior ?para que usar triu?
# y es lo que queda de b
function [U, y] = egauss(A, b)
  n = size(A, 1);
  # matriz extendida
  M = [A b];
  for i=1:n-1
    # multiplicadores
    mul = M(i+1:end,i) / M(i,i);
    # actualizar matriz
    # crear ceros
    # ci = ci - c1*mi (c = columna, m = multipicadores)
    M(i+1:end,:) = M(i+1:end,:) - mul .* M(i,:);
  end
  U = M(:,1:n);
  y = M(:,end);
endfunction

function x = soleg(A, b)
  [U, y] = egauss(A, b);
  x = soltrsup(U, y);
endfunction
