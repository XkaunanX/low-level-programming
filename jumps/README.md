# Ejemplos de Saltos en Assembly 8086

En Assembly, los **saltos** permiten modificar el flujo de ejecucion del programa. Los saltos pueden ser **incondicionales**, que siempre redirigen el flujo del programa, o **condicionales**, que dependen del resultado de una operacion anterior.

## Calculo de la Direccion de Salto

Cuando se utiliza una instruccion de salto como `JMP`, la direccion de destino es calculada con base en el desplazamiento desde la instruccion siguiente al `JMP`. Este desplazamiento se expresa en formato hexadecimal.

### Ejemplo de Salto hacia Adelante

Si un salto esta diseñado para avanzar en el programa, se calcula el desplazamiento sumando la diferencia entre la direccion de la etiqueta de destino y la direccion de la instruccion siguiente al `JMP`. Por ejemplo:

```plaintext
Direccion de la etiqueta de destino: `0000:0108`
Direccion de la instruccion siguiente al `JMP`: `0000:0105`

El desplazamiento se calcula como la diferencia entre estas direcciones: `0108 - 0105 = 0003h`.

Por lo tanto, el salto hacia adelante se representaria con un desplazamiento de `0003h`.
```

### Ejemplo de Salto hacia Atras

En el caso de un salto hacia atras, el calculo es similar, pero el desplazamiento sera negativo. Por ejemplo:

```plaintext
Direccion de la etiqueta de destino: `0000:0100`
Direccion de la instruccion siguiente al `JMP`: `0000:0105`

El desplazamiento se calcula como la diferencia: `0100 - 0105 = FFFBh`.

Esto representa un salto hacia atras con un desplazamiento de `FFF Bh`.
```

## Resumen

- **Salto hacia adelante:** El desplazamiento es positivo.
- **Salto hacia atras:** El desplazamiento es negativo. el numero sera negativo, y se representara en complemento a dos (en hexadecimal, el valor negativo se vera como un numero grande, como FFFBh).

## Tipos de Saltos

1. **Salto Incondicional (`JMP`)**:
   - Redirige la ejecucion a otra instruccion sin evaluar ninguna condicion.

2. **Saltos Condicionales**:
   - **JE (Jump if Equal)**: Salta si los operandos son iguales.
   - **JNE (Jump if Not Equal)**: Salta si los operandos no son iguales.
   - **JG (Jump if Greater)**: Salta si el primer operando es mayor.
   - **JL (Jump if Less)**: Salta si el primer operando es menor.

3. **Bucle (`LOOP`)**:
   - Decrementa el registro `CX` y salta si `CX` no es cero.
