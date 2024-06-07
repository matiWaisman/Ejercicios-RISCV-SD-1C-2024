.text:
main:
    la a0, array 
    lw a2, long
    li t1 1
    
    jal ra, max_array

    li a7, 1
    ecall

    li a7, 10
    ecall
    
max_array: 
    prologo: 
         addi sp, sp, -12 # Apilo en el stack 
         sw ra, 8(sp) # Guardo en memoria el return adress actual
         sw a0, 4(sp) # Guardo en memoria la posicion de a0 actual
         sw a2, 0(sp) # Guardo en memoria el indice del elemento que estoy viendo
         addi a0, a0, 4
         addi a2, a2, -1
         beq a2, t1, base_case # Si es uno vamos al caso base
         jal ra, max_array
         lw t0 4(sp) # Restauro la posicion original de a0
         lw t2 0(t0) # En t2 esta el valor de lo que contenia la posicion original de a0 
         lw t3 0(sp) # Restauro la longitud original de a2
         bge a0, t2, epilogo # Si el valor de a0 es mas grande me quedo con ese entonces voy directo al epilogo, si no me quedo con t2
             add a0, zero, t2
             j epilogo
             
    base_case:
        lw a0, 0(a0) # Guardo en a0 lo que diga la posicion de memoria 0 de a0
        
    epilogo:
        lw a2, 0(sp) # Restauro el valor de a2 del llamado anterior
        #lw a0, 4(sp) # Restauro el valor de a0 del llamado anterior
        lw ra, 8(sp) # Restauro la direccion del stack pointer del llamado anterior
        addi sp, sp, 12 # Libero espacio desapilando los dos datos
        ret
         


.data
# Pone contiguos en memoria estos cuatro datos
array: .word 0x00000003, 0x00000001, 0x00000009
long: .word 0x000000003