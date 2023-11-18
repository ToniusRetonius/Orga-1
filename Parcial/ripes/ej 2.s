# la idea será tomar un elemento del src y realizarle un XOR con su respectivo elemento
# en el dst. La idea será iterar simultaneamente los arrays 
# la idea será modificar el array dst con los resultados del XOR 
main:
    la a0, src
    la a1, dst
    li a2, 12
    call XorEspejo
    la ra, dst
check: 
    lw s4, 0(ra)
    lw s5, 4(ra)
    lw s6, 8(ra)
    lw s7, 12(ra)
    lw s8, 16(ra)
    lw s9, 20(ra)

halt: j halt

XorEspejo:
    # me guardo de donde empiezan los arr para poder offsetear al sig elem
    mv s0, a0
    mv s1, a1
    # me guardo la length
    mv s2, a2
    
loop:
    # mi res será manipulado en s3
    mv s3, x0
    # condición de ciclo y i--;
    beqz s2, return
    addi s2,s2,-1
    
    # cargo la data en mis registro de arg de función
    lw a0, 0(s0)
    lw a1, 0(s1)
    
    # ejecuto la operación 
    # XOR rd,rs1,rs2 
    # podría usar el stack para guardarme todas las comp y hacer un pop luego? 
    # quedaría desordenada
    # para hacer esto utilizo store word
    # SW rs2, offset(rs1)
    # almacena los cuatro bytes menos sign del registro x[rs2] a memoria en la dirección x[rs1] + sign-ext(offset)
    xor s3, a0, a1
    sw s3, 0(s1)
    
    # quiero mover la pos de lectura de datos tanto en src como en dst
    addi s0,s0, 4
    addi s1,s1,4
     
    j loop
return: 
    # queremos devolver el inicio del array modificado dst
    # y eso coincide con la etiqueta .dst
    la a1, dst
    ret
    
imprimir:
    la t2, dst
    # Cantidad de datos.
    li t3, 12
loop_imprimir:
    beqz t3, exit
    addi t3, t3, -1
    lw t4, 0(t2)
    # Imprime el resultado
    mv a0, t4
    li a7, 34
    ecall
    addi t2, t2, 4

    j loop_imprimir
exit:
    # Termina el programa.
    li a0, 0
    li a7, 93
    ecall

.data:
src:
.word 0xffffffff, 0x95555555, 0xf4444444, 0xf1111111
.word 0xffffff00, 0xf5005555, 0x95444444, 0xf1113311
.word 0xff00ffff, 0xf5550055, 0xa4444433, 0xa1551111      
dst:
.word 0xf5005555, 0x95444444, 0xf1113311, 0xffffff00
.word 0xf1111111, 0xffffffff, 0x95555555, 0xf4444444
.word 0xa1551111, 0xff00ffff, 0xf5550055, 0xa4444433
