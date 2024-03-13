data "aws_iam_policy_document" "example-policy" {
  statement {
    actions   = ["*"]
    resources = ["*"]
  }
}

resource "aws_iam_role" "admin-role" {
  name                = "${var.environment}_admin_role"
  assume_role_policy  = data.aws_iam_policy_document.example-policy.json # (not shown)
  managed_policy_arns = []
  tags = {
    git_commit           = "f5abc4fc41b394b145ee8a23429986184e150ef1"
    git_file             = "terraform/modules/iam/main.tf"
    git_last_modified_at = "2022-09-22 19:07:11"
    git_last_modified_by = "mroberts@m-c02ff1nqml85.paloaltonetworks.local"
    git_modifiers        = "mroberts"
    git_org              = "mroberts-panw"
    git_repo             = "codegoat"
    yor_name             = "admin-role"
    yor_trace            = "3a818e98-f4ff-4518-b6cd-25a08bcd1b6b"
  }
}
