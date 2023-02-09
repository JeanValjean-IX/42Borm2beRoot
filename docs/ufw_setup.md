# Born2beRoot

## Configuración del servidor

Antes de continuar, hemos de tener en cuenta que todo proceso de instalación y configuración puede generar un impacto importante en el funcionamiento del servidor. Por esta razón es recomendable:

- Utilizar "Snapshots" de la máquina virtual, para los diferentes procesos de instalación o configuración.
- Antes de instalar una utilidad o libreria o servicio, deberíamos actualizar tanto los repositorios como el software del sistema operativo.
- Antes de manipular o alterar un fichero de configuración, deberíamos hacer una copia.

### Instalación de la utilidad "Uncomplicated Firewall" (utilidad: ufw)

La utilidad "Uncomplicated Firewall" (ufw) es una herramienta utilizada para facilitar de una manera sencilla la configuración del firewall iptables. 

Esta herramienta no se instala por defecto, por lo tanto, tendremos que instalar a parte.

Antes de empezar con la instalación, utilizaremos la utilidad de "Snapshot" (de VirtualBox) para obtener una fotografia del sistema. De esta forma, en el caso que el resultados obtenidos no sean los deseados, podríamos retornar la máquina virtual al mismo punto que se encontraba antes de realizar la "Snapshot".

Para poder realizar la instalación, utilizaremos la consola local y el usuario "root", alternativamente y puesto que ya hemos instalado el servicio de SSH, tambien podemos iniciar una sesión remota con un usuario con roles de administración.

Si utilizamos un usuario diferente al usuario "root", tendremos que utilizar la utilidad "sudo". Para este apartado, se ha utilizado el usuario que creamos en el proceso de instalación mediante una consola remota utilizando el protocolo SSH.

Una vez dentro de la sesión, ejecutaremos las siguientes acciones:

- Primero verificaremos si el paquete "openssh-server" ya esta instalado: 
```
$ sudo dpkg-query -l | grep -i ufw
```
- Si el paquete no está instalado, no visualizaremos ningun mesanje, en cambio, si el paquete está instalado, nos mostrará el siguiente mensaje:
```
ii  ufw                            0.36-7.1                       all          program for managing a Netfilter firewall
```
- Actualizamos los repositorios y el software del servidor:
```
$ sudo apt update
$ sudo apt upgrade
```
- Si el paquete de "ufw" no está instalado, lo instalaremos:
```
$ sudo apt install ufw -y
```
- Para evitar problemas, lo primero que haremos será visualizar el estado y las reglas definidas:
```
$ sudo systemctl status ufw
● ufw.service - Uncomplicated firewall
     Loaded: loaded (/lib/systemd/system/ufw.service; enabled; vendor preset: enabled)
     Active: inactive (dead)
       Docs: man:ufw(8)
```
- Creamos la regla para el puerto 4242 (que se utiliza para el protocolo SSH):
```
$ sudo ufw allow 4242
```
- Activamos el servicio:
```
$ sudo ufw enable
Command may disrupt existing ssh connections. Proceed with operation (y|n)? 
Firewall is active and enabled on system startup
```
- Verificamos el estado y las reglas que hemos creado:
```
$ sudo ufw status
Status: active

To                         Action      From
--                         ------      ----
4242                       ALLOW       Anywhere                  
4242 (v6)                  ALLOW       Anywhere (v6)       
```
