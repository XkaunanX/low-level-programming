.MODEL SMALL
.STACK 0100H

.DATA
mensaje DB 'Salto realizado$', 0

.CODE
ORG 0100H
START:
    MOV DX, OFFSET mensaje
    JMP FIN            ; Salto incondicional a la etiqueta 'FIN'
    MOV AH, 09H        ; Esta instruccion no se ejecuta
FIN:
    MOV AH, 09H
    INT 21H            ; Imprimir mensaje
    MOV AH, 4CH
    INT 21H            ; Salida del programa
END START