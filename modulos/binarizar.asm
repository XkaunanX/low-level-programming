org 100h

.model small
.stack 100h

.data
    numero db 12       ; Numero que vamos a convertir

.code

start:
    ; Cargar el numero a convertir
    mov al, [numero]

    ; Llamar al modulo de conversion a binario
    call convertir_a_binario

    ; Terminar el programa
    mov ah, 4ch
    int 21h

; Modulo para convertir un numero a su representacion binaria
convertir_a_binario:
    mov cl, 8              ; Definir 8 bits para la conversion
    mov bl, al             ; Copiar el numero a BL
    convertir_loop:
        shl bl, 1          ; Desplazar el numero a la izquierda
        jc bit_1           ; Si el bit desplazado es 1, saltar a bit_1
        mov dl, '0'        ; Si el bit es 0, cargar '0' en DL
        jmp imprimir_bit

    bit_1:
        mov dl, '1'        ; Si el bit es 1, cargar '1' en DL

    imprimir_bit:
        mov ah, 02h        ; Llamar a la interrupcion para imprimir el bit
        int 21h
        loop convertir_loop ; Repetir para los 8 bits

    ret

end start