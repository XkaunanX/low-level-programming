.MODEL SMALL
.STACK 0100H

.DATA
no_igual DB 'Los valores no son iguales$', 0

.CODE
ORG 0100H
START:
    MOV AX, 10
    CMP AX, 5          ; Comparar AX con 5
    JNE DIFERENTES     ; Saltar a 'DIFERENTES' si no son iguales
    JMP FIN
DIFERENTES:
    MOV DX, OFFSET no_igual
    MOV AH, 09H
    INT 21H            ; Imprimir mensaje
FIN:
    MOV AH, 4CH
    INT 21H            ; Salida del programa
END START