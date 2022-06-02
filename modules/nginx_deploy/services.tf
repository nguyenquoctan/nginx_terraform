resource "kubernetes_service" "nginx_deploy" {
  metadata {
    name      = var.app_name
    namespace = kubernetes_namespace.nginx.metadata.0.name
  }
  spec {
    selector = {
      app = kubernetes_deployment.nginx_deploy.metadata.0.labels.app
    }
    port {
      node_port   = var.node_port
      port        = var.services_port
      target_port = var.container_port
    }
    type = var.services_type
  }
}