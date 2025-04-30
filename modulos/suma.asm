org 100h

.model small
.stack 100h

.data
    num1 db 5
    num2 db 10

.code

start:
    ; Cargar los numeros a sumar
    mov al, [num1]
    mov bl, [num2]
    
    ; Llamar al modulo de suma
    call sumar_numeros

    ; Mostrar el resultado (en AX)
    ; Aqui, se podria agregar codigo para mostrar el resultado
    ; en pantalla si fuera necesario.

    ; Terminar el programa
    mov ah, 4ch
    int 21h

; Modulo que suma dos numeros
sumar_numeros:
    add al, bl         ; Sumar el valor en BL al valor en AL
    mov ah, 0          ; Limpiar el registro AH (por si acaso)
    ret

end start