.text:
main:
    lw a0, n 
    
    jal ra n_sum
    
    li a7, 1
    ecall

    li a7, 10
    ecall
    
n_sum:
    prologo:
        addi sp, sp, -8
        sw ra 4(sp)
        sw a0 0(sp)
        beq a0, zero, epilogo
        addi a0, a0, -1
        jal ra n_sum
        add t0, a0, zero # El resultado del llamado recursivo
        lw a0, 0(sp) # Restauro el valor del parametro
        add a0, a0, t0
    
    epilogo:
        lw ra 4(sp)
        addi sp, sp, 8
        ret


.data
n: .word 6