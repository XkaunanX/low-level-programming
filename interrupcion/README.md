# Interrupciones

Las interrupciones son mecanismos que permiten que el procesador interrumpa su flujo de ejecucion normal para atender una solicitud especial, como la entrada/salida de datos o la gestion de errores.

## Interrupciones de Software

Las interrupciones de software son generadas por el propio programa mediante instrucciones especificas. Estas interrupciones son utilizadas para solicitar servicios del sistema operativo o realizar otras tareas criticas. A traves de las interrupciones de software, los programas pueden ejecutar funciones que requieren acceso al sistema, como operaciones de entrada/salida o la gestion de recursos del sistema.

```plaintext
+---------------------------+
|     Usuario / Aplicacion  |
+---------------------------+
           |
 (Interrupcion de software)
           |
           v
+---------------------------+     (Llamada al sistema)
|    Espacio de Usuario     |--------------------------+
+---------------------------+                          |
           |                                           v
           v                                   +---------------------------+
+---------------------------+                  |      Kernel (nucleo)      |
|    Interrupcion de        |----------------> |     Espacio del Kernel    |
|     Software (Syscall)    |                  +---------------------------+
+---------------------------+                          |
           |                                           |
           v                                           v
+---------------------------+                  +---------------------------+
|  Ejecucion del Sistema    |                  |   Acceso a Hardware       |
|  (funciones del sistema)  |                  +---------------------------+
+---------------------------+
```

## Vectores de Interrupcion

El 8086 tiene una tabla de vectores de interrupcion, que es un conjunto de direcciones de memoria que apuntan a las rutinas encargadas de gestionar cada interrupcion. Cada vector corresponde a un tipo de interrupcion, y cuando se genera una interrupcion, el procesador consulta esta tabla para determinar que rutina debe ejecutarse.

```plaintext
+---------------------------------------------------------------+
| Tabla de Vectores de Interrupcion del 8086                    |
+---------------------------------------------------------------+
| Vector | Direccion de la Rutina de Interrupcion                |
+---------------------------------------------------------------+
| 0x00   | Direccion de la rutina para la interrupcion 0x00     |
| 0x01   | Direccion de la rutina para la interrupcion 0x01     |
| 0x02   | Direccion de la rutina para la interrupcion 0x02     |
| 0x03   | Direccion de la rutina para la interrupcion 0x03     |
| 0x04   | Direccion de la rutina para la interrupcion 0x04     |
| 0x05   | Direccion de la rutina para la interrupcion 0x05     |
| 0x06   | Direccion de la rutina para la interrupcion 0x06     |
| 0x07   | Direccion de la rutina para la interrupcion 0x07     |
| ...    | ...                                                   |
| 0xFF   | Direccion de la rutina para la interrupcion 0xFF     |
+---------------------------------------------------------------+
```

## Rutinas de Interrupcion

Cuando ocurre una interrupcion, el procesador guarda el contexto actual de la ejecucion y salta a la direccion de la rutina asociada con la interrupcion correspondiente. Esta rutina es responsable de manejar el evento de la interrupcion. Despues de ejecutar la rutina, el procesador retorna al flujo de ejecucion original, restaurando el contexto previo a la interrupcion.

```plaintext
+------------------+       +------------------+
|    Nuevo         |------>|    Listo         |
+------------------+       +------------------+
                                    |
                                    v
                           +------------------+         +------------------+
                           |   En Ejecucion   |  -->    |   Terminado      |
                           +------------------+         +------------------+
                              |          ^
                              v          |
                           +------------------+
                           |   Bloqueado      |
                           +------------------+                      
```

## Proceso de Carga y Ejecucion de una Interrupcion en 8086

#### Cargar la Interrupcion en AH
Para ejecutar una interrupcion en el 8086, primero se debe cargar el numero de la interrupcion en el registro **AH** o en un registro especifico segun la interrupcion que se desea generar. El numero de la interrupcion generalmente corresponde a un valor entre 0 y 255, que es el identificador de la rutina de interrupcion deseada.

Por ejemplo, para cargar el numero de la interrupcion en AH:

- El registro **AH** es utilizado para almacenar el numero de la interrupcion que se desea ejecutar.
- El numero de interrupcion es almacenado en **AH**, mientras que **AL** y otros registros pueden usarse para pasar parametros a la rutina de interrupcion.

### Ejecutar la Interrupcion
Una vez que el numero de la interrupcion se ha cargado en el registro **AH**, el siguiente paso es ejecutar la interrupcion mediante la instruccion **`INT`** (Interrupt). La instruccion `INT` genera una interrupcion software que consulta la tabla de vectores de interrupcion para determinar la rutina que debe ser ejecutada.

Cuando se ejecuta la instruccion `INT`, el procesador guarda su contexto actual (como los registros y el contador de programa) y salta a la direccion de memoria que esta asociada al numero de interrupcion que se ha cargado previamente. Esta direccion esta definida en la tabla de vectores de interrupcion.

La rutina de interrupcion es responsable de manejar el evento (como una solicitud de entrada/salida, una operacion matematica, etc.). Una vez que la rutina ha completado su tarea, el procesador retoma la ejecucion normal del programa, restaurando el contexto que habia guardado antes de la interrupcion.

### Ejemplo de Secuencia
1. Cargar el numero de la interrupcion en AH (por ejemplo, cargar `0x21` para manejar una interrupcion del sistema de E/S).
2. Ejecutar la instruccion `INT` con el numero cargado en AH.
3. El procesador salta a la rutina de interrupcion correspondiente.
4. Una vez completada la rutina de interrupcion, el procesador retorna al punto donde fue interrumpido.

# Lista de interrupciones comunes

## 1. **Interrupcion INT 21h**

La interrupcion `INT 21h` es una de las mas comunes en el 8086. Esta interrupcion se utiliza para realizar diversas funciones de sistema operativo relacionadas con:

- Entrada/salida de caracteres
- Manejo de archivos (crear, eliminar, abrir, cerrar)
- Control de dispositivos de entrada/salida
- Gestion de memoria
- Funciones de consola y pantalla

Es la interrupcion mas utilizada en DOS.

## 2. **Interrupcion INT 10h**

La interrupcion `INT 10h` se utiliza para funciones relacionadas con la gestion del video, como:

- Cambiar el modo grafico
- Manipulacion del cursor (mover, ocultar, mostrar)
- Escribir texto en la pantalla
- Leer la posicion del cursor
- Control de la paleta de colores

Es esencial para la manipulacion de la pantalla en sistemas de graficos o consola.

## 3. **Interrupcion INT 13h**

La interrupcion `INT 13h` se utiliza para funciones relacionadas con discos duros, disquetes y almacenamiento en general. Algunas de sus funciones incluyen:

- Leer y escribir sectores en discos
- Formatear discos
- Detectar el tipo de unidad de disco
- Obtener el numero de serie de un disco

Es crucial para el manejo del almacenamiento y la interaccion con los dispositivos de disco en sistemas operativos.

## 4. **Interrupcion INT 14h**

La interrupcion `INT 14h` se usa para la comunicacion a traves de puertos serie, como en puertos COM1, COM2, etc. Algunas de las funciones que ofrece son:

- Leer y escribir datos a traves del puerto serie
- Configuracion de la velocidad de transmision (baud rate)
- Manejo de errores en la comunicacion serie

Es fundamental para el manejo de dispositivos como modems y terminales de texto.

## 5. **Interrupcion INT 0Dh (Division por Cero)**

La interrupcion `INT 0Dh` se activa cuando ocurre un error matematico de division por cero. Cuando el procesador intenta realizar una operacion de division y el divisor es cero, se genera esta interrupcion. El procesador detiene la ejecucion y transfiere el control a la rutina de manejo de errores.

## 6. **Interrupcion INT 08h (Temporizador del Sistema)**

La interrupcion `INT 08h` esta relacionada con el temporizador del sistema. Esta interrupcion se genera automaticamente a intervalos regulares para proporcionar una base para la temporizacion del sistema. Es utilizada principalmente para realizar tareas de programacion de tiempo y mantener la sincronizacion del sistema.

## 7. **Interrupcion INT 09h (Teclado)**

La interrupcion `INT 09h` esta asociada con la lectura de teclas del teclado. Se genera cuando se presiona una tecla y el sistema necesita procesar la entrada del teclado. Permite la gestion de la entrada de texto, asi como la deteccion de teclas especiales como "Shift", "Ctrl", "Alt" y las teclas de funcion.

## 8. **Interrupcion INT 04h (Desbordamiento de Pila)**

La interrupcion `INT 04h` se activa cuando ocurre un desbordamiento de pila (stack overflow). Esto sucede si se realizan demasiadas llamadas a funciones recursivas o se almacenan mas datos en la pila de lo que puede manejar. El procesador interrumpe la ejecucion y transfiere el control a la rutina de manejo de errores asociada.

## 9. **Interrupcion INT 0Ah (Desbordamiento de BCD)**

La interrupcion `INT 0Ah` se activa cuando se produce un desbordamiento de BCD (Binary Coded Decimal). Se refiere a la condicion en la que los valores de los numeros decimales codificados en binario exceden el rango que puede manejar el procesador. Esta interrupcion es especialmente relevante en sistemas que trabajan con datos en formato BCD.

## 10. **Interrupcion INT 1Bh (Control de Puertos Paralelos)**

La interrupcion `INT 1Bh` se utiliza para interactuar con puertos paralelos, como aquellos usados para impresoras. Permite el control y manejo de la comunicacion con dispositivos conectados a puertos paralelos, facilitando operaciones como la escritura y lectura de datos.

