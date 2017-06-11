run '3-sollu.m'
run '2-egauss.m'

n=3;
b1=[ones(n,1);zeros(n,1)];
b2=ones(2*n,1);
I=eye(n);
B=diag(4*ones(n,1)) - diag(ones(n-1,1),1) - diag(ones(n-1,1),-1);
A=[B,-I;-I,B]

disp('Solution of Ax = b1');
soleg1 = soleg(A, b1)
sollu1 = sollu(A, b1)

disp('Solution of Ax = b2');
soleg2 = soleg(A, b2)
sollu2 = sollu(A, b2)

disp('Diff');
diff1 = abs(soleg1 - sollu1)'
diff2 = abs(soleg2 - sollu2)'
