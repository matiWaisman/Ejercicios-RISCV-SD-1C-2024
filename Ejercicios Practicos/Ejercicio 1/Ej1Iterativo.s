.text:
main:
    la a0, array 
    lw a2, long
    
    jal ra, max_array

    li a7, 1
    ecall

    li a7, 10
    ecall

# a0 es la direccion del primer elemento del arreglo
# a1 es la longitud del arreglo
# t0 es el mayor elemento actual del arreglo
max_array:
    lw t0, (0)a0 # Cargo en t0 el valor del primer elemento del array
    while:
        beq a2, zero, end_while
        lw t1, (0)a0 # Cargo en t1 el valor del elemento actual que estoy viendo
        blt t1, t0, final # Si el actual es menor al maximo ni me importa
        addi t0, t1, 0 # Si es mas grande t0 pasa a valer t1 que es el nuevo maximo 
    final:
        addi a0, a0, 4 # Ir a la siguiente posicion del array
        addi a2, a2, -1 # Decrementar el while
        j while
    end_while:
        mv a0, t0
        ret
    
    

.data
# Pone contiguos en memoria estos cuatro datos
array: .word 0x00000003 0x00000001 0x00000004 0x00000001 0x00000005 0x00000009 0x00000002 0x00000006
long: .word 0x00000008
