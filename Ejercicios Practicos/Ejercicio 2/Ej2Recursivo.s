.text
main:
    la a2, s 
    la a3, q
    lw a4, long
    
    
    jal ra, copiar

    li a7, 1
    ecall

    li a7, 10
    ecall

    copiar:
        prologo:
            addi sp, sp, -16 # Me hago lugar para apilar 4 cosas el el stack 
            sw ra, 12(sp)
            sw a4, 8(sp)
            sw a2, 4(sp)
            sw a3, 0(sp)
        
            lw t0 0(a3) # Cargo en t0 lo que diga la posicion actual de q
            sw t0, 0(a2) # Sobreescribo la posicion actual de s con lo que haya en q
            addi a2, a2, 4
            addi a3, a3, 4
            addi a4, a4, -1
            beq a4, zero, epilogo #Si A4 es cero ya copiamos todos los elementos
            jal ra copiar
            
        epilogo:
            lw ra, 12(sp)
            lw a4, 8(sp)
            lw a2, 4(sp)
            lw a3, 0(sp)
            addi sp, sp, 16 # Desapilo todo del stack
            ret
        
     
    
.data
s: .word 1, 1, 1, 1, 1, 1, 1, 1
q: .word 3, 1, 4, 10, 5, 9, 2, 6
long: .word 0x000000008