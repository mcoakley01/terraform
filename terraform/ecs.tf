resource "aws_ecs_task_definition" "service" {
  family = "service"
  container_definitions = jsonencode([
    {
      name      = "first"
      image     = "nginx"
      cpu       = 10
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
    },
    {
      name      = "second"
      image     = "python:3.9-alpine"
      cpu       = 10
      memory    = 256
      essential = true
      portMappings = [
        {
          containerPort = 443
          hostPort      = 443
        }
      ]
    }
  ])
  tags = {
    git_commit           = "28f961c9082f76fc6f16d55ad0c27de60d14b4a7"
    git_file             = "terraform/ecs.tf"
    git_last_modified_at = "2022-10-11 17:12:10"
    git_last_modified_by = "104632309+mroberts-panw@users.noreply.github.com"
    git_modifiers        = "104632309+mroberts-panw"
    git_org              = "mroberts-panw"
    git_repo             = "codegoat"
    yor_name             = "service"
    yor_trace            = "d77c8584-b1a0-41f5-8dd0-981bc3ad3013"
  }
}
