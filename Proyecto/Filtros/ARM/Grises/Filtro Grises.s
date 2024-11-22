.global _start
_start:
    MOV R0, #0       @ píxeles originales
    MOV R1, #40000       @ Dirección resultados
    MOV R2, #40000            @ contador

loop:
    LDR R3, [R0]      @ Cargar pixel

    @ Extraer componentes RGB 
    AND R4, R3, #0xFF         @ B = bits [7:0]
    AND R5, R3, #0xFF00       @ G = bits [15:8]
    LSR R5, R5, #8            @ Ajustar G
    AND R6, R3, #0xFF0000     @ R = bits [23:16]
    LSR R6, R6, #16           @ Ajustar R

    @ Calcular el promedio 
    ADD R7, R6, R5            @ R + G
    ADD R7, R7, R4            @ (R + G + B)
    LSR R7, R7, #2            @ Dividir entre 4 (aproximado)

    @ Limitar el valor Gray a 255
    CMP R7, #255
    MOVHI R7, #255

    @ Reensamblar el píxel
    LSL R8, R7, #16           @ coloca Gray en la posición de R
    LSL R9, R7, #8            @ coloca Gray en la posición de G
    ORR R8, R8, R9            @ Combina Gray para R y G
    ORR R8, R8, R7            @ Combina Gray para B

    @ Guardar el píxel procesado en escala de grises (3 bytes, R, G, B)
    STR R8, [R1]         @ Guardar el píxel completo 

    @ Movimiento de pixel original y a procesar
    ADD R0, R0, #1 @ESTO HAY QUE VER SI ES 4 O 1
    ADD R1, R1, #1 @ESTO HAY QUE VER SI ES 4 O 1

    @ Decrementar contador y continuar
    SUBS R2, R2, #1           @ Contador -1
    BNE loop                  @ Continuar el bucle si contador ≠ 0

    B .                       @ Fin del programa
