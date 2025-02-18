terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_iam_account_password_policy" "strict" {
  #minimum_password_length        = 8
  #require_lowercase_characters   = true
  #require_numbers                = true
  #require_uppercase_characters   = true
  #require_symbols                = true
  #allow_users_to_change_password = true
  max_password_age = 90
}


module "vpc" {
  source = "./modules/vpc"
}

module "subnet" {
  source = "./modules/subnet"
  vpc_id = module.vpc.vpc_id
  region = var.region
}

module "storage" {
  source         = "./modules/storage"
  acl            = "public-read-write"
  db_username    = "admin"
  db_password    = "Pa$$w0rd"
  environment    = var.env
  vpc_id         = module.vpc.vpc_id
  private_subnet = [module.subnet.subnet_id_primary, module.subnet.subnet_id_secondary]
}

module "iam" {
  source = "./modules/iam"

  environment = var.env
}

module "instance" {
  source        = "terraform-aws-modules/ec2-instance/aws"
  ami           = var.ami
  instance_type = "t2.micro"
  name          = "example-server"

  vpc_security_group_ids = [module.vpc.vpc_sg_id]
  subnet_id              = module.subnet.subnet_id_primary

  tags = {
    Environment          = var.env
    git_commit           = "f5abc4fc41b394b145ee8a23429986184e150ef1"
    git_file             = "terraform/main.tf"
    git_last_modified_at = "2022-09-22 19:07:11"
    git_last_modified_by = "mroberts@m-c02ff1nqml85.paloaltonetworks.local"
    git_modifiers        = "mroberts"
    git_org              = "mroberts-panw"
    git_repo             = "codegoat"
    yor_name             = "instance"
    yor_trace            = "819fc9e0-3b74-4b08-afb1-f34250443667"
  }
}


resource "aws_ebs_volume" "i" {
  availability_zone = "${var.region}a"
  size              = 40
  tags = {
    git_commit           = "f5abc4fc41b394b145ee8a23429986184e150ef1"
    git_file             = "terraform/main.tf"
    git_last_modified_at = "2022-09-22 19:07:11"
    git_last_modified_by = "mroberts@m-c02ff1nqml85.paloaltonetworks.local"
    git_modifiers        = "mroberts"
    git_org              = "mroberts-panw"
    git_repo             = "codegoat"
    yor_name             = "i"
    yor_trace            = "e63e2e4d-f3a2-400b-be6d-1ec307ac2efe"
  }
}