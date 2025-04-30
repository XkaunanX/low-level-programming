.MODEL SMALL
.STACK 0100H

.DATA
valor1 DW 4444H

.CODE
ORG 0100H
START:
    MOV BX, OFFSET valor1 ; Cargar la direccion base en BX
    MOV AX, [BX]          ; Direccionamiento basado: AX = contenido apuntado por BX
    MOV DX, AX
    MOV AH, 4CH
    INT 21H               ; Salida del programa
END START