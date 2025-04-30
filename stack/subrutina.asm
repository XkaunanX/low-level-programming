ORG 100H

.MODEL SMALL
.DATA

mensaje DB 'Valor de AX antes y despues de la funcion: $'

.CODE

START:
    MOV AX, @DATA        ; Inicializar el segmento de datos
    MOV DS, AX
    
    ; Mostrar el mensaje
    MOV AH, 9
    LEA DX, mensaje
    INT 21H

    MOV AX, 10H          ; Cargar 10H en AX

    ; Guardar el valor de AX en el stack
    PUSH AX

    ; Llamar a la subrutina
    CALL Subrutina

    ; Recuperar el valor de AX
    POP AX

    ; Mostrar el valor de AX
    MOV AH, 2
    MOV DL, AL           ; Cargar el valor de AL en DL para imprimir
    INT 21H

    MOV AH, 4Ch          ; Terminar el programa
    INT 21H

Subrutina:
    ; Aqui cambiamos el valor de AX
    MOV AX, 20H          ; Cambiar el valor de AX a 20H

    RET                  ; Retornar de la subrutina