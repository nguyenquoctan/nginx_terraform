resource "docker_image" "nginx_image" {
  name = var.nginx_image_name
  build {
    path       = var.dockerfile_path
    dockerfile = var.dockerfile_name
    no_cache   = var.no_cache
    tag        = ["${var.nginx_image_name}:${var.env}"]
    build_arg = {
      source_image : "${var.source_image}"
      filtered_email : "${var.filtered_email}"
    }
    label = {
      version : "${var.image_version}"
    }
  }
}