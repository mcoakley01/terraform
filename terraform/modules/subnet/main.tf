resource "aws_subnet" "primary" {
  vpc_id            = var.vpc_id
  cidr_block        = var.cidr_primary
  availability_zone = "${var.region}a"
  tags = {
    git_commit           = "N/A"
    git_file             = "terraform/modules/subnet/main.tf"
    git_last_modified_at = "2023-06-05 19:06:25"
    git_last_modified_by = "94183307+mcoakley01@users.noreply.github.com"
    git_modifiers        = "94183307+mcoakley01/mroberts"
    git_org              = "mroberts-panw"
    git_repo             = "codegoat"
    yor_name             = "primary"
    yor_trace            = "f374e5ef-6c29-48a6-8ace-d89d5fe2885e"
  }
}

resource "aws_subnet" "secondary" {
  vpc_id            = var.vpc_id
  cidr_block        = var.cidr_secondary
  availability_zone = "${var.region}c"
  tags = {
    git_commit           = "N/A"
    git_file             = "terraform/modules/subnet/main.tf"
    git_last_modified_at = "2023-06-05 19:06:25"
    git_last_modified_by = "94183307+mcoakley01@users.noreply.github.com"
    git_modifiers        = "94183307+mcoakley01/mroberts"
    git_org              = "mroberts-panw"
    git_repo             = "codegoat"
    yor_name             = "secondary"
    yor_trace            = "75aec68e-4561-43e6-af0d-9c1044831e0d"
  }
}
