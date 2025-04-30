ORG 0100H

JMP INICIO

NUEVALINEA             EQU 0AH   ; \n
CRET                   EQU 0DH   ; \r
BCKSP                  EQU 08H   ; \b


; 
; Cadena codificada:
;
CADENA_CODIFICADA      DB      'Hola sere un mensaje cifrado!', CRET, NUEVALINEA, '$'


CADENA_ENTRADA         DB      259 DUP ('$')    ; Area reservada para la cadena de entrada (256 caracteres + \r + \n + $)                  

;                                                 
; Mensajes y dialogos a mostrar en la interfaz de usuario:
;
MENSAJE_BIENVENIDA     DB      NUEVALINEA, 'Bienvenido al sistema de cifrado monoalfabetico! ', CRET, NUEVALINEA
                       DB      'Por favor, elige como deseas proceder:', CRET, NUEVALINEA
                       DB      '1- Introducir cadena como entrada (maximo: 256 caracteres)', CRET, NUEVALINEA
                       DB      '2- Usar cadena codificada', CRET, NUEVALINEA, '$'

MENSAJE_USANDO_CODIGO  DB      '===============================', CRET, NUEVALINEA
                       DB      'USANDO TU CADENA CODIFICADA' , CRET, NUEVALINEA
                       DB      '===============================', CRET, NUEVALINEA, '$'
                       
MENSAJE_USANDO_ENTRADA DB      '===============================', CRET, NUEVALINEA
                       DB      'Por favor, introduce tu cadena a continuacion' , CRET, NUEVALINEA
                       DB      '===============================', CRET, NUEVALINEA, '$'
                       
MENSAJE_INTENTAR_NUEVO DB      CRET, NUEVALINEA, '¿Intentarlo una vez mas? (s/n)', CRET, NUEVALINEA, '$'

MENSAJE_PRESIONAR_TECLA DB      'Presiona cualquier tecla para salir...$'                      

MENSAJE_MOSTRAR_ORIGEN DB      CRET, NUEVALINEA, 'Tu cadena original: $'                       
MENSAJE_MOSTRAR_CIFRADO DB      CRET, 'Mensaje cifrado: $'
MENSAJE_MOSTRAR_DESCIFRADO DB      CRET, 'Mensaje descifrado: $'
MENSAJE_CIFRANDO       DB      'Cifrando...$'
MENSAJE_DESCIFRANDO    DB      'Descifrando...$'


; Solo para referencia --------------------->  'abcdefghijklmnopqrstuvwxyz'
TABLA_CIFRADO_MINUSCULA DB      97 DUP (' '), 'qwertyuiopasdfghjklzxcvbnm'  
TABLA_DESCIFRADO_MINUSCULA DB      97 DUP (' '), 'kxvmcnophqrszyijadlegwbuft'  
; Dejamos 97(61H) espacios en blanco antes del inicio de la tabla
; ya que el valor ASCII de 'a' = 61H
                                   
TABLA_CIFRADO_MAYUSCULA DB      65 DUP (' '), 'QWERTYUIOPASDFGHJKLZXCVBNM'  
TABLA_DESCIFRADO_MAYUSCULA DB      65 DUP (' '), 'KXVMCNOPHQRSZYIJADLEGWBUFT'
; Dejamos 65(41H) espacios en blanco antes del inicio de la tabla
; ya que el valor ASCII de 'A' = 41H


INICIO:                 
  
                       LEA     DX, MENSAJE_BIENVENIDA
                       MOV     AH, 09
                       INT     21H                    
                       MOV     AH, 0
                       INT     16H
                       CMP     AL, '2'        ; El usuario eligio usar la cadena codificada
                       JE      USAR_CODIGO
                       CMP     AL, '1'        ; El usuario eligio introducir una cadena
                       JNE     INICIO
                       LLAMAR  OBTENER_ENTRADA
                       JMP     INICIO_PROCESAR
                       
USAR_CODIGO:          LEA     DX, MENSAJE_USANDO_CODIGO
                       MOV     AH, 09
                       INT     21H
                       LEA     SI, CADENA_CODIFICADA 
                       
                                                                                         
INICIO_PROCESAR:

; Mostrar la cadena original
                       LEA     DX, MENSAJE_MOSTRAR_ORIGEN
                       MOV     AH, 09          ; El valor de AH se ajusta ya que la operacion de int 21H depende de su valor
                       INT     21H             ; En AH = 09, int 21H muestra la cadena en DS:DX
                       LEA     DX, SI
                       MOV     AH, 09          
                       INT     21H             

; Cifrar:              
                       LEA     DX, MENSAJE_CIFRANDO   ; Mostrar mensaje
                       MOV     AH, 09
                       INT     21H
                       MOV     AH, 1           ; El valor de AH se ajusta ya que la operacion de cifrado/descifrado depende de su valor
                       LLAMAR  CIFRAR_DESCIFRAR ; AH = 1 significa cifrado monoalfabetico, 0 significa descifrado monoalfabetico, otros valores no hacen nada

; Mostrar el resultado en la pantalla:
                       LEA     DX, MENSAJE_MOSTRAR_CIFRADO
                       MOV     AH, 09          ; El valor de AH se ajusta ya que la operacion de int 21H depende de su valor
                       INT     21H             ; En AH = 09, int 21H muestra la cadena en DS:DX             
                       LEA     DX, SI
                       MOV     AH, 09          
                       INT     21H             

; Descifrar:
                       LEA     DX, MENSAJE_DESCIFRANDO    ; Mostrar mensaje
                       MOV     AH, 09
                       INT     21H
                       MOV     AH, 0           ; AH = 0 significa descifrado monoalfabetico
                       LLAMAR  CIFRAR_DESCIFRAR 
                    
; Mostrar el resultado en la pantalla:
                       LEA     DX, MENSAJE_MOSTRAR_DESCIFRADO
                       MOV     AH, 09          ; El valor de AH se ajusta ya que la operacion de int 21H depende de su valor
                       INT     21H             ; En AH = 09, int 21H muestra la cadena en DS:DX             
                       LEA     DX, SI
                       MOV     AH, 09          
                       INT     21H

; Mostrar mensaje de intentar nuevamente
INTENTAR_NUEVO:       LEA     DX, MENSAJE_INTENTAR_NUEVO    
                       MOV     AH, 09
                       INT     21H
                       MOV     AH, 0
                       INT     16H
                       CMP     AL, 's'
                       JE      INICIO
                       CMP     AL, 'n'
                       JNE     INTENTAR_NUEVO
                       
                    
; Esperar cualquier tecla...
                       LEA     DX, MENSAJE_PRESIONAR_TECLA
                       MOV     AH, 09
                       INT     21H
                       MOV     AH, 0           ; El valor de AH se ajusta ya que la operacion de int 16H depende de su valor
                       INT     16H             ; En AH = 00, int 16H espera la pulsacion de una tecla del teclado (sin eco)       
                    
                       RET   
   
   
;   SI - direccion de la cadena a cifrar
CIFRAR_DESCIFRAR       PROC    NEAR
                       PUSH    SI
SIGUIENTE_CARACTER:    MOV     AL, [SI]
                	   CMP     AL, '$'         ; ¿Fin de la cadena?
                	   JE      FIN_CADENA
                	   	 
                	   CMP     AL, ' '         ;<--- Comprobacion de espacio
        	           JNE     CONTINUAR        ; Dado que esto era un requisito en el trabajo, uno de mis requisitos era omitir espacios en mi resultado
	                   LLAMAR  OMITIR_ESPACIO  ; Puedes eliminar estas 4 lineas y la subrutina OMITIR_ESPACIO si no deseas hacer esto.       	           
                       JMP     SIGUIENTE_CARACTER ;<--- Fin de la comprobacion de espacio
                       	
CONTINUAR:            LLAMAR  CIFRAR_DESCIFRAR_CARACTER
    	               INC     SI	
            	       JMP     SIGUIENTE_CARACTER
FIN_CADENA:           POP     SI
                       RET            
CIFRAR_DESCIFRAR       ENDP


      
;
; Subrutina para mover espacios al final de la cadena (despues de '$')
; Puedes eliminar esta subrutina si no la necesitas
;
OMITIR_ESPACIO        PROC    NEAR    
                       PUSH    SI              ; La razon por la que envio el espacio despues de '$'
	                                           ; es para manejar varios espacios consecutivos sin
OMITIR_ESPACIO_LOOP:  MOV     AL, [SI+1]      ; entrar en un bucle infinito en lugar de solo intercambiar
                       MOV     [SI+1], ' '     ; el caracter ' ' con el caracter siguiente 
                       MOV     [SI], AL
                       INC     SI
                       CMP     [SI-1], '$'                       
                       JNE     OMITIR_ESPACIO_LOOP
                       POP     SI  
                       RET
OMITIR_ESPACIO        ENDP    
                   


; Subrutina para convertir el caracter con la
; tabla apropiada (cifrar/descifrar) (mayuscula/minuscula)
CIFRAR_DESCIFRAR_CARACTER PROC    NEAR
                       PUSH    BX    
                       CMP     AL, 'a'       
                       JB      COMPROBAR_CARACTER_MAYUSCULA
                       CMP     AL, 'z'
                       JA      OMITIR_CARACTER
                       CMP     AH, 1          ; AH = 1 significa cifrado monoalfabetico, como estamos trabajando con minusculas, usamos TABLA_CIFRADO_MINUSCULA
                       JE      CIFRAR_MINUSCULA
                       CMP     AH, 0          ; AH = 0 significa descifrado monoalfabetico, como estamos trabajando con minusculas, usamos TABLA_DESCIFRADO_MINUSCULA
                       JNE     OMITIR_CARACTER
                       LEA     BX, TABLA_DESCIFRADO_MINUSCULA
                       JMP     TRADUCIR_CARACTER                     
CIFRAR_MINUSCULA:     LEA     BX, TABLA_CIFRADO_MINUSCULA 
                	   JMP     TRADUCIR_CARACTER                	
COMPROBAR_CARACTER_MAYUSCULA: CMP     AL, 'A'
                       JB      OMITIR_CARACTER
                       CMP     AL, 'Z'
                       JA      OMITIR_CARACTER
                       CMP     AH, 1          ; AH = 1 significa cifrado monoalfabetico, como estamos trabajando con mayusculas, usamos TABLA_CIFRADO_MAYUSCULA
                	   JE      CIFRAR_MAYUSCULA
                	   CMP     AH, 0          ; AH = 0 significa descifrado monoalfabetico, como estamos trabajando con mayusculas, usamos TABLA_DESCIFRADO_MAYUSCULA
                       JNE     OMITIR_CARACTER
                       LEA     BX, TABLA_DESCIFRADO_MAYUSCULA
                       JMP     TRADUCIR_CARACTER 
CIFRAR_MAYUSCULA:     LEA     BX, TABLA_CIFRADO_MAYUSCULA	
TRADUCIR_CARACTER:    XLATB
	                   MOV     [SI], AL	                		
OMITIR_CARACTER:      POP     BX
                       RET
CIFRAR_DESCIFRAR_CARACTER ENDP



; Subrutina para tomar la cadena de entrada del usuario
; La subrutina maneja si el usuario presiona retroceso: elimina el caracter y aumenta CX
; La subrutina permite al usuario introducir un maximo de 256 caracteres 
OBTENER_ENTRADA        PROC    NEAR
                       LEA     DX, MENSAJE_USANDO_ENTRADA
                       MOV     AH, 09
                       INT     21H
                       LEA     SI, CADENA_ENTRADA
                       MOV     AH, 1
                       MOV     CX, 255        ; Para poner un limite en la entrada de la cadena a 256 caracteres            
                       JMP     BUCLE_ENTRADA
RETROCESO_PULSADO:     INC     CX             ; Incrementar CX en caso de que el usuario presione retroceso ya que se elimina el caracter
BUCLE_ENTRADA:        INT     21H                                                      
                       MOV     [SI], AL
                       CMP     AL, BCKSP
                       JNE     CONTINUAR_ENTRADA                     
                       CMP     SI, OFFSET CADENA_ENTRADA  
                       JE      BUCLE_ENTRADA     ; Si la cadena esta vacia, solo repite el bucle sin afectar SI ni incrementar CX                    
                       MOV     [SI], ' '
                       LLAMAR  OMITIR_ESPACIO
                       DEC     SI                       
                       JMP     RETROCESO_PULSADO                                            

CONTINUAR_ENTRADA:    INC     SI
                       CMP     AL, CRET
                       JE      TERMINAR_CADENA                   

                       LOOP    BUCLE_ENTRADA     ; LOOP en lugar de JMP para incorporar (CX != 0000H) como condicion de salto                                              
TERMINAR_CADENA:      MOV     [SI-1], CRET
                       MOV     [SI], NUEVALINEA
                       MOV     [SI+1], '$'
                       LEA     SI, CADENA_ENTRADA
                       RET
OBTENER_ENTRADA        ENDP
        
FIN
