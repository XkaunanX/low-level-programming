.MODEL SMALL
.STACK 0100H

.DATA
mensaje DB 'Valor de AX es: $'

.CODE
ORG 0100H
START:
    MOV AX, 1234H          ; AX = 1234H, el acumulador almacena resultados de operaciones
    MOV DX, OFFSET mensaje  ; Cargar la direccion de mensaje en DX
    MOV AH, 09H             ; Funcion para imprimir cadena
    INT 21H                 ; Llamada a interrupcion para mostrar mensaje
    MOV AX, 4C00H           ; Terminar el programa
    INT 21H
END START