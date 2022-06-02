module "nginx_alpine_deploy" {
  source         = "../../modules/nginx_deploy"
  env            = terraform.workspace == "default" ? "test" : terraform.workspace
  app_name       = "nginx-alpine"
  replica_number = 2
  nginx_image    = "nginx_alpine:${terraform.workspace == "default" ? "test" : terraform.workspace}"
  image_policy   = "Never"
  container_port = 80
  services_port  = 8080
  node_port      = 32100
  services_type  = "NodePort"
}
