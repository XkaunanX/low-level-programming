.MODEL SMALL
.STACK 0100H

.DATA
igual DB 'Los valores son iguales$', 0

.CODE
ORG 0100H
START:
    MOV AX, 5
    CMP AX, 5          ; Comparar AX con 5
    JE IGUALES         ; Saltar a 'IGUALES' si son iguales
    JMP FIN
IGUALES:
    MOV DX, OFFSET igual
    MOV AH, 09H
    INT 21H            ; Imprimir mensaje
FIN:
    MOV AH, 4CH
    INT 21H            ; Salida del programa
END START
