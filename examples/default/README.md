# Default Kubernetes Deployment

This example shows how to use the Terraform module to create new Kubernetes Deployments for a Lacework Admission Controller and a Proxy Scanner. By default, the module will create self-signed certificates for encrypted communiction between the K8s API and admission controller.

```hcl
terraform {
  required_providers {
    kubernetes = ">= 2.0.0"
  }
}

provider "kubernetes" {}

module "lacework_admission_controller" {
  source  = "lacework/admission-controller/kubernetes"
  version = "~> 0.1"

  lacework_account_name = "YourLaceworkAccount"
  proxy_scanner_token   = "_123456789abcdef123456789abcd"
  registries = [
    {
      name      = "myRegistry"
      domain    = "myregistrydomain.com:8080"
      ssl       = true
      auto_poll = false
      credentials = {
        user_name = "myUsername"
        password  = "myPassword"
      }
    }
  ]
}
```
