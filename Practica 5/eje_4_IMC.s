
#IMC = peso / (estatura)2

#Infrapeso (IMC < 18,5), Normal (18,5 ≤ IMC < 25), Sobrepeso (25 ≤ IMC < 30) y Obeso (IMC ≥ 30).


.data
peso: .double 68.0
estatura: .double 1.70
infrapeso: .double 18.5
normal: .double 25.0
sobrepeso: .double 30.0
obeso: .double 30.0
estado: .double 0.0
.code
L.D f1,peso(r0)
L.D f2,estatura(r0)
mul.d f3, f2,f2 # estatura al cuadrado
div.d f4, f1,f3 # f4 = IMC
L.D f10, infrapeso(r0)
L.D f11, normal(r0)
L.D f12, sobrepeso(r0)
L.D f13, obeso(r0)
L.D f15, estado (r0)

Comparo_Infrapeso: C.LT.D f4, f10 #Compara y deja flag=1 si es menor
                   BC1T Result_Infrapeso #Si flag=1 salta a Result_infrapeso

            #si es mayor que 18.5, NO salta, y avanzo :

Comparo_normal: C.LT.D f4, f11
                BC1T Result_Normal

                #si es mayor que 25, NO salta, y avanzo:

Comparo_sobrepeso: C.LT.D f4, f12
                   BC1T Result_Sobrepeso

                # si no saltó antes, es porque el IMC corresponde a obeso
                # no hace falta comparar si el IMC es mayor que 30....

Result_Obeso: daddi r1,r1,0
              mtc1 r1, f5
              j fin



Result_Infrapeso: daddi r1,r0,1
                  mtc1 r1, f5
                  j fin

Result_Normal:    daddi r1,r0,2
                  mtc1 r1, f5
                  j fin

Result_Sobrepeso: daddi r1, r0, 3
                  mtc1 r1, f5
                  j fin

#f5, valor correspondiente del resultado del IMC

fin: S.D f5,estado(r0) #guardo el resultado correspondiente, en estado
     halt

