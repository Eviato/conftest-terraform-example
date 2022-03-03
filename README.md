# Conftest example

> This repository aims to describe how to create a conftest policy with Terraform.

## How-To

```bash
make conftest
```

We're force to pass through the json output of `terraform plan` command because we use a loop on resources in order to simplify the Terraform code.
