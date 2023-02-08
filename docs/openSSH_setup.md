# Born2beRoot

## Configuración del servidor

Antes de continuar, hemos de tener en cuenta que todo proceso de instalación y configuración puede generar un impacto importante en el funcionamiento del servidor. Por esta razón es recomendable:

- Utilizar "Snapshots" de la máquina virtual, para los diferentes procesos de instalación o configuración.
- Antes de instalar una utilidad o libreria o servicio, deberíamos actualizar tanto los repositorios como el software del sistema operativo.
- Antes de manipular o alterar un fichero de configuración, deberíamos hacer una copia.

### Instalación de un servicio de acceso remoto por SSH (Servidor de openSSH)

Cuando hablamos de SSH, estamos hablando de un protocolo de comunicación entre dos máquinas. 

SSH corresponde a las siglas Secure SHell. Su principal función es la de permitir un acceso remoto a una consola de servidor, con la finalidad de realizar tareas de gestión y/o administración. Este protocolo se caracteriza por tener una comunicación encriptada entre el emisor y el receptor.

Al tratarse de un protocolo, como es lógico, necesitaremos un emisor (cliente de SSH) y un receptor (servidor SSH). Para poder implementar este protocolo necesitaremos instalar un "Servidor de SSH" en nuestro servidor.

En linux, el software por excelencia utilizado para establecer comunicaciones de tipo SSH es "openSSH". 

En este apartado, instalaremos y configuraremos un "Servidor de OpenSSH" en nuestro servidor teniendo en cuenta los requerimientos de nuestro proyecto.

Antes de empezar con la instalación, utilizaremos la utilidad de "Snapshot" (de VirtualBox) para obtener una fotografia del sistema. De esta forma, en el caso que el resultados obtenidos no sean los deseados, podríamos retornar la máquina virtual al mismo punto que se encontraba antes de realizar la "Snapshot".

Para poder realizar la instalación, utilizaremos la consola local y el usuario "root".

Una vez dentro de la sesión, ejecutaremos las siguientes acciones:

- Primero verificaremos si el paquete "openssh-server" ya esta instalado: 
```
$ dpkg-query -l | grep -i openssh-server
```
- Si el paquete no está instalado, no visualizaremos ningun mesanje, en cambio, si el paquete está instalado, nos mostrará el siguiente mensaje:
```
ii  openssh-server                 1:8.4p1-5+deb11u1              amd64        secure shell (SSH) server, for secure access from remote machines
```
- Actualizamos los repositorios y el software del servidor:
```
$ apt update
$ apt upgrade
```
- Si el paquete de "openssh-server" no está instalado, lo instalaremos:
```
$ apt install openssh-server -y
```
- Hacemos una copia de seguridad del fichero de configuración
```
$ cp /etc/ssh/sshd_config /etc/ssh/ssh_config.backup
```
- Abrimos el fichero de configuración:
```
$ nano /etc/ssh/ssh_config
```
- Realizamos las siguientes modificaciones:
```
- Buscamos la linea "#Port 22" y la substituimos por "Port 4242"
- (Eliminamos el símbolo de comentario "#" y cambiamos el valor "22" por el valor "4242")
- Buscamos la linea "#PermitRootLogin prohibit-password" y la subtituimos por "PermitRootLogin no"
- (Eliminamos el símbolo de comentario "#" y cambiamos el valor "prohibit-password" por el valor "no")
- Guardamos los cambios y salimos (ctrl+x)
```
- Reiniciamos los servicio:
```
$ systemctl restart ssh
```
- Verificamos el estado del servicio:
```
$ systemctl status ssh

● ssh.service - OpenBSD Secure Shell server
     Loaded: loaded (/lib/systemd/system/ssh.service; enabled; vendor preset: enabled)
     Active: active (running) since Wed 2023-02-08 19:26:40 GMT; 58s ago
       Docs: man:sshd(8)
             man:sshd_config(5)
    Process: 781 ExecStartPre=/usr/sbin/sshd -t (code=exited, status=0/SUCCESS)
   Main PID: 782 (sshd)
      Tasks: 1 (limit: 4671)
     Memory: 1.1M
        CPU: 21ms
     CGroup: /system.slice/ssh.service
             └─782 sshd: /usr/sbin/sshd -D [listener] 0 of 10-100 startups

Feb 08 19:26:40 xxxxx42 systemd[1]: Stopping OpenBSD Secure Shell server...
Feb 08 19:26:40 xxxxx42 systemd[1]: ssh.service: Succeeded.
Feb 08 19:26:40 xxxxx42 systemd[1]: Stopped OpenBSD Secure Shell server.
Feb 08 19:26:40 xxxxx42 systemd[1]: Starting OpenBSD Secure Shell server...
Feb 08 19:26:40 xxxxx42 sshd[782]: Server listening on 0.0.0.0 port 4242.
Feb 08 19:26:40 xxxxx42 sshd[782]: Server listening on :: port 4242.
Feb 08 19:26:40 xxxxx42 systemd[1]: Started OpenBSD Secure Shell server.
```
- Observamos que el servicio esta activo y esta escuchando por el puerto 4242
- Para asegurarnos que el servicio se iniciará automáticamente al arrancar el servidor de "Debian", ejecutaremos el comando:
```
$ systemctl enable ssh
```
- Averiguamos la dirección IP del servidor:
```
$ ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 08:00:27:9d:41:51 brd ff:ff:ff:ff:ff:ff
    inet 10.0.2.15/24 brd 10.0.2.255 scope global dynamic enp0s3
       valid_lft 82201sec preferred_lft 82201sec
    inet6 fe80::a00:27ff:fe9d:4151/64 scope link 
       valid_lft forever preferred_lft forever
```
- Observamos que la dirección ip es: 10.0.2.15

### Acceso remoto a la consola

Para poder acceder remotamente a la consola del servidor, mediante el protolo SSH, tendremos que utilizar un cliente de SSH.

Hemos de tener en cuenta que nuestro servidor está virtualizado, por lo tanto, el acceso dependerá de la configuración de red que hemos establecido para la máquina virtual.

