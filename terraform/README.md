# Terraform Configuration for GCP

Este directorio contiene la configuración de Terraform para desplegar una instancia de Google Compute Engine en Google Cloud Platform (GCP) utilizando el archivo `main.tf` y las credenciales proporcionadas en el archivo JSON.

## Estructura de Archivos

- **`main.tf`**: Contiene la definición principal para crear una máquina virtual (VM) en GCP, configurando el tipo de máquina, la imagen, el disco y las reglas de firewall necesarias para permitir tráfico SSH y HTTP.
- **`pract4-terraform-5725f294d97a.json`**: Archivo de credenciales de cuenta de servicio para autenticarse con GCP. Este archivo se utiliza para autenticar Terraform y realizar operaciones en tu proyecto de GCP.
- **Carpeta `.ssh`**: He generado claves SSH específicas para mi proyecto y las he incluido en esta carpeta dentro del repositorio. Estas claves se utilizarán para autenticar las conexiones SSH a las instancias.

## Requisitos

1. **Terraform**: Asegúrate de tener instalado Terraform en tu máquina local. Puedes descargarlo desde [aquí](https://www.terraform.io/downloads.html).
2. **Credenciales de GCP**: El archivo `pract4-terraform-5725f294d97a.json` es el archivo de credenciales necesario para que Terraform se conecte a Google Cloud.
3. **Google Cloud SDK** (opcional): Recomendado para verificar manualmente los recursos creados o realizar depuraciones.

## Pasos para ejecutar Terraform

1. **Inicializar el entorno de Terraform**:
   - Este comando descarga los proveedores necesarios (en este caso, GCP) y prepara el directorio de trabajo.
   
```bash
terraform init
```
![image](https://github.com/user-attachments/assets/d56f54fb-8ba8-4d26-aa3d-e7c909099c85)


## Planificar la infraestructura:

Revisa los recursos que Terraform va a crear o modificar en tu proyecto de GCP antes de aplicar los cambios. Terraform mostrará un resumen de las acciones que va a tomar.

```bash
terraform plan
```
![image](https://github.com/user-attachments/assets/9401f420-cd31-4001-8373-4b201f5b640a)
![image](https://github.com/user-attachments/assets/5e27adf0-967d-43ad-89a7-143ba323b725)

## Aplicar los cambios:

Ejecuta el siguiente comando para desplegar los recursos especificados en main.tf:

```bash
terraform apply
```
![image](https://github.com/user-attachments/assets/84a9ebae-8d16-4b03-a5b7-ae07e7775a2f)

Terraform te pedirá confirmación antes de proceder. Escribe yes cuando te lo solicite.

## Verificar los recursos creados:

Una vez que se complete el despliegue, puedes verificar los recursos creados en la consola de Google Cloud o ejecutando:

```bash
terraform show
```
![image](https://github.com/user-attachments/assets/a855ef71-b5da-40ad-a24d-a5b4c87fb557)

## Conectarse a la máquina por SSH

Una vez que la máquina virtual esté levantada, el siguiente paso es conectarse a ella utilizando SSH. Usa el siguiente comando para hacerlo:

```bash
ssh sa_107619536602385214076@35.241.220.75 -i /home/arturo/.ssh/ssh-key-terraform-sa
```

En este comando:

- **sa_107619536602385214076** es el ID del **service account** asociado a la instancia en Google Cloud.
- **/home/arturo/.ssh/ssh-key-terraform-sa** es la ruta a tu clave privada SSH.

Asegúrate de usar el ID correcto del **service account** y la ruta a tu clave privada.

![image](https://github.com/user-attachments/assets/bfb7da26-1552-4b4a-91cb-2fb18943b27a)

## Instalar Apache en la máquina virtual

Una vez conectado a la máquina por SSH, el próximo paso es instalar el servidor web **Apache**. Ejecuta los siguientes comandos para instalarlo y configurarlo:

### Instalar Apache:

```bash
sudo yum install httpd -y
```
![image](https://github.com/user-attachments/assets/fe90692a-c49d-4b5e-9a8f-3707f5461549)

### Habilitar y arrancar el servicio de Apache:

Para habilitar Apache para que se inicie automáticamente y arrancarlo de inmediato, ejecuta los siguientes comandos:

```bash
sudo systemctl enable httpd
sudo systemctl start httpd
```
![image](https://github.com/user-attachments/assets/3f971184-3115-4b86-850c-e2a435fe5b79)

Después de ejecutar estos comandos, Apache debería estar funcionando en tu máquina virtual y deberías poder acceder a ella desde un navegador usando la dirección IP pública de la VM.


## Detalles del `main.tf`

Este archivo incluye:

- **Instancia de Compute Engine**: Se crea una máquina virtual con las siguientes características:
  - Tipo de máquina: `e2-medium`
  - Imagen: `CentOS 9`
  - Etiquetas de red para habilitar tráfico HTTP y SSH

- **Reglas de Firewall**:
  - **allow-ssh**: Permite el tráfico en el puerto 22 (SSH) desde cualquier IP.
  - **allow-http**: Permite el tráfico en el puerto 80 (HTTP) desde cualquier IP.

## Consideraciones

- **Cambios en el archivo de credenciales**: Si estás utilizando un archivo de credenciales diferente, asegúrate de actualizar la ruta en el archivo `main.tf`:

```hcl
provider "google" {
  credentials = file("/ruta/a/tu/credencial.json")
  ...
}
```

- **Claves SSH**: He generado las claves SSH para mi proyecto y las he incluido en una carpeta llamada `.ssh` dentro del repositorio. Estas claves serán necesarias para conectarse a las instancias de VM creadas.
- **Destruir la infraestructura**: Si deseas eliminar todos los recursos creados por Terraform, puedes usar el siguiente comando:

```bash
terraform destroy
```
Esto eliminará todas las instancias de VM y las reglas de firewall asociadas creadas por Terraform.

## Progreso y Resultados

A continuación, se incluirán imágenes mostrando el éxito en la ejecución del `terraform apply` y la conexión SSH a la instancia de VM:

![image](https://github.com/user-attachments/assets/2d01d9ff-b389-48f2-a1a1-94f852fd1046)
![image](https://github.com/user-attachments/assets/f832e633-712d-48e7-972a-2cc7f9bd593d)
![image](https://github.com/user-attachments/assets/f12be433-f621-41bd-b3e9-17469d0ac893)
### ÉXITO!
![image](https://github.com/user-attachments/assets/37821885-19fa-47b3-a159-ad74eafcd18d)
![image](https://github.com/user-attachments/assets/b9e3cd6c-0b84-4960-b161-550c29f927f4)








## Referencias

- [Documentación de Terraform para Google Cloud](https://registry.terraform.io/providers/hashicorp/google/latest/docs)
- [Guía de uso de Google Cloud Compute Engine](https://cloud.google.com/compute/docs)
