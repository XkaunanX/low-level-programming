org 100h

.model small
.stack 100h

.code

start:
    ; Mostrar un caracter 'B' en la pantalla usando la interrupcion 10h
    mov ah, 0Eh       ; Funcion 0Eh de la interrupcion 10h (escribir caracter)
    mov al, 'B'       ; Caracter a mostrar
    int 10h

    ; Terminar el programa
    mov ah, 4Ch
    int 21h

end start