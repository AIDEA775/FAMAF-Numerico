# A matriz cuadrada superior
# b vector
function x = soltrsup(A, b)
  n = size(A, 1);
  for i = n : -1 : 1
    # el ultimo elemento
    if A(i,i) == 0
      disp('Singular matrix');
      return;
    endif
    # x(n) = b(n)/A(n,n)
    result_i = b(i)/A(i,i);
    # tenemos una solucion
    x(i,1) = result_i;
    # multiplicamos su columna
    new_constants = A(:,i) * result_i;
    # y la restamos a b
    b = b - new_constants;
    # quitamos la columna
    A(:,i) = [];
  endfor
endfunction

function x = soltrinf(A, b)
  n = size(A, 1);
  for i = 1 : n
    # el primer elemento
    if A(i,1) == 0
      disp('Singular matrix.');
      clear x;
      return;
    endif
    # x(1) = b(1)/A(1,1)
    result_i = b(i)/A(i,1);
    # tenemos una solucion
    x(i,1) = result_i;
    # multiplicamos su columna
    new_constants = A(:,1) * result_i;
    # y la restamos a b
    b = b - new_constants;
    # quitamos la columna
    A(:,1) = [];
  endfor
endfunction
