# Terraform ECR Module



Terraform module that creates ECR resources on AWS.


## Description

Provision [ECR Repository](https://docs.aws.amazon.com/AmazonECR/latest/userguide/Repositories.html),
[Repository Policy](https://docs.aws.amazon.com/AmazonECR/latest/userguide/RepositoryPolicies.html) and
[Lifecycle Policy](https://docs.aws.amazon.com/AmazonECR/latest/userguide/LifecyclePolicies.html).

This module provides settings:

- Enable access by ARN
- Automation of cleaning up unused images

## Usage

### Minimal setup & Unrestricted access to ECR

```hcl
module "ecr" {
  source = "hazelops/ecr/aws"
  version = "~> 2.0"
  name = "test"
}
```

### Full setup & Restricted access to ECR by IAM arns

```hcl
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
```

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ecr_lifecycle_policy.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_lifecycle_policy) | resource |
| [aws_ecr_repository.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |
| [aws_ecr_repository_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository_policy) | resource |
| [aws_iam_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ecr_policy"></a> [ecr\_policy](#input\_ecr\_policy) | Optional ECR policy to be applied. | `list(string)` | `[]` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | If not enabled, no resources will be created. | `bool` | `true` | no |
| <a name="input_encryption_type"></a> [encryption\_type](#input\_encryption\_type) | The encryption type for the repository. Must be one of: `KMS` or `AES256`. Defaults to `AES256.` | `string` | `null` | no |
| <a name="input_force_delete"></a> [force\_delete](#input\_force\_delete) | If true, will delete the repository even if it contains images. | `bool` | `false` | no |
| <a name="input_image_scan_on_push"></a> [image\_scan\_on\_push](#input\_image\_scan\_on\_push) | Indicates whether images are scanned after being pushed to the repository (`true`) or not scanned (`false`). | `bool` | `false` | no |
| <a name="input_image_tag_mutability"></a> [image\_tag\_mutability](#input\_image\_tag\_mutability) | The tag mutability setting for the repository. Must be one of: `MUTABLE` or `IMMUTABLE`. Defaults to `MUTABLE`. | `string` | `"MUTABLE"` | no |
| <a name="input_kms_key"></a> [kms\_key](#input\_kms\_key) | The ARN of the KMS key to use when encryption\_type is `KMS`. If not specified, uses the default AWS managed key for ECR. | `string` | `null` | no |
| <a name="input_max_any_image_count"></a> [max\_any\_image\_count](#input\_max\_any\_image\_count) | Maximum number of images that you want to retain in repository. | `number` | `100` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the ECR repository. | `any` | n/a | yes |
| <a name="input_pull_arns"></a> [pull\_arns](#input\_pull\_arns) | List of IAM ARNs that can pull images. | `list(string)` | `[]` | no |
| <a name="input_push_arns"></a> [push\_arns](#input\_push\_arns) | List of IAM ARNs that can push and pull images and tags. | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_repository_id"></a> [repository\_id](#output\_repository\_id) | n/a |
| <a name="output_repository_url"></a> [repository\_url](#output\_repository\_url) | n/a |
<!-- END_TF_DOCS -->

### Terraform Module Registry

![Hazelops logo](https://avatars0.githubusercontent.com/u/63737915?s=25&v=4) [Terraform ECR Repo
](https://registry.terraform.io/modules/hazelops/ecr/aws)

Inspired by modules from [justinm](https://registry.terraform.io/modules/justinm) and [tmknom](https://registry.terraform.io/modules/tmknom)

Maintainer: [Dmitry Borisov](https://github.com/kobrikx)
