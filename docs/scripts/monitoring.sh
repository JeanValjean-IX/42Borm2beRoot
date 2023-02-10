#!/bin/bash

typeLinux=$(uname -a)
phisicalCPU=$(grep "physical id" /proc/cpuinfo | wc -l)
virtualCPU=$(grep processor /proc/cpuinfo | wc -l)
ramUsage=$(free --mega | awk '$1 == "Mem:" {printf("%i MB (%.2f%%)\n", $2,$3/$2*100)}')
diskUsage=$(df -m | grep "/dev/" | grep -v "/boot" | awk '{memory_total += $2; memory_use += $3} END {printf ("%i MB (%.2f%%)\n", memory_total,(memory_use*100)/memory_total)}')
cpuUsage=$(vmstat 1 4 | tail -1 | awk '{printf("%i%%", $13)}')
lastBoot=$(who -b | awk '$1 == "system" {print $3 " " $4}')
lvmStatus=$(if [ $(lsblk | grep "lvm" | wc -l) -gt 0 ]; then echo yes; else echo no; fi)
activeConnections=$(ss -ta | grep ESTAB | wc -l)
totalUsers=$(users | wc -w)
ipAddress=$(ip addr show |grep -w inet |grep -v 127.0.0.1|awk '{ print $2}'| cut -d "/" -f 1)
macAddress=$(ip a |awk '/ether/ {print $2}')
sudoExecuted=journalctl _COMM=sudo | grep COMMAND | wc -l

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
