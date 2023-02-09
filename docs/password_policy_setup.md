# Born2beRoot

## Configuración del servidor

Antes de continuar, hemos de tener en cuenta que todo proceso de instalación y configuración puede generar un impacto importante en el funcionamiento del servidor. Por esta razón es recomendable:

- Utilizar "Snapshots" de la máquina virtual, para los diferentes procesos de instalación o configuración.
- Antes de instalar una utilidad o libreria o servicio, deberíamos actualizar tanto los repositorios como el software del sistema operativo.
- Antes de manipular o alterar un fichero de configuración, deberíamos hacer una copia.

### Implementación de una política estricta de passwords (módulos: libpam-pwquality / libpam-cracklib)

En los requerimientos de este proyecto aparece la implimentación de una política estricta de password. 

Para poder implementar la política requerida, tendremos que hacer uso de bibliotecas que se encargan de gestionar los procesos de autentificación. En Linux, estas biblicotecas son las conocidas como bibliotecas PAN. En la actualidad existen muchos tipos de bibliotecas PAN, como puden ser las que se encagan de autentificaciones contra directorios de LDAP o directorios de Active Directory o doble factor de autentificación, etc. 

Para este proyecto, con las librerias PAN que se han instalado por defecto, no podríamos implementar la politica exigida. Para poderlo hacer, deberíamos instalar y usar biblioteca "libpam-pwquality".

"libpam-pwquality" es una biblioteca que tiene su origen en la biblioteca "libpam-cracklib". Con ambas bibliotecas podríamos aplicar politicas estrictas de contraseñas, pero como ya se ha comentado, en este proyecto utilizaremos la "libpam-pwquality".

Antes de empezar con la instalación, utilizaremos la utilidad de "Snapshot" (de VirtualBox) para obtener una fotografia del sistema. De esta forma, en el caso que el resultados obtenidos no sean los deseados, podríamos retornar la máquina virtual al mismo punto que se encontraba antes de realizar la "Snapshot".

Para poder realizar la instalación, utilizaremos la consola remota con el usuario que hemos creado en la instalación del servidor. Al utilizar un usuario diferente al "root", tendremos que hacer uso de la utilidad "sudo".

Una vez dentro de la sesión, ejecutaremos las siguientes acciones:

- Primero verificaremos si el paquete "libpam-pwquality" ya esta instalado:
```
$ dpkg-query -l | grep -i libpam-pwquality
```
Si el paquete no está instalado, no visualizaremos ningun mesanje, en cambio, si el paquete está instalado, nos mostrará el siguiente mensaje:
```
ii  libpam-pwquality:amd64         1.4.4-1                        amd64        PAM module to check password strength
```
- Actualizamos los repositorios y el software del servidor:
```
$ sudo apt update
$ sudo apt upgrade
```
- Si el paquete de "ufw" no está instalado, lo instalaremos:
```
$ sudo apt install libpam-pwquality -y
```
- Hacemos una copia de seguridad del fichero de configuración "common-password":
```
$ sudo cp /etc/pam.d/common-password /etc/pam.d/common-password.backup
```
- Editamos el fichero de configuración y realizamos las siguientes modificaciones:
```
$ sudo nano /etc/pam.d/common-password

- Buscamos la linea que contiene:
password        requisite       pam_pwquality.so retry=3
- La subtituimos por la siguiente línea:
password        requisite       pam_pwquality.so minlen=10 lcredit=-1 ucredit=-1 dcredit=-1 maxrepeat=3 reject_username difok=7 enforce_for_root
- Guardamos los cambios y salimos (ctrl+x)
```
- Hacemos una copia de seguridad del fichero de configuración "login.defs":
```
$ sudo cp /etc/login.defs /etc/login.defs.backup
```
- Editamos el fichero de configuración y realizamos las siguientes modificaciones:
```
$ sudo nano /etc/login.defs

- Buscamos las líneas:
PASS_MAX_DAYS   ..... 
PASS_MIN_DAYS   .....
PASS_WARN_AGE   .....

- Las modificamos con los siguientes valores:
PASS_MAX_DAYS   30
PASS_MIN_DAYS   2
PASS_WARN_AGE   7
```
- Cambiamos las contraseñas del usuario "root" y el usuario que hemos utilizado para la instalació:
```
$ sudo passwd root
$ sudo passwd xxxxxx

(las "xxxxx" se han de subtituir por el username del usuario que hemos utuilizado")
```
