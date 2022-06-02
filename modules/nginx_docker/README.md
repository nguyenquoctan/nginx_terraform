<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.1.0 |
| <a name="requirement_docker"></a> [docker](#requirement\_docker) | 2.16.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_docker"></a> [docker](#provider\_docker) | 2.16.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [docker_image.nginx_image](https://registry.terraform.io/providers/kreuzwerker/docker/2.16.0/docs/resources/image) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dockerfile_name"></a> [dockerfile\_name](#input\_dockerfile\_name) | Dockerfile name | `string` | `"Dockefile"` | no |
| <a name="input_dockerfile_path"></a> [dockerfile\_path](#input\_dockerfile\_path) | Relative path of Dockerfile | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | Environment to build image. | `any` | n/a | yes |
| <a name="input_filtered_email"></a> [filtered\_email](#input\_filtered\_email) | Email information to get the name | `string` | n/a | yes |
| <a name="input_image_version"></a> [image\_version](#input\_image\_version) | Use cache while building image | `string` | n/a | yes |
| <a name="input_nginx_image_name"></a> [nginx\_image\_name](#input\_nginx\_image\_name) | Image name | `string` | n/a | yes |
| <a name="input_no_cache"></a> [no\_cache](#input\_no\_cache) | Use cache while building image | `bool` | n/a | yes |
| <a name="input_source_image"></a> [source\_image](#input\_source\_image) | Dockerfile source image | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->