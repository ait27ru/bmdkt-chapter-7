# Initialises Terraform providers and sets their version numbers.

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.22.0"
    }
    tls = {
      source = "hashicorp/tls"
      version = "4.0.2"
    }
  }
}

provider "azurerm" {
  features { }
}

provider "tls" {
}