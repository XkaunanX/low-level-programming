.MODEL SMALL
.STACK 0100H

.CODE
ORG 0100H
START:
    MOV AX, 1234H        ; Direccionamiento inmediato: AX = 1234H
    MOV DX, AX
    MOV AH, 4CH
    INT 21H              ; Salida del programa
END START