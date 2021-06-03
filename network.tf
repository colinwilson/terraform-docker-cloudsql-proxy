# Create a new private network for docker swarm
resource "docker_network" "private_network" {
  name            = var.private_network
  driver          = "overlay"
  attachable      = true # Disable in production
  check_duplicate = true
  internal        = true
}