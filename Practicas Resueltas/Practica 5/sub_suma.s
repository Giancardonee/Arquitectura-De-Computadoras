# ESTE PROGRAMA HACE UNA SUMA USANDO SUBRUTINAS Y REGISTROS DE CONVENCION
# en este caso, no usamos variables para numeros.
#  la unica variable que usaremos es para almacenar el resultado

OBVIAMENTE NO VAMOS A USAR UNA SUBRUTINA PARA HACER ESTO
PERO ES PARA IR FAMILIARIZANDONOS CON LAS SUBRUTINAS DEL WINMIPS :)

.data
RES: .word 0
.code
daddi $a0, $zero, 5
daddi $a1, $zero, 10
jal SUMARDA
sd $v0, RES($zero)
halt

SUMARDA: dadd $v0, $a0, $a1
         jr $ra
