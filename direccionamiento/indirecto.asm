.MODEL SMALL
.STACK 0100H

.DATA
valor DW 5678H

.CODE
ORG 0100H
START:
    MOV BX, OFFSET valor ; Cargar la direccion de 'valor' en BX
    MOV AX, [BX]         ; Direccionamiento indirecto: AX = contenido apuntado por BX
    MOV DX, AX
    MOV AH, 4CH
    INT 21H              ; Salida del programa
END START