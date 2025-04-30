# low-level-programming
Assembly es un lenguaje de programacion de bajo nivel que traduce directamente a las instrucciones ejecutables por el procesador. Cada instruccion en assembly corresponde a una operacion especifica que el hardware puede realizar. Es usado para obtener un control preciso sobre el hardware y optimizar el rendimiento.

## Tamaño de Registros
En el procesador 8086, los registros son de 16 bits, aunque algunos se pueden dividir en partes de 8 bits:

- **Registros de datos:** AX (AH/AL), BX (BH/BL), CX (CH/CL), DX (DH/DL).
- **Registros de puntero e indice:** SP (Stack Pointer), BP (Base Pointer), SI (Source Index), DI (Destination Index).
- **Registros de segmento:** CS (Code Segment), DS (Data Segment), SS (Stack Segment), ES (Extra Segment).
- **Registro de estado:** FLAGS, que contiene indicadores como Zero Flag (ZF), Carry Flag (CF), etc.

Cada registro tiene un tamaño de 16 bits, permitiendo manejar valores entre 0 y 65,535 en decimal o 0x0000 a 0xFFFF en hexadecimal.

```plaintext

                        +-------------------------------------+
                        |              8086                  |
                        +-------------------------------------+
                                 |        |       |
            +-------------------+--------+-------+-------------------+
            |                   |        |       |                   |
    +---------------+    +---------------+   +---------------+   +---------------+
    |    ALU        |    |    Registros  |   |    Bus de      |   |    Unidad de  |
    | (Aritmetica y |    |   Proposito   |   |   Direcciones  |   |   Control     |
    |  Logica)      |    |   General     |   |   y Datos      |   |               |
    +---------------+    +---------------+   +---------------+   +---------------+
            |                   |                   |                   |
    +---------------+    +---------------+   +---------------+   +---------------+
    |     Registros |    |     Registros |   |    Bus de      |   |    Interfaz   |
    |  de Segmentos |    |  de Proposito |   |  Entrada/Salida|   |  Externa      |
    |   (CS, DS, SS,|    |   (AX, BX, CX,|   |  (DMA, Puertos |   |   de Memoria  |
    |    ES)        |    |   DX, SI, DI) |   |   de E/S)      |   |               |
    +---------------+    +---------------+   +---------------+   +---------------+
            |                       |
    +---------------+        +----------------+
    |   Unidad de   |        |    Controlador  |
    |   Buses       |        |   de Interrup-  |
    |   (Direccion, |        |   ciones y      |
    |    Datos)     |        |   de Memoria    |
    +---------------+        +----------------+

```

## CISC
El 8086 pertenece a la arquitectura **CISC** (*Complex Instruction Set Computer*). Sus caracteristicas principales son:

- **Conjunto de instrucciones extenso:** Permite realizar operaciones complejas con pocas instrucciones.
- **Modos de direccionamiento variados:** Directo, indirecto, basado en registros, indexado, entre otros.
- **Ciclos de instruccion variables:** Dependiendo de la complejidad de cada instruccion.
- **Acceso directo a memoria:** Permite trabajar con datos almacenados en memoria sin moverlos a registros intermedios.

```plaintext
                  +-------------------------+
                  |    Instrucciones CISC   |
                  +-------------------------+
                            |
                            v
+---------------------------------------------+
|              Decodificador de Instrucciones |
+---------------------------------------------+
                            |
                            v
+---------------------------------------------+
|               Unidad de Control            |
+---------------------------------------------+
                            |
                            v
+---------------------------------------------+
|             Registros de la CPU            |
|    (Acumulador, Contador de Programa, etc.) |
+---------------------------------------------+
                            |
                            v
+---------------------------------------------+
|      Unidad Aritmetica y Logica (ALU)      |
+---------------------------------------------+
                            |
                            v
+---------------------------------------------+
|           Memoria (RAM/Cache)              |
+---------------------------------------------+
                            |
                            v
+---------------------------------------------+
|            Entrada/Salida (I/O)            |
+---------------------------------------------+
```

## Paradigma
El paradigma del ensamblador 8086 es **imperativo** y **orientado a la arquitectura**. El programador controla directamente el flujo de ejecucion, los registros y la memoria. Esto permite un alto nivel de optimizacion y eficiencia en el uso del hardware.

## Segmentacion y Direcciones Fisicas

El procesador 8086 utiliza **segmentacion de memoria** para acceder a hasta 1 MB (2^20 direcciones) de memoria fisica, dividiendola en segmentos de 64 KB (2^16 direcciones) cada uno. Los segmentos se combinan con un desplazamiento para calcular una direccion fisica:

```plaintext
+---------------------------------------------+
|               Memoria RAM 8086              |
|                (1 MB de memoria)            |
+---------------------------------------------+
|   Segmento 0 (Direccion Base 0x0000)        |
|   +---------------------------------------+ |
|   |       Segmento 0x0000 - 0xFFFF        | |
|   +---------------------------------------+ |
|                                             |
+---------------------------------------------+
|   Segmento 1 (Direccion Base 0x1000)        |
|   +---------------------------------------+ |
|   |       Segmento 0x1000 - 0x1FFF        | |
|   +---------------------------------------+ |
|                                             |
+---------------------------------------------+
|   Segmento 2 (Direccion Base 0x2000)        |
|   +---------------------------------------+ |
|   |       Segmento 0x2000 - 0x2FFF        | |
|   +---------------------------------------+ |
|                                             |
+---------------------------------------------+
|   Segmento 3 (Direccion Base 0x3000)        |
|   +---------------------------------------+ |
|   |       Segmento 0x3000 - 0x3FFF        | |
|   +---------------------------------------+ |
|                                             |
+---------------------------------------------+
|   Segmento 4 (Direccion Base 0x4000)        |
|   +---------------------------------------+ |
|   |       Segmento 0x4000 - 0x4FFF        | |
|   +---------------------------------------+ |
|                                             |
+---------------------------------------------+
|   Segmento 5 (Direccion Base 0x5000)        |
|   +---------------------------------------+ |
|   |       Segmento 0x5000 - 0x5FFF        | |
|   +---------------------------------------+ |
|                                             |
+---------------------------------------------+
|   Segmento 6 (Direccion Base 0x6000)        |
|   +---------------------------------------+ |
|   |       Segmento 0x6000 - 0x6FFF        | |
|   +---------------------------------------+ |
|                                             |
+---------------------------------------------+
|   Segmento 7 (Direccion Base 0x7000)        |
|   +---------------------------------------+ |
|   |       Segmento 0x7000 - 0x7FFF        | |
|   +---------------------------------------+ |
|                                             |
+---------------------------------------------+
|                    ...                     |
+---------------------------------------------+
|   Segmento 15 (Direccion Base 0xF000)       |
|   +---------------------------------------+ |
|   |       Segmento 0xF000 - 0xFFFF        | |
|   +---------------------------------------+ |
+---------------------------------------------+
```

## Interpretacion de la Direccion `3:12:05`

En sistemas que utilizan segmentacion de memoria, una direccion como `3:12:05` puede dividirse en componentes que representan diferentes niveles de organizacion en la memoria, tales como segmentos, paginas y desplazamientos dentro de las paginas.

### 1. **Numero de Segmento (`3`)**

El numero de segmento indica la **base** o el inicio de un bloque de memoria. Cada segmento tiene un tamaño fijo, generalmente de 64 KB.  
- En este ejemplo, el segmento esta identificado por el valor `3`, lo que significa que es el tercer bloque de memoria dentro de la organizacion de segmentos.

### 2. **Numero de Pagina (`12`)**

El numero de pagina representa una subdivision dentro del segmento. Si consideramos el segmento como un conjunto mas grande de datos, la pagina organiza estos datos en bloques mas pequeños.  
- Aqui, el valor `12` identifica la pagina especifica dentro del tercer segmento. Este valor ayuda a acceder de manera estructurada a areas mas pequeñas de la memoria segmentada.

### 3. **Numero Dentro de la Pagina (`05`)**

El numero dentro de la pagina, tambien llamado desplazamiento u **offset**, especifica la ubicacion exacta dentro de una pagina donde se encuentran los datos.  
- En este caso, el valor `05` apunta al sexto elemento (contando desde cero) dentro de la pagina identificada como `12`.

```plaintext
Segmento: 3
+---------------------------------------------------------------+
| Pagina 0                                                     |
|   Direcciones: 0x0000 - 0x00FF (256 direcciones)             |
|---------------------------------------------------------------|
| Pagina 1                                                     |
|   Direcciones: 0x0100 - 0x01FF (256 direcciones)             |
|---------------------------------------------------------------|
| Pagina 2                                                     |
|   Direcciones: 0x0200 - 0x02FF (256 direcciones)             |
|---------------------------------------------------------------|
| Pagina 3                                                     |
|   Direcciones: 0x0300 - 0x03FF (256 direcciones)             |
|---------------------------------------------------------------|
| Pagina 4                                                     |
|   Direcciones: 0x0400 - 0x04FF (256 direcciones)             |
|---------------------------------------------------------------|
| ...                                                          |
|---------------------------------------------------------------|
| Pagina 255                                                   |
|   Direcciones: 0xFF00 - 0xFFFF (256 direcciones)             |
+---------------------------------------------------------------+
```

### Direccion logica**: En el 8086, la direccion logica consiste en un par de valores:
   - Segmento (16 bits)
   - Desplazamiento (offset, 16 bits)

### Direccion Logica a Direccion Fisica
La direccion fisica se calcula asi:
```plaintext
Direccion Fisica = (Segmento × 16) + Desplazamiento
```
Por ejemplo:
- Segmento: 0x1234
- Desplazamiento: 0x5678
- Direccion Fisica: (0x1234 × 16) + 0x5678 = 0x12340 + 0x5678 = 0x179B8

### Caracteristicas de la Segmentacion
- Cada segmento puede contener hasta 64 KB.
- Los registros de segmento (CS, DS, SS, ES) definen la ubicacion base de un segmento.
- Se pueden usar registros como SI y DI para especificar el desplazamiento dentro del segmento.

## Lectura del Hexadecimal
El sistema hexadecimal utiliza 16 simbolos: 0-9 y A-F. Cada digito hexadecimal representa 4 bits (un nibble). Por ejemplo:

- Decimal: 255
- Binario: 11111111
- Hexadecimal: 0xFF

En el 8086, las direcciones y valores suelen expresarse en hexadecimal para simplificar la representacion de datos binarios.
