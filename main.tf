resource "aws_ecr_repository" "this" {
  count                = var.enabled ? 1 : 0
  name                 = var.name
  force_delete         = var.force_delete
  image_tag_mutability = var.image_tag_mutability
  encryption_configuration {
    encryption_type = var.encryption_type
    kms_key         = var.kms_key
  }
  image_scanning_configuration {
    scan_on_push = var.image_scan_on_push
  }
  tags = var.tags
}

resource "aws_ecr_repository_policy" "this" {
  count      = ((length(var.push_arns) > 0 || length(var.pull_arns) > 0) && var.enabled) ? 1 : 0
  policy     = data.aws_iam_policy_document.this.json
  repository = aws_ecr_repository.this[0].name
}

data "aws_iam_policy_document" "this" {
  override_policy_documents = var.ecr_policy

  dynamic "statement" {
    for_each = length(var.pull_arns) > 0 ? [""] : []
    content {
      actions = [
        "ecr:GetDownloadUrlForLayer",
        "ecr:BatchGetImage",
        "ecr:BatchCheckLayerAvailability",
      ]

      principals {
        type        = "AWS"
        identifiers = var.pull_arns
      }
    }
  }

  dynamic "statement" {
    for_each = length(var.push_arns) > 0 ? [""] : []

    content {
      actions = [
        "ecr:GetDownloadUrlForLayer",
        "ecr:BatchGetImage",
        "ecr:BatchCheckLayerAvailability",
        "ecr:PutImage",
        "ecr:InitiateLayerUpload",
        "ecr:UploadLayerPart",
        "ecr:CompleteLayerUpload",
        "ecr:GetAuthorizationToken"
      ]

      principals {
        type        = "AWS"
        identifiers = var.push_arns
      }
    }
  }
}

resource "aws_ecr_lifecycle_policy" "default" {
  count      = var.enabled ? 1 : 0
  repository = aws_ecr_repository.this[0].name

  policy = jsonencode({
    rules = [
      {
        rulePriority = 1
        description  = "Keep last ${var.max_any_image_count} images"
        selection = {
          tagStatus   = "any"
          countType   = "imageCountMoreThan"
          countNumber = var.max_any_image_count
        }
        action = {
          type = "expire"
        }
      },
    ]
  })
}
