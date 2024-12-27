module "ecr" {
  source               = "hazelops/ecr/aws"
  version              = "~> 2.0"
  name                 = "test"
  enabled              = true
  pull_arns            = ["arn:aws:iam::1234567890:user/johnd"]
  push_arns            = ["arn:aws:iam::123454321:user/elvis"]
  image_tag_mutability = "IMMUTABLE"
  image_scan_on_push   = true
  encryption_type      = "KMS"
  max_any_image_count  = 5
  tags = {
    Name      = "test"
    Terraform = "true"
  }
}
