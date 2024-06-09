.text:
main:
    lw a0, n0 
    
    jal ra factorial
    
    li a7, 1
    ecall

    li a7, 10
    ecall
    
multiplicar:
    addi a1, a1, -1
    add t0, a0, zero
    while:
        beq a1, zero, end
        add, a0, a0, t0
        addi a1, a1, -1
        j while
        end:
            ret

factorial: 
    prologo:
        beq a0, zero, base_case
        addi sp, sp, -8
        sw ra, 4(sp)
        sw a0, 0(sp)
        addi a0, a0, -1
        jal ra, prologo
        lw a1, 0(sp) # Restauro el valor de a0 original
        jal ra multiplicar
        j epilogo
    
    base_case:
        li a0, 1
        
    epilogo:
        lw ra, 4(sp)
        addi sp, sp, 8
        ret
        

.data
n0: .word 30