# Example-2

This example uses Terraform to create:
* a resource group in Azure.
* a private container registery in Azure.
* a Kubernetes cluster in Azure.

And to deploy it to the created infrastructure:
* **MongoDB database**

Run this example using:

```bash
cd working/scripts
terraform apply
```

terraform plan -out=tfplan
terraform show -json tfplan > tfplan.json
terraform apply tfplan