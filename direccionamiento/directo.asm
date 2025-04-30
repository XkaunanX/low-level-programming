.MODEL SMALL
.STACK 0100H

.DATA
valor DW 1234H

.CODE
ORG 0100H
START:
    MOV AX, valor       ; Direccionamiento directo: AX = contenido de 'valor'
    MOV DX, AX
    MOV AH, 4CH
    INT 21H             ; Salida del programa
END START