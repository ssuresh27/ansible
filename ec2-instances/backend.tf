
# terraform {
#   backend "pg" {
#     conn_str = "postgres://yessures:Monday22@yessures.cg7qhfapbqlo.us-east-2.rds.amazonaws.com/my_terraform_database"
#     schema_name = "keypair"
#   }
# }
terraform {
  backend "local" {
    path = "./terraform.tfstate"
  }
}

provider "aws" {
  region                   = "us-east-2"
  shared_credentials_files = ["../credentials"]
  profile                  = "default"

}

provider "local" {
  
}