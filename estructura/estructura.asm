ORG 0100H

.MODEL SMALL

.STACK 0100H             ; SEGMENTO DE PILA (SS)

.DATA                    ; SEGMENTO DE DATOS (DS)

    MSG DB 'HOLA MUNDO$'  
    NUMERO DB 5           

.DATA?                   ; SEGMENTO DE DATOS EXTRA (ES)

    RES DB 0              

.CODE                    ; SEGMENTO DE CODIGO (CS)

    MOV AX, @DATA        
    MOV DS, AX           
    MOV ES, AX           

    MOV DX, OFFSET MSG   
    MOV AH, 09h          
    INT 21h              

    PUSH AX              
    MOV AL, [NUMERO]     
    ADD AL, 3            
    MOV ES:[RES], AL     

    POP AX               

    MOV DL, [RES]        
    ADD DL, '0'          
    MOV AH, 02h          
    INT 21h              

    MOV AX, 4C00h        
    INT 21h