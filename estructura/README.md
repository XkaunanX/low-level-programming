# Segmentacion en la Arquitectura de Memoria

## Descripcion de la Segmentacion

La **segmentacion** es una tecnica de gestion de memoria en sistemas informaticos, donde la memoria se divide en segmentos logicos de tamaño variable. A diferencia de la paginacion, que divide la memoria en bloques fijos (paginas), la segmentacion permite que cada segmento tenga un tamaño diferente segun el tipo de datos o el tipo de codigo que se esta almacenando.

La segmentacion es util porque permite organizar la memoria de manera mas flexible, adaptandose a las necesidades del programa. Un segmento puede contener diferentes tipos de informacion, como codigo ejecutable, datos, o pilas, dependiendo de como se haya diseñado el programa.

## Tabla de Segmentos

La **tabla de segmentos** es un componente clave en el sistema de segmentacion. Esta tabla almacena la informacion de los segmentos, como la direccion base (el punto de inicio del segmento en la memoria fisica) y el limite (el tamaño del segmento). Cada entrada en la tabla de segmentos corresponde a un segmento de memoria y proporciona detalles sobre como acceder a el.

En general, la tabla de segmentos permite al procesador realizar la traduccion entre direcciones logicas (las direcciones que utiliza el programa) y direcciones fisicas (las direcciones reales en la memoria).

## Fragmentacion

La **fragmentacion** en la segmentacion se puede dividir en dos tipos:

1. **Fragmentacion externa**: Ocurre cuando hay espacios libres en la memoria que no pueden ser utilizados porque son demasiado pequeños para contener un segmento completo. Esta situacion puede causar que se desperdicie espacio en la memoria, ya que los segmentos no se ajustan completamente a estos espacios libres.
   
2. **Fragmentacion interna**: Ocurre cuando un segmento es mas grande de lo necesario para almacenar sus datos, dejando espacio no utilizado dentro del segmento. Aunque este tipo de fragmentacion puede ser menos comun, puede ocurrir en sistemas donde los segmentos tienen tamaños fijos o predefinidos.

La segmentacion sufre de fragmentacion externa.

## Punto de Vista del Usuario

Desde el punto de vista del usuario, la segmentacion resuelve varios problemas relacionados con la gestion de la memoria:

- **Flexibilidad**: La segmentacion permite que los programas se dividan en bloques logicos de tamaño variable, lo que facilita el manejo de datos de diferentes tamaños y tipos.
- **Proteccion y aislamiento**: Los segmentos pueden ser protegidos y aislados, de modo que el acceso a un segmento no afecte a otros segmentos, mejorando la seguridad y estabilidad del sistema.
- **Facilidad de programacion**: Los programadores pueden organizar sus programas en segmentos logicos (como codigo, datos, pilas), lo que facilita la gestion de los diferentes componentes del programa.

Sin embargo, la fragmentacion puede ser un problema, ya que puede llevar a una utilizacion ineficiente de la memoria, haciendo que el sistema se vuelva mas lento a medida que la memoria disponible se fragmenta.

## Paradigma de la Segmentacion

La segmentacion se basa en el **paradigma estructurado** de programacion. Este paradigma organiza los programas en bloques o modulos logicos, que son los segmentos en la memoria. Cada segmento puede contener un tipo especifico de informacion (por ejemplo, un segmento de codigo o un segmento de datos), lo que permite una mayor modularidad y organizacion del programa.

El paradigma estructurado fomenta la creacion de programas que son faciles de entender y mantener. En este contexto, la segmentacion ayuda a representar la estructura logica de un programa en la memoria, permitiendo una administracion mas intuitiva y eficiente de los recursos.


# Estructura de un programa en assembly 8086

En el 8086, la **memoria** se divide en **segmentos** de hasta 64 KB, y se utilizan registros de segmento para acceder a estas regiones de memoria. Los segmentos permiten organizar el codigo, los datos y la pila, proporcionando una estructura logica que facilita el acceso y la proteccion de la memoria.

## Registros de Segmento en Assembly 8086

En el 8086, hay cuatro registros de segmento principales que controlan el acceso a diferentes partes de la memoria:

### 1. **Code Segment (CS)**

El registro `CS` contiene la direccion base del segmento de codigo, que almacena las instrucciones ejecutables del programa.
Cuando el procesador busca ejecutar una instruccion, utiliza `CS` combinado con el puntero de instruccion (`IP`).
Ejemplo:

```assembly
mov ax, CS        ; Mueve el valor del segmento de codigo al registro AX
mov bx, offset etiqueta
jmp bx            ; Salta a la direccion especificada
```

### 2. **Data Segment (DS)**
El registro DS contiene la direccion base del segmento de datos, donde se almacenan variables y datos estaticos.
Se utiliza para acceder a datos definidos en la seccion .data del programa.

Ejemplo:

```assembly
mov ax, DS        ; Mueve el valor del segmento de datos al registro AX
mov si, offset variable
mov al, [si]      ; Carga el valor de la variable en AL
```

### 3. **Extra Segment (ES)**
El registro ES se utiliza como un segmento adicional para operaciones especiales, como transferencias de datos con instrucciones MOVS, CMPS, SCAS, etc.
A menudo se usa en conjunto con DS para realizar operaciones en bloques de memoria.

Ejemplo:

```assembly
mov ax, ES        ; Mueve el valor del segmento extra al registro AX
mov di, offset destino
mov cx, 10        ; Numero de bytes a copiar
rep movsb         ; Copia datos desde DS:SI a ES:DI
```

### 4. **Stack Segment (SS)**
El registro SS contiene la direccion base del segmento de pila, utilizado para manejar llamadas a subrutinas y almacenamiento temporal de datos.
El puntero de pila (SP) indica el desplazamiento dentro del segmento de pila.

Ejemplo:

```assembly
mov ax, SS        ; Mueve el valor del segmento de pila al registro AX
push ax           ; Guarda el valor en la pila
pop bx            ; Recupera el valor de la pila
```
