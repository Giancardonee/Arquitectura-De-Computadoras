# ANALIZAR Y BUSCAR EL ERROR.

.data
tabla: .word 1,2,3,4,5,6,7,8,9,10
long:  .word 10
M:     .word 6
Mayores_M: .word 0
.code
ld $a0,M($zero)
#aca tendria que cargar el offset de tabla
ld $a2, long($zero)
daddi $t8, $zero, 0 ; inicializo desplazamiento en 0
jal subrutina

halt

subrutina: sd $t0, tabla($t8) ;me traigo num de la tabla
           beqz $a2, FIN ; si long = 0 jump fin
           beq $t0, $a0, sig_posicion
; si el valor de la tabla es igual a M, salto a siguiente posocion

          slt $t1, $t0, $a0
 ;        si $t0 es mayor $t1 = 0
 ;        si $t0 es menor $t1 = 1
          beqz $t1, Mayor_M
 ;        si $t1 = 0 es porq es mayor, entonces salto a Mayor_M

 ; si es menor, avanza a la sig posicion
sig_posicion: daddi $t8, $t8 ,1  ; avanzo posicion
               daddi $a2, $a2, -1 ; dec long
               j subrutina

Mayor_M: daddi $v0, $v0 ,1 ; inc contador de M mayor
         j sig_posicion


FIN:  sd $v0, Mayores_M(r0)
      jr $ra ; retorno al
