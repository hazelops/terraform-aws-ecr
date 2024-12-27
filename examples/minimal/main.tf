module "ecr" {
  source  = "hazelops/ecr/aws"
  version = "~> 2.0"
  name    = "test"
}
