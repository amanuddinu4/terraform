# Introduction<br>

Terraform is an Infrastructure as Code (IaC) tool that allows you to manage and provision resources in a declarative manner.We will use Terraform to provision a local Docker container running the Nginx web server.<br>

# Prerequisites<br>

Before starting, ensure the following are installed:<br>
Terraform<br>
Docker<br>

# Step-by-Step Guide<br>

Write Your Terraform Configuration<br>

Open main.tf and define the configuration:<br>

#Specify the Terraform provider for Docker<br><br>
 terraform {<br>
   required_providers {<br>
     docker = {<br>
      source  = "kreuzwerker/docker"<br>
      version = "~> 2.0"<br>
    }<br>
  }<br>
}<br>

provider "docker" {}<br>

 #Define the Docker image<br><br>
resource "docker_image" "nginx_image" {<br>
  name         = "nginx:latest"<br>
  keep_locally = false<br>
}<br>

#Create a Docker container<br><br>
resource "docker_container" "nginx_container" {<br>
  name  = "nginx_server"<br>
  image = docker_image.nginx_image.name<br>
  ports {<br>
    internal = 80<br>
    external = 8080<br>
  }<br>
}<br>

# Provision a local Docker container using Terraform<br>

1) Initialize Terraform<br>

In your terminal, run:<br><br>
    terraform init<br>
This command initializes the working directory and downloads the required Docker provider.<br>

2) Plan Your Deployment<br>

Preview the changes Terraform will apply:<br><br>
  terraform plan<br>
Terraform will generate a plan that shows the resources it will create.<br>

3) Apply the Configuration<br>

Provision the resources<br><br>
  terraform apply<br>
Type "yes" when prompted to confirm. Terraform will create the Docker image and container.<br>

# Verify the Deployment<br>

Check if the Docker container is running:<br><br>
   docker ps<br>
You should see the container named nginx_Server running.<br>

# Verification in Browser<br>

If you're running Terraform locally, access the Nginx server in your browser:<br>
URL: http://localhost:8080<br>

# Notes<br>

Ports: Internal port 80 maps to external port 8080 on your machine.<br>
Container Management: You can manage containers using Docker commands (docker stop,docker rm, etc.).<br>
Logs: Use docker logs nginx_server to view container logs.<br>
