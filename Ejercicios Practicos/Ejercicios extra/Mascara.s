# Consigna: En el registro a0 (que es de 32 bits en RISC-V RV32I) se empaquetaron 4 datos cada uno de 1 byte. Usando operaciones lógicas colocar en los registros a1, a2, a3 y a4 cada uno de los 4 datos.

.text
main:
    lw a0, n
    
    jal ra, enmascarar

    li a7, 1
    ecall

    li a7, 10
    ecall
    
# Se puede implementar iterativo/ recursivo para que sea mas elegante y no tener instrucciones repetidas  
enmascarar:
    li t0 0xff000000
    and a1, a0, t0 # a1 tiene el primer byte de a0 pero al principio
    srli a1, a1, 24
    srli t0, t0, 8
    and a2, a0, t0 # a2 tiene el segundo byte de a0 pero a la mitad
    srli a2, a2, 16
    srli t0, t0, 8
    and a3, a0, t0 # a3 tiene el tercer byte de a0 pero a la mitad
    srli a3, a3, 8
    srli t0, t0, 8
    and a4, a0, t0 # a4 tiene el cuarto byte de a0 bien puesto
    
    
    
.data
n: .word 0x11223344

