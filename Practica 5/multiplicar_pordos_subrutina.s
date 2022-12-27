# este programa multiplica por 2 los elementos de un vector
# mediante el llamado a una subrutina multiplicar

.data
tabla: .word 2,4,6
.code
daddi $s0, $zero, 3 ; long
daddi $s1, $zero, 0 ; desplazamiento
loop: ld $a0, tabla($s1)
      jal multiplicar
      sd $v0, tabla($s1)
      daddi $s1, $s1,8   ; sumo para desplazarme a sig elemento
      daddi $s0, $s0, -1 ; dec long
      bnez $s0,loop      ; si $s0 no es = 0, anda a loop
      halt

multiplicar: daddi $t0, $zero, 2
; basicamente,$t0 = 2, este valor lo usa para multiplicarlo
; $t0, es un valor temporal para usar dentro de una subrutina
             dmul $v0, $a0, $t0
             jr $ra
