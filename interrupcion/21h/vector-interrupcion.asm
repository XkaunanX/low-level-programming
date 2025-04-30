org 100h

.model small
.stack 100h

.code

start:
    ; Establecer un nuevo vector para la interrupcion 21h
    mov ah, 25h       ; Funcion 25h de int 21h (establecer vector de interrupcion)
    mov al, 21h       ; Interrupcion 21h
    lea dx, new_isr   ; Direccion de la nueva rutina
    int 21h           ; Establecer el nuevo vector

    ; Terminar el programa
    mov ah, 4Ch
    int 21h

new_isr:
    ; Nueva rutina de interrupcion para la 21h
    ret

end start