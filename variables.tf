variable "name" {
  description = "Name of the ECR repository."
}

variable "enabled" {
  default     = true
  description = "If not enabled, no resources will be created."
}

variable "pull_arns" {
  default     = []
  type        = list(string)
  description = "List of IAM ARNs that can pull images."
}

variable "push_arns" {
  default     = []
  type        = list(string)
  description = "List of IAM ARNs that can push and pull images and tags."
}

variable "ecr_policy" {
  default     = ""
  description = "Optional ECR policy to be applied."
}

variable "tag_prefix_list" {
  type        = list(string)
  description = "List of image tag prefixes on which to take action with lifecycle policy."
}

variable "max_untagged_image_count" {
  default     = 1
  type        = number
  description = "Maximum number of untagged images that you want to retain in repository."
}

variable "max_tagged_image_count" {
  default     = 20
  type        = number
  description = "Maximum number of tagged images that you want to retain in repository."
}