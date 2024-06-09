Existen tres saltos incondicionales:

Los saltos Jal y Jalr que aparte de hacer el salto guardan el PC + 4 en un registro destino.

La diferencia entre Jal y Jalr es que Jal le suma el inmediato al PC y Jalr al valor del registro fuente proporcionado.

Y después el tercer salto es J que es una pseudoinstrucción que en realidad es jal x0 offset. Como no nos interesa volver de donde venimos no nos interesa la dirección de la próxima instrucción por lo que la “escribimos” en x0 aunque realmente no se va a escribir en ningún lado por lo que no estamos desperdiciando ningún registro en guardar un dato que no nos interesa. 

Lo que sí Jal y Jalr no son del mismo tipo. Jal es la única instrucción de tipo J y Jalr es de tipo I.

Jal sirve en llamadas a funciones para almacenar la dirección de la siguiente instrucción en el registro destino (generalmente el return address) 

En cambio Jalr sirve para hacer llamadas a funciones que están en una dirección de memoria calculada dinámicamente. 
