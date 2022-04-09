terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.9"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ca-central-1"
}

# Configure the Vpc
resource "aws_vpc" "AmiramVpc" {
  cidr_block = "196.100.6.0/24"
  tags = {
    "name" = "Amiram_vpc"
  }
}

#Web subnet
resource "aws_subnet" "webVpc" {
  cidr_block = "196.100.6.0/27"
    vpc_id = aws_vpc.AmiramVpc.id
    tags = {
    "name" = "Amiram_subnet_web"
  }
}
#App subnet
resource "aws_subnet" "appVpc" {
  cidr_block = "196.100.6.32/27"
    vpc_id = aws_vpc.AmiramVpc.id
    tags = {
    "name" = "Amiram_subnet_app"
  }
}
#DB subnet
resource "aws_subnet" "DBVpc" {
  cidr_block = "196.100.6.64/28"
  vpc_id = aws_vpc.AmiramVpc.id
  tags = {
    "name" = "Amiram_subnet_DB"
  }
}