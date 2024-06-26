.text:
main:
    la a0, array 
    lw a1, long
    
    
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
         sw a1, 0(sp) # Guardo la cantidad de elementos restantes + 1 
         li t1 1
         beq a1, t1, base_case # Si es uno vamos al caso base
         addi a0, a0, 4
         addi a1, a1, -1
         jal ra, max_array
         lw t0 4(sp) # Restauro la posicion original de a0
         lw t0 0(t0) # En t0 esta el valor de lo que contenia la posicion original de a0 
         lw t3 0(sp) # Restauro la longitud original de a2
         bge a0, t0, epilogo # Si el valor de a0 es mas grande me quedo con ese entonces voy directo al epilogo, si no me quedo con t2
             add a0, zero, t0
             j epilogo
             
    base_case:
        lw a0, 0(a0) # Guardo en a0 lo que diga la posicion de memoria 0 de a0
        
    epilogo:
        lw a1, 0(sp) # Restauro el valor de a2 del llamado anterior
        #lw a0, 4(s0x00000003p) # Restauro el valor de a0 del llamado anterior
        lw ra, 8(sp) # Restauro la direccion del stack pointer del llamado anterior
        addi sp, sp, 12 # Libero espacio desapilando los dos datos
        ret
         


.data
array: .word 0x00000003, 0x00000001, 0x00000009
long: .word 0x000000003
