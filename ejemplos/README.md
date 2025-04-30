# Ejemplos

## parquimetro: 
Medidor de espera para coches

En el aparcamiento, se utiliza un medidor de espera para coches. El conductor pone una cierta cantidad de dinero y este medidor le permitira estacionar su coche durante un tiempo especifico.

La lista de precios es la siguiente:

1 libra → 5 segundos
5 libras → 30 segundos
10 libras → 60 segundos
Si el tiempo se ha agotado, se encendera un LED rojo.

La entrada es la cantidad de dinero.

La salida es el LED rojo encendido si el tiempo ha expirado.

## Bloqueo: 
Cerradura de seguridad

En el banco, se utiliza una cerradura de seguridad para acceder a algunas habitaciones. Esta cerradura acepta dos entradas: el numero de identificacion del empleado (16 bits) y su contraseña (4 bits). Si el banco tiene 20 empleados, se debe construir una base de datos de estos empleados y almacenarla en la memoria. Luego, escribir un programa para acceder a estas habitaciones.

Las entradas del programa son el numero de identificacion del empleado y la contraseña.

La salida es un bit (0/1) que significa (denegado/permitido).

## Cifrado: 
Cifrado por Sustitucion Monoalfabetica

En el cifrado por sustitucion monoalfabetica, cada letra del alfabeto es sustituida por otra letra segun la siguiente tabla:

Texto plano

a b c d e f g h i j k l m n o p q r s t u v w x y z

Texto cifrado

q w e r t y u i o p a s d f g h j k l z x c v b n m

Construye esta tabla y almacenala en la memoria.

Escribe un programa que te permita ingresar un mensaje en texto plano, cifrar este mensaje utilizando la tabla almacenada, y luego descifrar el texto cifrado para obtener el mensaje original.

## Semaforo: 
Control de semaforo

Escribe un programa para controlar el tiempo de los semaforos. Las señales roja y verde deben estar encendidas durante 3 minutos. La señal amarilla debe estar encendida durante 1 minuto.

Especificaciones:
Rojo y verde: 3 minutos (180 segundos).
Amarillo: 1 minuto (60 segundos).
El programa debe simular los cambios de luces en un ciclo repetitivo.

Ejemplo de flujo:
La luz roja se enciende durante 3 minutos.
Luego, la luz verde se enciende durante 3 minutos.
Finalmente, la luz amarilla se enciende durante 1 minuto.
El ciclo se repite.
Este control puede implementarse con temporizadores y secuencias dentro del programa.

## Alarma

En una fabrica petroquimica, se mide la temperatura de una caldera cada 3 minutos. Dependiendo de la temperatura, se encendera un LED de diferente color:

Si la temperatura es ≤ 200ºC, se enciende un LED verde.
Si la temperatura esta en el rango 200ºC < temperatura < 500ºC, se enciende un LED amarillo.
Si la temperatura es ≥ 500ºC, se enciende un LED rojo.
Especificaciones:
El programa debe leer la temperatura cada 3 minutos.
Basado en la temperatura, debe mostrar el estado de los LEDs (verde, amarillo o rojo).