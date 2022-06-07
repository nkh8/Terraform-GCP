terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  credentials = file("playground-s-11-313a8ea2-9a5b64555cef.json")

  project = "playground-s-11-313a8ea2"
  region  = "us-central1"
  zone    = "us-central1-a"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network3"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
    }
  }
}
