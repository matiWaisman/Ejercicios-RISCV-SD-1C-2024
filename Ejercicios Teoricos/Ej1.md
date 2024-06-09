La ALU en el Datapath va a estar conectada al Register File para realizar las operaciones 1,2 y 4. Como operandos fuente va a recibir un dato de RD1.

Como también se realizan operaciones con el inmediato la Alu va a tener que recibir un dato de un multiplexor que hace que el dato: O venga de RD2 ya en 32 bits o venga con un inmediato con su signo extendido. Como salida de la Alu va a estar conectado al Data Memory y a su vez a un multiplexor que indica si vamos a escribir un dato levantándolo de la memoria principal (de Data Memory) o levantándolo de la operación que hicimos en la Alu (como en este caso) y ese multiplexor va a ir al WD3 del register file. 

Como en el código también tenemos un salto condicional (por más que no se ejecute nunca) la Alu en este caso va a recibir dos datos de 32 bits del Register File y el resultado de hacer RS1 - RS2 y chequear si la flag de carry está en 1 o en 0 va a poner en 1 o en 0 el dato de la unidad de control que determina cuánto sumarle al pc. Vamos a tener un multiplexor en la entrada del clock que va a determinar si quedarse con el + 4 de no hacer ningún salto porque la unidad de control está en 0. O con el resultado de sumar el salto inmediato + el PC actual porque la unidad de control indica que hay que hacer un salto. 

El programa:

- Suma el registro zero con 1 y lo guarda en a1. Por lo que a1 pasa a valer 1.
- Suma el registro zero con 2 y lo guarda en a2. Por lo que a2 pasa a valer 2.
- Si a2 es menor a a1 salta a test. No pasa porque a2 no es menor a a1. 
- Hace a1 - a2 y lo guarda en a3. Por lo que a3 pasa a valer -1 (En binario en notación complemento a 2)
- Salta a la etiqueta end (le suma 8 al pc)
- La instrucción nop no hace nada así que termina el programa porque no hay ninguna instrucción debajo. 

Nunca se ejecuta la operación sub a3,a2,a1 porque 2 nunca es menor a 1 así que nunca va a saltar a test y siempre va a saltar a end que está debajo. 
