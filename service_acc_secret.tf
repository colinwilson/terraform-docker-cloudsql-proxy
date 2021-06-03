resource "docker_secret" "sa_json" {
  name = "sa_json-${replace(timestamp(), ":", ".")}"
  data = var.service_account_key_base64

  lifecycle {
    ignore_changes        = [name]
    create_before_destroy = true
  }
}