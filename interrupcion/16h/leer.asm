org 100h

.model small
.stack 100h

.code

start:
    ; Leer un caracter desde el teclado sin eco (funcion 00h de int 16h)
    mov ah, 00h
    int 16h           ; Lee un caracter sin mostrarlo

    ; Terminar el programa
    mov ah, 4Ch
    int 21h

end start