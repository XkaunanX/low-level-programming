;OPERACIONES CON CADENAS - Ejemplo 3: Comparar 2 cadenas
org 100H

.model small

.data

    primer_cadena db 'hola', 0          ; Primera cadena
    segunda_cadena db 'hola', 0         ; Segunda cadena

.code

lea SI, primer_cadena        ; Cargar SI con la direccion de inicio de la primera cadena
lea DI, segunda_cadena       ; Cargar DI con la direccion de inicio de la segunda cadena

comparar_cadenas:            ; Bloque donde comparo las cadenas
    mov AL, [SI]             ; Cargar el caracter actual de la primera cadena en AL
    mov BL, [DI]             ; Cargar el caracter actual de la segunda cadena en BL
    cmp AL, BL               ; Comparar los caracteres
    jne cadenas_diferentes   ; Si los caracteres son diferentes, salto a cadenas_diferentes
    cmp AL, 0H               ; Comprobar si llegamos al final de la cadena
    je cadenas_iguales       ; Si llegamos al final, las cadenas son iguales

    inc SI                   ; Avanzar al siguiente caracter de la primera cadena
    inc DI                   ; Avanzar al siguiente caracter de la segunda cadena
    jmp comparar_cadenas     ; Volver a comparar los siguientes caracteres

cadenas_iguales:   ; Bloque si las cadenas son iguales
    mov DX, 8888H
    jmp completado

cadenas_diferentes:   ; Bloque si las cadenas son diferentes
    mov DX, 5555H
    jmp completado

completado:
    mov DX, 8888H
    mov AL, 4CH
    int 21H  ; Terminar el programa