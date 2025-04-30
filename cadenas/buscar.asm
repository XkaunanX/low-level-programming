;OPERACIONES CON CADENAS - Ejemplo 4: Buscar un caracter en una cadena
org 100H

.model small

.data

    cadena db 'hola, mundo', 0          ; Cadena en la que buscaremos el caracter
    caracter_a_buscar db ','            ; Caracter que quiero buscar

.code

lea SI, cadena               ; Cargar SI con la direccion base de los datos
mov AL, caracter_a_buscar    ; Cargar AL con el caracter que queremos buscar

buscar_caracter:
    mov BL, [SI]             ; Cargar el caracter actual de la cadena en BL
    cmp BL, AL               ; Comparar el caracter actual con el que estamos buscando
    je encontrado            ; Si son iguales, saltar a encontrado
    cmp BL, 0                ; Comprobar si llegamos al final de la cadena
    je no_encontrado         ; Si es 0, significa que hemos llegado al final
    inc SI                   ; Avanzar al siguiente caracter de la cadena
    jmp buscar_caracter      ; Volver a buscar el siguiente caracter

encontrado:
    mov DX, 4444H            ; Mostrar si el caracter ha sido encontrado
    jmp finalizacion

no_encontrado:
    mov DX, 7777H            ; Mostrar si no se ha encontrado el caracter
    jmp finalizacion

finalizacion:
    mov AL, 4CH
    int 21H  ; Terminar el programa