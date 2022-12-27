
# punto flotante
# EL SIGUIENTE PROGRAMA HACE (A+B) * C Y GUARDA EL
# RESULTADO EN LA VARIABLE RESUL
.data
A: .double 2
B: .double 2
C: .double 10
RESUL: .double
.code
L.D F1,A(r0)
L.D F2,B(R0)
L.D F3,C(R0)
ADD.D F1, F2,F1
MUL.D F1, F3, F1
S.D F1,RESUL(R0)
halt
