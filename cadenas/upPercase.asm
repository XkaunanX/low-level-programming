;OPERACIONES CON CADENAS - Ejemplo 5: Convertir una cadena a mayusculas
org 100H

.model small

.data

    string db 'hola, mundo', 0          ; Cadena a convertir a mayusculas

.code

lea SI, string              ; Cargar SI con la direccion de inicio de la cadena

convertir_mayusculas:
    mov AL, [SI]             ; Cargar el caracter actual de la cadena en AL
    cmp AL, 0                ; Comprobar si llegamos al final de la cadena
    je fin_conversion

    cmp AL, 'a'              ; Comprobar si el caracter es una letra minuscula 'a'
    jl siguiente_caracter    ; Si no, pasar al siguiente caracter
    cmp AL, 'z'              ; Comprobar si el caracter es una letra minuscula 'z'
    jg siguiente_caracter    ; Si no, pasar al siguiente caracter

    sub AL, 20H              ; Convertir el caracter a mayusculas restando 32 (20H) al valor ASCII
    mov [SI], AL             ; Guardar el caracter convertido en la misma posicion de la cadena

siguiente_caracter:
    inc SI                   ; Avanzar al siguiente caracter de la cadena
    jmp convertir_mayusculas  ; Continuar convirtiendo

fin_conversion:
    mov DX, 6666H            ; Mostrar que la conversion ha terminado
    mov AL, 4CH
    int 21H                  ; Finalizar el programa