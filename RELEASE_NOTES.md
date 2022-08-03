# Release Notes
Another day, another Terraform Module. This is the first release of the new Terraform Module for
deploying the Lacework Admission Controller and Proxy Scanner in a Kubernetes cluster. (`v0.1.0`)

## Basic Usage
```
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

## Bug Fixes
* fix: example should reference local module (Salim Afiune Maya)([415b100](https://github.com/lacework/terraform-kubernetes-admission-controller/commit/415b100500c68915e64b9ef6ad3de51d677d4d4a))
## Documentation Updates
* docs: update README.md (Salim Afiune Maya)([ce4f705](https://github.com/lacework/terraform-kubernetes-admission-controller/commit/ce4f70561b24bb12fed00143210107431da22385))
