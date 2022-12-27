#EL SIGUIENTE PROGRAMA COMPARA UN CARACTER
#NOS PIDEN HACER UNA SUBRUTINA QUE RETORNE:
#1 SI EL CARACTER ES VOCAL
#0 SI EL CARACTER NO ES VOCAL


.data
car: .asciiz "e"
cadena: .asciiz "AEIOUaeiou"
result: .word 0
.code
lbu $a0, car($zero) ; traemos el car a $a0
jal Vocal_o_no
sd $v0,result($zero) ; guardamos el resultado de la subrutina en la variable res
halt

    Vocal_o_no: daddi $v0, $v0, 0 ; resultado
                daddi $t0, $t0, 0 ; desplazaamiento
loopardo: lbu $t1,cadena($t0)   ; traemos una vocal de la cadena
          beqz $t1, fin         ; si es 00 es xq llegamos al final, entonces jmp fin
          beq $t1,$a0, es_vocal
# comparamos si el car es igual a alguna letra de la cadena
          daddi $t0,$t0,1
# incrementamos $t0 para desplazarnos al sig car de la cadena
          j loopardo


    es_vocal: daddi $v0,$v0,1

fin: jr $ra
