
ORG 100H

.MODEL SMALL

.DATA

    comando DB 'TASKILL /F /IM EXEC.EXE', 0 ; Comando para terminar un proceso

.CODE

    MOV AX, @DATA            ; Inicializar el segmento de datos
    MOV DS, AX               ; Cargar el segmento de datos en DS

    ; Ejecutar el comando para terminar un proceso
    MOV DX, OFFSET comando   ; Cargar el comando en DX
    INT 21H                  ; Llamar a la interrupcion para ejecutar el comando

    ; Terminar el programa
    MOV AH, 4CH              ; Funcion para terminar el programa
    INT 21H
