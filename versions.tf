terraform {
<<<<<<< HEAD
  required_version = ">= 0.12.31"

  required_providers {
    kubernetes = ">= 2.0.0"
=======
  required_version = ">= 0.12.26"

  required_providers {
    lacework = {
      source  = "lacework/lacework"
      version = "~> 0.3"
    }
>>>>>>> 0843f98 (feat: shape our TF module scaffolding (#1))
  }
}
