resource "docker_image" "cloudsql_proxy" {
  name = "${var.image_name}:${var.image_version}"
}