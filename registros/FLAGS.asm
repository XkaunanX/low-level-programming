.MODEL SMALL
.STACK 0100H

.DATA
mensaje1 DB 'El resultado es positivo.$'
mensaje2 DB 'El resultado es negativo.$'
mensaje3 DB 'El resultado es cero.$'

.CODE
ORG 0100H
START:
    MOV AX, 10             ; AX = 10
    MOV BX, 5              ; BX = 5
    CMP AX, BX             ; Compara AX con BX, ajustando los flags segun el resultado

    JE ResultadoCero       ; Si el resultado de la comparacion es igual (ZF = 1), salta a ResultadoCero
    JL ResultadoNegativo   ; Si el resultado es menor (SF != OF), salta a ResultadoNegativo
    JG ResultadoPositivo   ; Si el resultado es mayor (SF = OF), salta a ResultadoPositivo

ResultadoCero:
    MOV DX, OFFSET mensaje3 ; Cargar la direccion de mensaje3 (resultado cero)
    MOV AH, 09H
    INT 21H
    JMP Fin                 ; Salir del programa

ResultadoNegativo:
    MOV DX, OFFSET mensaje2 ; Cargar la direccion de mensaje2 (resultado negativo)
    MOV AH, 09H
    INT 21H
    JMP Fin                 ; Salir del programa

ResultadoPositivo:
    MOV DX, OFFSET mensaje1 ; Cargar la direccion de mensaje1 (resultado positivo)
    MOV AH, 09H
    INT 21H
    JMP Fin                 ; Salir del programa

Fin:
    MOV AX, 4C00H           ; Terminar el programa
    INT 21H
END START