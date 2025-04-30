# Uso de cadenas

En Assembly 8086, las cadenas se manejan tipicamente como secuencias de bytes almacenados en memoria, donde cada caracter de la cadena es representado por un valor ASCII. A continuacion, se describen las operaciones mas comunes para trabajar con cadenas de caracteres.

1. **MOVSB (Move String Byte)**
La instruccion `MOVSB` mueve un byte desde la direccion de memoria apuntada por `SI` (Source Index) a la direccion de memoria apuntada por `DI` (Destination Index).  
Esta instruccion incrementa o decrementa automaticamente los registros `SI` y `DI` segun el valor de la bandera `DF` (Direction Flag). Si `DF` esta claro, `SI` y `DI` se incrementan; si esta establecido, `SI` y `DI` se decrementan.  
**Ejemplo:**
```assembly
MOV SI, OFFSET cadenaOrigen  ; Direccion de origen
MOV DI, OFFSET cadenaDestino ; Direccion de destino
MOVSB                       ; Copia un byte de cadenaOrigen a cadenaDestino
```

2. **MOVSW (Move String Word)**
La instruccion `MOVSW` es similar a `MOVSB`, pero mueve una palabra (2 bytes) desde la direccion de memoria apuntada por `SI` a la direccion de memoria apuntada por `DI`.  
Esta instruccion tambien ajusta automaticamente los registros `SI` y `DI`.  
**Ejemplo:**
```assembly
MOV SI, OFFSET cadenaOrigen  ; Direccion de origen
MOV DI, OFFSET cadenaDestino ; Direccion de destino
MOVSW                       ; Copia una palabra (2 bytes) de cadenaOrigen a cadenaDestino
```

3. **LODSB (Load String Byte)**
La instruccion `LODSB` carga un byte desde la direccion de memoria apuntada por `SI` al registro `AL`. Luego, `SI` se incrementa o decrementa dependiendo de la bandera `DF`.  
**Ejemplo:**
```assembly
MOV SI, OFFSET cadena        ; Direccion de la cadena
LODSB                        ; Carga un byte de la cadena en AL
```

4. **LODSW (Load String Word)**
Similar a `LODSB`, pero carga una palabra (2 bytes) desde la direccion de memoria apuntada por `SI` al registro `AX`. Despues de la operacion, `SI` se ajusta automaticamente.  
 **Ejemplo:**
```assembly
MOV SI, OFFSET cadena        ; Direccion de la cadena
LODSW                        ; Carga una palabra (2 bytes) de la cadena en AX
```

5. **STOSB (Store String Byte)**
La instruccion `STOSB` almacena el valor de `AL` en la direccion de memoria apuntada por `DI`. Luego, `DI` se ajusta segun el valor de la bandera `DF`.  
**Ejemplo:**
```assembly
MOV DI, OFFSET cadenaDestino ; Direccion de destino
MOV AL, 'A'                  ; Valor a almacenar
STOSB                        ; Almacena AL en cadenaDestino
```

6. **STOSW (Store String Word)**
Similar a `STOSB`, pero almacena el valor de `AX` (una palabra de 2 bytes) en la direccion de memoria apuntada por `DI`. Despues de la operacion, `DI` se ajusta automaticamente.  
**Ejemplo:**
```assembly
MOV DI, OFFSET cadenaDestino ; Direccion de destino
MOV AX, 'AB'                 ; Valor a almacenar
STOSW                        ; Almacena AX en cadenaDestino
```

7. **SCASB (Scan String Byte)**
La instruccion `SCASB` compara un byte almacenado en `AL` con el byte en la direccion de memoria apuntada por `DI`. Luego, `DI` se ajusta segun la bandera `DF`. El resultado de la comparacion afecta las banderas de estado.  
**Ejemplo:**
```assembly
MOV AL, 'A'                  ; Valor a buscar
MOV DI, OFFSET cadenaDestino ; Direccion de la cadena
SCASB                        ; Compara AL con el byte en cadenaDestino
```

8. **SCASW (Scan String Word)**
Similar a `SCASB`, pero compara una palabra (2 bytes) en `AX` con la palabra en la direccion de memoria apuntada por `DI`.
**Ejemplo:**
```assembly
MOV AX, 'AB'                 ; Valor a buscar
MOV DI, OFFSET cadenaDestino ; Direccion de la cadena
SCASW                        ; Compara AX con la palabra en cadenaDestino
```

9. **CMPSB (Compare String Byte)**
La instruccion `CMPSB` compara un byte desde la direccion de memoria apuntada por `SI` con el byte en la direccion de memoria apuntada por `DI`.  
Luego, `SI` y `DI` se ajustan automaticamente y las banderas de estado se modifican segun el resultado de la comparacion.  
**Ejemplo:**
```assembly
MOV SI, OFFSET cadena1       ; Direccion de la primera cadena
MOV DI, OFFSET cadena2       ; Direccion de la segunda cadena
CMPSB                        ; Compara los bytes de las dos cadenas
```

10. **CMPSW (Compare String Word)**
Similar a `CMPSB`, pero compara una palabra (2 bytes) en las direcciones de memoria apuntadas por `SI` y `DI`.  
**Ejemplo:**
```assembly
MOV SI, OFFSET cadena1       ; Direccion de la primera cadena
MOV DI, OFFSET cadena2       ; Direccion de la segunda cadena
CMPSW                        ; Compara las palabras de las dos cadenas
```
