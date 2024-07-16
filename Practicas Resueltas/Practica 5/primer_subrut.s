#Este programa hace una suma, y la almacena en la variable result
#todo esto lo hace mediante registros de convención.

.data
result: .word 0
.code
daddi $a0, $zero, 6
daddi $a1, $zero, 9
jal sumar
sd $v0, result(r0)
halt

sumar: dadd $v0, $a0,$a1
       jr $ra

       ; estos valores se usan para pasar parametros a subrutinas
       #R4 = $a0
       #R5 = $a1
       #R2 =$v0
       #JR31 = $RA

