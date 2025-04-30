ORG 100H

.MODEL SMALL

.DATA

    mensaje DB 'Parametro 1: $'

.CODE

    MOV AX, @DATA            ; Inicializar el segmento de datos
    MOV DS, AX               ; Cargar el segmento de datos en DS

    ; Mostrar el primer parametro de la linea de comando
    MOV AH, 09H              ; Funcion 09H de la interrupcion 21H: Mostrar una cadena
    MOV DX, [BP+2]           ; Cargar la direccion del primer parametro en DX
    INT 21H                  ; Llamar a la interrupcion 21H para mostrar el parametro

    ; Mostrar el segundo parametro de la linea de comando
    MOV DX, [BP+4]           ; Cargar la direccion del segundo parametro en DX
    INT 21H                  ; Llamar a la interrupcion 21H para mostrar el parametro

    ; Terminar el programa
    MOV AH, 4CH              ; Funcion para terminar el programa
    INT 21H
