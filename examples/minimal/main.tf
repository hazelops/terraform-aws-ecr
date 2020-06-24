module "ecr" {
  source = "hazelops/ecr/aws"
  version = "~> 1.0"
  name = "test"
  push_arns = ["arn:aws:iam::123454321:user/elvis"]
}
