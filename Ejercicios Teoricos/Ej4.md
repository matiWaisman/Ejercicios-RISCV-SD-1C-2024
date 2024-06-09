Están las operaciones:

Tipo R para operaciones entre registros. Se necesitan para todos dos operandos fuentes y un operando destino.

Tipo I para operaciones con inmediatos. También se puede usar con Loads (Load immediate) Si o si un registro destino y puede o no haber registro fuente. 
Tipo S para stores. Guarda en la posición de memoria indicada en un registro + un offset inmediato la información que diga el registro fuente. 

Tipo B para branches. Los branches son saltos condicionales, reciben dos operandos fuentes y un offset y siempre actualiza el pc en caso de que se cumpla el branching que estamos haciendo. 

Tipo U para inmediatos largos sin signo. 

Tipo J para saltos incondicionales.Jal y Jalr, J es una pseudoinstrucción que es Beq x0, x0, offset. 

En todos los tipos de instrucción el opcode está en los 7 bits menos significativos para saber que tipo de instrucción hay que decodificar. Y después entre si varian qué datos encontrar en cada parte. 
