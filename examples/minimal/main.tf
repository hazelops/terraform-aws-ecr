module "ecr" {
  source = "../../terraform/ecr-module"
  name = "<name-of-ecr-repository>"
  pull_arns = [<list-of-pull-only-arns>]
  push_arns = [<list-of-push-pull-arns>]
  tag_prefix_list = [<tag-name>]