# Born2beRoot

## Configuración del servidor

Antes de continuar, hemos de tener en cuenta que todo proceso de instalación y configuración puede generar un impacto importante en el funcionamiento del servidor. Por esta razón es recomendable:

- Utilizar "Snapshots" de la máquina virtual, para los diferentes procesos de instalación o configuración.
- Antes de instalar una utilidad o libreria o servicio, deberíamos actualizar tanto los repositorios como el software del sistema operativo.
- Antes de manipular o alterar un fichero de configuración, deberíamos hacer una copia.

### Instalación de la utilidad "super user do" (utilidad: sudo)

La utilidad "sudo" o "super user do" es una herramienta diseñanda para facilitar, a los administradores de sistemas, la ejecución de comandos con privilegios de superusuario (es decir, como un usuario "root").

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
- Al principio del fichero, encontramos varias líneas que empiezan por "Default". A continuación de estas lineas añadimos:
```
Defaults        passwd_tries=3
Defaults        requiretty
Defaults        logfile="/var/log/sudo.log"
Defaults        badpass_message="......"
```
- Buscamos las lineas:
```
#User privilege specification
root ALL=(ALL) ALL
```
- Debajo de la línea del usuario "root" añadimos la siguiente línea: (las "xxxxx" se han de substituir por el username del usuario que se creó en el proceso de instalación del sistema operativo Debian)
```
xxxxx ALL=(ALL) ALL
```
- Guardamos y salimos (ctrl+x)
- Añadimos el usuario al grupo "sudo": (las "xxxxx" se han de substituir por el username del usuario que se creó en el proceso de instalación del sistema operativo Debian)
```
$ usermod -aG sudo xxxxx
```
### Verificaciones

1. Cerramos la sesión del usuario "root"
2. Volvemos a entrar pero esta vez con el usuario que se creó en el proceso de intalación.
3. Ejecutamos el comando:
```
$ sudo apt update
```
   - Verificamos que no aparece un error de permisos.
   - Introducimos mal el password. Verificamos que nos aparece el mensaje que configuramos.
   - Volvemos a introducir 2 veces más el password mal y verificamos que, a aparte que nos aparece el mensaje de error, la utilidad deja de ejecutarse.
4. Ejecutamos el comando otra vez:
```
$ sudo apt update
``` 
   - Introducimos el password bien. Verificamos que los repositorios se actualizan correctamente.

Si todas las verificaciones que hemos realizado hemos obtenido un resultado correcto, entonces procederemos a eliminar el "snapshot" que hemos realizado al inicio de la instalación de la utilidad "sudo"

