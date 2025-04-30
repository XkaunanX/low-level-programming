ORG 100H

.MODEL SMALL

.DATA

    fechaYhora DB 20 DUP(?)   ; Espacio para almacenar la fecha (formato DD-MM-YYYY)

.CODE

    MOV AX, @DATA            ; Inicializa el segmento de datos
    MOV DS, AX               ; Cargar el segmento de datos en DS

    ; Obtener la fecha del sistema
    MOV AH, 2AH              ; Funcion 2AH de la interrupcion 21H: Obtener la fecha y hora
    INT 21H                  ; Llamar a la interrupcion 21H

    MOV AH, 09H              ; Funcion 09H: Mostrar una cadena de caracteres
    LEA DX, fechaYhora       ; Cargar la direccion de la cadena de la fecha
    INT 21H                  ; Llamar a la interrupcion 21H para mostrar la fecha

    ; Terminar el programa
    MOV AH, 4CH              ; Funcion para terminar el programa
    INT 21H
