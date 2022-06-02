resource "kubernetes_deployment" "nginx_deploy" {
  metadata {
    name      = var.app_name
    namespace = kubernetes_namespace.nginx.metadata.0.name
    labels = {
      app = var.app_name
    }
  }
  spec {
    replicas = var.replica_number
    selector {
      match_labels = {
        app = var.app_name
      }
    }
    template {
      metadata {
        labels = {
          app = var.app_name
        }
      }
      spec {
        container {
          image             = var.nginx_image
          image_pull_policy = var.image_policy
          name              = var.app_name
          port {
            name           = "port-${var.container_port}"
            container_port = var.container_port
          }
          security_context {
            allow_privilege_escalation = false
          }
        }
      }
    }
  }
}