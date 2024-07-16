#este programa compara y recorre dos cadenas de caracteres
#si ambas cadenas son iguales, res = -1
#si ambas cadenas NO son iguales, res = 0

.data
cadena1: .asciiz "hola"
cadena2: .asciiz "hola"
result:  .word 0
.code
daddi $a0, $zero, cadena1
daddi $a1, $zero, cadena2
jal comparo
sd $v0, result($zero)
halt

comparo: lbu $t0, 0($a0)
         lbu $t1, 0($a1)
         daddi $v0, $v0, -1
         bne $t1, $t0,no_iguales
         beqz $t0,fin
         beqz $t1,fin
         daddi $a0, $a0, 1
         daddi $a1, $a1, 1
         j comparo

no_iguales: daddi $v0, $zero, 0
fin: jr $ra

