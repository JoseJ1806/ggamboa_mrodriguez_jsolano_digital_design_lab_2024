.global _start
_start:
	
	.global _start
_start:
	
	LDR R0, =array      @ R0 apunta al inicio del arreglo
    MOV R1, #0          @ R1 es el índice i, inicializado a 0
    MOV R2, #3          @ Constante "y" en R2

loop:
    CMP R1, #10         @ Comparar el índice con 10
    BGT end_loop        @ Si i > 10, salir del bucle

    LDR R3, [R0, R1, LSL #2]  @ Cargar array[i] en R3 (acceso al arreglo)
    CMP R3, R2                @ Comparar array[i] con "y"
    BLT add_case              @ Si array[i] < y, ir a la suma

mul_case:
    MUL R3, R3, R2            @ array[i] = array[i] * y
    STR R3, [R0, R1, LSL #2]  @ Guardar el resultado de nuevo en array[i]
    B next

add_case:
    ADD R3, R3, R2            @ array[i] = array[i] + y
    STR R3, [R0, R1, LSL #2]  @ Guardar el resultado en array[i]

next:
    ADD R1, R1, #1            @ Incrementar el índice i
    B loop                    @ Volver al inicio del bucle

end_loop:
    @ Fin del bucle

array:
    .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10  @ Definición del arreglo en memoria
