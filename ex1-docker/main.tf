terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "terraform-tutorial-nginx" {
  image = docker_image.nginx.latest
  name  = "terraform-tutorial"
  ports {
    internal = 80
    external = 8000
  }
}