# Born2beRoot

## Configuración del servidor

Antes de continuar, hemos de tener en cuenta que todo proceso de instalación y configuración puede generar un impacto importante en el funcionamiento del servidor. Por esta razón es recomendable:

- Utilizar "Snapshots" de la máquina virtual, para los diferentes procesos de instalación o configuración.
- Antes de instalar una utilidad o libreria o servicio, deberíamos actualizar tanto los repositorios como el software del sistema operativo.
- Antes de manipular o alterar un fichero de configuración, deberíamos hacer una copia.

### Desarrollo e implementación de un "script" de monitorización del servidor.

En este apartado no vamos a realizar acciones instrusivas o que puedan suponer un riesgo en el servidor, por lo tanto, no será necesario realizar snapshots de nuestra máquina virtual.

Para poder realizar un script que monitorize nuestro sistema, primero ejecutaremos por separado cada una de las consultas que queremos incluir.

- The architecture of your operating system and its kernel version:
```
$ uname -a
```
- The number of physical processors:
```
$ echo "Physical processors: $(grep "physical id" /proc/cpuinfo | wc -l)"
```
- The number of virtual processors:
```
$ echo "Virtual processors: $(grep processor /proc/cpuinfo | wc -l)"
```
- The current available RAM on your server and its utilization rate as a percentage:
```
$ echo "RAM memory (size)   : $(free --mega | awk '$1 == "Mem:" {print $2}')"
$ echo "RAM memory (in use) : $(free --mega | awk '$1 == "Mem:" {printf("(%.2f%%)\n", $3/$2*100)}')"
```
- The current available memory on your server and its utilization rate as a percentage:
```
$ echo "Disk : $(df -BG | grep "/dev/" | awk '{memory_use += $3;memory_total += $2} END {printf("%i GB (%.2f%%)\n",memory_total,(memory_use*100/memory_total))}')"
```
