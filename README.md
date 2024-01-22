<a href="https://lacework.com"><img src="https://techally-content.s3-us-west-1.amazonaws.com/public-content/lacework_logo_full.png" width="600"></a>

# terraform-kubernetes-admission-controller

[![GitHub release](https://img.shields.io/github/release/lacework/terraform-kubernetes-admission-controller.svg)](https://github.com/lacework/terraform-kubernetes-admission-controller/releases/)
[![Codefresh build status]( https://g.codefresh.io/api/badges/pipeline/lacework/terraform-modules%2Ftest-compatibility?type=cf-1&key=eyJhbGciOiJIUzI1NiJ9.NWVmNTAxOGU4Y2FjOGQzYTkxYjg3ZDEx.RJ3DEzWmBXrJX7m38iExJ_ntGv4_Ip8VTa-an8gBwBo)]( https://g.codefresh.io/pipelines/edit/new/builds?id=607e25e6728f5a6fba30431b&pipeline=test-compatibility&projects=terraform-modules&projectId=607db54b728f5a5f8930405d)

A Terraform Module to create a Deployment and other resources necessary for deploying the Lacework Admission Controller and Proxy Scanner in a Kubernetes cluster.
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.31 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.0.0 |
| <a name="requirement_lacework"></a> [lacework](#requirement\_lacework) | ~> 1.18 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | >= 2.0.0 |
| <a name="provider_lacework"></a> [lacework](#provider\_lacework) | ~> 1.18 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_cluster_role.lacework_admission_controller_cluster_role](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/cluster_role) | resource |
| [kubernetes_cluster_role_binding.lacework_admission_controller_cluster_role_binding](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/cluster_role_binding) | resource |
| [kubernetes_deployment.lacework_admission_controller](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/deployment) | resource |
| [kubernetes_deployment.lacework_proxy_scanner](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/deployment) | resource |
| [kubernetes_role.lacework_admission_controller_role](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/role) | resource |
| [kubernetes_role_binding.lacework_admission_controller_role_binding](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/role_binding) | resource |
| [kubernetes_secret.lacework_admission_controller_cert](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |
| [kubernetes_secret.lacework_admission_controller_config](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |
| [kubernetes_secret.lacework_proxy_scanner_config](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |
| [kubernetes_service.lacework_admission_controller_service](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service) | resource |
| [kubernetes_service.lacework_proxy_scanner_service](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service) | resource |
| [kubernetes_service_account.lacework_admission_controller_service_account](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service_account) | resource |
| [kubernetes_validating_webhook_configuration_v1.lacework_admission_controller_webhook](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/validating_webhook_configuration_v1) | resource |
| [tls_cert_request.admission](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/cert_request) | resource |
| [tls_locally_signed_cert.admission](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/locally_signed_cert) | resource |
| [tls_private_key.admission](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [tls_private_key.ca](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [tls_self_signed_cert.ca](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/self_signed_cert) | resource |
| [lacework_metric_module.lwmetrics](https://registry.terraform.io/providers/lacework/lacework/latest/docs/data-sources/metric_module) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admission_controller_image"></a> [admission\_controller\_image](#input\_admission\_controller\_image) | The image to use for deploying the Lacework admission controller. | `string` | `"lacework/lacework-admission-controller"` | no |
| <a name="input_admission_controller_image_tag"></a> [admission\_controller\_image\_tag](#input\_admission\_controller\_image\_tag) | The image tag to use for deploying the Lacework admission controller. | `string` | `"latest"` | no |
| <a name="input_admission_controller_name"></a> [admission\_controller\_name](#input\_admission\_controller\_name) | The name for the Lacework admission controller deployment. | `string` | `"lacework-admission-controller"` | no |
| <a name="input_admission_scanner_timeout"></a> [admission\_scanner\_timeout](#input\_admission\_scanner\_timeout) | Default timeout for communication between admission controller and proxy scanner. | `number` | `30` | no |
| <a name="input_block_exec"></a> [block\_exec](#input\_block\_exec) | Block command execution (kubectl exec) on pods by admission controller. | `bool` | `false` | no |
| <a name="input_block_on_error"></a> [block\_on\_error](#input\_block\_on\_error) | Block admission request if proxy scanner returns and error. | `bool` | `false` | no |
| <a name="input_bypass_scope"></a> [bypass\_scope](#input\_bypass\_scope) | The list of namespaces to bypass control of by admission controller. Ex: kube-system,kube-public,lacework,mynamespace | `string` | `"kube-system,kube-public,lacework,lacework-dev"` | no |
| <a name="input_ca_cert"></a> [ca\_cert](#input\_ca\_cert) | Root certificate for TLS authentication with the K8s api server. If use\_self\_signed\_certs is false, this is required. Otherwise a self-signed cert will be created. | `string` | `""` | no |
| <a name="input_cert_file_path"></a> [cert\_file\_path](#input\_cert\_file\_path) | Path for server certificate file in admission controller volume. | `string` | `"/certs/admission.crt"` | no |
| <a name="input_cert_key_path"></a> [cert\_key\_path](#input\_cert\_key\_path) | Path for server key file in admission controller volume. | `string` | `"/certs/admission.key"` | no |
| <a name="input_certs_secret_name"></a> [certs\_secret\_name](#input\_certs\_secret\_name) | The name of the K8s secret containing the certificates. | `string` | `"lacework-admission-certs"` | no |
| <a name="input_default_registry"></a> [default\_registry](#input\_default\_registry) | Default registry for proxy scanner to use when none is provided in image name. | `string` | `"index.docker.io"` | no |
| <a name="input_deploy_combined"></a> [deploy\_combined](#input\_deploy\_combined) | Deploy both the admission controller and proxy scanner together if true. If false, only deploy the admission controller. | `bool` | `true` | no |
| <a name="input_enable_debug_logging"></a> [enable\_debug\_logging](#input\_enable\_debug\_logging) | Enable debug logging on the admission controller. | `bool` | `true` | no |
| <a name="input_excluded_resources"></a> [excluded\_resources](#input\_excluded\_resources) | The list of resources skip admission review. Ex: ['Pod', 'Deployment', 'ReplicaSet', 'DaemonSet'] | `list(string)` | `[]` | no |
| <a name="input_failure_policy"></a> [failure\_policy](#input\_failure\_policy) | Webhook falure policy (what response the webhook should take if it fails) Ex: Ignore, Fail | `string` | `"Ignore"` | no |
| <a name="input_image_pull_policy"></a> [image\_pull\_policy](#input\_image\_pull\_policy) | The pull policy to use when deploying container images. Ex: Always, Never, IfNotPresent | `string` | `"Always"` | no |
| <a name="input_lacework_account_name"></a> [lacework\_account\_name](#input\_lacework\_account\_name) | The name of your Lacework account (for the proxy scanner). | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | The Kubernetes namespace in which to deploy the admission controller and (optionally) the proxy scanner. | `string` | `"lacework"` | no |
| <a name="input_proxy_scanner_image"></a> [proxy\_scanner\_image](#input\_proxy\_scanner\_image) | The image to use for deploying the Lacework proxy scanner. | `string` | `"lacework/lacework-proxy-scanner"` | no |
| <a name="input_proxy_scanner_image_tag"></a> [proxy\_scanner\_image\_tag](#input\_proxy\_scanner\_image\_tag) | The image tag to use for deploying the Lacework proxy scanner. | `string` | `"latest"` | no |
| <a name="input_proxy_scanner_log_level"></a> [proxy\_scanner\_log\_level](#input\_proxy\_scanner\_log\_level) | Set the LOG\_LEVEL environment variable for proxy scanner. Ex: info, debug | `string` | `"info"` | no |
| <a name="input_proxy_scanner_name"></a> [proxy\_scanner\_name](#input\_proxy\_scanner\_name) | The name for the Lacework proxy scanner deployment. | `string` | `"lacework-proxy-scanner"` | no |
| <a name="input_proxy_scanner_token"></a> [proxy\_scanner\_token](#input\_proxy\_scanner\_token) | The token for the Lacework proxy scanner. | `string` | n/a | yes |
| <a name="input_registries"></a> [registries](#input\_registries) | A list of registries to apply to proxy scanner. See proxy scanner configuration documentation for details. | `list(any)` | n/a | yes |
| <a name="input_revision_history_limit"></a> [revision\_history\_limit](#input\_revision\_history\_limit) | The number of history revisions to keep. | `number` | `10` | no |
| <a name="input_scan_public_registries"></a> [scan\_public\_registries](#input\_scan\_public\_registries) | Set to true if you want to scan images from registries that are publicly accessible. | `bool` | `false` | no |
| <a name="input_server_certificate"></a> [server\_certificate](#input\_server\_certificate) | Certificate for TLS authentication with the K8s api server. If use\_self\_signed\_certs is false, this is required. Otherwise a self-signed cert will be created. | `string` | `""` | no |
| <a name="input_server_key"></a> [server\_key](#input\_server\_key) | Certificate key for TLS authentication with the K8s api server. If use\_self\_signed\_certs is false, this is required. Otherwise a self-signed cert will be created. | `string` | `""` | no |
| <a name="input_service_account_name"></a> [service\_account\_name](#input\_service\_account\_name) | The Kubernetes ServiceAccount to use for pods. | `string` | `"lacework-admission-sa"` | no |
| <a name="input_skip_cert"></a> [skip\_cert](#input\_skip\_cert) | Skip encrypted communication between admission controller and proxy scanner using certificate. Default is to skip. If set to false, certificate used will be based on use\_self\_signed\_certs setting. | `bool` | `true` | no |
| <a name="input_skip_verify"></a> [skip\_verify](#input\_skip\_verify) | Skip SSL verification between the webhook and the proxy scanner. | `bool` | `true` | no |
| <a name="input_static_cache_location"></a> [static\_cache\_location](#input\_static\_cache\_location) | Location of the proxy scanner's cache file. | `string` | `"/opt/lacework/cache"` | no |
| <a name="input_tls_port"></a> [tls\_port](#input\_tls\_port) | Listening port for admission controller. | `number` | `8443` | no |
| <a name="input_tolerations"></a> [tolerations](#input\_tolerations) | A list of Kubernetes Tolerations to apply to the Deployment definition. | `list(map(string))` | <pre>[<br>  {<br>    "effect": "NoSchedule",<br>    "key": "node-role.kubernetes.io/master"<br>  }<br>]</pre> | no |
| <a name="input_use_self_signed_certs"></a> [use\_self\_signed\_certs](#input\_use\_self\_signed\_certs) | Deploy admission controller with self-signed certificates if true. If false, you must define certs in the ca\_cert, server\_certificate, and server\_key variables. | `bool` | `true` | no |
| <a name="input_webhook_timeout"></a> [webhook\_timeout](#input\_webhook\_timeout) | Timeout in seconds for admission webhook failure. | `number` | `30` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->