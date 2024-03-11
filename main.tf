terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }

  }

/*
  backend "s3" {
    bucket = "backend-111"
    key = "terraform.tfstate"
    region = "ap-south-1"
  #  dynamodb_table = "value"
  }
*/
}



provider "aws" {
  region     = "ap-south-1"
  access_key = "***********"
  secret_key = "***********"
}



module "my_ec2" {
  source = "./ec2-module"
  ami-id = var.ami-id
  instance = var.type
  subnet_id = module.subnet-1.subnet_id
  vpc-id = module.VPC-1.vpc-id
  security_groups = [module.security-1.Security-id]
  
}


module "VPC-1" {
  source = "./vpc-module"
  vpc-cidr-block = var.vpc-cidr-block
  
}

module "internet-gateway-id" {
  source = "./internet-gateway"
  vpc_id = module.VPC-1.vpc-id
}


module "route-table" {
  source = "./route-module"
  vpc-id = module.VPC-1.vpc-id
  cidr-ranges = var.range
  gateway-route = module.internet-gateway-id.internet-gateway-id

}

  

module "route_table_association" {
  source = "./route-association"
  subnet-route = module.subnet-1.subnet_id
  table = module.route-table.route-id
}




module "subnet-1" {
  source = "./subnet-module"
  vpc-id = module.VPC-1.vpc-id
  subnet-cidr-block = var.subnet-1
  env = "this is Production Envirnnment"
  
}

module "security-1" {
  source = "./security-module"
  vpc_id = module.VPC-1.vpc-id
  security-group-rules = var.rules-sg
  outbound-rules = var.outbound

}

  module "null" {
    source = "./null-resources-module"
    targethost = module.my_ec2.public-ip
    user = var.user
    file-path = var.file-path
    destination-path = var.destination-path
  }




  



