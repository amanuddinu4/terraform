<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Provisioning Docker with Terraform</title>
</head>
<body>
    <header>
        <h1>Provisioning Docker Resources Using Terraform</h1>
        <p>Complete documentation for managing Docker resources with Terraform.</p>
    </header>

    <main>
        <section id="prerequisites">
            <h2>Prerequisites</h2>
            <ul>
                <li><strong>Terraform</strong>: Download from <a href="https://www.terraform.io/downloads" target="_blank">here</a>.</li>
                <li><strong>Docker</strong>: Install from <a href="https://docs.docker.com/get-docker/" target="_blank">Docker's official website</a>.</li>
                <li><strong>Text Editor</strong>: Visual Studio Code or any code editor.</li>
            </ul>
        </section>

        <section id="steps">
            <h2>Steps to Provision Docker Resources</h2>

            <h3>Step 1: Set Up Terraform</h3>
            <ol>
                <li>Create a new directory for the project:
                    <pre><code>mkdir terraform-docker-project
cd terraform-docker-project</code></pre>
                </li>
                <li>Create a file named <code>main.tf</code> in the directory.</li>
            </ol>

            <h3>Step 2: Write Your Terraform Configuration</h3>
            <p>Add the following content to <code>main.tf</code>:</p>
            <pre><code>
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx_image" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx_container" {
  name  = "nginx_server"
  image = docker_image.nginx_image.name
  ports {
    internal = 80
    external = 8080
  }
}
            </code></pre>

            <h3>Step 3: Initialize Terraform</h3>
            <p>Run the following command to initialize Terraform:</p>
            <pre><code>terraform init</code></pre>

            <h3>Step 4: Plan Your Deployment</h3>
            <p>Preview changes Terraform will apply:</p>
            <pre><code>terraform plan</code></pre>

            <h3>Step 5: Apply the Configuration</h3>
            <p>Provision resources by running:</p>
            <pre><code>terraform apply</code></pre>
            <p>Type "yes" when prompted to confirm.</p>

            <h3>Step 6: Verify the Deployment</h3>
            <p>Check running containers:</p>
            <pre><code>docker ps</code></pre>

            <p>Access the Nginx server in your browser at:</p>
            <p><code>http://localhost:8080</code></p>
        </section>

        <section id="troubleshooting">
            <h2>Troubleshooting</h2>
            <ul>
                <li>
                    <strong>Error: Docker Daemon Not Running</strong>: Start Docker with:
                    <pre><code>
sudo systemctl start docker
sudo systemctl enable docker
                    </code></pre>
                </li>
                <li>
                    <strong>Permission Issues</strong>: Add your user to the Docker group:
                    <pre><code>sudo usermod -aG docker $USER</code></pre>
                    <p>Log out and log back in to apply changes.</p>
                </li>
            </ul>
        </section>
    </main>
</body>
</html>
