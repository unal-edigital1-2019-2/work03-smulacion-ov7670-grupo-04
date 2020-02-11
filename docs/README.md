##  ELECTRÓNICA DIGITAL 1 2019 -2 UNIVERSIDAD NACIONAL DE COLOMBIA 
## TRABAJO 03- SIMULACION

## Integrantes

1. David Ricardo Lugo Venegas 1075872618

## Introducción 

Teniendo presente los siguientes archivos:

1. cam_read.v: fichero que en el que se realiza la descripción funcional de la captura de datos de la camara en formato RGB565
2. test_cam_TB.v:  fichero que contiene la simulación de las señales de la camara y almacena la salida VGA en un archivo de texto plano.

## Desarrollo

1. Teniendo en cuenta el siguientes diagrama

Insertar “diagrama 1”
![diagrama 1](https://github.com/unal-edigital1-2019-2/work03-smulacion-ov7670-grupo-04/blob/master/docs/figs/diagrama%201.png)

Podemos observar que el bloque “test_cam_TB” consta de tres partes en general. 

1.1 Bloque de nacionalización: Donde encontramos las entradas y salidas que en nuestro caso son registros y “cables”, ademas de tener la función de “test cam” que es básicamente el paquete de trabajo 2 (WP=02).

1.2 Simulación: Son básicamente tres secciones que se activan con flancos de cambio del registro pclk; un contador de pixel, cambio de estado de la señal vsync y una sección de cambio de estado del la señal href.

1.3 Sección de creación de archivo txt: Código que crea un archivo con la estructura vga para ser leída por un simulador.

Todos estos segmentos nos permiten simulaar las señales enviadas por la camara ov7670.

2. En la sección “simulat”, en el recuadro de  “processes” seleccionamos  “simulate behavioral” y se modifica el tiempo de simulación a 30ms y se ejecuta la simulación (este proceso de simulación en nuestro caso tarda 45 minutos)

3. Una vez terminada la simulación se revisa dentro del directorio HW que contenga el fichero test_vga.txt

4. Ingresar a la web vga-simulator y cargar el archivo test_vga.txt, dejamos los datos de configuración tal cual como aparecen y ejecutamos submit.

El resultado de la pagina web es:

insertar “Prueba 1”

5. Ahora agregamos en el fichero  “cam_read” la sección de “adquisición de datos” que se realizo en el WP02, el cual recibe los datos de la cámara y los guarda en la ram proceso que se describe en el siguiente diagrama:

Insertar “diagrama 2”


6. Ejecutamos la simulación y realizamos los pasos 3 y 4, obteniendo el siguiente resultado de la pagina web

Insertar “Prueba 2”.

Así, damos por finalizado nuestro paquete de trabajo 3, teniendo presente que aunque hemos variado los valores de la pantalla en todas las direcciones necesarias el archivo dio resultados satisfactorios cuando utilizamos una resolución de 160*120.

