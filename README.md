<header>Introduction</header>
Terraform is an Infrastructure as Code (IaC) tool that allows you to manage and provision resources in a declarative manner. In this guide, we will use Terraform to provision a local Docker container running the Nginx web server.
Prerequisites
Before starting, ensure the following are installed:
Terraform
Docker

Step-by-Step Guide
Write Your Terraform Configuration
Open main.tf and define the configuration:
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
<h1>Provision a local Docker container using Terraform</h1>

Initialize Terraform
In your terminal, run:
terraform init
This command initializes the working directory and downloads the required Docker provider.

Plan Your Deployment
Preview the changes Terraform will apply:
terraform plan
Terraform will generate a plan that shows the resources it will create.

Apply the Configuration
Provision the resources
terraform apply
Type "yes" when prompted to confirm. Terraform will create the Docker image and container.

Verify the Deployment
Check if the Docker container is running:
docker ps
You should see the container named nginx_Server running.

Verification in Browser
If you're running Terraform locally, access the Nginx server in your browser:
URL: http://localhost:8080

Notes
Ports:Internal port 80 maps to external port 8080 on your machine.
Container Management: You can manage containers using Docker commands (docker stop,docker rm, etc.).
Logs: Use docker logs nginx_server to view container logs.
