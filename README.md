# miniPHP

**miniPHP** es un analizar léxico basado en **Flex & Bison** y en el **lenguaje C**. El objeto de este software es analizar un archivo de texto, verificar si pertenece o no al lenguaje **PHP**, y generar la lista de tokens válidos a la vez que captura errores en el contenido.

# Uso

> Se incluye un binario ejecutable para sistemas Linux de 64 bits dentro del directorio `/bin`. Si tu máquina no cuenta con una imagen Linux de 64 bits, o deseas compilar propiamente un binario ejecutable, necesitarás saltar a la sección **Compilación de Flex**

Abre una consola de comandos y navega hasta el directorio `/Proyecto_1` (deberías ver los directorios `/bin`, `/src` y el archivo `MyRegEx.txt`). Una vez en esa ruta, ejecuta el siguiente comando para analizar un archivo PHP:

```shell
$   ./bin/miniPHP Pruebas.php
```
Para el comando anterior se infiere que el archivo `Pruebas.php` se encuentra en la ruta `/Proyecto_1`. El programa generará un archivo corregido `Pruebas.out`. De existir un error, no se generara el archivo `Pruebas.out`, en cambio, se escribirá un archivo `Pruebas.tmp` que contiene la lista de errores encontrados.

#### Compilación de Flex.
Para todos los procedimientos de compilación es necesario que cumplas las siguientes dependencias:
- Linux 32 o 64 bits.
- Flex 2.6
- GCC 5.4.0


Al descargar el código fuente encontrarás en la carpeta `/src` todos los archivos de código fuente. Uno de ellos está nombrado como `phpFLEX.l`. Este archivo contiene las definciones de las expresiones regulares usadas para analizar el archivo en busca de tokens PHP válidos.

Abre una consola de comandos y navega hasta el directorio `/Proyecto_1` (deberías ver los directorios `/bin`, `/src` y el archivo `MyRegEx.txt`). Una vez en esa ruta, ejecuta el siguiente comando:

```shell
$   flex -o src/phpFLEX.c src/phpFLEX.l
```

El comando anterior generará un archivo en lenguaje C, `phpFLEX.c`,  que contiene el analizador léxico, mismo que se compilará en un binario ejecutable para tu sistema. Se incluye una copia precompilada (para Linux 64 bits) de este archivo dentro de `/src`.

#### Compilación de miniPHP.

>Nuevamente debes estar ubicado en el directorio `/Proyecto_1`. Para compilar el binario de miniPHP es necesario que hayas ejecutado el paso anterior. Caso contrario, obtendrás un error.

En la consola de comandos ejecuta la siguiente instrucción:
```shell
$   gcc src/miniPHP.c src/phpFLEX.c -o bin/miniPHP -O3
```

El comando anterior compilará los archivos necearios en un pequeño ejecutable llamado `miniPHP` dentro del directorio `/Proyecto_1`. Ahora sí, ya puedes ejecutar miniPHP con el siguiente comando:

```shell
$   ./bin/miniPHP Pruebas.php
```
Para el comando anterior se infiere que el archivo `Pruebas.php` se encuentra en la ruta `/Proyecto_1`. El programa generará un archivo corregido `Pruebas.out`. De existir un error, no se generara el archivo `Pruebas.out`, en cambio, se escribirá un archivo `Pruebas.tmp` que contiene la lista de errores encontrados.

# Funcionamiento
miniPHP  se ejecuta como un programa de consola que recibe opcionalmente una ruta de archivo. Si el archivo es válido, el programa se encargará de analizar el contenido y generar los tokens y el archivo de salida respectivo. De no recibir una ruta de archivo, el programa leerá de consola cada elemento que el usuario ingrese manualmente, y retornará si ha hallado algún token válido, o mostrará un error.

El proceso del programa para validar el contenido de un archivo o expresión, es generado por Flex y un conjunto de reglas, llamadas expresiones regulares, que están definidas para validar elementos del lenguaje PHP. Por ejemplo, el programa puede validar si una variable es válida (lexicográficamente) por medio de la expresión regular:
>`"$"[a-zA-Z_\x7F-\xFF][a-zA-Z0-9_]*`

Por tanto, es necesario definir tantas expresiones regulares como elementos válidos existan en PHP. Por nombrar algunos:
- Operadores
- Variables
- Constantes
- Palabras reservadas
- Funciones
- Identificadores
- Estructuras de control.
- Etcétera.

##### Captura de errores
Es interesante que un analizador lexico pueda capturar errores, o tokens no válidos dentro de PHP. Por ejemplo, es sencillo analizar una variable con un nombre inválido usando la siguiente expresión regular:
>`"$"^[a-zA-Z_\x7F-\xFF][a-zA-Z0-9_\x7F-\xFF]*|"$"`

Sin embargo, no todos los errores son capturables con expresiones regulares. La mayoría de los casos se basan en capturar errores después de que el token no cazó en todas las expresiones regular válidas. Eso requiere que el programa analice y descarte cada expresión regular válida solo para conocer si un token es erróneo.

# Justificación
miniPHP es un programa y analizador léxico robusto, eficiente y flexible. Primero, el analizador léxico es capaz de reconocer gran cantidad de tokens PHP válidos de forma correcta, además de los errores básicos de léxico. En miniPHP, dichos tokens son independientes entre sí (la validez de uno, no influye en la validez de otro token). Tal propiedad es importante pues permite que el programa puede manejar cada token con los requerimientos necesarios para generar un archivo limpio y corregido.

Por otro lado, miniPHP separa las definiciones lexicográficas de la sección lógica y programable (el programa). Esto brinda la ventaja de poder modificar las expresiones regulares sin afectar el funcionamiento del programa y brinda la flexibilidad para hacer validaciones no lexicográficas, como el manejo de archivos, listas y memoria. Además, miniPHP está escrito **100% en lenguaje C**. El resultado: un programa altamente eficiente en el manejo de recursos, de más rápida ejecución que otras alternativas en otros lenguajes de programación, ligero y optimizado para sistemas Linux, con la capacidad de portarse a otros SO.
