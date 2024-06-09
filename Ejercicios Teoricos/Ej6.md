Para el branching la arquitectura ofrece 4 instrucciones: saltar si el resultado es igual (beq), distinto (bne), mayor o igual (bge), o menor (blt). Los últimos dos casos son comparaciones con signo, pero RV32I también ofrece versiones sin signo: bgeu y bltu.

Las instrucciones del tipo B reciben dos operandos fuentes manda los operandos a la alu y dependiendo que tipo de salto es hace una operación distinta y se revisa una flag distinta. Por ejemplo para Beq basta con restar y ver si el resultado es cero. 

También la instrucción de branch recibe un inmediato que en caso de ser verdadera la comparación va a sumarle ese offset al pc. 

También existen los saltos incondicionales como el J solo que es una pseudoinstrucción que en realidad hace beq x0, x0, target y como siempre x0 va a valer lo mismo que sigo mismo va a ser verdadero. Y después están las operaciones Jal y Jalr que no son pseudoinstrucciones porque aparte de hacer el salto guardan el PC + 4 en un registro destino.

La diferencia entre Jal y Jalr es que Jal le suma el inmediato al PC y Jalr al valor del registro fuente proporcionado.

Lo que sí Jal y Jalr no son del mismo tipo. Jal es la única instrucción de tipo J y Jalr es de tipo I.
