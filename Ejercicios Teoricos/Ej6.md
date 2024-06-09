Para el branching la arquitectura ofrece 4 instrucciones: saltar si el resultado es igual (beq), distinto (bne), mayor o igual (bge), o menor (blt). Los últimos dos casos son comparaciones con signo, pero RV32I también ofrece versiones sin signo: bgeu y bltu.

Las instrucciones del tipo B reciben dos operandos fuentes manda los operandos a la alu y dependiendo que tipo de salto es hace una operación distinta y se revisa una flag distinta. Por ejemplo para Beq basta con restar y ver si el resultado es cero. 

También la instrucción de branch recibe un inmediato que en caso de ser verdadera la comparación va a sumarle ese offset al pc. 
