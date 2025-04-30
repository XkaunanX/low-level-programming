.MODEL SMALL
.STACK 0100H

.CODE
ORG 0100H
START:
    MOV AX, 4321H        ; Cargar un valor en AX
    MOV BX, AX           ; Direccionamiento de registro: copiar AX en BX
    MOV DX, BX
    MOV AH, 4CH
    INT 21H              ; Salida del programa
END START