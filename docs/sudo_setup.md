# Born2beRoot

## Configuración del servidor

Antes de continuar, hemos de tener en cuenta que todo proceso de instalación y configuración puede generar un impacto importante en el funcionamiento del servidor. Por esta razón es recomendable:

- Utilizar "Snapshots" de la máquina virtual, para los diferentes procesos de instalación o configuración.
- Antes de instalar una utilidad o libreria o servicio, deberíamos actualizar tanto los repositorios como el software del sistema operativo.
- Antes de manipular o alterar un fichero de configuración, deberíamos hacer una copia.

### Instalación de la utilidad "super user do" (utilidad: sudo)

La utilidad "sudo" o "super user do" es una herramienta diseñanda para facilitar a los administradores de sistemas la ejecución de comandos con privilegios de superusuario (es decir, como un usuario "root").

Antes de empezar con la instalación, utilizaremos la utilidad de "Snapshot" (de VirtualBox) para obtener una fotografia del sistema. De esta forma, en el caso que el resultados obtenidos no sean los deseados, podríamos retornar la máquina virtual al mismo punto que se encontraba antes de realizar la "Snapshot".

Para poder instalar la utilidad "sudo", utilizaremos la consola local y el usuario "root". 

Una vez dentro de una sesión ejecutaremos las siguientes acciones: 

- Actualizamos los repositorios y el software
```
$ apt update
$ apt upgrade
```
- Instalamos la utilidad "sudo"
```
$ apt install sudo
```
- Hacemos una copia de seguridad del fichero de configuración
```
$ cp /etc/sudoers /etc/sudoers.backup
```
- Editamos el fichero de configuración
```
$ nano /etc/sudoers
```
- Buscamos las lineas:
```
#User privilege specification
root ALL=(ALL) ALL
```
- Debajo de la línea del usuario"root" añadimos la siguiente línea (las "xxxxx" se ha de substituir por el username que creamos en la instalación del sistema operativo Debian):
```
xxxxx ALL=(ALL) ALL
```
