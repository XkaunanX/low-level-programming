# Registros del CPU 8086

Este conjunto de ejemplos demuestra como se utilizan los diferentes registros del procesador 8086. Los registros del 8086 se dividen en registros de proposito general, de segmento, de puntero, de indice y de estado. En estos ejemplos, se explica la funcion de cada uno de estos registros.

```plaintext
+------------------+-----------------+------------------+------------------+
|                           Registros de Datos                             |
+------------------+-----------------+------------------+------------------+
| AX   | AH | AL   | BX   | BH | BL   | CX   | CH | CL  | DX   | DH | DL   |
+------------------+-----------------+------------------+------------------+
| 16   | 8  | 8    | 16   | 8  | 8   | 16    | 8  | 8   | 16   | 8  | 8    |
+------------------+-----------------+------------------+------------------+


+-------------------------+---------------------------+
| Registros de Puntero    | Registros de Segmento     |
+-------------------------+---------------------------+
| SP (Stack Pointer)      | CS (Code Segment)         |
| BP (Base Pointer)       | DS (Data Segment)         |
| SI (Source Index)       | SS (Stack Segment)        |
| DI (Destination Index)  | ES (Extra Segment)        |
+-------------------------+---------------------------+
| 16 bits                 | 16 bits                   |
+-------------------------+---------------------------+

+---------------------------+
| Registro de Estado        |
+---------------------------+
| FLAGS                     |
| Contiene indicadores como |
| ZF (Zero Flag), CF (Carry)|
+---------------------------+
| 16 bits                   |
+---------------------------+

```

## Registros de Proposito General

- **AX**: Acumulador, utilizado para operaciones aritmeticas y de entrada/salida.
- **BX**: Base, utilizado generalmente como puntero a datos en segmentos de datos.
- **CX**: Contador, se utiliza principalmente para el conteo en bucles e iteraciones.
- **DX**: Datos, se utiliza para operaciones aritmeticas y entrada/salida (por ejemplo, con puertos).

## Registros de Indice

- **SI**: Indice fuente, usado para operaciones con datos en memoria.
- **DI**: Indice destino, se usa para operaciones con cadenas de caracteres y otros datos.

## Registros de Puntero y Base

- **SP**: Puntero de pila, apunta al tope de la pila.
- **BP**: Base de pila, usado para acceder a datos locales en la pila.

## Registros de Segmento

- **CS**: Registro de segmento de codigo, que contiene la direccion base del segmento de codigo.
- **DS**: Registro de segmento de datos, que contiene la direccion base del segmento de datos.
- **ES**: Registro de segmento extra, usado para operaciones adicionales.
- **SS**: Registro de segmento de pila, contiene la direccion base de la pila.

## Registros de Estado

- **IP**: Puntero de instruccion, contiene la direccion de la siguiente instruccion a ejecutar.
- **FLAGS**: Registro de estado, que contiene informacion sobre el estado del procesador.

### Flags en el Registro **FLAGS**

El registro **FLAGS** contiene varios bits que indican el estado de las operaciones realizadas. Los principales flags son:

- **CF (Carry Flag)**: Se establece si hubo un acarreo en una operacion de suma o una toma prestada en una operacion de resta.
- **PF (Parity Flag)**: Indica si el numero de bits con valor 1 en el resultado de una operacion es par o impar.
- **AF (Auxiliary Carry Flag)**: Se establece si hubo un acarreo desde el bit 3 hacia el bit 4 en una operacion de suma o resta.
- **ZF (Zero Flag)**: Se establece si el resultado de una operacion es cero.
- **SF (Sign Flag)**: Se establece si el resultado de una operacion es negativo.
- **TF (Trap Flag)**: Se utiliza para la depuracion del programa. Si se establece, el procesador ejecuta una interrupcion despues de cada instruccion.
- **IF (Interrupt Flag)**: Controla la habilitacion o deshabilitacion de las interrupciones.
- **DF (Direction Flag)**: Indica la direccion de las operaciones de cadenas. Si esta establecido, las operaciones avanzan de manera decreciente (de derecha a izquierda).
- **OF (Overflow Flag)**: Se establece si ocurre un desbordamiento en una operacion aritmetica.
- **IOPL (Input/Output Privilege Level)**: Bits 12 y 13, indican el nivel de privilegio para operaciones de entrada/salida.
- **NT (Nested Task Flag)**: Indica si una tarea esta anidada dentro de otra tarea.
- **RF (Resume Flag)**: Se utiliza para control de tareas en el procesador.
- **VM (Virtual 8086 Mode Flag)**: Indica si el procesador esta operando en modo virtual 8086.
- **AC (Alignment Check Flag)**: Se establece cuando ocurre un error de alineacion de datos.
- **NC (Not Used)**: No se utiliza en la mayoria de los sistemas actuales.
- **TF (Trap Flag)**: Ya descrito, utilizado para la depuracion de la ejecucion.

Cada uno de estos flags puede ser utilizado por el procesador para determinar como manejar el flujo de ejecucion de un programa, especialmente en el caso de saltos condicionales, manejo de errores y control de interrupciones.
