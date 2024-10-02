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
## Planificar la infraestructura:

Revisa los recursos que Terraform va a crear o modificar en tu proyecto de GCP antes de aplicar los cambios. Terraform mostrará un resumen de las acciones que va a tomar.

```bash
terraform plan
```

## Aplicar los cambios:

Ejecuta el siguiente comando para desplegar los recursos especificados en main.tf:

```bash
terraform apply
```

Terraform te pedirá confirmación antes de proceder. Escribe yes cuando te lo solicite.

## Verificar los recursos creados:

Una vez que se complete el despliegue, puedes verificar los recursos creados en la consola de Google Cloud o ejecutando:

```bash
terraform show
```

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
