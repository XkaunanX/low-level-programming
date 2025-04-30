org 100h

.model small
.stack 100h

.data
    mensaje db 'Hola, mundo!$', 0

.code

; Inicializacion
start:
    ; Llamar a la funcion de impresion del mensaje
    call imprimir_mensaje
    
    ; Terminar el programa
    mov ah, 4ch
    int 21h

; Llamada a la funcion para imprimir el mensaje
imprimir_mensaje:
    ; Mostrar el mensaje en la pantalla
    mov ah, 09h
    lea dx, mensaje
    int 21h
    ret

end start