.text
main:
    lw a0, target
    lw a2, n
    la a3, array

    jal ra, binary_search

    li a7, 1
    ecall

    li a7, 10
    ecall
    
    binary_search:
        li t0, 0 # Representa el Low
        addi a2, a2, -1 # Representa el high
        prologo:
            addi sp, sp, -12 # Hago espacio para guardar 3 cosas en el stack No guardo la posicion de inicio del array ni el numero que busco porque eso es constante
            sw ra, 8(sp)
            sw a2, 4(sp)
            sw t0, 0(sp)
            bgt t0, a2, no_encontre
            
            # En t1 esta mid, lo calculo:
            sub t1, a2, t0 
            srli t1, t1, 1
            add t1, t1, t0 # Ya es mid
            # A A0 lo dejo siempre en la posicion inicial del array
            slli t1, t1, 2 #Multiplico por 4 la posicion que representa el mid y esa ya va a ser la posicion del array que quiero
            add t2, t1, a3
            lw t3, 0(t2) # t3 tiene el valor de la posicion mid del array
            srli t1, t1, 2 # Divido por 4 la posicion porque antes la habia multiplicado para usar en el array
            beq t3, a0, encontre
            blt t3, a0, avanzar # arr[mid] < target
            
            # arr[mid] > target
            add a2, t1, zero
            addi a2, a2, -1
            jal ra prologo
            j epilogo
                
                avanzar: 
                    add t0, t1, zero
                    addi t0, t0, 1
                    jal ra, prologo
                    j epilogo
                
                no_encontre:
                    li a0, -1
                    j epilogo
                encontre:
                    add a0, t1, zero
                    addi a0, a0, 1
            
                  
            
        epilogo:
            lw ra, 8(sp)
            lw a2, 4(sp)
            lw t0, 0(sp)
            addi sp, sp, 12 # Desapilo las 3 cosas del stack
            ret
            
    
         
.data
array: .word 1, 3, 5, 7, 9, 11, 13, 15, 17, 19 
target: .word 17 
n: .word 10
