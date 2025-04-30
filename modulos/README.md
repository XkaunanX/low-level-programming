# Modularizacion de Programas con las Instrucciones CALL y RET en Assembly 8086

## **CALL**
La instruccion `CALL` se utiliza para realizar una **llamada a una subrutina** o funcion.
Cuando se ejecuta un `CALL`, el procesador hace lo siguiente:
1. **Empuja la direccion de retorno** en la pila. Esta es la direccion de la instruccion que sigue a la llamada (`CALL`), para que luego se pueda regresar a ese punto de ejecucion.
2. **Cambia el flujo de control** al inicio de la subrutina, haciendo que el procesador comience a ejecutar el codigo en la direccion de la subrutina indicada.

```assembly
CALL MiSubrutina   ; Llama a la subrutina MiSubrutina
```

## **RET**
La instruccion `RET` se utiliza para **regresar de una subrutina** a la instruccion que sigue a la llamada (`CALL`).
Cuando se ejecuta un `RET`, el procesador realiza los siguientes pasos:
1. **Extrae la direccion de retorno** desde la pila (la direccion que fue empujada por el `CALL`).
2. **Ajusta el puntero de instruccion (IP)** a la direccion extraida, lo que hace que el procesador retome la ejecucion del programa justo despues de la llamada.
Si se pasaron parametros a la subrutina a traves de la pila, se puede usar `RET N` para limpiar esos parametros de la pila, donde `N` es el numero de bytes que deben limpiarse.

```assembly
RET 4  ; Limpia 4 bytes de la pila (por ejemplo, si se pasaron 2 parametros de 2 bytes cada uno)
```

## **Resumen del flujo de ejecucion:**
1. **CALL**:
   - Empuja la direccion de retorno en la pila.
   - Salta al inicio de la subrutina.

2. **RET**:
   - Extrae la direccion de retorno de la pila.
   - Regresa a la instruccion siguiente al `CALL`.

## **Ejemplo completo:**

```assembly
; Llamada a subrutina y retorno

CALL MiSubrutina     ; Llama a la subrutina MiSubrutina

; Despues de la llamada
MiSubrutina:
    ; Cualquier codigo de la subrutina
    RET              ; Regresa al punto despues del CALL

; Aqui el flujo de ejecucion continua despues del RET
