mat1:   .word 1, 2, 3, 4
        .word 5, 6, 7, 8
        .word 9, 10, 11, 12
        .word 13, 14, 15, 16

mat2:   .word 16, 15, 14, 13
        .word 12, 11, 10, 9
        .word 8, 7, 6, 5
        .word 4, 3, 2, 1

mat3:   .space 64  @ Espacio reservado para la matriz de resultado (4x4)

.global _start
_start:
    LDR R0, =mat1   @ Apuntador a la primera matriz (mat1)
    LDR R1, =mat2   @ Apuntador a la segunda matriz (mat2)
    LDR R2, =mat3   @ Apuntador a la matriz de resultado (mat3)

    MOV R3, #0      @ Contador para las 16 posiciones (4x4 = 16 elementos)

sum_loop:
    LDR R4, [R0], #4   @ Cargar un elemento de mat1 y avanzar el puntero
    LDR R5, [R1], #4   @ Cargar un elemento de mat2 y avanzar el puntero
    ADD R6, R4, R5     @ Sumar los dos elementos
    STR R6, [R2], #4   @ Almacenar el resultado en mat3 y avanzar el puntero

    ADD R3, R3, #1     @ Incrementar el contador
    CMP R3, #16        @ Comparar el contador con 16 (número de elementos)
    BNE sum_loop       @ Si no hemos sumado todos los elementos, repetir el bucle
	
end:
	@ Fin del programa