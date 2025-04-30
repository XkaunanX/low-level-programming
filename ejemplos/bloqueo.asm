INCLUDE EMU8086.INC

.MODEL SMALL

.DATA   
        SIZE EQU 10
        ENCABEZADO DB '________________Bloqueo de seguridad________________','$'
        MENSAJE1 DB 13, 10, 'Introduce tu ID:$'
        MENSAJE2 DB 13, 10, 'Introduce tu Contraseña:$'
        MENSAJE3 DB 13, 10, 'ERROR: ID no encontrado!$'
        MENSAJE4 DB 13, 10, 'Contraseña incorrecta! Acceso denegado$'
        MENSAJE5 DB 13, 10, '¡Correcto! Bienvenido al sistema seguro$'
        MENSAJE6 DB 13, 10, '¡Contraseña demasiado larga!$'
        
        ID_TEMPORAL DW 1 DUP(?),0
        CONTRASEÑA_TEMP DB 1 DUP(?)
        
        TAMAÑO_ID = $-ID_TEMPORAL
        TAMAÑO_CONTRASEÑA = $-CONTRASEÑA_TEMP
        
        ID  DW 'A150', 'B255', 'CE20', 'BB71', 'D111', 'E500', 'F432', 'EC12', '5321', '9876'
        CONTRASEÑA DB 1, 2, 3, 4, 7, 10, 11, 13, 12, 14
    
.CODE

PROCESO_PRINCIPAL PROC
            MOV AX,@DATA   ; Iniciar segmento de datos
            MOV DS,AX
            MOV AX,0000H

ENCABEZADO_IMAGEN:
            LEA DX,ENCABEZADO
            MOV AH,09H
            INT 21H                ; Mostrar encabezado

SOLICITUD_ID:
            LEA DX,MENSAJE1
            MOV AH,09H
            INT 21H                ; Mostrar mensaje "Introduce tu ID"

LECTURA_ID:
            MOV BX,0
            MOV DX,0
            LEA DI,ID_TEMPORAL
            MOV DX,TAMAÑO_ID
            CALL OBTENER_CADENA    ; Llamada a la subrutina para leer el ID

VERIFICAR_ID:
            MOV BL,0
            MOV SI,0

VUELTA_ID:
            MOV AX,ID[SI] 
            MOV DX,ID_TEMPORAL
            CMP DX,AX
            JE  SOLICITUD_CONTRASEÑA
            INC BL
            ADD SI,4
            CMP BL,SIZE
            JB  VUELTA_ID

ERROR_ID:
            LEA DX,MENSAJE3
            MOV AH,09H
            INT 21H                ; Mostrar mensaje de error "ID no encontrado"
            JMP SOLICITUD_ID        ; Volver a solicitar el ID

SOLICITUD_CONTRASEÑA:
            LEA DX,MENSAJE2
            MOV AH,09H
            INT 21H                ; Mostrar mensaje "Introduce tu Contraseña"

LECTURA_CONTRASEÑA:
            CALL LEER_NUMERO
            CMP CL,0FH
            JAE CONTRASEÑA_LARGA
            MOV BH,00H
            MOV DL,CONTRASEÑA[BX]
            CMP CL,DL
            JE  ACCESO_CORRECTO

CONTRASEÑA_INCORRECTA:
            LEA DX,MENSAJE4
            MOV AH,09H
            INT 21H                ; Mostrar mensaje de "Contraseña incorrecta"
            JMP SOLICITUD_ID        ; Volver a solicitar el ID

ACCESO_CORRECTO:
            LEA DX,MENSAJE5
            MOV AH,09H
            INT 21H                ; Mostrar mensaje "¡Correcto! Bienvenido"
            JMP TERMINAR            ; Terminar el programa

CONTRASEÑA_LARGA:
            LEA DX,MENSAJE6
            MOV AH,09H
            INT 21H                ; Mostrar mensaje "¡Contraseña demasiado larga!"
            JMP SOLICITUD_CONTRASEÑA

DEFINIR_LEER_NUMERO
DEFINIR
