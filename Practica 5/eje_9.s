#EL SIGUIENTE PROGRAMA COMPARA UN CARACTER
#NOS PIDEN HACER UNA SUBRUTINA QUE RETORNE:
#1 SI EL CARACTER ES VOCAL
#0 SI EL CARACTER NO ES VOCAL
#   :)

.data
car: .asciiz "e"
cadena: .asciiz "AEIOUaeiou"
result: .word 0
.code
lbu $a0, car($zero) ;
jal Vocal_o_no
sd $v0,result($zero)
halt

    Vocal_o_no: daddi $v0, $v0, 0 ; resultado
                daddi $t0, $t0, 0 ; desplazaamiento
loopardo: lbu $t1,cadena($t0)
          beqz $t1, fin
          beq $t1,$a0, es_vocal
          daddi $t0,$t0,1
          j loopardo

    es_vocal: daddi $v0,$v0,1

fin: jr $ra
