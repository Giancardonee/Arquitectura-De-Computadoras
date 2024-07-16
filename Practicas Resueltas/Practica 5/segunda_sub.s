#El siguiente programa multiplica dos valores A y B
#Luego divide por 2 el resultado de esa multiplicacion y lo guarda
#en la variable RES
 ; (funciona correctamente)
.data
A: .word 5
B: .word 10
C: .word 2
RES: .word 0
.code
LD $a0, A(r0)
LD $a1, B(r0)
LD $a2, C(r0)

jal CALCULO
SD $v0, RES(r0)
halt

CALCULO: dmul $v0, $a0, $a1
         ddiv $v0, $v0, $a2
         jr $RA


