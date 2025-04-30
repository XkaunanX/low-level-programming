ORG 100H

.MODEL SMALL

.DATA

    variable_entorno DB "PATH=" ; Nombre de la variable de entorno a buscar
    valor DB 128 DUP(?)         ; Buffer para almacenar el valor de la variable de entorno

.CODE

    MOV AX, @DATA              ; Inicializar el segmento de datos
    MOV DS, AX                 ; Cargar el segmento de datos en DS

    ; Obtener el PSP (Segmento de Programa)
    MOV AH, 62H                ; Funcion 62H de la interrupcion 21H: Obtener el PSP
    INT 21H                    ; Llamar a la interrupcion 21H

    MOV BX, 2CH                ; Offset de la tabla de segmento del PSP que contiene las variables de entorno
    MOV ES, AX                 ; Cargar el segmento del PSP en ES
    MOV DI, BX                 ; Cargar el offset de la tabla en DI

buscar_variable_entorno:
    LODSB                      ; Cargar el siguiente byte de SI en AL y avanzar SI
    CMP AL, '='                ; Verificar si el byte es '='
    JNE no_coincide            ; Si no es '=', continuar buscando
    CALL comparar_nombre_variable_entorno  ; Comparar el nombre de la variable con "PATH"
    JC encontrado              ; Si la comparacion es exitosa, saltar a "encontrado"
    JMP siguiente              ; Si no se encontro, avanzar a la siguiente entrada

comparar_nombre_variable_entorno:
    MOV CX, 5                  ; Longitud del nombre "PATH"
    REPZ CMPSB                 ; Comparar los primeros 5 bytes con "PATH"
    RET                        ; Regresa el resultado de la comparacion

siguiente:
    LODSB                      ; Avanzar al siguiente byte
    CMP AL, '$'                ; Verificar si llegamos al final
    JNE buscar_variable_entorno ; Si no es '$', continuar buscando
    JMP no_encontrado          ; Si es '$', la variable no se encontro

encontrado:
    INC SI                      ; Saltar el '='
    MOV CX, 128h               ; Longitud maxima del valor
    MOV DI, OFFSET valor       ; Cargar la direccion del buffer "valor"
    REP MOVSB                   ; Copiar el valor de la variable al buffer

no_coincide:
    CMP AL, '$'                ; Verificar si llegamos al final
    JNE buscar_variable_entorno ; Si no es '$', continuar buscando
    JMP no_encontrado          ; Si es '$', la variable no se encontro

no_encontrado:
    MOV byte ptr [valor], '$'   ; Establecer el valor como cadena vacia

    ; Terminar el programa
    MOV AH, 4CH                ; Funcion para terminar el programa
    INT 21H
    
