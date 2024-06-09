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
        addi sp, sp, -12 # Apilo en el stack el Ra, el parametro actual y despues voy a apilar n-1
        sw ra, 8(sp)
        sw a0, 4(sp)
        li t0, 2
        blt a0, t0, epilogo # Si a0 es 1 o 0 el valor de retorno = el valor del parametro
        # a0 > 1
        addi a0, a0, -1
        jal ra prologo
        sw a0, 0(sp) # Guardo el valor de fibo(n-1)
        lw a0 4(sp) # Restauro el valor original de a0 como parametro
        addi a0, a0, -2
        jal ra prologo
        lw t1, 0(sp) # Cargo el resultado de n-1
        add a0, a0, t1
        
            
    epilogo:
        lw ra, 8(sp)
        addi sp, sp, 12
        ret
    
.data
n: .word 7
    
