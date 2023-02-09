# Born2beRoot

## Configuración del servidor

Antes de continuar, hemos de tener en cuenta que todo proceso de instalación y configuración puede generar un impacto importante en el funcionamiento del servidor. Por esta razón es recomendable:

- Utilizar "Snapshots" de la máquina virtual, para los diferentes procesos de instalación o configuración.
- Antes de instalar una utilidad o libreria o servicio, deberíamos actualizar tanto los repositorios como el software del sistema operativo.
- Antes de manipular o alterar un fichero de configuración, deberíamos hacer una copia.

### Implementación de una política estricta de passwords (módulos: libpam-pwquality / libpam-cracklib)

En los requerimientos de este proyecto aparece la implimentación de una política estricta de password. Esta política tendrá que cumplir las siguientes reglas:

- Caducidad del password se fija en 30 dias.
- El mínimo de dias para volver a cambiar el password una vez cambiado es de 2 días.
- El número de dias para empezar a avisar que el password va a acaducar es de 7 días.
- La nueva contraseña ha de tener una longitud de 10 carácteres como mínimo.
- La nueva contraseña de de tener como mínimo: una letra en minúscula, otra letra en mayúscula y un número.
- La nueva contraseña no puede tener 3 caracteres iguales consecutivos.
- La nueva contraseña no puede incluir el nombre del usuario.
- 
