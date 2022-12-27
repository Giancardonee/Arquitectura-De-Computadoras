** este ejercicio lo hice en papel. Lo comprobé con el profesor y me dijo que estaba bien. El programa no me corre. si encuentran el eror avisen :)**


# ESCRIBIR UNA SUBRUTINA QUE RECIBA COMO PARAMETRO UNA TABLA DE NUMEROS
# LA SUBRUTINA DEBE CONTAR LA CANTIDAD DE NUMEROS IMPARES
# (detalle importante, la tabla tiene que terminar con el num 0 )
.data
TABLA: .word 2,3,4,5,6,7,8,9,0
long: .word 9
Cant_Impares: .word 0
.code
LD $a1, long ($zero)
jal sera_impar
sd $v0, Cant_Impares($zero)
halt

sera_impar: LD $a0, TABLA($t0)
            andi $t1, $a0, 1
       #hago un and con 1 y el valor de la tabla
   ; si el numero es impar: $T1= 1
   ; si el numero es par:   $T1= 0
            bnez $t1, impar
            beqz $a1, fin   ; si $a1=0 es xq llegue al final

siguiente: daddi $t0, $t0, 8 #$t0 es mi desplazamiento
           daddi $a1, $a1, -1#Decremento longitud
           j sera_impar

impar: daddi $v0, $v0, 1
       j siguiente

fin: jr $ra



