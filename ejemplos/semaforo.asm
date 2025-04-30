#start=Traffic_Lights.exe#
;Rojo es el menos significativo de cada 3 bits consecutivos: 0,3,6,9
;Amarillo es el medio significativo de cada 3 bits consecutivos: 1,4,7,A
;Verde es el mas significativo de cada 3 bits consecutivos: 2,5,8,B
;los ultimos 4 bits no se usan C,D,E,F

NAME "traffic"
MOV AX, 249h  ; 249h significa todos son rojos, los bits 0,3,6,9 son todos unos
OUT 4, AX     ;4 es el numero de salida para el trafico (integrado)

; espera 5 segundos para el movimiento inicial
MOV     CX, 4Ch    ;    004C4B40h = 5,000,000 microsegundos calculados por el calculador de decimal a hexa
MOV     DX, 4B40h
MOV     AH, 86h         ;AH se carga con 86 (mapea a la interrupcion 15, asi que es constante) se necesita para la interrupcion 15
INT     15h         ;la interrupcion 15 revisa CX:DX y se usa para retrasar

LOP:
MOV AX, TRANSITION1   ;1ra iteracion
OUT 4, AX

; esperar 120 segundos (120 millones de microsegundos)
;MOV     CX, 0727h    ;    07270E00H=120 millones de microsegundos, 120 no 180 porque necesitaremos que el amarillo este activo por 60 segundos (rojo y verde activos con amarillo, asi que el total para rojo y verde es 180 segundos)
;MOV     DX, 0E00h              
;MOV     AH, 86h
;INT     15h                 
;ESTE CODIGO DEBERIA HACER UN RETRASO DE 2 MINUTOS, PERO SOLO HACE 1 MINUTO POR ALGUNA RAZON, POR ESO RETRASE 60 SEGUNDOS DOS VECES
; esperar 60 segundos (60 millones de microsegundos)
MOV     CX, 0393h    ;    03938700H=60 millones de microsegundos
MOV     DX, 8700h
MOV     AH, 86h
INT     15h
; esperar 60 segundos (60 millones de microsegundos)
MOV     CX, 0393h    ;    03938700H=60 millones de microsegundos
MOV     DX, 8700h
MOV     AH, 86h
INT     15h

MOV AX, TRANSITION2    ;2da iteracion
OUT 4, AX

; esperar 60 segundos (60 millones de microsegundos)
MOV     CX, 0393h    ;    03938700H=60 millones de microsegundos
MOV     DX, 8700h
MOV     AH, 86h
INT     15h

MOV AX, TRANSITION3     ;3ra iteracion
OUT 4, AX

; esperar 60 segundos (60 millones de microsegundos)
MOV     CX, 0393h    ;    03938700H=60 millones de microsegundos
MOV     DX, 8700h
MOV     AH, 86h
INT     15h
; esperar 60 segundos (60 millones de microsegundos)
MOV     CX, 0393h    ;    03938700H=60 millones de microsegundos
MOV     DX, 8700h
MOV     AH, 86h
INT     15h

MOV AX, TRANSITION4     ;4ta iteracion
OUT 4, AX

; esperar 60 segundos
MOV     CX, 0393h    
MOV     DX, 8700h
MOV     AH, 86h
INT     15h

MOV AX, 249h  ; 249h significa todos son rojos, los bits 0,3,6,9 son todos unos
OUT 4, AX     ;4 es el numero de salida para el trafico (integrado)

; esperar 5 segundos para el movimiento inicial
MOV     CX, 4Ch    ;    004C4B40h = 5,000,000 microsegundos calculados por el calculador de decimal a hexa
MOV     DX, 4B40h
MOV     AH, 86h         ;AH se carga con 86 (mapea a la interrupcion 15, asi que es constante) se necesita para la interrupcion 15
INT     15h         ;la interrupcion 15 revisa CX:DX y se usa para retrasar

JMP LOP

;                                 FEDC_BA98_7654_3210
TRANSITION1               EQU     0000_0011_0000_1100b ;2 Rojo y 2 Verde (norte y sur estan verdes)
TRANSITION2               EQU     0000_0111_1001_1110b ;todos 4 son Amarillos (dos comenzaran a moverse pronto y dos pararan de moverse pronto) y el rojo y verde permanecen)
TRANSITION3               EQU     0000_1000_0110_0001b ;2 Rojo y 2 Verde (este y oeste estan verdes)
TRANSITION4               EQU     0000_1100_1111_0011b ;todos 4 son Amarillos (dos comenzaran a moverse pronto y dos pararan de moverse pronto) y el rojo y verde permanecen)
