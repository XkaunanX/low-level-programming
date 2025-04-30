org 100h

.model small
.stack 100h

.code

start:
    ; Leer un caracter desde el teclado (funcion 01h de int 21h)
    mov ah, 01h
    int 21h           ; Espera un caracter

    ; Mostrar el caracter leido
    mov dl, al        ; El caracter leido esta en AL, lo pasamos a DL
    mov ah, 02h
    int 21h           ; Muestra el caracter

    ; Terminar el programa
    mov ah, 4Ch
    int 21h

end start