# Practica 4 ASR. Arturo Fernández García

Este repositorio contiene los archivos necesarios para desplegar una máquina virtual en Google Cloud utilizando Ansible. La estructura que he incorporado en la carpeta "ansible" sigue el siguiente esquema:

```bash
$ tree
.
├── main.yml
└── roles
    └── simple-web
        ├── files
        │   └── index.html
        └── tasks
            └── main.yml

4 directories, 3 files

```

### Descripción del contenido





- **main.yml**: Este es el archivo principal del playbook de Ansible. Aquí se definen todas las tareas para la creación de la instancia de Compute Engine en Google Cloud, la configuración de reglas de firewall y el despliegue de un servidor HTTP con una página HTML personalizada.
  
- **Carpeta roles/simple-web/**: Contiene las definiciones para el rol simple-web, que se encarga de desplegar el servidor HTTP en la máquina virtual:
  - **files/index.html**: Página web HTML personalizada que se servirá en la máquina virtual.
  - **tasks/main.yml**: Define las tareas necesarias para instalar y configurar un servidor HTTP (Apache) en la VM.

### Personalización del playbook

Este playbook está configurado específicamente para mi entorno en Google Cloud. Los datos introducidos en main.yml, como el nombre de mi proyecto, las rutas a las claves y configuraciones locales, deben cambiarse antes de intentar ejecutar el comando.

#### Cambios necesarios:
- **Nombre del proyecto de Google Cloud**: En el archivo main.yml, se encuentra la variable gcp_project, que debe ser cambiada a tu propio proyecto de Google Cloud.
  
- **Rutas en el ordenador local**: En mi caso, las rutas apuntan a mi directorio local (/home/arturo/). Estas rutas deben ser actualizadas según tu propia configuración local. Afectan al campo del json y de las claves

Una vez que hayas hecho los ajustes necesarios, puedes ejecutar el playbook con el siguiente comando (cambiando en el comando el ID del service account si cambia y la ruta a la clave privada):

```bash
ansible-playbook main.yml -u sa_106565994304844757361 --key-file /home/arturo/.ssh/ssh-key-ansible-sa
```

### Asegúrate de cambiar --key-file a la ubicación correcta de tu clave SSH privada.

### Carpeta con claves SSH

He incluido una carpeta con las claves SSH utilizadas durante la configuración por si es necesario utilizarlas. Si decides usar tus propias claves, deberás asegurarte de que están correctamente añadidas a la instancia de Google Cloud.

### Progreso y resultados

A continuación, se incluirán imágenes mostrando el éxito en la ejecución del playbook en mi máquina local, desde la creación de la VM hasta el despliegue exitoso del servidor HTTP.

![image](https://github.com/user-attachments/assets/3cab566d-8a38-40aa-b08d-03996a8e84d3)
![image](https://github.com/user-attachments/assets/ba12dcda-8301-43a9-be7a-361497abdf80)
![image](https://github.com/user-attachments/assets/fd85d44c-0374-4433-be48-84e2500177b1)
![image](https://github.com/user-attachments/assets/fb5397a3-009e-46e5-a1bb-d972d9d3c1ed)
![image](https://github.com/user-attachments/assets/c84bc310-9232-4b82-a3d6-375baa362ec3)




