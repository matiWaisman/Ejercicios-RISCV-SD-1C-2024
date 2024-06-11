# Consigna: Un aula tiene N pibes. Para pasar lista se le asignó a c/u un número (del 0 al N). El problema es que como constantemente los pibes entran y salen resulta difícil saber quiénes están dentro del aula. Cada pibe es un bit

# Asumo que no me pasan el aula (en que palabra esta) para hacerlo un poquito mas dificil.
.text
main:
 lw a2, n
 la a3, p
 lw a4, alumno1
 lw a5, alumno2
 jal ra aula_lo_sigue_a

li a7, 10
ecall
 

# Modifica el bit correspondiente a `id_pibe` marcándolo como "adentro del aula" (1) 
aula_entro:
    bgt a4, a2, imposible # Si el alumno a modificar es mayor a la cantidad de alumnos no podemos modificarlo
    
    addi sp, sp, -4  
    sw ra, 0(sp) 
    
    # Primero calculo en que aula esta. 
    li t0, 32
    div t1, a4, t0 # Aca tengo el cociente entero
    # Calculo que numero es en la nueva palabra. Ej si tengo 43 es la posicion 11
    mul t0, t0, t1
    sub a4, a4, t0 # A4 tiene la posicion final dentro de la palabra
    li t0, 4
    mul t0, t0, t1
    add t0, a3, t0 
    lw t2, 0(t0) # t2 tiene la palabra a modificar
    li t3, 32
    sub a4, t3, a4 # a4 tiene la posicion relativa a modificar en la palabra. Por ejemplo si queremos modificar el alumno 8 tenemos que ir desde el bit menos significativo 24 para atras
    li t3, 1 
    sll t3, t3, a4 
    or t2, t2, t3 # Modifico la posicion
    sw t2, 0(t0) # La guardo en la original
    lw ra, 0(sp)     
    addi sp, sp, 4   
    ret
    imposible:
        ret
# Modifica el bit `id_pibe` marcándolo como "fuera del aula" (0)
aula_salio:
    bgt a4, a2, imposible # Si el alumno a modificar es mayor a la cantidad de alumnos no podemos modificarlo
    
    addi sp, sp, -4  
    sw ra, 0(sp) 
    
    # Primero calculo en que aula esta. 
    li t0, 32
    div t1, a4, t0 # Aca tengo el cociente entero
    # Calculo que numero es en la nueva palabra. Ej si tengo 43 es la posicion 11
    mul t0, t0, t1
    sub a4, a4, t0 # A4 tiene la posicion final dentro de la palabra
    
    li t0, 4
    mul t0, t0, t1
    add t0, a3, t0 
    lw t2, 0(t0) # t2 tiene la palabra a modificar
    
    li t3, 32
    sub a4, t3, a4 # a4 tiene la posicion relativa a modificar en la palabra. Por ejemplo si queremos modificar el alumno 8 tenemos que ir desde el bit menos significativo 24 para atras
    li t3, 1
    sll t3, t3, a4
    not t3, t3
    and t2, t2, t3 # Modifico la posicion
    sw t2, 0(t0) # La guardo en la original
    
    lw ra, 0(sp)     
    addi sp, sp, 4   
    ret
 
# Conmuta el bit correspondiente a `id_pibe`: Si estaba afuera pasa a estar adentro y Si estaba adentro pasa a estar afuera
aula_paso_por_la_puerta:
    bgt a4, a2, imposible # Si el alumno a modificar es mayor a la cantidad de alumnos no podemos modificarlo
    
    addi sp, sp, -4  
    sw ra, 0(sp) 
    
    # Primero calculo en que aula esta. 
    li t0, 32
    div t1, a4, t0 # Aca tengo el cociente entero
    # Calculo que numero es en la nueva palabra. Ej si tengo 43 es la posicion 11
    mul t0, t0, t1
    sub a4, a4, t0 # A4 tiene la posicion final dentro de la palabra
    
    li t0, 4
    mul t0, t0, t1
    add t0, a3, t0 
    lw t2, 0(t0) # t2 tiene la palabra a modificar
    li t3, 32
    sub a4, t3, a4 # a4 tiene la posicion relativa a modificar en la palabra. Por ejemplo si queremos modificar el alumno 8 tenemos que ir desde el bit menos significativo 24 para atras
    
    li t3, 1
    sll t3, t3, a4
    xor t2, t2, t3 # Modifico la posicion
    sw t2, 0(t0) # La guardo en la original
    lw ra, 0(sp)     
    addi sp, sp, 4   
    ret
    

# Copia el estado de `pibe_src` al estado de `pibe_dst`  
# Asumo que los dos estan en el mismo aula      
aula_lo_sigue_a:
    addi sp, sp, -4  
    sw ra, 0(sp)   
    
    bgt a4, a2, imposible # Si el alumno a modificar es mayor a la cantidad de alumnos no podemos modificarlo
    bgt a5, a2, imposible # Si el alumno a modificar es mayor a la cantidad de alumnos no podemos modificarlo
    
    # Primero calculo en que aula estan. 
    li t0, 32
    div t1, a4, t0 # Aca tengo el cociente entero
    # Calculo que numero es en la nueva palabra. Ej si tengo 43 es la posicion 11
    mul t0, t0, t1
    sub a5, a5, t0 # A5 tiene la posicion final dentro de la palabra
    
    li t0, 4
    mul t0, t0, t1
    add t0, a3, t0 
    lw t2, 0(t0) # t2 tiene la palabra a modificar
    
    li t3, 32
    sub a5, t3, a5 # a5 tiene la posicion relativa a buscar en la palabra. Por ejemplo si queremos modificar el alumno 8 tenemos que ir al bit mas significativo 24 
    
    li t3, 1
    sll t3, t3, a5
    and t1, t3, t2 # T1 tiene todos 0's salvo el bit del que queremos seguir que igual puede ser 0
    srl t1, t1, a5 #T1 es o uno o cero
    beq t1 zero salir
    jal ra aula_entro
    lw ra, 0(sp)     
    addi sp, sp, 4  
    ret
    salir:
        jal ra aula_salio
        lw ra, 0(sp)     
        addi sp, sp, 4  
        ret


.data
n: .word 48
p: .word 0b10101101010000110011011111010101, 0b01011010100000110000000000000000
alumno1: .word 34
alumno2: .word 33