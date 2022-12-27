.data
num1: .double 4
num2: .double 3
num3: .double 10
res: .double 0

.code
L.D F1,num1(r0)
L.D F2,num2(r0)
L.D F3,num3(r0)
add.d F4,F2,F1
nop
mul.d F4,F4,F3
S.D F4,res(r0)

halt
