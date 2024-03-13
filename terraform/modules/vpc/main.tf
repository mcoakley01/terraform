resource "aws_vpc" "example" {
  cidr_block = var.cidr
  tags = {
    git_commit           = "f5abc4fc41b394b145ee8a23429986184e150ef1"
    git_file             = "terraform/modules/vpc/main.tf"
    git_last_modified_at = "2022-09-22 19:07:11"
    git_last_modified_by = "mroberts@m-c02ff1nqml85.paloaltonetworks.local"
    git_modifiers        = "mroberts"
    git_org              = "mroberts-panw"
    git_repo             = "codegoat"
    yor_name             = "example"
    yor_trace            = "1124ff95-f471-4832-9918-5cad9694fc93"
  }
}

resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.example.id

  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
  }
  tags = {
    git_commit           = "N/A"
    git_file             = "terraform/modules/vpc/main.tf"
    git_last_modified_at = "2023-06-05 19:06:25"
    git_last_modified_by = "94183307+mcoakley01@users.noreply.github.com"
    git_modifiers        = "94183307+mcoakley01/mroberts"
    git_org              = "mroberts-panw"
    git_repo             = "codegoat"
    yor_name             = "default"
    yor_trace            = "0c69b8ea-0374-4161-a220-a46b37632a7e"
  }
}

resource "aws_security_group" "allow_all_ssh" {
  name        = "allow_all_ssh"
  description = "Allow SSH inbound from anywhere"
  vpc_id      = aws_vpc.example.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    git_commit           = "f5abc4fc41b394b145ee8a23429986184e150ef1"
    git_file             = "terraform/modules/vpc/main.tf"
    git_last_modified_at = "2022-09-22 19:07:11"
    git_last_modified_by = "mroberts@m-c02ff1nqml85.paloaltonetworks.local"
    git_modifiers        = "mroberts"
    git_org              = "mroberts-panw"
    git_repo             = "codegoat"
    yor_name             = "allow_all_ssh"
    yor_trace            = "5d09f39f-c3a2-4ca5-abdc-8e850e76f100"
  }
}

resource "aws_security_group" "allow_ssh_from_valid_cidr" {
  name        = "allow_ssh_from_valid_cidr"
  description = "Allow SSH inbound from specific range"
  vpc_id      = aws_vpc.example.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = tolist([var.cidr])
  }
  tags = {
    git_commit           = "N/A"
    git_file             = "terraform/modules/vpc/main.tf"
    git_last_modified_at = "2023-06-05 19:06:25"
    git_last_modified_by = "94183307+mcoakley01@users.noreply.github.com"
    git_modifiers        = "94183307+mcoakley01/mroberts"
    git_org              = "mroberts-panw"
    git_repo             = "codegoat"
    yor_name             = "allow_ssh_from_valid_cidr"
    yor_trace            = "59efa9dd-ad5a-4380-a1d3-73c33264f52b"
  }
}
