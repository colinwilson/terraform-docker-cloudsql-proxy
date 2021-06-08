# Create Cloud SQL Proxy Docker service
resource "docker_service" "cloudsql_proxy" {
  name = "cloudsql-proxy"

  task_spec {
    container_spec {
      image = docker_image.cloudsql_proxy.latest

      command = [
        "/cloud_sql_proxy",
        "-instances=${var.instance_connection_name}=tcp:0.0.0.0:5432",
        "-credential_file=/secrets/service_account.json"
      ]

      secrets {
        secret_id   = docker_secret.sa_json.id
        secret_name = docker_secret.sa_json.name
        file_name   = "/secrets/service_account.json"
      }

    }
    networks = var.networks
  }

  endpoint_spec {
    ports {
      target_port = "5432"
    }
  }
}
