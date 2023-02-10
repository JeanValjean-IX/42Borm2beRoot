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
$ grep "physical id" /proc/cpuinfo | wc -l
```
- The number of virtual processors:
```
$ grep processor /proc/cpuinfo | wc -l
```
- The current available RAM on your server and its utilization rate as a percentage:
```
$ free --mega | awk '$1 == "Mem:" {printf("%i MB (%.2f%%)\n", $2,$3/$2*100)}'
```
- The current available memory on your server and its utilization rate as a percentage:
```
$ df -m | grep "/dev/" | grep -v "/boot" | awk '{memory_total += $2; memory_use += $3} END {printf ("%i MB (%.2f%%)\n", memory_total,(memory_use*100)/memory_total)}'
```
- The current utilization rate of your processors as a percentage.
```
$ vmstat 1 4 | tail -1 | awk '{printf("%i %", $13)}'
```
- The date and time of the last reboot:
```
$ who -b | awk '$1 == "system" {print $3 " " $4}'
```
- Whether LVM is active or not:
```
$ if [ $(lsblk | grep "lvm" | wc -l) -gt 0 ]; then echo yes; else echo no; fi
```
- The number of active connections:
```
$ ss -ta | grep ESTAB | wc -l
```
- The number of users using the server:
```
$ users | wc -w
```
- The IPv4 address of your server and its MAC (Media Access Control) address.
```
$ ip addr show |grep -w inet |grep -v 127.0.0.1|awk '{ print $2}'| cut -d "/" -f 1
$ ip a |awk '/ether/ {print $2}')
```
- The number of commands executed with the sudo program:
```
$ sudo journalctl _COMM=sudo | grep COMMAND | wc -l
```
- Creamos y editamos el fichero que contendrá nuesto script ("monitoring.sh"):
```
$ nano monitoring.sh
```
- Introducimos los siguientes lineas:
```
#!/bin/bash

typeLinux = $(uname -a)
phisicalCPU = $(grep "physical id" /proc/cpuinfo | wc -l)
virtualCPU = $(grep processor /proc/cpuinfo | wc -l)
ramUsage = $(free --mega | awk '$1 == "Mem:" {printf("%i MB (%.2f%%)\n", $2,$3/$2*100)}')
diskUsage = $(df -m | grep "/dev/" | grep -v "/boot" | awk '{memory_total += $2; memory_use += $3} END {printf ("%i MB (%.2f%%)\n", memory_total,(memory_use*100)/memory_total)}')
cpuUsage = $(vmstat 1 4 | tail -1 | awk '{printf("%i %", $13)}')
lastBoot = $(who -b | awk '$1 == "system" {print $3 " " $4}')
lvmStatus = $(if [ $(lsblk | grep "lvm" | wc -l) -gt 0 ]; then echo yes; else echo no; fi)
activeConnections = $(ss -ta | grep ESTAB | wc -l)
totalUsers = $(users | wc -w)
ipAddress = $(ip addr show |grep -w inet |grep -v 127.0.0.1|awk '{ print $2}'| cut -d "/" -f 1)
macAddress = $(ip a |awk '/ether/ {print $2}')
sudoExecuted = journalctl _COMM=sudo | grep COMMAND | wc -l

wall " 
          Type : $typeLinux
          CPUs : $virtualCPU
         vCPUs : $virtualCPU
           RAM : $ramUsage
          Disk : $diskUsage
           CPU : $cpuUsage
     Last Boot : $lastBoot
    LVM Active : $lvmStatus
   Connections : $activeConnections
         Users : $totalUsers
    IP Address : $ipAddress
   Mac Address : $macAddress
 SUDO executed : $sudoExecuted
"
```
- Guardamos y salimos (ctrl+x)
- Creamos una tarea para ejecutar nuestro script cada 10 minutos:
```
$ sudo crontab -u root -e
```
- Introducimos las líneas:
```
*/10 * * * * sh ~/monitor.sh
```
- Guardamos y salimos (ctrl+x)
