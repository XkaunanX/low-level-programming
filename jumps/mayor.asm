.MODEL SMALL
.STACK 0100H

.DATA
mayor DB 'AX es mayor que 5$', 0

.CODE
ORG 0100H
START:
    MOV AX, 8
    CMP AX, 5          ; Comparar AX con 5
    JG ES_MAYOR        ; Saltar a 'ES_MAYOR' si AX > 5
    JMP FIN
ES_MAYOR:
    MOV DX, OFFSET mayor
    MOV AH, 09H
    INT 21H            ; Imprimir mensaje
FIN:
    MOV AH, 4CH
    INT 21H            ; Salida del programa
END START