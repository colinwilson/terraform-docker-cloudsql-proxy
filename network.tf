# Create a new private network for docker swarm
resource "docker_network" "cloud_sql_proxy" {
  name            = var.cloud_sql_proxy_network
  driver          = "overlay"
  attachable      = true # Disable in production
  check_duplicate = true
  internal        = true
}