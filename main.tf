# Specify the Terraform provider for Docker
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.0"
    }
  }
}

provider "docker" {}

# Define the Docker image
resource "docker_image" "nginx_image" {
  name         = "nginx:latest"
  keep_locally = false
}

# Create a Docker container
resource "docker_container" "nginx_container" {
  name  = "nginx_server"
  image = docker_image.nginx_image.name
  ports {
    internal = 80
    external = 8080
  }
}
