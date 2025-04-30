org 100h

.model small
.stack 100h

.data
    num1 db 12
    num2 db 8

.code

start:
    ; Cargar los numeros a comparar
    mov al, [num1]
    mov bl, [num2]

    ; Llamar al modulo para obtener el maximo
    call obtener_maximo

    ; Terminar el programa
    mov ah, 4ch
    int 21h

; Modulo para obtener el maximo entre dos numeros
obtener_maximo:
    cmp al, bl      ; Comparar los dos numeros
    jge maximo      ; Si AL es mayor o igual que BL, AL es el maximo
    mov al, bl      ; De lo contrario, BL es el maximo
maximo:
    ret

end start