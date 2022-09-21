# Sets global variables for this Terraform project.

variable "app_name" {
  default = "flixtube202209"
}
variable "location" {
  default = "West US"
}

variable "admin_username" {
  default = "linux_admin"
}

# To create a service principal:
# 1. az account show
# 2. az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/<id field from previous command output>"
# use appId for client_id and password for client_secret

variable "client_id" {
}

variable "client_secret" {
}
