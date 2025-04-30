ORG 100h                 ; Definir la direccion de inicio del programa

   .data
    MENSAJEENTRADA DB "Introduce la cantidad de dinero pagado o ingresa '0' si deseas salir: $"  ; Mensaje para pedir la cantidad
    MENSAJEERROR DB "Valor no especificado $"
    MENSAJEEXPIRADO DB "Expirado... $ "        ; Mensaje cuando se acaba el tiempo

.CODE

MOV AX, @DATA            ; Cargar la direccion de la seccion de datos en AX
MOV DS, AX               ; Cargar el segmento de datos

USUARIOENTRADA:

; Mostrar el mensaje de entrada en pantalla
LEA DX, MENSAJEENTRADA
MOV AH, 09H
INT 21H                  ; Interrupcion DOS para mostrar la cadena de texto

MOV DL, 10               ; Inicializar DL con 10 (usado para multiplicar por 10)
MOV BL, 0                ; Inicializar BL en 0 (para almacenar el numero introducido)

LEERNUMERO:

      MOV AH, 01H         ; Interrupcion DOS para leer un solo caracter
      INT 21H

      CMP AL, 13          ; Compara si la tecla presionada es "ENTER"
      JE REGRESAR         ; Si es "ENTER", salta a REGRESAR

      MOV AH, 0           ; Limpiar AH
      SUB AL, 48          ; Convertir el caracter ASCII a valor numerico (restando 48)

      MOV CL, AL          ; Mover el valor numerico a CL
      MOV AL, BL          ; Mover el valor de BL (anteriormente almacenado) a AL

      MUL DL              ; Multiplicar el valor actual por 10 (en AL) por 10 (en DL)

      ADD AL, CL          ; Sumar el valor nuevo al resultado anterior (anterior * 10 + nuevo digito)
      MOV BL, AL          ; Almacenar el resultado final en BL (BL tendra el numero entero)

      JMP LEERNUMERO      ; Repetir el ciclo de lectura de numeros

REGRESAR:

MOV AX, 0                ; Inicializar AX en 0
OUT 199, AX              ; Enviar a la salida el valor 0 (codigo de salida)

CMP BL, 1                ; Comparar el valor introducido con 1 (si es menor que 1, error)
JNE SI1LIBRA             ; Si no es igual a 1, saltar a la etiqueta SI1LIBRA
MOV CX, 4CH              ; Establecer el tiempo para 5 segundos
MOV DX, 4B40H            ; Cargar el valor de tiempo en DX
JMP FINSI                ; Saltar a la parte final del flujo de ejecucion

SI1LIBRA:
CMP BL, 5                ; Comparar el valor introducido con 5 (si es menor que 5, error)
JNE SI10LIBRAS           ; Si no es igual a 5, saltar a la etiqueta SI10LIBRAS
MOV CX, 1C9H             ; Establecer el tiempo para 30 segundos
MOV DX, 0C380H           ; Cargar el valor de tiempo en DX
JMP FINSI                ; Saltar a la parte final del flujo de ejecucion

SI10LIBRAS:
CMP BL, 0AH              ; Comparar el valor introducido con 10 (si es menor que 10, error)
JNE ENTRADAINCORRECTA    ; Si no es igual a 10, saltar a ENTRADAINCORRECTA
MOV CX, 393H             ; Establecer el tiempo para 60 segundos
MOV DX, 8700H            ; Cargar el valor de tiempo en DX
JMP FINSI                ; Saltar a la parte final del flujo de ejecucion

FINSI:

; Nueva linea
MOV DX, 13
MOV AH, 2
INT 21H                  ; Interrupcion DOS para imprimir un salto de linea
MOV DX, 10
MOV AH, 2
INT 21H                  ; Interrupcion DOS para imprimir otro salto de linea

; Espera (simulando un retraso)
MOV AH, 86H
INT 15H                  ; Interrupcion BIOS para esperar

; Mensaje cuando el tiempo se acaba
LEA DX, MENSAJEEXPIRADO
MOV AH, 09H
INT 21H                  ; Mostrar el mensaje "Expirado"

MOV AX, 1                ; Poner 1 en AX
OUT 199, AX              ; Enviar el valor 1 al puerto 199 (esto es un indicador de tiempo expirado)

JMP FINAL                ; Salto al final para terminar el programa

ENTRADAINCORRECTA:
CMP BL, 0H               ; Si el valor es 0, salir del programa
JE FIN

; Nueva linea
MOV DX, 13
MOV AH, 2
INT 21H                  ; Interrupcion DOS para imprimir un salto de linea
MOV DX, 10
MOV AH, 2
INT 21H                  ; Interrupcion DOS para imprimir otro salto de linea

LEA DX, MENSAJEERROR
MOV AH, 09H
INT 21H                  ; Mostrar el mensaje de error ("Valor no especificado")

FINAL:

; Nueva linea
MOV DX, 13
MOV AH, 2
INT 21H                  ; Interrupcion DOS para imprimir un salto de linea
MOV DX, 10
MOV AH, 2
INT 21H                  ; Interrupcion DOS para imprimir otro salto de linea

CALL USUARIOENTRADA     ; Llamada recursiva a USUARIOENTRADA para pedir de nuevo el numero

FIN:                     ; Fin del programa
HLT                      ; Detener la ejecucion