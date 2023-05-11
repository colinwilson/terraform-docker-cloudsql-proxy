data "docker_registry_image" "cloud_sql_proxy" {
  name = "eu.gcr.io/cloud-sql-connectors/${var.image_name}:${var.image_version}"
}

resource "docker_image" "cloud_sql_proxy" {
  name          = data.docker_registry_image.cloud_sql_proxy.name
  pull_triggers = [data.docker_registry_image.cloud_sql_proxy.sha256_digest]
  keep_locally  = true
}