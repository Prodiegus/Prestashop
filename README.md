# Prestashop con docker

## Proyecto de Prestashop con docker de la Universidad de Talca

# Proyecto Unidad 2

A continuación, se detallan los principales elementos que se deben desarrollar:

- Instale Docker en algunas de las alternativas de virtualización vistas en clases (GCP o Proxmox). Escoja la que otorgue mejores rendimientos a su computador.
- Utilizando `docker-compose.yml`, instale Prestashop (última versión disponible) en el servidor con Docker. El despliegue tiene que cumplir los requisitos siguientes:
  1. Debe tener un contenedor que permita ejecutar el servicio web. Algunas opciones pueden ser Apache o Nginx.
  2. Deberá tener un contenedor independiente, que utilice la imagen del sistema gestor de base de datos de su preferencia. Algunas alternativas son MySQL, MariaDB o PostgreSQL. Conecte el contenedor Web con el contenedor del Sistema Gestor de Bases de Datos.
  3. Ambos contenedores deben estar en una red creada solamente para ellos, con el objetivo de mejorar la seguridad.
- Configure un volumen compartido en el directorio `/data/prestashop` del servidor local, que contenga el directorio de instalación de Prestashop (esa ruta puede ser diferente de `/var/www/html`).
- Configure un volumen compartido en el directorio `/data/prestashop_DB` del servidor local, que contenga una copia de la base de datos que se ejecuta en el contenedor del SGBD.
- Modifique el código de Prestashop (en caso que sea necesario) para cambiar la plantilla por defecto de la aplicación. El objetivo es que la tienda sea diferente al resto de sus competidores. Intente que sea lo más atractiva posible.

## Requisitos

### Instalación de Prestashop a través de `docker-compose.yml` (30 puntos):

- Plataforma funcionando y actualizada, se hará reiniciar el sistema de virtualización y el servidor deberá operar correctamente. Es decir, al reiniciar la VM, todos los servicios de los contenedores deberán iniciar de manera automática sin su intervención.
- Detalle el proceso de instalación paso a paso. Además, deberán reportar los problemas principales y cómo los solucionaron.
- Muestre evidencias de funcionamiento.

### Instalación del contenedor de MySQL (20 puntos):

- Instalar desde la imagen el Sistema Gestor de BD.
- Conectar de manera correcta los contenedores.
- Verificar el funcionamiento global de Prestashop.

### Despliegue de Prestashop (20 puntos):

- Verifique que el volumen local `/data/prestashop` se encuentre en el directorio de instalación del contenedor de Prestashop.
- Verifique que el volumen local `/data/prestashop_DB` se encuentre en el directorio del SGBD del contenedor.

### Realice la automatización de procesos (10 puntos):

- Actualización de los contenedores todos los lunes a las 05:00.
- Cree un respaldo de la Base de Datos todos los días a las 23:55 y esos archivos deberán estar disponibles desde el servidor anfitrión.

### Modifique visualmente la versión de Prestashop (10 puntos):

- Modifique de manera visual la forma de presentar los productos en la tienda.

### Archivos (10 puntos):

- Deberán subir todos los archivos necesarios a un repositorio de Github. De manera que al clonarlo desde un dispositivo con Docker y ejecutar el `docker-compose`, quede desplegado Prestashop.