# Default Kubernetes Deployment

This example shows how to use the Terraform module to create a new Kubernetes Deployment for a Lacework Admission Controller and Proxy Scanner.

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
