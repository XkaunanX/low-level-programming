.MODEL SMALL
.STACK 0100H

.DATA
mensaje DB 'Contenido de SI es: $'

.CODE
ORG 0100H
START:
    MOV SI, 1000H         ; SI = 1000H, usado para direccionamiento de memoria
    MOV DX, OFFSET mensaje ; Direccion del mensaje
    MOV AH, 09H            ; Funcion para mostrar cadena
    INT 21H                ; Llamada a la interrupcion
    MOV AX, 4C00H          ; Terminar el programa
    INT 21H
END START