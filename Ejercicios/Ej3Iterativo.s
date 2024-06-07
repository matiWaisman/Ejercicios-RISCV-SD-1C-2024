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
        li t1 1
        and t1 t1 a2
        addi a2, a2, -1
        addi a0, a0, 4
        addi a1, a1, 4
        beq t1, zero, while
        lw t0, -4(a1) # Cargo en t0 la informacion del arreglo 2 
        sw t0, -4(a0) # Lo guardo en el arreglo 1
        j while
    end_while:
        ret
    
         
.data
# Pone contiguos en memoria estos cuatro datos
array1: .word 1, 1, 1, 1, 1, 1, 1, 1
array2: .word 3, 5, 4, 6, 5, 9, 2, 6
long: .word 0x000000008