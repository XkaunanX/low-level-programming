org 100h

.model small
.stack 100h

.data
    num1 db 56
    num2 db 98

.code

start:
    ; Cargar los numeros en AX y BX
    mov al, [num1]
    mov bl, [num2]

    ; Llamar al modulo de calculo del MCD
    call calcular_mcd

    ; Terminar el programa
    mov ah, 4ch
    int 21h

; Modulo para calcular el MCD usando el algoritmo de Euclides
calcular_mcd:
    cmp al, bl          ; Comparar los numeros
    je mcd_calculado    ; Si son iguales, el MCD es el valor de AL
    jl mcd_intercambiar ; Si AL es menor que BL, intercambiamos los valores

    ; Restar el valor menor al mayor
    sub al, bl
    call calcular_mcd   ; Llamamos recursivamente

mcd_intercambiar:
    xchg al, bl         ; Intercambiamos AL y BL
    sub bl, al          ; Restamos el valor menor al mayor
    call calcular_mcd   ; Llamamos recursivamente

mcd_calculado:
    ret

end start