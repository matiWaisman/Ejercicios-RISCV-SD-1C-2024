.text:
main:
    lw a2, n
    la a3, fuente
    la a4, destino
    
    jal ra xorear

    li a7, 10
    ecall
    
xorear:
    #Uso a a2 como iterador
    while:
        beq a2, zero, fin
        lw t0, 0(a3)
        lw t1, 0(a4)
        xor t0, t0, t1
        sw t0, 0(a4)
        addi a3, a3, 4
        addi a4, a4, 4
        addi a2, a2, -1
        j while
    fin:
        ret


    
.data
n: .word 12
fuente: .word 0xffffffff, 0x95555555 , 0xf4444444 , 0xf1111111, 0xffffff00, 0xf5005555 ,0x95444444 , 0xf1113311, 0xff00ffff, 0xf5550055 , 0xa4444433 , 0xa1551111
destino: .word 0xf5005555 ,0x95444444 , 0xf1113311 , 0xffffff00 , 0xf1111111 , 0xffffffff , 0x95555555 , 0xf4444444, 0xa1551111 , 0xff00ffff , 0xf5550055 , 0xa4444433

