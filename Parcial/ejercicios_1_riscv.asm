.text:

# inicializar programa

# recorrer arreglo y acumular

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
