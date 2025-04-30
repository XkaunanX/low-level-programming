org 100h

.model small
.stack 100h

.data
    mensaje db 'Hola, mundo$' ; Cadena de texto con el terminador '$'

.code

start:
    ; Mostrar la cadena en pantalla
    mov ah, 09h
    lea dx, mensaje
    int 21h

    ; Terminar el programa
    mov ah, 4Ch
    int 21h

end start