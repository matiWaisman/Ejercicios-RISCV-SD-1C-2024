.text:
main:
    lw a0, n
    la a2, array
    
    jal ra sumar
    
    li a7, 1
    ecall

    li a7, 10
    ecall
    
sumar:
    add t0, a0, zero # Con t0 recorro el array
    li a0, 0 # Con a0 acumulo el resultado
    while:
        beq t0, zero, fin
        lh t1, 0(a2) # Lh extiende el signo
        add a0, a0, t1
        addi a2, a2, 4
        addi t0, t0, -1
        j while    
    fin:
        ret

    
.data
n: .word 12
array: .word 0xffff 0x1111 0xfff0 0x8888 0x0003 0x0001 0x0000 0x8088 0x0202  0x8081 0x2222 0x5555
