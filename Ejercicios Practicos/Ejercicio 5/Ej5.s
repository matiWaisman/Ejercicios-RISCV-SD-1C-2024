.text
main:
    lw a0 n
    jal ra, fibonacci

    li a7, 1
    ecall

    li a7, 10
    ecall
    
fibonacci:
    prologo:
        
        addi sp, sp, -16 # Apilo en el stack el Ra, el parametro actual y despues voy a apilar n-1
        sw ra, 12(sp)
        sw a0, 8(sp)
        sw s0, 4(sp)
        li t0, 2
        
        blt a0, t0, epilogo # Si a0 es 1 o 0 el valor de retorno = el valor del parametro
        # a0 > 1
        addi a0, a0, -1
        jal ra prologo
        sw a0, 0(sp) # Guardo el valor de fibo(n-1)
        lw a0 8(sp) # Restauro el valor original de a0 como parametro
        addi a0, a0, -2
        jal ra prologo
        lw s0, 0(sp) # Cargo el resultado de n-1
        add a0, a0, s0
        
            
    epilogo:
        lw ra, 12(sp)
        lw s0, 4(sp)
        addi sp, sp, 16
        ret
    
.data
n: .word 7
    
