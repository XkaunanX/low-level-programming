;OPERACIONES CON CADENAS - Ejemplo 2: Concatenar 2 cadenas
org 100H

.model small

.data

    cadena1 db 'hola', 0                ; Cadena 1
    cadena2 db ',mundo', 0              ; Cadena 2
    cadena_concatenada db 30 dup(0)     ; Cadena de destino para la concatenacion

.code

lea SI, cadena1               ; Cargar SI con la direccion de inicio de la primera cadena
lea DI, cadena_concatenada    ; Cargar DI con la direccion de inicio de la cadena concatenada

copiar_cadena1:               ; Bloque para copiar la primera cadena
    mov AL, [SI]              ; Cargar el caracter actual de la primera cadena en AL
    mov [DI], AL              ; Guardar el caracter en la cadena concatenada
    inc SI                    ; Avanzar al siguiente caracter de la primera cadena
    inc DI                    ; Avanzar al siguiente espacio de memoria en la cadena concatenada
    cmp AL, 0                 ; Comprobar si hemos llegado al final de la primera cadena
    jne copiar_cadena1        ; Si no, continuar copiando

lea SI, cadena2              ; Cargar SI con la direccion de inicio de la segunda cadena

copiar_cadena2:              ; Bloque para copiar la segunda cadena
    mov AL, [SI]             ; Cargar el caracter actual de la segunda cadena en AL
    mov [DI], AL             ; Guardar el caracter en la cadena concatenada
    inc SI                   ; Avanzar al siguiente caracter de la segunda cadena
    inc DI                   ; Avanzar al siguiente espacio de memoria en la cadena concatenada
    cmp AL, 0H               ; Comprobar si hemos llegado al final de la cadena
    jne copiar_cadena2       ; Si no, continuar copiando

jmp finalizado               ; Terminar la concatenacion

finalizado:
    mov DX, 8888H
    mov AL, 4CH
    int 21H  ; Terminar el programa