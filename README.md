# README #

Leeme si no sabes como instalar.

### Para qué es este repositorio? ###

* Alojamiento de los servicios del proyecto MilOficios.
* Todos los servicios están en GET, para el el simple uso.
[Swagger Guia](https://geeks.ms/jorge/2018/01/25/uso-de-swagger-en-una-asp-net-core-2-web-api-i/)

### Uso ###
Clonar el repositorio:
git bash:
```
git clone INGRESE_URL
```
### Activar IIS ###
Panel de control < Características de Window:

* .NET Framework 3.5 (Include .NET 2.0 y 3.0).
* Internet Information Services.
* Servicios avanzados de .NET Framework 4.7.

### Conceder permisos a la carpeta autogenerada "inetpub" ###
C:\inetpub (conceder todos los permisos a los siguientes usuarios) : 

* Todos.
* IUSR.
* IIS_IUSRS.

### Activar los protocolos de Sql Server Configuration Manager ###

* Canalizaciones con nombre `Habilitado`.
* TCP/IP `Habilitado`.


### Reiniciar los servicios ##
Services de windows :

* MSSQLSERVER `Reiniciar`.


### Publicar el servicio ###
Proyecto de C#:
Click derecho a `SwaggerUI.APIRest` y despues a `Publicar`, escoger la carpeta y recordarla para despues, luego abrir IIS:
```
TU-PC
      Sitios
            Default Web Site (Click derecho - "Agregar Aplicación" - Seleccionar la ruta anterior - Colocar Nombre - Aceptar)
                                                                  MilOficiosv3 (Click derecho - "Administrar aplicación" - "Examinar")
                                  
                                                                    
```
### Listo ya tienes los servicios publicados en local =) ###
### Hecho por Jhon Coronel - Cibertec ###

