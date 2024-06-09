Las decisiones a la hora de diseñar el set de instrucciones para determinar qué sacrificios/ compromisos hacer se basan en las siguientes métricas:

- Costo:

Los procesadores son implementados como circuitos integrados, comúnmente denominados chips o dies. Comienzan como una oblea redonda el cual es cortado en múltiples pedacitos. Entre más pequeño el die, mas dies por oblea. 

A su vez en el proceso de producción suele pasar mucho que algunos chips salgan defectuosos. Como los dies son más pequeños cuando sale un chip defectuoso hay una menor cantidad de dies afectados. Minimizando la cantidad de dies defectuosos. 

Al mantener el ISA lo más simple posible lo que logramos es reducir el tamaño del procesador que lo implementa. 

- Simplicidad:

La simplicidad del set de instrucciones reduce el tiempo requerido para diseñar y validar los dies. Esto hace que se puedan validar los chips más rápido mejorando el beneficio. 

La simplicidad también reduce el costo de la documentación y la dificultad de hacer que los clientes entiendan cómo usar el ISA.

- Rendimiento:

Tampoco hay que pasarse con hacer muy chico al chip porque lo que hace eso es decrementar la velocidad de operación. Por eso frente a menor cantidad de instrucciones hay que aumentar la cantidad de ciclos de reloj por instrucción y cada cuanto hay un ciclo de reloj para poder tener un mejor rendimiento que una implementación con una mayor cantidad de instrucciones. 

- Aislamiento de arquitectura e implementación:

Como hay implementaciones que tener un instruction set distinto los beneficia una opción tentadora es modificar la arquitectura para mejorar esos use cases. El problema de agrandar el ISA es que puede empeorar otras implementaciones. Por lo tanto se prima el uso general y no el particular. 

- Espacio para crecer:

Es fundamental reservar espacio para tareas específicas que se pueden usar en el futuro. Porque el único camino para incrementar significativamente el rendimiento es agregar instrucciones para tareas particulares. 

- Tamaño del programa:

Entre más pequeño el programa, menor el área del chip que ocupará la memoria, lo cual puede ser un costo significativo para sistemas embebidos. También tamaños de programa más chicos implica menos gastos de energía para el chip. 

- Facilidad de programar / compilar / linkear:

Dado que el acceso de datos en registros es mucho más rápido que en memoria, es crucial que los compiladores hagan una buena asignación de registros. Dicha tarea es más fácil entre más registros se tenga. Por lo que tener una cantidad mayor de registros puede hacerle la vida más fácil al programador, pero agranda el tamaño del chip y hace que el acceso a registros sea más lento. 



