# Born2beRoot

## Virtualización del sistema operativo Linux Debian

Para poder virtualizar el sistema operativo Debian, primero creamos una máquina nueva en VirtualBox. En el proceso de creación de la maquina virtual tendremos en cuenta las configuraciones indicadas.

Una vez creada la máquina virtual, ya podremos instalar el sistema operativo. En el siguiente apartado se detallan las acciones a realizar. 

### Proceso de instalación del sistema operativo Linux Debian el sistema operativo Debian

En este apartado se indican las acciones necesarias para instalar el sistema operativo Debian dentro de la máquina virtual que hemos creado.

![This is an image](/docs/images/006_new_virtual_machine.png)

Una vez creada la máquina virtual, hacemos clic en el botón con la etiqueta de "Iniciar" para arrancar el proceso de instalación del sistema operativo Debian.

![This is an image](/docs/images/007_setup_debian.png)
- Seleccionamos la opción de "Install" y continuamos
- Para este proyecto se ha elegido como idioma el inglés (aunque podría ser otro)

![This is an image](/docs/images/008_setup_debian.png)
- Seleccionamos el idioma "English" (podría ser uno diferente) y continuamos

![This is an image](/docs/images/009_setup_debian.png)
- Seleccionamos el pais "United Kingdon" (podría ser uno diferente) y continuamos

![This is an image](/docs/images/010_setup_debian.png)
- Seleccionamos la configuración del teclado "British English" (podría ser uno diferente) y continuamos

![This is an image](/docs/images/012_setup_debian.png)
- Introducimos el "Hostname" de red de la máquina virtual.

![This is an image](/docs/images/013_setup_debian.png)
- En "Domain name" tendríamos que introducir el nombre de dominio de nuestra red (pero para este proyecto lo dejaremos en blanco)
- Continuamos

![This is an image](/docs/images/014_setup_debian.png)
- En "Root password" inroducimos la contraseña del usuario "root"
- Continuamos

![This is an image](/docs/images/015_setup_debian.png)
- Volvemos a introducir la contraseña del usuario "root" (de esta forma verificamos que la contraseña está bien introducida, en caso contrarío, el instalador nos avisaría del problema y volvería a solicitar y verificar la contraseña una vez más)
- Continuamos

![This is an image](/docs/images/016_setup_debian.png)
- En "Full name for new user" introduciomos el nombre para un nuevo usuario.  
- Continuamos

![This is an image](/docs/images/018_setup_debian.png)
- En "Username for your acouunt" introduciomos el username que utilizará el nuevo usuario.  
- Continuamos

![This is an image](/docs/images/020_setup_debian.png)
- Introducimos la contraseña para el nuevo usuario.  
- Continuamos

![This is an image](/docs/images/022_setup_debian.png)
- Volvemos a introducir la contraseña del nuevo usuario.  
- Continuamos

![This is an image](/docs/images/025_setup_debian.png)
- Seleccionamos la opción "Guided - use entire disk and set up encrypted LVM".  
- Continuamos

![This is an image](/docs/images/026_setup_debian.png)
- Continuamos

![This is an image](/docs/images/027_setup_debian.png)
- En la seleccion de "Partitioning scheme:" seleccionamos la opción "Separate /home partition"
- Continuamos

![This is an image](/docs/images/028_setup_debian.png)
- A la pregunta "Write changes to disks and configure LVM?" seleccionamos "Yes"
- Continuamos

![This is an image](/docs/images/031_setup_debian.png)
- Introduciomos la frase de encriptacion para el disco 
- Continuamos

![This is an image](/docs/images/032_setup_debian.png)
- Volvemos a introducir la frase de encriptacion para el disco
- Si las dos frases introducidas no coinciden tendremos que repetir el proceso.
- Si la frase introducida no cumple unos mínimos requisitos de seguridad, aparecerá una pantalla donde nos informará del problema y nos preguntará si deseamos continuar o no (en el caso que no deseemos continuar se repetirá el proceso) 
- Continuamos

![This is an image](/docs/images/035_setup_debian.png)
- Continuamos

![This is an image](/docs/images/036_setup_debian.png)
- Selecionamos "Finish partitioning and write changes"
- Continuamos

![This is an image](/docs/images/037_setup_debian.png)
- A la pregunta "Write the changes to disk?" selecionamos "Yes"
- Continuamos

![This is an image](/docs/images/040_setup_debian.png)
- A la pregunta "Scan extra installation media?" selecionamos "No"
- Continuamos

![This is an image](/docs/images/041_setup_debian.png)
- Selecionamos el pais del repositorio de Debian (se recomienda el más cercano).
- Continuamos.

![This is an image](/docs/images/042_setup_debian.png)
- Selecionamos la dirección del repositorio de Debian ("deb.debian.org").
- Continuamos.

![This is an image](/docs/images/043_setup_debian.png)
- Si la red local, desde donde estamos realizando la instalación, dispone un servidor proxy, introduciremos su dirección y continuaremos
- Sin embargo, si la red local no dispone de un servidor proxy continuaremos sin introducir nada

![This is an image](/docs/images/046_setup_debian.png)
- A la pregunta "Participate in the package usage?" seleccionamos "No"
- Continuamos

![This is an image](/docs/images/048_setup_debian.png)
- En la pantalla "Software selecion" sólo dejaremos seleccionada las opción "standard system utilities"
- Continuamos

![This is an image](/docs/images/050_setup_debian.png)
- A la pregunta "Install the GRUB boot loader to your primary drive?" seleccionaremos la opción "Yes"
- Continuamos

![This is an image](/docs/images/051_setup_debian.png)
- Seleccionamos la opción "/dev/sda (....."
- Continuamos

![This is an image](/docs/images/054_setup_debian.png)
- Continuamos

![This is an image](/docs/images/055_setup_debian.png)
- En este punto se reiniciará la máquina virtual
- Introduciremos la frase de encriptacion del disco
- Una vez el sistema ya este iniciado, aparecerá la consola local del servidor, donde tendremos que introducir un username y una contraseña para iniciar la sesion que permita interactuar con el sel servidor.
