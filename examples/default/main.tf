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
