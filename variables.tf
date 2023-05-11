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
variable "additional_networks" {
  type        = list(any)
  description = "Names of additional networks to connect Cloud SQL Proxy to."
  default     = []
}

variable "cloud_sql_proxy_network" {
  type        = string
  description = "Cloud SQL Proxy (Docker overlay) network name."
  default     = "cloud-sql-proxy"
}

variable "image_name" {
  type        = string
  description = "Cloud SQL Proxy Docker image."
  default     = "cloud-sql-proxy"
}

variable "image_version" {
  type        = string
  description = "Cloud SQL Proxy Docker image version."
  default     = "2.2.0"
}

variable "listen_address" {
  type        = string
  description = "Cloud SQL Proxy listen address"
  default     = "0.0.0.0"
}

variable "listen_port" {
  type        = string
  description = "Cloud SQL Proxy listen port"
  default     = "5432"
}