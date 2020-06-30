module "ecr" {
  source = "hazelops/ecr/aws"
  version = "~> 1.0"
  name = "test"
}
