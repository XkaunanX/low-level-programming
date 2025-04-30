ORG 100H

.MODEL SMALL
.DATA

mensaje DB 'Se regreso de la funcion: $'

.CODE

; FUNCION PRINCIPAL
START:
    MOV AX, @DATA        ; Inicializar el segmento de datos
    MOV DS, AX

    ; Llamar a una subrutina
    CALL Funcion         ; Llamar a la subrutina Funcion

    ; Mostrar el mensaje
    MOV AH, 9
    LEA DX, mensaje
    INT 21H

    MOV AH, 4Ch          ; Terminar el programa
    INT 21H

; FUNCION
Funcion:
    ; Aqui se realiza algun procesamiento
    MOV AX, 5            ; Cargar valor 5 en AX

    ; Regresar a la funcion principal
    RET                  ; Retorna de la funcion (usa el valor en el stack para la direccion de retorno)