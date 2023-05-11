# Create Cloud SQL Proxy Docker service
resource "docker_service" "cloud_sql_proxy" {
  name = "cloud-sql-proxy"

  task_spec {
    container_spec {
      image = docker_image.cloud_sql_proxy.repo_digest

      command = [
        "/cloud-sql-proxy",
        "--address=${var.listen_address}",
        "--port=${var.listen_port}",
        "--credentials-file=/secrets/service_account.json",
        "${var.instance_connection_name}"
      ]

      secrets {
        secret_id   = docker_secret.sa_json.id
        secret_name = docker_secret.sa_json.name
        file_name   = "/secrets/service_account.json"
      }

    }
    networks_advanced {
      name = docker_network.cloud_sql_proxy.name
    }

    dynamic "networks_advanced" {
      for_each = var.additional_networks
      content {
        name = each.key
      }
    }
  }

  endpoint_spec {
    ports {
      target_port = "5432"
    }
  }
}
