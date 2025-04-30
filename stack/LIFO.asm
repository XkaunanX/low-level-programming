ORG 100H

.MODEL SMALL
.DATA

mensaje DB 'Valor sacado de la pila: $'

.CODE

START:
    MOV AX, @DATA        ; Inicializar el segmento de datos
    MOV DS, AX
    
    ; Empujar valores a la pila
    MOV AX, 1            ; Cargar el valor 1 en AX
    PUSH AX              ; Empujar al stack

    MOV AX, 2            ; Cargar el valor 2 en AX
    PUSH AX              ; Empujar al stack

    MOV AX, 3            ; Cargar el valor 3 en AX
    PUSH AX              ; Empujar al stack

    ; Sacar valores de la pila
    POP AX               ; Sacar el ultimo valor (3) y guardarlo en AX

    ; Mostrar el valor
    MOV AH, 9
    LEA DX, mensaje
    INT 21H

    MOV AH, 2
    MOV DL, AL           ; Mostrar el valor sacado (3)
    INT 21H

    MOV AH, 4Ch          ; Terminar el programa
    INT 21H