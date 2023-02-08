# Born2beRoot

## Configuración del servidor

Antes de continuar, hemos de tener en cuenta que todo proceso de instalación y configuración puede generar un impacto importante en el funcionamiento del servidor. Por esta razón es recomendable:

- Utilizar "Snapshots" de la máquina virtual, para los diferentes procesos de instalación o configuración.
- Antes de instalar una utilidad o libreria o servicio, deberíamos actualizar tanto los repositorios como el software del sistema operativo.
- Antes de manipular o alterar un fichero de configuración, deberíamos hacer una copia.

### Instalación de un servicio de acceso remoto por SSH (Servidor de openSSH)

Cuando hablamos de SSH, estamos hablando de un protocolo de comunicación entre dos máquinas. 

SSH corresponde a las siglas Secure SHell. Su principal función es la de permitir un acceso remoto a una consola de servidor, con la finalidad de realizar tareas de gestión y administración. Este protocolo se caracteriza por una comunicación encriptada entre el emisor y el receptor.

Al tratarse de un protocolo, como es lógico, necesitaremos un emisor (cliente de SSH) y un receptor (servidor SSH). Para poder implementar este protocolo necesitaremos instalar un "Servidor de SSH" en nuestro servidor.

En linux, el software por excelencia utilizado para establecer comunicaciones de tipo SSH es "openSSH". En este apartado, instalaremos y configuraremos un "Servidor de OpenSSH" en nuestro servidor.

Antes de empezar con la instalación, utilizaremos la utilidad de "Snapshot" (de VirtualBox) para obtener una fotografia del sistema. De esta forma, en el caso que el resultados obtenidos no sean los deseados, podríamos retornar la máquina virtual al mismo punto que se encontraba antes de realizar la "Snapshot".




