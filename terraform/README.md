# Terraform


## Configuration Steps
1. Please follow this [page](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) for installing and setting up the configruation




# Executing
1. The version attribute is optional, but **we recommend using it to constrain the provider version so that Terraform does not install a version of the provider that does not work with your configuration.**
```bash
terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "4.16"
    }
  }
  required_version = ">= 1.2.0"
}
```
2. **We recommend using consistent formatting in all of your configuration files.** The terraform fmt command automatically updates configurations in the current directory for readability and consistency.
```bash
terraform fmt
```
3. Validate
```bash
terraform validate
```
4. Apply
```bash
terraform apply
```