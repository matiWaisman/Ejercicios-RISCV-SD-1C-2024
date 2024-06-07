# Consigna: https://cses.fi/problemset/task/1068
.text

main:
    lw a0, input
    jal ra, weird
    # el jal pone en ra el pc+4

    li a7, 93
    ecall

weird:
    # Prólogo
    addi t0, zero, 1
    addi sp, sp, -8
    sw ra, 4(sp)
    sw a0, 0(sp)
    
    li a7, 1
    ecall
    
    beq a0, t0, epilogo  # Si A0 es 1 vamos al epilogo directo porque terminamos
    
    and t1, a0, t0       # Si t0 es 1 es impar, si no es par
    beq t1, zero, esPar
    
    # Es impar
    addi t2, zero, 3
    mul a0, a0, t2
    addi a0, a0, 1
    jal ra, weird
    
    lw t0, 0(sp)
    j epilogo

esPar:
    srli a0, a0, 1
    jal ra, weird

epilogo:
    lw a0, 0(sp)
    lw ra, 4(sp)
    addi sp, sp, 8
    ret

.data
input: .word 0x00000003
