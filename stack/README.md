# Stack del 8086

La pila (stack) en el procesador 8086 es una estructura de datos utilizada para almacenar temporalmente direcciones de retorno, datos intermedios y registros durante la ejecucion de programas. Esta pila tiene una organizacion de tipo LIFO (Last In, First Out), lo que significa que el ultimo dato que se coloca en la pila es el primero que se extrae.

## Estructura de la Stack

En el 8086, la pila es organizada de la siguiente manera:

- **Top of Stack (TOS)**: Es el valor mas reciente que se ha colocado en la pila.
- **Direccion de retorno**: Al realizar una llamada a subrutina (CALL), la direccion de retorno se coloca en la pila para que, al ejecutar el RET, el procesador regrese a esa direccion.
- **Datos temporales**: Los valores de registros o datos intermedios se almacenan en la pila temporalmente durante las operaciones.
- **Bottom of Stack**: Es la direccion mas baja de la pila.

```plaintext
+----------------------+
| Direccion mas alta   |  <-- Top of Stack (TOS)
+----------------------+
| Retorno de direccion |  
| de subrutina         |
+----------------------+
| ...                  |
+----------------------+
| Datos temporales     |
| almacenados en la    |
| pila                 |
+----------------------+
| ...                  |
+----------------------+
| Direccion de retorno |  <-- Bottom of Stack
+----------------------+
```

## Direccion de la Stack

La pila esta localizada en un segmento especifico de memoria denominado Stack Segment (SS), y su direccion de inicio es determinada por el valor de SS:SP. La direccion de la pila se ajusta dinamicamente a medida que se realizan operaciones PUSH y POP.

```plaintext
+--------------------------+
|          Memoria          |
+--------------------------+
| Direccion alta           |
| 0xFFFF                   |
| ------------------------ |
| ...                      |
| ------------------------ |
| Direccion de la Stack    |
| (Inicio de la Stack)     |
| SS:SP                    |
| ------------------------ |
| Datos de la Pila         |
| ------------------------ |
| ...                      |
| ------------------------ |
| Direccion baja           |
| 0x0000                   |
+--------------------------+
```

# Operaciones sobre la Pila en Assembly 8086

1. **PUSH**
   - La instruccion `PUSH` coloca un valor en la parte superior de la pila.
   - El valor se coloca en la direccion de memoria apuntada por el puntero de pila (SP), y luego el puntero de pila se decrece.
   - Ejemplo: `PUSH AX` empuja el valor contenido en el registro AX a la pila.

2. **POP**
   - La instruccion `POP` extrae un valor de la parte superior de la pila.
   - El valor se recupera de la direccion de memoria apuntada por el puntero de pila (SP), y luego el puntero de pila se incrementa.
   - Ejemplo: `POP BX` saca el valor del registro BX de la pila.

3. **PUSHF**
   - La instruccion `PUSHF` coloca el contenido del registro de bandera (Flags) en la pila.
   - Esto permite guardar el estado de las banderas antes de realizar ciertas operaciones.
   - Ejemplo: `PUSHF` guarda el valor de las banderas en la pila.

4. **POPF**
   - La instruccion `POPF` recupera el valor del registro de bandera (Flags) desde la pila.
   - Esto restaura el estado de las banderas a como estaba antes de que se ejecutara el `PUSHF`.
   - Ejemplo: `POPF` restaura las banderas desde la pila.

5. **ENTER**
   - La instruccion `ENTER` prepara la pila para una llamada a una subrutina, guardando el marco de la pila.
   - Generalmente se utiliza para establecer el espacio de almacenamiento para las variables locales en subrutinas.
   - Ejemplo: `ENTER 10, 0` establece un marco de pila de 10 bytes para variables locales.

6. **LEAVE**
   - La instruccion `LEAVE` deshace los efectos de la instruccion `ENTER`, restaurando el puntero de pila (SP) al estado anterior.
   - Se usa generalmente al finalizar una subrutina.
   - Ejemplo: `LEAVE` limpia el marco de pila de la subrutina.
