.global _start

.section .data
X1:    .word 5    @ Fibonacci hasta el número 5
X2:    .word 7    @ Fibonacci hasta el número 7
X3:    .word 10   @ Fibonacci hasta el número 10

.section .text

_start:
    ldr r0, =X1     @ Cargar dirección de X1 en r0
    ldr r1, [r0]    @ Cargar el valor de X1 en r1
    bl fibonacci    @ Llamar a la función fibonacci

    ldr r0, =X2    
    ldr r1, [r0]   
    bl fibonacci    

    ldr r0, =X3     
    ldr r1, [r0] 
    bl fibonacci    

    mov r7, #1      @ exit
    swi 0

fibonacci:
    push {r4-r6, lr}    @ Guardar registros
    mov r2, #0          @ F0 = 0 
    mov r3, #1          @ F1 = 1 
    cmp r1, #1          @ Comparar X con 1
    ble done            @ Si X <= 1, out 

    mov r4, #2          @ Contador i = 2, ya esta F0 y F1)

loop:
    add r6, r2, r3      @ F(i) = F(i-1) + F(i-2)
    mov r2, r3          @ F(i-1) = F(i)
    mov r3, r6          @ F(i-2) = F(i)
    add r4, r4, #1      @ i++
    cmp r4, r1          @ Comparar i con X
    ble loop            @ Si i <= X, repetir

done:
    mov r0, r3          @ Resultado final en r0 
    pop {r4-r6, pc}     
