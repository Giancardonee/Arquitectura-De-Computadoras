.data
valor1: .word 16
valor2: .word 4
result: .word 0

 .text
ld $a0, valor1($zero) # $a0 = 16
ld $a1, valor2($zero) # $a1 = 4
jal a_la_potencia
sd $v0, result($zero)
halt
a_la_potencia: daddi $v0, $zero, 1 $v0 = +1
 lazo: slt $t1, $a1, $zero
 # compara $a1 (4) con cero. mientras $a1 sea menor que 0, el registro $t1 va a valer 0

bnez $t1, terminar  # si $t1 vale 1, va a terminar
daddi $a1, $a1, -1  #dec $a1 (variable cont)
dmul $v0, $v0, $a0  #hace la potencia
j lazo #vuelve a loopear
 terminar: jr $ra


 #6_a) El siguiente programa hace las primeras 4 potencias de 16
 #el codigo del programa esta estructurado, para usar subrutinas mediante registros de convencion.

 #6_b)La instruccion JAL= salta a la direccion rotulada, y copia en          r31 ($ra con convencion) la direccion de retorno
 #** Lo asocio a un CALL de msx**

 #La instruccion JR Rd(registro destino)= salta a la DIRECCION contenida en el registro destino

 #6_c) En el registro $ra (r31) se almacena el valor de la direccion de retorno de la subrutina.

 #
