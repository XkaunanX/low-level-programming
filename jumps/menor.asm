.MODEL SMALL
.STACK 0100H

.DATA
menor DB 'AX es menor que 5$', 0

.CODE
ORG 0100H
START:
    MOV AX, 3
    CMP AX, 5          ; Comparar AX con 5
    JL ES_MENOR        ; Saltar a 'ES_MENOR' si AX < 5
    JMP FIN
ES_MENOR:
    MOV DX, OFFSET menor
    MOV AH, 09H
    INT 21H            ; Imprimir mensaje
FIN:
    MOV AH, 4CH
    INT 21H            ; Salida del programa
END START