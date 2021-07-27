# Required variables
variable "instance_connection_name" {
  type        = string
  description = "Cloud SQL instance connection name. e.g. arctic-goal-676703:europe-west2:myinstance-name"
}

variable "service_account_key_base64" {
  type        = string
  description = "Service Account Key file content (base64 encoded)"
}

# Optional variables
variable "networks" {
  type        = list(any)
  description = "List of networks to connect Cloud SQL Proxy to."
  default     = ["private"]
}

variable "private_network" {
  type        = string
  description = "Private (Docker overlay) network name."
  default     = "private"
}

variable "image_name" {
  type        = string
  description = "Cloud SQL Proxy Docker image."
  default     = "eu.gcr.io/cloudsql-docker/gce-proxy"
}

variable "image_version" {
  type        = string
  description = "Cloud SQL Proxy Docker image version."
  default     = "1.23.1"
}