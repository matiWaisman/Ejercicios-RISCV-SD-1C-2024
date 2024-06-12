.text:
main:
    lw a0, n
    jal ra, factorial

    li a7, 1
    ecall

    li a7, 10
    ecall
    
    
factorial:
    prologo:
        addi sp, sp, -8
        sw ra, 4(sp)
        sw a0, 0(sp)
        li t0, 1
        addi a0, a0, -1
        beq t0, a0, fin # Si estamos en el caso base no hay que hacer nada porque a0 ya tiene su valor (1)
        jal ra factorial
        add t0, a0, zero # En t0 guardo el valor del resultado recursivo anterior
        lw a0, 0(sp) # Restauro el valor de a0 como parametro
        mul a0, a0, t0         
    epilogo:
        lw ra, 4(sp)
        addi sp, sp, 8
    fin:
        ret

# El unico registro que uso que hay que preservar su valor despues de la llamada a la funcion es el sp. Lo que hago para preservarlo es al final de cada llamada sumo para dejarlo a donde estaba al principio de la llamada anterior. Al final de todos los llamados como se van a contrarrestar todas las restas (apilar) con todas las sumas (desapilar) al final de la funcion va a tener su valor original.
# Despues uso el registro a0 que entra como parametro como valor de retorno de la funcion como indica la convencion.
# Por ultimo todos los demas valores intermedios los almaceno en registros temporales los cuales no tengo que restaurar en ningun momento. 

.data
n: .word 5
    