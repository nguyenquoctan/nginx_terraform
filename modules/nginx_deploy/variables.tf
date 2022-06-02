variable "env" {
  description = "Environment to build image."
}

variable "app_name" {
  description = "Application name"
  type        = string
}

variable "replica_number" {
  description = "Deployment replica"
  default     = 1
  type        = string
}

variable "nginx_image" {
  description = "nginx docker image"
  type        = string
}

variable "image_policy" {
  description = "image pull policy"
  type        = string
}

variable "container_port" {
  description = "Container / target port"
  type        = number
}

variable "services_port" {
  description = "Services port"
  type        = number
}

variable "node_port" {
  description = "Node port"
  type        = number
}

variable "services_type" {
  description = "Service type"
  type        = string
}