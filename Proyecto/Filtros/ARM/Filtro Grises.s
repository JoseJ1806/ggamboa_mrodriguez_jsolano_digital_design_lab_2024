        .global _start
_start:
        LDR R0, =0x00000000       @ píxel 0,0
        LDR R1, =0x00013880       @ Dirección destino 
        MOV R2, #40000            @ Contador
        
loop:
        LDR R3, [R0]              @

        @ Extraer componentes RGB
        AND R4, R3, #0xFF         @ B = bits [7:0]
        AND R5, R3, #0xFF00       @ G = bits [15:8]
        LSR R5, R5, #8            @ Ajustar G
        AND R6, R3, #0xFF0000     @ R = bits [23:16]
        LSR R6, R6, #16           @ Ajustar R

        @ Calcular el promedio (Gray)
        ADD R7, R6, R5            @ R + G
        ADD R7, R7, R4            @ (R + G + B)
        LSR R7, R7, #2            @ Dividir entre 4 (es raro, mejor esta aproximación porque se puede caer la división)

        @ Limitar el valor Gray a 255
        CMP R7, #255
        MOVHI R7, #255

        @ Reensamblar el píxel en escala de grises
        LSL R8, R7, #16           @ Gray << 16 (coloca Gray en la posición de R)
        LSL R9, R7, #8            @ Gray << 8 (coloca Gray en la posición de G)
        ORR R8, R8, R9            @ Combina Gray para R y G
        ORR R8, R8, R7            @ Combina Gray para B

        @ Escribir el píxel en escala de grises en la RAM destino
        STR R8, [R1]              @ Guardar en dirección destino

        @ Actualizar direcciones
        ADD R0, R0, #1            @ pixel siguiente
        ADD R1, R1, #1            @ siguiente palabra de destino

        SUBS R2, R2, #1           @ Contardor -1 
        BNE loop                  @ Continuar el bucle si contador =/= 0

        B .
