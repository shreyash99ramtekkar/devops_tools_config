provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "ops_server" {

    tags = {
        Name = "Ops Server"
    }
  
}