terraform {
  required_version = ">= 0.12.31"

  required_providers {
    kubernetes = ">= 2.0.0"

    lacework = {
      source  = "lacework/lacework"
      version = "~> 2.0"
    }
  }
}
