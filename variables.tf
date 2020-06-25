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

variable "max_any_image_count" {
  default = 100
  type = number
  description = "Maximum number of images that you want to retain in repository."
}



