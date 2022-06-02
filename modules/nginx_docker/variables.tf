variable "env" {
  description = "Environment to build image."
}

variable "nginx_image_name" {
  description = "Image name"
  type        = string
}

variable "dockerfile_path" {
  description = "Relative path of Dockerfile"
  type        = string
}

variable "dockerfile_name" {
  description = "Dockerfile name"
  default     = "Dockefile"
  type        = string
}

variable "source_image" {
  description = "Dockerfile source image"
  type        = string
}

variable "filtered_email" {
  description = "Email information to get the name"
  type        = string
}

variable "no_cache" {
  description = "Use cache while building image"
  type        = bool
}

variable "image_version" {
  description = "Use cache while building image"
  type        = string
}