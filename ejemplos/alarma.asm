JMP  DONE                       ;Salta a DONE
        
LOW:      PRINT 'LED VERDE ENCENDIDO'  ;Imprime un mensaje de indicacion
          JMP  DONE                       ;Salta a DONE
        
HIGH:     PRINT 'LED ROJO ENCENDIDO'    ;Imprime un mensaje de indicacion

DONE:     PRINTN 
          PRINT '-----------------------------------------------------'
          PRINTN 
          PRINT 'Otro Lector en 3 minutos, Por Favor Espere'
          PRINTN
          CALL DELAY3MIN     ;Llama a la funcion de retraso de 3 minutos
          JMP  START         ;Salta a START

          RET             ;Devuelve al llamador principal (Sistema Operativo)  

          DELAY3MIN PROC  ;Procedimiento para el retraso de 3 minutos 
              
          MOV  AL, 3      ;Contador de bucles
                          ;La resolucion del tiempo de espera es en microsegundos (60 millones de microsegundos --> 1 minuto) equivalente a 03938700H
REPEAT:   MOV  CX, 0393H  ;Bytes superiores (0393H)
          MOV  DX, 8700H  ;Bytes inferiores (8700H)
          MOV  AH, 86H    ;Registro auxiliar con 86H para INT 15H
          INT  15H        ;Funcion de espera BIOS, los entradas son CX:DX, espera un numero especifico de microsegundos antes de devolver el control al llamador
          DEC  AL         ;Decrementa AL
          JNZ  REPEAT     ;Bucle 3 veces para generar el retraso de 3 minutos  

          RET             ;Devuelve al llamador 
        
DELAY3MIN ENDP  
          
          
DEFINE_SCAN_NUM           ;Un macro que escanea la entrada del usuario definida antes del final
END                       ;Detiene el programa
