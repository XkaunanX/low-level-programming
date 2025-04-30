.MODEL SMALL
.STACK 0100H

.DATA
mensaje DB 'Valor de SP y BP son: $'

.CODE
ORG 0100H
START:
    MOV SP, 0xFF00        ; Establece la pila en una direccion
    MOV BP, SP            ; Copiar SP a BP
    MOV DX, OFFSET mensaje ; Direccion del mensaje
    MOV AH, 09H            ; Funcion para imprimir
    INT 21H                ; Llamada para mostrar mensaje
    MOV AX, 4C00H          ; Terminar el programa
    INT 21H
END START