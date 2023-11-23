main:   
SET R1, 0x03
SET R2, 0x00
SET R3, rai
STR [0x00], R3
STI

loop:
CMP R1, R2
JZ fin
JMP loop

fin:
CLI

halt:
JMP halt

rai:
DEC R1
IRET

// a) asignaciones.. loop : comparamos R1 con R2 fin : desactivamos interrupciones rai: r1-- retorno 
// b) el bucle se ejecuta hasta qye R1 = R2  por tanto son necesarias 3 interrupciones 
// c) se ejecuta rai
// d) no debería haber problema pues el flag I está en 0 