# mi idea sera iterativamente hacer el or sobre los valores del arreglo de
# 12 elementos de 32 bits que ocupan posiciones impares
# para lograrlo,
    # hago un load adrr en a0 de la etiqueta Data 
    # hago un load imm en a1 de la length 
       
.main:
main:
    la a0, arr
    li a1, 12
    call OrIterativo
    
halt: j halt

OrIterativo:
    # cargo en s0 la dirección que tengo en a0 para poder ir moviendome de una posicion impar a la siguiente dentro del loop offseteado para que comience en la posicion impar
    # la longitud del array en s1 
    # importante la return adrr por tanto uso s2 = ra
    # inicializo s3 en 0x00 para guardarme los resultados del OR
    mv s0, a0
    lw a0, 4(s0) 
    mv s1, a1
    mv s3, x0
loop:
    # condicion de ciclo
    beqz s1, return
    
    # i -2;
    addi s1, s1, -2
    
    # necesito tener el elemento a comparar 
    # load word lw rd, offset(rs1)
    # carga cuatro bytes de memoria en la dire x[rs1] + sign-ext(offset) y los escribe en x[rd]    
    lw a0, 4(s0) 
    
    # el OR rd,rs1,rs2 
    # calcula el OR inclusivo a nivel de bits de los reg x[rs1] y x[rs2] y guarda el res en x[rd]
    or s3, s3, a0
    
    # proxima direccion de elemento impar 
    addi s0,s0,8
    
    j loop
    
return:
    # ya tenemos s3 calculado y nos queda ponerlo en el registro apropiado para valores de retorno
    mv a0, s3
    ret
exit:
    # Imprime la suma
    mv a0, t4
    li a7, 34
    ecall

    # Termina el programa.
    li a0, 0
    li a7, 93
    ecall

.data:
arr:
.word	0xffffffff, 0x95555555, 0xf4444444, 0xf1111111
.word	0xffffff00, 0xf5005555, 0x95444444, 0xf1113311
.word	0xff00ffff, 0xf5550055, 0xa4444433, 0xa1551111  