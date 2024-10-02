provider "google" {
  project     = "pract4-terraform"  # Proyecto original
  region      = "europe-west1"      # Región original
  zone        = "europe-west1-b"    # Zona original
  credentials = file("/home/arturo/pract4-terraform/pract4-terraform-5725f294d97a.json")  # Añadir las credenciales de GCP
}

# Crear la instancia de VM con la configuración original
resource "google_compute_instance" "terraform" {
  name         = "terraform"
  machine_type = "e2-medium"
  
  boot_disk {
    initialize_params {
      image = "projects/centos-cloud/global/images/centos-stream-9-v20240919"  # Imagen original
    }
  }

  network_interface {
    network = "default"
    access_config {
      # Dejar en blanco para permitir la asignación automática de una IP externa
    }
  }

  tags = ["http-server", "https-server", "ssh-externo"]  # Etiquetas añadidas para que las reglas de firewall se apliquen correctamente
}

# Crear la regla de firewall para SSH (puerto 22)
resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]  # Permitir desde cualquier IP
  target_tags   = ["ssh-externo"]  # Aplicar a instancias con la etiqueta "ssh-externo"
}

# Crear la regla de firewall para HTTP (puerto 80)
resource "google_compute_firewall" "allow_http" {
  name    = "allow-http"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]  # Permitir desde cualquier IP
  target_tags   = ["http-server"]  # Aplicar a instancias con la etiqueta "http-server"
}
