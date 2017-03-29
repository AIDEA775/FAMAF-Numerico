v = [2;3];
u = [5;6;7;2];
A = randi(5,2);
B = randi(5,2,3);

printf("Resultados\n\n")

a = pi*v
b = v'*v
c = sqrt(v'*v)
d = v*u'
e = v.*u(2:3)
f = A*v
g = A^2
h = A.*A
i = A*B
j = A.*B(1:2,2:3)


printf("Parte 2\n\n")

x = randi(10)
y = randi(10)
z = randi(10)

printf("Esto %f diferente de %f\n\n", x/y + z, x/(y + z))
printf("Esto %f igual de %f\n\n", x/y*z, x/(y*z))

