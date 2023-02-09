# Born2beRoot

El objetivo de este repositorio es documentar el proceso que se ha seguido para la realización del proyecto. 

## Material necesario

- 1x Software de virtualización o hypervisor "Oracle Virtualbox"
- 1x Software para Oracle VirtualBox: "VirtualBox Extension Pack" 
- 1x Software de instalación del sistema operativo Debian
- 1x Software para Debian: Utilidad "super user do" (sudo)
- 1x Software para Debian: Servidor "OpenSSH"
- 1x Software para Debian: Utilidad "Uncomplicated Firewall" (ufw)
- 1x Software para Debian: Módulo de autentificacion "PAM pwquality" (libpam-pwquality) o "PAM cracklib" (libpam-cracklib)

## Enlaces para la descarga de software

### VirtualBox:
- Para Linux: https://www.virtualbox.org/wiki/Linux_Downloads
- Para MacOS (Intel host): https://download.virtualbox.org/virtualbox/7.0.6/VirtualBox-7.0.6-155176-OSX.dmg
- Para Windows: https://download.virtualbox.org/virtualbox/7.0.6/VirtualBox-7.0.6-155176-Win.exe

### VirtualBox ("VirtualBox Extension Pack"):
- Para todos los sistemas: https://download.virtualbox.org/virtualbox/7.0.6/Oracle_VM_VirtualBox_Extension_Pack-7.0.6a-155176.vbox-extpack

### Imagen ISO para la instalación del Sistema Opertivo Debian
- Imagen de instalación básica por red: https://www.debian.org/distrib/netinst

## Virtualización del sistema operativo Linux Debian

### Instalación del software: Oracle WM VirtualBox

Para la instalación de VirtualBox en sistemas operativos de Mac y Windows descargaremos el paquete de instalación y ejecutaremos el instalador. Sin embargo para sistemas Linux lo más sencillo es seguir las indicaciones que aparecen en el apartado de descargas.

Con independencia del sistema operativo donde se instale VirtualBox hay que tener en cuenta que el usuario que se utilice ha de tener permisos de administración.

### Configuraciónes significativas de la máquina virtual

| Característica | Valor |
| --- | --- |
| Ubicación de máquina virtual | (ver indicaciones "sgoinfre" de la intra) |   
| Sistema operativo | Linux # Debian (64-bit) |
| Memoria base | 4 GB (4096 MB) |
| Almacenamiento | Disco 32 GB (almacenamiento dinámico) |
| Procesadores | 1 (si pueden ser 2, mejor) |
| Adaptador de red apartado "conectado a" | NAT (Configuración avanzada: Reenvio de puertos [puerto anfitrión: 4242, puerto invitado: 4242]) |

### Instalación del sistema operativo virtualizado: Linux Debian

Para poder virtualizar el sistema operativo Debian, primero creamos una máquina nueva en VirtualBox. En el proceso de creación de la maquina virtual tendremos en cuenta las configuraciones indicadas en el apartado anterior.

Una vez tengamos definida y creada nuestra máquina virtual,la arrancaremos e instalaremos el sistema operativo que hemos elegido (en nuestro caso setrataria de Debian).

Para más detalle hacer clic en los siguientes enlaces:
- [Proceso de creación de una máquina virtual donde instalar el sistema operativo Debian](/docs/virtual_machine_setup.md)
- [Proceso de instalación del sistema operativo Linux Debian](/docs/debian_os_setup.md)

## Configuración del servidor.

Antes de continuar, hemos de tener en cuenta que todo proceso de instalación y configuración puede generar un impacto importante en el funcionamiento del servidor. Por esta razón es recomendable:

- Utilizar "Snapshots" de la máquina virtual, para los diferentes procesos de instalación o configuración.
- Antes de instalar una utilidad o libreria o servicio, deberíamos actualizar tanto los repositorios como el software del sistema operativo.
- Antes de manipular o alterar un fichero de configuración, deberíamos hacer una copia.

### Hoja de ruta o plan de trabajo: 

- [Instalación de la utilidad "super user do" (utilidad: sudo)](/docs/sudo_setup.md)
- [Instalación de un servicio de acceso remoto por SSH (Servidor de openSSH)](/docs/openSSH_setup.md)
- [Instalación de la utilidad "Uncomplicated Firewall" (utilidad: ufw)](/docs/ufw_setup.md)
- Implementación de una política estricta de passwords (módulos: libpam-pwquality / libpam-cracklib)
- Desarrollo e implementación de un "script" de monitorización del servidor.




