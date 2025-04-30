org 100h

.model small
.stack 100h

.code

start:
    ; Cambiar el color de fondo a negro y texto a blanco
    mov ah, 09h       ; Funcion 09h (establecer el color de texto)
    mov al, 0Fh       ; Color blanco
    mov bh, 00h       ; Fondo negro
    int 10h

    ; Mostrar el mensaje
    mov ah, 0Eh
    mov al, 'H'
    int 10h

    ; Terminar el programa
    mov ah, 4Ch
    int 21h

end start