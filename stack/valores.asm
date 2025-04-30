ORG 100H

.MODEL SMALL
.DATA

mensaje DB 'Valor recuperado del stack: $'

.CODE
    MOV AX, @DATA       ; Inicializar el segmento de datos
    MOV DS, AX
    
    ; Empujar valores al stack
    MOV AX, 1234H       ; Cargar el valor 1234H en AX
    PUSH AX             ; Empujar AX al stack

    MOV AX, 5678H       ; Cargar el valor 5678H en AX
    PUSH AX             ; Empujar AX al stack

    ; Recuperar valores del stack
    POP AX              ; Sacar el valor mas reciente del stack (5678H) y ponerlo en AX

    ; Mostrar el valor recuperado
    MOV AH, 9
    LEA DX, mensaje
    INT 21H

    MOV AH, 4Ch         ; Terminar el programa
    INT 21H