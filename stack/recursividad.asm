ORG 100H

.MODEL SMALL
.DATA

mensaje DB 'Numero factorial: $'

.CODE
START:
    MOV AX, @DATA
    MOV DS, AX

    ; Llamar a la funcion factorial
    MOV AX, 5            ; Calcular el factorial de 5
    CALL Factorial

    ; Mostrar el mensaje
    MOV AH, 9
    LEA DX, mensaje
    INT 21H

    MOV AH, 4Ch          ; Terminar el programa
    INT 21H

Factorial:
    PUSH AX              ; Guardar AX en el stack

    ; Base case: Si AX es 0 o 1, el factorial es 1
    CMP AX, 1
    JLE Fin_Factorial

    DEC AX               ; Decrementar AX (n-1)
    CALL Factorial       ; Llamar recursivamente
    POP BX               ; Recuperar el valor de AX a BX

    MUL BX               ; Multiplicar AX por el valor de BX (n * (n-1)!)

Fin_Factorial:
    POP AX               ; Recuperar el valor original de AX
    RET                  ; Retornar al llamador