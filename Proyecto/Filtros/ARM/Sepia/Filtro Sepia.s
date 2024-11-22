        .global _start

_start:
        MOV R0, #0       @ Dirección inicial de la RAM (pixel 0,0)
        LDR R1, =80000   @ESTA LINEA NO SE SI FUNCIONE, EL LDR ACÁ ES DUDOSO
        MOV R2, #40000            @ Contador de píxeles (40,000 píxeles)
        
loop:
        LDR R3, [R0]              @ Leer palabra desde la RAM (RGB en 24 bits)

        @ Extraer componentes RGB
        AND R4, R3, #0xFF         @ B = bits [7:0]
        AND R5, R3, #0xFF00       @ G = bits [15:8]
        LSR R5, R5, #8            @ Ajustar G
        AND R6, R3, #0xFF0000     @ R = bits [23:16]
        LSR R6, R6, #16           @ Ajustar R

        @ Calcular R_sepia
        MOV R7, #393              @ Multiplicador 0.393
        MUL R7, R6, R7            @ 0.393 * R
        MOV R8, #769              @ Multiplicador 0.769
        MUL R8, R5, R8            @ 0.769 * G
        ADD R7, R7, R8            @ Acumular
        MOV R8, #189              @ Multiplicador 0.189
        MUL R8, R4, R8            @ 0.189 * B
        ADD R7, R7, R8            @ R_sepia = 0.393*R + 0.769*G + 0.189*B
        LSR R7, R7, #10           @ Dividir por 1000
        CMP R7, R1              @ Limitar a 255
        MOVHI R7, R1

        @ Calcular G_sepia
        MOV R8, #349              @ Multiplicador 0.349
        MUL R8, R8, R6            @ 0.349 * R
        MOV R9, #686              @ Multiplicador 0.686
        MUL R9, R5, R9            @ 0.686 * G
        ADD R8, R8, R9            @ Acumular
        MOV R9, #168              @ Multiplicador 0.168
        MUL R9, R4, R9            @ 0.168 * B
        ADD R8, R8, R9            @ G_sepia = 0.349*R + 0.686*G + 0.168*B
        LSR R8, R8, #10           @ Dividir por 1000
        CMP R8, R1              @ Limitar a 255
        MOVHI R8, R1

        @ Calcular B_sepia
        MOV R9, #272              @ Multiplicador 0.272
        MUL R9, R9, R6            @ 0.272 * R
        MOV R10, #534             @ Multiplicador 0.534
        MUL R10, R5, R10          @ 0.534 * G
        ADD R9, R9, R10           @ Acumular
        MOV R10, #131             @ Multiplicador 0.131
        MUL R10, R4, R10          @ 0.131 * B
        ADD R9, R9, R10           @ B_sepia = 0.272*R + 0.534*G + 0.131*B
        LSR R9, R9, #10           @ Dividir por 1000
        CMP R9, R1              @ Limitar a 255
        MOVHI R9, R1

        @ Reensamblar el píxel sepia
        LSL R7, R7, #16           @ R_sepia << 16
        LSL R8, R8, #8            @ G_sepia << 8
        ORR R7, R7, R8            @ Combinar R y G
        ORR R7, R7, R9            @ Combinar con B

        @ Escribir el píxel sepia en la RAM destino
        STR R7, [R1]              @ Guardar en dirección destino

        @ Actualizar direcciones
        ADD R0, R0, #1            @ Avanzar a la siguiente palabra de entrada (pixel siguiente)
	ADD R1, R1, #1		  @ ME IMAGINO QUE SI EL LDR DE ARRIBA SE CAE, ESTE TAMBIÉN SE VA A CAER

        SUBS R2, R2, #1           @ Decrementar el contador de píxeles
        BNE loop                  @ Si no hemos procesado los 40,000 píxeles, continuar el bucle

        B .
