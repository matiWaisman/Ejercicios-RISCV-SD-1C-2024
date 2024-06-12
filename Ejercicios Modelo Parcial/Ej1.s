.text
main:
    li s0 0x37A2F011
    jal ra contar_impares
    
    li a7, 1
    ecall

    li a7, 10
    ecall
    
contar_impares:
    li a0, 0
    
    li t0, 0xFF000000
    and t1, s0, t0 # Tengo solo los valores del byte mas significativo
    srli t1, t1, 24 # Tengo los valores del byte mas significativo en el menos significativo
    andi t1, t1, 1 # Solo va a sobrebivir el bit menos significativo
    add a0, a0, t1 # Si habia un 1 en el menos significativo es porque es impar, entonces sumo. Si habia un 0 va a quedar un 0 por lo que sumar es lo mismo
    
    srli t0, t0, 8 # Muevo los 1's al segundo byte
    and t1, s0, t0 # Tengo solo los valores del segundo byte mas significativo
    srli t1, t1, 16 # Tengo los valores del segundo byte mas significativo en en el menos significativo
    andi t1, t1, 1 # Solo va a sobrevivir el bit menos significativo
    add a0, a0, t1 # Si habia un 1 en el menos significativo es porque es impar, entonces sumo. Si habia un 0 va a quedar un 0 por lo que sumar es lo mismo
    
    srli t0, t0, 8 
    and t1, s0, t0
    srli t1, t1, 8
    andi t1, t1, 1
    add a0, a0, t1
    
    srli t0, t0, 8
    and t1, s0, t0
    andi t1, t1, 1
    add a0, a0, t1
    
    ret
    

    