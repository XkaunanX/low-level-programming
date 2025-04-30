;OPERACIONES CON CADENAS - Ejemplo 1: Copiar una cadena en otra
org 100H

.model small

.data

    cadena_origen db 'hola, mundo', 0   ; Cadena origen
    tamano_cadena equ $ - cadena_origen ; Calcular el tamaño de la cadena origen

    cadena_destino db 20 dup(0)         ; Cadena de destino con tamaño suficiente

.code

mov AX, @data
mov DS, AX    ; Cargo DS con la direccion base de los datos

lea SI, cadena_origen    ; Asigno la direccion de inicio de la cadena de origen en SI
lea DI, cadena_destino   ; Asigno la direccion de inicio de la cadena de destino en DI

copiar_cadena:
    mov AL, [SI]         ; Cargar el caracter actual de la cadena de origen en AL
    mov [DI], AL         ; Guardar el caracter en la cadena de destino
    inc SI               ; Avanzar al siguiente caracter de la cadena de origen
    inc DI               ; Avanzar al siguiente espacio de memoria en la cadena de destino
    cmp AL, 0H           ; Comprobar si hemos llegado al final de la cadena
    jne copiar_cadena    ; Si no, continuar copiando

jmp fin  ; Salir cuando hemos copiado la cadena

fin:
    mov DX, 8888H
    mov AL, 4CH
    int 21H  ; Terminar el programa