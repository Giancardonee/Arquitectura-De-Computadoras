#Escribir un programa que calcule la superficie de un triángulo rectángulo de base 5,85 cm y altura 13,47 cm.
#pista: la superficie de un triángulo se calcula como:
#Superficie = (base x altura) / 2

.data
base: .double 5.85
altura: .double 13.47
dos: .double 2
superficie: .double 0
.code
l.d f1, base(r0)
l.d f2, altura(r0)
l.d f3, dos(r0)
l.d f4, superficie(r0)
mul.d f5, f1, f2
div.d f5, f5,f3
s.d f5, superficie(r0)

halt
