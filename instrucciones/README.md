## ¿Que es una Instruccion?

En el contexto de la programacion en ensamblador, una **instruccion** es una operacion o comando que la CPU puede ejecutar. Cada instruccion en un programa de ensamblador se traduce en una operacion basica, como mover datos, realizar calculos, o controlar el flujo de ejecucion. En el caso de la arquitectura 8086, las instrucciones operan sobre registros y memoria, y generalmente se representan mediante una secuencia de bytes en la memoria.

## Ciclo de Vida de una Instruccion

El ciclo de vida de una instruccion es el proceso completo de ejecucion de una instruccion por parte de la CPU. Este ciclo generalmente consta de las siguientes fases:

1. **Busqueda (Fetch):** La CPU lee la instruccion desde la memoria.
2. **Decodificacion (Decode):** La CPU interpreta la instruccion, determinando que operacion debe realizar.
3. **Ejecucion (Execute):** La CPU ejecuta la operacion especificada por la instruccion.
4. **Acceso a Memoria (Memory Access):** Si la instruccion requiere leer o escribir datos en memoria, se realiza en esta fase.
5. **Escritura de Resultados (Write-back):** Los resultados de la instruccion se escriben en los registros o en memoria.

Este ciclo se repite continuamente a lo largo de la ejecucion de un programa.

## CISC vs RISC

Las arquitecturas de computadoras se pueden clasificar principalmente en dos tipos: **CISC** (Complex Instruction Set Computing) y **RISC** (Reduced Instruction Set Computing).

- **CISC (Complex Instruction Set Computing):** En una arquitectura CISC, como la 8086, las instrucciones son mas complejas y pueden realizar multiples operaciones en un solo ciclo de reloj. Esto significa que cada instruccion puede realizar tareas como cargar, almacenar y realizar operaciones aritmeticas en un solo paso. Sin embargo, esto puede resultar en un mayor consumo de ciclos de reloj para cada instruccion y una mayor complejidad en la decodificacion de instrucciones.

- **RISC (Reduced Instruction Set Computing):** En una arquitectura RISC, las instrucciones son mas simples y generalmente requieren un numero constante de ciclos de reloj para ejecutarse. Cada instruccion realiza una unica operacion, lo que permite una ejecucion mas rapida en muchos casos, pero puede requerir mas instrucciones para lograr tareas complejas.

La arquitectura 8086 es un ejemplo de un diseño CISC, con un conjunto de instrucciones mas complejo en comparacion con los diseños RISC modernos.

## Microdigo

El **microdigo** es un conjunto de instrucciones de bajo nivel que describe como una instruccion de alto nivel, como las del lenguaje ensamblador, se traduce en operaciones de la CPU. En las arquitecturas CISC como la 8086, el microdigo es fundamental para descomponer una instruccion compleja en una serie de microoperaciones que se pueden ejecutar en los ciclos de reloj de la CPU.

Por ejemplo, para la instruccion `MOV AX, 10`, el microdigo podria descomponerla en las siguientes microoperaciones:

1. **Leer la instruccion** `MOV AX, 10` desde la memoria.
2. **Decodificar la instruccion** para identificar que el valor 10 debe moverse al registro AX.
3. **Escribir el valor 10** en el registro AX.

En la practica, el microdigo para una instruccion varia segun el tipo de operacion y la arquitectura especifica de la CPU.

## Traductores del Lenguaje

Los **traductores** son programas que convierten el codigo fuente escrito en un lenguaje de alto nivel o en ensamblador a un formato que la CPU pueda ejecutar, generalmente codigo binario. En el caso de la arquitectura 8086, existen varios tipos de traductores:

- **Ensambladores (Assembler):** Son los programas que traducen el codigo escrito en ensamblador a codigo de maquina. El ensamblador genera un archivo binario ejecutable, traduciendo cada instruccion de ensamblador en una secuencia de bytes que la CPU puede procesar directamente.
  
  Ejemplo de un ensamblador que puede usarse con la 8086 es **MASM (Microsoft Macro Assembler)**.

## Destino y Fuente

En el contexto de las instrucciones en assembly 8086, **fuente** y **destino** son terminos que se utilizan para describir los operandos de una instruccion:

- **Fuente:** Es el valor que se va a operar o copiar en la operacion. Por ejemplo, en la instruccion `MOV AX, 10`, el valor `10` es la fuente.
- **Destino:** Es el registro o la ubicacion en memoria donde se almacenara el resultado de la operacion. En la instruccion `MOV AX, 10`, el registro `AX` es el destino.

Por lo tanto, en las instrucciones de ensamblador, la fuente y el destino son los componentes que especifican los operandos con los que se va a trabajar la CPU.

## Modificacion de las Banderas

Al ejecutar una instruccion, el estado de las **banderas** del procesador puede cambiar. Estas banderas son bits especiales en la CPU que reflejan el resultado de las operaciones y se utilizan para controlar el flujo del programa. Dependiendo de la operacion, las banderas como el **Carry Flag**, **Zero Flag** o **Overflow Flag** pueden ser modificadas, lo que afecta la ejecucion de instrucciones subsecuentes.

## Tipos de Instrucciones en Assembly 8086

Las instrucciones de ensamblador 8086 se pueden clasificar en diferentes tipos segun su proposito. A continuacion, se describen los principales tipos de instrucciones.

# 1. Instrucciones de Datos

Estas instrucciones permiten mover, cargar, almacenar y manipular datos en los registros o en la memoria. Permiten trabajar con los datos directamente.  
  
**MOV**: Mueve datos de una fuente a un destino.

```plaintext
MOV AX, 1234h       ; Cargar el valor 1234h en el registro AX
MOV BX, 0x3000      ; Direccion de memoria en la RAM donde se va a guardar el valor
MOV [BX], AX        ; Guardar el valor de AX en la RAM en la direccion 0x3000
```
**PUSH**: Coloca un valor en la pila.  
**POP**: Extrae un valor de la pila.  

```assembly
MOV AX, 1234h      ; Cargar el valor 1234h en el registro AX
PUSH AX            ; Colocar el valor de AX en la pila

MOV AX, 5678h      ; Cargar el valor 5678h en el registro AX
PUSH AX            ; Colocar el valor de AX (5678h) en la pila

POP BX             ; Extraer el valor de la pila y guardarlo en BX (sera 5678h)
POP AX             ; Extraer el siguiente valor de la pila y guardarlo en AX (sera 1234h)
``` 

# 2. Instrucciones de Control de Flujo (Saltos)

Las instrucciones de control de flujo permiten alterar el orden de ejecucion de las instrucciones, lo que permite crear bucles, saltos y tomar decisiones.

- **JMP**: Realiza un salto incondicional a una direccion especificada.
- **JE / JZ**: Realiza un salto si la bandera de cero esta activada, es decir, si los dos valores comparados son iguales.
- **JNE / JNZ**: Realiza un salto si la bandera de cero no esta activada, es decir, si los dos valores comparados son diferentes.

```assembly
MOV AX, 10h         ; Cargar el valor 10h en el registro AX
MOV BX, 10h         ; Cargar el valor 10h en el registro BX

CMP AX, BX          ; Comparar los valores de AX y BX
JE igual            ; Si AX y BX son iguales, saltar a la etiqueta "igual"

MOV DX, 0           ; Si no son iguales, cargar 0 en DX (esto no se ejecutara en este caso)

igual:
MOV DX, 1           ; Si los valores son iguales, cargar 1 en DX
```

# 3. Instrucciones Aritmeticas

Estas instrucciones realizan operaciones matematicas con los valores almacenados en los registros.

- **ADD**: Suma dos valores.
- **SUB**: Resta dos valores.
- **MUL**: Multiplica dos valores.
- **DIV**: Divide un valor entre otro.

## Instruccion ADD

La instruccion `ADD` suma dos operandos y almacena el resultado en el registro `AX`. Este registro es utilizado como destino para almacenar el resultado de la operacion, aunque dependiendo de la arquitectura y el contexto, el resultado podria almacenarse en otro registro o en una direccion de memoria.

## Instruccion SUB

La instruccion `SUB` toma dos operandos: el operando de destino y el operando de fuente. Resta el valor del operando de fuente al operando de destino, y coloca el resultado en el operando de destino. A menudo, el operando de destino es un registro, como `AX`, y el operando de fuente puede ser un registro, un valor inmediato o una direccion de memoria.

## Funcionamiento con Complemento a 2

En la arquitectura 8086, la instruccion `SUB` no realiza directamente una operacion de resta en terminos aritmeticos. En lugar de ello, la resta se lleva a cabo sumando el **complemento a 2** del operando de fuente al operando de destino.

El **complemento a 2** de un numero se obtiene mediante los siguientes pasos:

1. **Inversion de los bits** del numero (complemento a 1).
2. **Suma de 1** al resultado obtenido.

Una vez calculado el complemento a 2 del operando de fuente, la operacion de resta se convierte en una operacion de suma entre el operando de destino y el complemento a 2 del operando de fuente.

### Ejemplo de la Instruccion SUB

Supongamos que tenemos los siguientes valores:

- `AX = 5`
- `BX = 3`

Cuando ejecutamos la instruccion `SUB AX, BX`, la operacion de resta `AX - BX` se convierte en una suma del valor de `AX` con el complemento a 2 de `BX`.

1. El complemento a 2 de `BX = 3` es calculado como sigue:
   - Representacion binaria de `BX` (3): `0000 0011`
   - Complemento a 1 de `3`: `1111 1100`
   - Suma de 1 al complemento a 1: `1111 1101` (esto es -3 en complemento a 2).

2. La instruccion `SUB` suma el contenido de `AX` con el complemento a 2 de `BX`: AX + (-BX) = 5 + (-3) = 2

En este caso, el resultado `2` se almacena en el registro `AX`.

## Instruccion MUL

La instruccion **MUL** realiza la multiplicacion de un valor por el contenido de un registro de 8 bits o 16 bits. El resultado de la multiplicacion se almacena en los registros `AX`, `DX:AX` o `AX:DX`, dependiendo de si se esta trabajando con numeros de 8 bits o 16 bits. El impacto en otros registros depende del tipo de multiplicacion realizada:

### 1. **Multiplicacion de 8 bits:**

Cuando se realiza una multiplicacion de dos valores de 8 bits, el operando de 8 bits se multiplica por el registro `AL` (parte baja de `AX`). El resultado de esta multiplicacion se almacena en los registros `AX`, los cuales son de 16 bits.

- **Registros afectados**: La multiplicacion de 8 bits solo afectara los registros `AX` (especificamente `AL` y `AH`), sin afectar otros registros como `BX`, `CX`, etc.
- **Posible desbordamiento**: Si el resultado de la multiplicacion excede los 8 bits, los registros `AH` y `AL` seran modificados para contener el resultado de 16 bits.

### 2. **Multiplicacion de 16 bits:**

Cuando se realiza una multiplicacion de dos valores de 16 bits, el operando de 16 bits se multiplica por el valor contenido en `AX`. El resultado de la multiplicacion se almacena en los registros `DX:AX`, donde `DX` contiene la parte mas significativa del resultado y `AX` contiene la parte menos significativa.

- **Registros afectados**: En una multiplicacion de 16 bits, tanto `AX` como `DX` seran afectados, ya que el resultado de la multiplicacion puede requerir hasta 32 bits. Los registros `AX` contienen los 16 bits menos significativos, mientras que los registros `DX` contienen los 16 bits mas significativos.
- **Posible desbordamiento**: Dado que el resultado puede superar los 16 bits, los registros `DX` y `AX` se usan para almacenar todo el resultado de la multiplicacion.

### ¿Por que la multiplicacion afecta otros registros?

- **Tamaño del Resultado**: La razon principal por la que la multiplicacion puede afectar otros registros es el tamaño del resultado. En el caso de multiplicaciones de 16 bits, el resultado puede ser un numero de 32 bits, lo que requiere dos registros (`DX` y `AX`) para almacenarlo.
- **Registros Predeterminados**: El uso de `AX` y `DX` como registros predeterminados para almacenar el resultado de la multiplicacion implica que estos registros pueden verse alterados durante la operacion, lo que puede afectar otras partes del programa si se estan utilizando estos registros para otros fines.

## Instruccion DIV

La instruccion `DIV` en la arquitectura 8086 se utiliza para realizar una operacion de division. La operacion puede involucrar numeros de 8 bits o 16 bits, y el resultado se almacena en un par de registros especificos segun el tamaño de los operandos.

## Descripcion

La instruccion `DIV` realiza una division de un operando (dividendo) entre otro operando (divisor). Dependiendo del tamaño de los operandos, los registros involucrados varian, pero el resultado siempre se almacena en los registros de destino del procesador.

### Funcionamiento

### Division de 8 bits

Cuando se realiza una division de 8 bits, el dividendo se encuentra en los registros `AX`. El registro `AH` contiene la parte alta del dividendo y el registro `AL` contiene la parte baja. El cociente se almacena en el registro `AL`, mientras que el resto se guarda en el registro `AH`.

- **Dividendo**: `AX` (16 bits).
- **Cociente**: `AL` (8 bits).
- **Resto**: `AH` (8 bits).

### Division de 16 bits

Para una division de 16 bits, el dividendo se encuentra en los registros `DX:AX`. El registro `DX` contiene la parte alta del dividendo y el registro `AX` contiene la parte baja. El cociente se almacena en el registro `AX` y el resto en el registro `DX`.

- **Dividendo**: `DX:AX` (32 bits).
- **Cociente**: `AX` (16 bits).
- **Resto**: `DX` (16 bits).

### Consideraciones

- **Division por cero**: Si el divisor es cero, la instruccion `DIV` generara una excepcion de division por cero, lo que detendria la ejecucion del programa.
- **Rango de valores**: Es importante verificar que los registros de destino sean lo suficientemente grandes para contener tanto el cociente como el resto. En el caso de divisiones de 16 bits, el registro `AX` puede almacenar un cociente de hasta 65535, mientras que el registro `DX` se utiliza para almacenar el resto.

# 4. Instrucciones Logicas

Las instrucciones logicas permiten realizar operaciones a nivel de bits, como AND, OR, XOR e invertir los bits de un registro con mascaras.

- **AND**: Realiza una operacion logica AND entre dos valores.
- **OR**: Realiza una operacion logica OR entre dos valores.
- **XOR**: Realiza una operacion logica XOR entre dos valores.
- **NOT**: Invierte todos los bits de un valor.  

## Operaciones logicas y mascaras
Una mascara es un valor binario utilizado para manipular bits especificos de un registro o una posicion de memoria. Las mascaras se emplean para realizar operaciones como:

- **Activacion de bits:** Establecer uno o mas bits en 1.
- **Desactivacion de bits:** Establecer uno o mas bits en 0.
- **Conmutacion de bits:** Cambiar el estado de uno o mas bits (de 1 a 0 o de 0 a 1).
- **Prueba de bits:** Verificar si uno o mas bits estan en un estado especifico.

## Operaciones Comunes con Mascaras
Las mascaras se utilizan junto con operadores logicos en ensamblador para manipular bits de manera controlada:

### 1. Activacion de Bits (OR)
Para activar bits especificos, se utiliza la operacion **OR** (`OR`). Esta operacion establece en 1 los bits indicados por la mascara, mientras deja los demas sin cambios.

### 2. Desactivacion de Bits (AND)
Para desactivar bits especificos, se utiliza la operacion **AND** (`AND`) con el complemento de la mascara. Esto fuerza a 0 los bits indicados por la mascara, dejando los demas sin cambios.

### 3. Conmutacion de Bits (XOR)
Para cambiar el estado de bits especificos, se utiliza la operacion **XOR** (`XOR`). Los bits indicados por la mascara se alternan entre 0 y 1, mientras que los demas permanecen sin cambios.

### 4. Prueba de Bits (AND)
Para verificar el estado de bits especificos, se utiliza la operacion **AND** (`AND`). Si el resultado es distinto de 0, significa que al menos uno de los bits indicados por la mascara estaba activo (en 1).

## Mascaras Comunes

### Mascara de 8 bits
Supongamos que se desea manipular el registro **AL** (8 bits):

- Mascara para activar los bits 0 y 3: `00001001` (0x09 en hexadecimal).
- Mascara para desactivar los bits 1 y 2: `11111011` (0xFB en hexadecimal).
- Mascara para conmutar los bits 7 y 6: `11000000` (0xC0 en hexadecimal).

### Mascara de 16 bits
Si se trabaja con un registro de 16 bits como **AX**:

- Mascara para activar los bits 15 y 14: `1100000000000000` (0xC000 en hexadecimal).
- Mascara para desactivar los bits 7 y 0: `1111111011111110` (0xFEFE en hexadecimal).

# 5. Instrucciones de Comparacion

Estas instrucciones comparan dos valores y establecen las banderas de la CPU en funcion del resultado de la comparacion.

- **CMP**: Compara dos valores.
- **TEST**: Realiza una operacion AND entre dos valores, pero solo afecta las banderas sin almacenar el resultado.

# 6. Instrucciones de Entrada y Salida

Estas instrucciones permiten leer y escribir datos en puertos de entrada y salida, facilitando la interaccion con los dispositivos perifericos.

- **IN**: Lee un byte desde un puerto de entrada.
- **OUT**: Escribe un byte a un puerto de salida.
