.text:
main:
    lw a0, largo
    la a1, mediciones
    
    jal ra medir
    
    li a7, 1
    ecall

    li a7, 10
    ecall

medir:
    add t0, a0, zero # Uso t0 como iterador
    add t1, a0, zero # Guardo en t1 el largo original
    li a0, 0
    li t2, 0x0F00
    while:
        beq t0, zero, decidir
        lh t3, 0(a1) # Cargo en t3 la medicion actual, al ser una HW al cargarla en 32 bits no se le va a extender el signo asi que va a ser siempre positiva.
        addi t0, t0, -1
        addi, a1, a1, 2
        blt t3, t2, while
        addi a0, a0, 1
        j while
    decidir:
        srli t1, t1, 1 # Divido por 2 al largo original
        add t0, a0, zero
        li a0, 0
        bgt t1, t0, fin
        li a0, 1
        fin:
            ret

.data:
mediciones: .half 0x1100 0x00F0 0xA200 0x1000 0x00F0
largo: .byte 5
    
    