module "nginx_image_alpine" {
  source           = "../../modules/nginx_docker"
  env              = terraform.workspace == "default" ? "test" : terraform.workspace
  nginx_image_name = "nginx_alpine"
  dockerfile_path  = "./docker"
  dockerfile_name  = "Dockerfile_alpine"
  source_image     = "nginx:1.21.6-alpine"
  filtered_email   = "Darron.Nikolaus@eulah.me"
  no_cache         = true
  image_version    = "1.0.0"
}
