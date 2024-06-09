.text:
main:
    lw a0, n 
    
    jal ra n_sum
    
    li a7, 1
    ecall

    li a7, 10
    ecall
    
n_sum:
    add t0, a0, zero
    addi t0, t0, -1 # Arranco con t0 en a0 - 1 porque el primer numero ya esta sumado
    while:
        beq t0 zero fin
        add a0, a0, t0
        addi t0, t0, -1
        j while
        fin:
            ret


.data
n: .word 5