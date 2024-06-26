.text:
main:
    lb a0, largo
    la a1, mediciones
    li a2, 0x0F00
    
    
    jal ra medir
    
    li a7, 1
    ecall

    li a7, 10
    ecall

medir:
    add t0, a0, zero # Uso t0 como iterador
    add t1, a0, zero # Guardo en t1 el largo original
    li a0, 0
    while:
        beq t0, zero, decidir
        lhu t2, 0(a1) # Como no extiende signo va a quedar siempre positivo. Si no pudiera usar lhu hago un XOR con 0xFFFF
        addi t0, t0, -1
        addi, a1, a1, 2
        blt t2, a2, while
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
mediciones: .half 0xA200 0x00F0 0xA200 0xA200 0x1000
largo: .byte 4
    
    