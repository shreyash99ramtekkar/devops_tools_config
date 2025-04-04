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

4. Plan
```bash
terraform plan 
terraform show -json "tfplan" | jq > tfplan.json
#Clean up infrastructure
terraform plan -destroy -out "tfplan-destroy"
#configuration
jq '.configuration.provider_config' tfplan.json
#Resources
jq '.configuration.root_module.resources' tfplan.json
#Modules
jq '.configuration.root_module.module_calls' tfplan.json
#prior state
jq '.prior_state' tfplan-input-var.json
#variables
jq '.variables' tfplan-input-var.json
#changes in the resources
jq '.resource_changes[] | select( .address == "module.hello.random_pet.server")' tfplan-input-var.json


#Note never save tfplan files in the repository since it contains sensitive info.
```
```
4. Apply
```bash
terraform apply
```
5. Show
```bash
terraform show
```

6. State
```bash
terraform state list
```

7. If resource get down or puts into error  - aws_instance.main[1] you will get this from terraform state command. Write down which resource need to be replace
```bash
terraform apply -replace "aws_instance.main[1]"
```