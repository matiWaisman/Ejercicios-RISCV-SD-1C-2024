# Consigna: Un aula tiene N pibes. Para pasar lista se le asignó a c/u un número (del 0 al N). El problema es que como constantemente los pibes entran y salen resulta difícil saber quiénes están dentro del aula. Cada pibe es un bit

# Asumo que no me pasan el aula (en que palabra esta) para hacerlo un poquito mas dificil.
.text
main:
 lw a2, n
 la a3, p
 lw a4, alumno
 jal ra aula_salio
 

# Modifica el bit correspondiente a `id_pibe` marcándolo como "adentro del aula" (1) 
aula_entro:
    bgt a4, a2, imposible # Si el alumno a modificar es mayor a la cantidad de alumnos no podemos modificarlo
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
    imposible:
        nop
 
aula_salio:
    bgt a4, a2, imposible # Si el alumno a modificar es mayor a la cantidad de alumnos no podemos modificarlo
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
    li t3, 0xFFFFFFFF 
    
    or t2, t2, t3 # Modifico la posicion
    sw t2, 0(t0) # La guardo en la original
 
    
    
.data
n: .word 48
p: .word 0b10101101010000110011011111010101, 0b01011010100000110000000000000000
alumno: .word 34