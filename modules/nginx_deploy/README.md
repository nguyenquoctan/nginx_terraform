<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.1.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.11.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.11.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_deployment.nginx_deploy](https://registry.terraform.io/providers/hashicorp/kubernetes/2.11.0/docs/resources/deployment) | resource |
| [kubernetes_namespace.nginx](https://registry.terraform.io/providers/hashicorp/kubernetes/2.11.0/docs/resources/namespace) | resource |
| [kubernetes_service.nginx_deploy](https://registry.terraform.io/providers/hashicorp/kubernetes/2.11.0/docs/resources/service) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | Application name | `string` | n/a | yes |
| <a name="input_container_port"></a> [container\_port](#input\_container\_port) | Container / target port | `number` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | Environment to build image. | `any` | n/a | yes |
| <a name="input_image_policy"></a> [image\_policy](#input\_image\_policy) | image pull policy | `string` | n/a | yes |
| <a name="input_nginx_image"></a> [nginx\_image](#input\_nginx\_image) | nginx docker image | `string` | n/a | yes |
| <a name="input_node_port"></a> [node\_port](#input\_node\_port) | Node port | `number` | n/a | yes |
| <a name="input_replica_number"></a> [replica\_number](#input\_replica\_number) | Deployment replica | `string` | `1` | no |
| <a name="input_services_port"></a> [services\_port](#input\_services\_port) | Services port | `number` | n/a | yes |
| <a name="input_services_type"></a> [services\_type](#input\_services\_type) | Service type | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->