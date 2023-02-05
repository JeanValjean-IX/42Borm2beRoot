# Born2beRoot

## Configuración del servidor

Antes de continuar, hemos de tener en cuenta que todo proceso de instalación y configuración puede generar un impacto importante en el funcionamiento del servidor. Por esta razón es recomendable:

- Utilizar "Snapshots" de la máquina virtual, para los diferentes procesos de instalación o configuración.
- Antes de instalar una utilidad o libreria o servicio, deberíamos actualizar tanto los repositorios como el software del sistema operativo.
- Antes de manipular o alterar un fichero de configuración, deberíamos hacer una copia.

### Instalación de la utilidad "super user do" (utilidad: sudo)

Antes de empezar con la instalación, utilizaremos la utilidad de "Snapshot" (de VirtualBox) para obtener una fotografia del sistema. De esta forma, en el caso que el resultados obtenidos no sean los deseados, podríamos deshacer los cambios realizados, dejando la máquina en el mismo punto que se encontraba antes de realizar la "Snapshot".

Al ser el primer paso de configuración del servidor, utilizaremos usuario "root" desde la consola local.

Una vez dentro de la sesión, procedemos a actualizar los reporitorios, actualizar el software e instalar la utilidad sudo:
```
$ apt update
$ apt upgrade
$ apt install sudo
```

