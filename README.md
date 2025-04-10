<h1>Provision a local Docker container using Terraform</h1>

<h1>Initialize Terraform
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
