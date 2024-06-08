.text
main:
    la a0, array1 
    la a1, array2
    lw a2, long
    
    
    jal ra, max_array

    li a7, 1
    ecall

    li a7, 10
    ecall
    
max_array:
    while:
        beq a2, zero, end_while
        lw t0, 0(a1) # Cargo en t0 la informacion del arreglo 2 
        sw t0, 0(a0) # Lo guardo en el arreglo 1
        addi a0, a0, 4
        addi a1, a1, 4
        addi a2, a2, -1
        j while
    end_while:
        ret
    
         
.data
# Pone contiguos en memoria estos cuatro datos
array1: .word 1, 1, 1, 1, 1, 1, 1, 1
array2: .word 3, 1, 4, 1, 5, 9, 2, 6
long: .word 0x000000008