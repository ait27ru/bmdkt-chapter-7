# Example-2

This example uses Terraform to create:
* a resource group in Azure.
* a private container registery in Azure.
* a Kubernetes cluster in Azure.

Run this example using:

```bash
cd working/scripts
terraform apply
```

terraform plan -out=tfplan
terraform show -json tfplan > tfplan.json
terraform apply tfplan