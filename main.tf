terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

module "network" {
  source = "./modules/network"
  vpc_name = var.network_name
  
}

module "subnet" {
  source = "./modules/subnets"
  vpc_id = module.network.vpc_id
}

module "instance" {
  source = "./modules/instances"
  instance_name = var.instance_name
  instance_type = var.instance_type
  subnet_id = module.subnet.subnet_id
}

module "instance_dos" {
  source = "./modules/instances"
  instance_name = var.instance_name
  instance_type = var.instance_type
  subnet_id = module.subnet.subnet_id
}