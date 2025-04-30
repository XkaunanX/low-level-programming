.MODEL SMALL
.STACK 0100H

.DATA
lista DW 1111H, 2222H, 3333H

.CODE
ORG 0100H
START:
    MOV SI, 2            ; Indice para acceder al tercer elemento
    MOV AX, lista[SI*2]  ; Direccionamiento indexado: AX = contenido de lista + desplazamiento
    MOV DX, AX
    MOV AH, 4CH
    INT 21H              ; Salida del programa
END START