# Initialises Terraform providers and sets their version numbers.

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.22.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.2"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.13.1"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.1.1"
    }
  }
}

provider "azurerm" {
  features {
  }
}

provider "tls" {
}

provider "kubernetes" {
  host                   = azurerm_kubernetes_cluster.cluster.kube_config[0].host
  client_certificate     = base64decode(azurerm_kubernetes_cluster.cluster.kube_config[0].client_certificate)
  client_key             = base64decode(azurerm_kubernetes_cluster.cluster.kube_config[0].client_key)
  cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.cluster.kube_config[0].cluster_ca_certificate)
}

provider "null" {
}
