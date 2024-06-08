.text
main:
    la a0, s 
    la a1, q
    lw a2, long
    
    
    jal ra, copiar

    li a7, 1
    ecall

    li a7, 10
    ecall
    
copiar:
    while:
        beq a2, zero, end_while
        lw t0, 0(a1) # Cargo en t0 la informacion de q
        sw t0, 0(a0) # Lo guardo en el arreglo s
        addi a0, a0, 4
        addi a1, a1, 4
        addi a2, a2, -1
        j while
    end_while:
        ret
    
         
.data
# Pone contiguos en memoria estos cuatro datos
s: .word 1, 1, 1, 1, 1, 1, 1, 1
q: .word 3, 1, 4, 1, 5, 9, 2, 6
long: .word 0x000000008