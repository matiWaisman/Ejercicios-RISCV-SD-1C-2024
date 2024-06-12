Las direcciones de memoria en RISC-V son de 8 bits (1 byte) cada una. Las direcciones se suelen agrupar en 4, formando así una palabra que son 4 bytes.

| Posición de memoria | Dato de 32 Bits + su posición        |
|---------------------|--------------------------------------|
| 8-11                | `0x    FF       FF      AB     BA`   |
| 4-7                 | `0x    00       02      BE     21`   |
| 0-3                 | `0x    0E       00      DF     78`   |
| Posición            | `-   Pi + 0  Pi + 1  Pi + 2  Pi + 3` |

Si queremos pasar a la siguiente palabra, tendríamos que sumar 4 a la dirección actual.

Si queremos leer el próximo byte, podemos hacer `lb sd, 1(direcciónActual)`.






