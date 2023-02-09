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





Esta política tendrá que cumplir las siguientes reglas:

- Caducidad del password se fija en 30 dias.
- El mínimo de dias para volver a cambiar el password una vez cambiado es de 2 días.
- El número de dias para empezar a avisar que el password va a acaducar es de 7 días.
- La nueva contraseña ha de tener una longitud de 10 carácteres como mínimo.
- La nueva contraseña de de tener como mínimo: una letra en minúscula, otra letra en mayúscula y un número.
- La nueva contraseña no puede tener 3 caracteres iguales consecutivos.
- La nueva contraseña no puede incluir el nombre del usuario.
- 
