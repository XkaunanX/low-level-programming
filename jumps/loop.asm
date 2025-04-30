.MODEL SMALL
.STACK 0100H

.DATA
mensaje DB 'Contando...', 0

.CODE
ORG 0100H
START:
    MOV CX, 5          ; Inicializar el contador del bucle
BUCLE:
    MOV DX, OFFSET mensaje
    MOV AH, 09H
    INT 21H            ; Imprimir mensaje
    LOOP BUCLE         ; Repetir mientras CX no sea cero
    MOV AH, 4CH
    INT 21H            ; Salida del programa
END START