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
  default     = []
  type        = list(string)
  description = "Optional ECR policy to be applied."
}

variable "max_any_image_count" {
  default     = 100
  type        = number
  description = "Maximum number of images that you want to retain in repository."
}

variable "force_delete" {
  default     = false
  description = "If true, will delete the repository even if it contains images."
}

variable "image_tag_mutability" {
  default     = "MUTABLE"
  description = "The tag mutability setting for the repository. Must be one of: `MUTABLE` or `IMMUTABLE`. Defaults to `MUTABLE`."
}

variable "kms_key" {
  description = "The ARN of the KMS key to use when encryption_type is `KMS`. If not specified, uses the default AWS managed key for ECR."
  type        = string
  default     = null
}

variable "image_scan_on_push" {
  description = "Indicates whether images are scanned after being pushed to the repository (`true`) or not scanned (`false`)."
  type        = bool
  default     = false
}

variable "encryption_type" {
  description = "The encryption type for the repository. Must be one of: `KMS` or `AES256`. Defaults to `AES256.`"
  type        = string
  default     = null
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}

