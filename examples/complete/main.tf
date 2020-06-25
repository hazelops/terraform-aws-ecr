module "ecr" {
  source = "hazelops/ecr/aws"
  version = "~> 1.0"
  name = "test"
  enabled = true
  pull_arns = ["arn:aws:iam::1234567890:user/johnd"]
  push_arns = ["arn:aws:iam::123454321:user/elvis"]
  max_any_image_count = 3
}
